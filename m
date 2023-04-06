Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FF6D9530
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4210EB6B;
	Thu,  6 Apr 2023 11:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D310EB6A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:32:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94DAE64672;
 Thu,  6 Apr 2023 11:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D28AC433D2;
 Thu,  6 Apr 2023 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680780723;
 bh=KvbfyJJsZJdfmByvweii2cgAnMVFdQui9o6fhzYeZtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iB95A4yrRuN5uuCo76iEcfyH7cKw0yKwTpUTb4rcJN8NP3aqKaIMaBYowDezxMHkq
 T2K7Hx28MW3il2bJRLMZLquJF2LXV6p+qSVMX+kFfzoSTV2x6aGfrce3jcTEsZk75S
 DFOsv3cHwONpIUSeVkV16wSd7PtC4GeTiyishBrmXOpQKy1kxLnRekVvAcDEBzeggb
 Jl7RO215pQZwKNB4hPSYMjo14Z1I2dhD0mUHhXt1+nxnUH78/cDdb0uzrACM0w5bNy
 +katIzOC3XFI1KuubWlHudpSNcaUyTyzy3oHAvFV+2kb8Gxci0/wN7qnTkBN56xnYS
 ZJt+CGHolsm3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 12/17] drm: test: Fix 32-bit issue in
 drm_buddy_test
Date: Thu,  6 Apr 2023 07:31:26 -0400
Message-Id: <20230406113131.648213-12-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jason@zx2c4.com,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maxime@cerno.tech, David Gow <davidgow@google.com>,
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
index f8ee714df3967..09ee6f6af896b 100644
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

