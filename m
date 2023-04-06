Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D106D9543
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60A310EB68;
	Thu,  6 Apr 2023 11:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788C510EB68
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:32:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF3B664486;
 Thu,  6 Apr 2023 11:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D823CC433D2;
 Thu,  6 Apr 2023 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680780762;
 bh=gbj4RU+WH+JTTi3fle7TPFkxkVd8ZbwYZhG3W2bu5jA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RlNVFakRtZKVNWmlanKuFie5Mn/aBlxHtRNvZNY8FnNzpxZq6GdkykaxKuglZZSk5
 MbttfqVoAP/gLubGKJ+rw63uBKuK4E8Rsy7ka20Y77lQJ9qE3ZoxHdi6b54ZhDvDgK
 R2lch/+bl0uF+IaAwb0zJVnltme/DeCSWrR6QvqpFoNai4xxrw/AzuFxTGarLjI39X
 d74fGpYew6F3Q9AoRPMH91ddrMy65Nt6nMCMkbVqd9Fx18+8VUbejzxo9b4cFYEWfw
 ein/AfgoKbBc3/vC+5J9TJleaBz8/dolWRdZr9HEd701W4yJRUqRD7f7Kp4D1hg0WN
 ECUU7Ve0Bg/Yg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/17] drm: test: Fix 32-bit issue in
 drm_buddy_test
Date: Thu,  6 Apr 2023 07:32:06 -0400
Message-Id: <20230406113211.648424-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113211.648424-1-sashal@kernel.org>
References: <20230406113211.648424-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jason@zx2c4.com,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, djwong@kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 mairacanal@riseup.net, David Gow <davidgow@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Gow <davidgow@google.com>

[ Upstream commit 25bbe844ef5c4fb4d7d8dcaa0080f922b7cd3a16 ]

The drm_buddy_test KUnit tests verify that returned blocks have sizes
which are powers of two using is_power_of_2(). However, is_power_of_2()
operations on a 'long', but the block size is a u64. So on systems where
long is 32-bit, this can sometimes fail even on correctly sized blocks.

This only reproduces randomly, as the parameters passed to the buddy
allocator in this test are random. The seed 0xb2e06022 reproduced it
fine here.

For now, just hardcode an is_power_of_2() implementation using
x & (x - 1).

Signed-off-by: David Gow <davidgow@google.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230329065532.2122295-2-davidgow@google.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 62f69589a72d3..a699fc0dc8579 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_buddy *mm,
 		err = -EINVAL;
 	}
 
-	if (!is_power_of_2(block_size)) {
+	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
+	if (block_size & (block_size - 1)) {
 		kunit_err(test, "block size not power of two\n");
 		err = -EINVAL;
 	}
-- 
2.39.2

