Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E306D952A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9891B10EB69;
	Thu,  6 Apr 2023 11:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A5B10EB6D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:31:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9E5E64651;
 Thu,  6 Apr 2023 11:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AF5C4339E;
 Thu,  6 Apr 2023 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680780715;
 bh=VWeaSIihX1UD1HpAC36qM6ZP2rDBKHTw1ESYWCVeS1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gmD0LNML0LUaBVFkcUUHnggDkyEChej7C85vllwJbLRABMO+cY0LufLHTR0GaJvat
 poBJgtnUWVhM73Kj5zP0A7OA+/w8E7pcGJortkFX0/C5LEGlPS1Z7mCHsMX+PYE7M1
 +FM6n9auaY38fLcoGg5MNW4S94b+G9JEBDNmtLv8kDPXm7y1tWUJ8oVCdp+tYmH65b
 XA5pKxw+kHUTzl++vkM7x2XpJnfUz0CowfVAYGRGdR/hdLiTNCiHiXb4tu35bLzVWV
 g/ZRZIuSjKaUAueDueRTYpu6vuDGZpikujJoFgpAWB+EeWvtO1+MJpmCH9dQkW90o9
 JnCVUafdH3ZvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 11/17] drm: buddy_allocator: Fix buddy allocator
 init on 32-bit systems
Date: Thu,  6 Apr 2023 07:31:25 -0400
Message-Id: <20230406113131.648213-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113131.648213-1-sashal@kernel.org>
References: <20230406113131.648213-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 =?UTF-8?q?Lu=C3=ADs=20Mendes?= <luis.p.mendes@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Gow <davidgow@google.com>

[ Upstream commit 4453545b5b4c3eff941f69a5530f916d899db025 ]

The drm buddy allocator tests were broken on 32-bit systems, as
rounddown_pow_of_two() takes a long, and the buddy allocator handles
64-bit sizes even on 32-bit systems.

This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
	./tools/testing/kunit/kunit.py run --arch i386 \
	--kunitconfig ./drivers/gpu/drm/tests drm_buddy

(It results in kernel BUG_ON() when too many blocks are created, due to
the block size being too small.)

This was independently uncovered (and fixed) by Luís Mendes, whose patch
added a new u64 variant of rounddown_pow_of_two(). This version instead
recalculates the size based on the order.

Reported-by: Luís Mendes <luis.p.mendes@gmail.com>
Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=-CviDQbNaH0qfgYTSSjZgvvyj4U78AA@mail.gmail.com/T/
Signed-off-by: David Gow <davidgow@google.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230329065532.2122295-1-davidgow@google.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_buddy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 3d1f50f481cfd..7098f125b54a9 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		unsigned int order;
 		u64 root_size;
 
-		root_size = rounddown_pow_of_two(size);
-		order = ilog2(root_size) - ilog2(chunk_size);
+		order = ilog2(size) - ilog2(chunk_size);
+		root_size = chunk_size << order;
 
 		root = drm_block_alloc(mm, NULL, order, offset);
 		if (!root)
-- 
2.39.2

