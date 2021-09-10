Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A940701B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 18:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064296EA41;
	Fri, 10 Sep 2021 16:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1D76EA41
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 16:58:47 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B6AB3F04C; 
 Fri, 10 Sep 2021 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631293125;
 bh=P4J0uP+mvBeCpdSBmGVI2spIor3xRsNEZjAeWnGcryo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=DG0kXV2QncuQ1VkQGiYLOTf9w1Tq0m32MF9+mIoDus8+TlQsxzFSx60hPb0Z3FuBS
 QXY0iK7RHnjsUf1xSKjirRw7M7F5LsycIOLQFNMFI5bCgV/VSmRxZUFhO+G/mXcd2I
 peMd159lomSA/M121gSRQcD8nGudZEOJCnhazk++veFYTGmg71/l9KPSBZAMndj5Lw
 /IEslUJGu7bV03tcEnqV3W+xZB2rmrX9DmTGcZENeo50SufQVD4w0IPS4sXnKKpYMH
 EumnL09/TEMUbMY24PRfpm6zMctAQRS8uyXQEuDpwXnRpT0AGP1BVaA3HZdGRZCg3j
 aO0YVOmw1aafg==
From: Colin King <colin.king@canonical.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: atyfb: Remove assigned but never used variable
 statements
Date: Fri, 10 Sep 2021 17:58:44 +0100
Message-Id: <20210910165844.98940-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements where local variables are being assigned
values that are never read because the function returns immediately after
the assignment. Clean up the code by removing them.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/aty/mach64_gx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/mach64_gx.c b/drivers/video/fbdev/aty/mach64_gx.c
index 9c37e28fb78b..d06d24830080 100644
--- a/drivers/video/fbdev/aty/mach64_gx.c
+++ b/drivers/video/fbdev/aty/mach64_gx.c
@@ -352,10 +352,8 @@ static int aty_var_to_pll_18818(const struct fb_info *info, u32 vclk_per,
 	post_divider = 1;
 
 	if (MHz100 > MAX_FREQ_2595) {
-		MHz100 = MAX_FREQ_2595;
 		return -EINVAL;
 	} else if (MHz100 < ABS_MIN_FREQ_2595) {
-		program_bits = 0;	/* MHz100 = 257 */
 		return -EINVAL;
 	} else {
 		while (MHz100 < MIN_FREQ_2595) {
-- 
2.32.0

