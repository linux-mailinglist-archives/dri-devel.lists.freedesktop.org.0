Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEC31F557
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94756E8A5;
	Fri, 19 Feb 2021 07:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E816E8A5;
 Fri, 19 Feb 2021 07:29:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UOxD3N8_1613719765; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UOxD3N8_1613719765) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 19 Feb 2021 15:29:25 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@linux.ie
Subject: [PATCH] drm/radeon/dpm: fix non-restricted types with le16_to_cpu()
Date: Fri, 19 Feb 2021 15:29:20 +0800
Message-Id: <1613719760-42773-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following sparse warnings:
drivers/gpu/drm/radeon/rv6xx_dpm.c:1798:21: warning: cast to restricted
__le32
drivers/gpu/drm/radeon/rv6xx_dpm.c:1799:22: warning: cast to restricted
__le16
drivers/gpu/drm/radeon/rv6xx_dpm.c:1800:23: warning: cast to restricted
__le16

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/radeon/rv6xx_dpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.c b/drivers/gpu/drm/radeon/rv6xx_dpm.c
index 69d380f..e6ab99e 100644
--- a/drivers/gpu/drm/radeon/rv6xx_dpm.c
+++ b/drivers/gpu/drm/radeon/rv6xx_dpm.c
@@ -1795,9 +1795,9 @@ static void rv6xx_parse_pplib_non_clock_info(struct radeon_device *rdev,
 					     struct radeon_ps *rps,
 					     struct _ATOM_PPLIB_NONCLOCK_INFO *non_clock_info)
 {
-	rps->caps = le32_to_cpu(non_clock_info->ulCapsAndSettings);
-	rps->class = le16_to_cpu(non_clock_info->usClassification);
-	rps->class2 = le16_to_cpu(non_clock_info->usClassification2);
+	rps->caps = le32_to_cpu((__le32 __force)non_clock_info->ulCapsAndSettings);
+	rps->class = le16_to_cpu((__le16 __force)non_clock_info->usClassification);
+	rps->class2 = le16_to_cpu((__le16 __force)non_clock_info->usClassification2);
 
 	if (r600_is_uvd_state(rps->class, rps->class2)) {
 		rps->vclk = RV6XX_DEFAULT_VCLK_FREQ;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
