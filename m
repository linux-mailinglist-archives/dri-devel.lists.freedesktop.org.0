Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF8452A20
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 06:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4D26E0C1;
	Tue, 16 Nov 2021 05:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 16 Nov 2021 05:58:28 UTC
Received: from qq.com (smtpbg456.qq.com [59.36.132.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960D06E8D0;
 Tue, 16 Nov 2021 05:58:28 +0000 (UTC)
X-QQ-mid: bizesmtp42t1637041833t56n8jsa
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 16 Nov 2021 13:50:32 +0800 (CST)
X-QQ-SSF: 01400000002000B0G000B00A0000000
X-QQ-FEAT: 0VgNaGdhy9gMzxiMf1vmpjJbNpQ/R/ZOeZ0tS/XNDElwqgpr4Swqsek2YJaCD
 cziT7dWpG99gNhZes+Eql5RTGoAx2xSjd1Pw+aU9sSvzp0tiKfo1TQC9GmyO4+8kSKl68Yq
 TVMAPW/mA0Kb3dMLZXWaa23CFclqHcPBU5QgNKZBDKqWI/+IlJfm3aP0N4H371ykVGAFHgx
 XgUA1vQtlW9hnw+iVWNZGCygwzL4obN9r36Nmkfk3JSslx52Z3YiRG943brxIHHY+xvUqA6
 8LSSWRMwlpLowvCePefZimT/O1Ivshy7bwlYLIILabMJrX/ljNh8AXi2ZIvg7LYCuMGq4OS
 dUS9TRGSjqzWRY3kXUJ20T5WdFyvGQJuyl7Fdu9gfrxxrH+xag=
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/radeon:WARNING opportunity for max()
Date: Tue, 16 Nov 2021 13:50:31 +0800
Message-Id: <20211116055031.31621-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
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
Cc: zhaoxiao <zhaoxiao@uniontech.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following coccicheck warning:
drivers/gpu/drm/radeon/r100.c:3450:26-27: WARNING opportunity for max()
drivers/gpu/drm/radeon/r100.c:2812:23-24: WARNING opportunity for max()

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/radeon/r100.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 2dd85ba1faa2..c65ee6f44af2 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -2809,10 +2809,7 @@ void r100_vram_init_sizes(struct radeon_device *rdev)
 		if (rdev->mc.aper_size > config_aper_size)
 			config_aper_size = rdev->mc.aper_size;
 
-		if (config_aper_size > rdev->mc.real_vram_size)
-			rdev->mc.mc_vram_size = config_aper_size;
-		else
-			rdev->mc.mc_vram_size = rdev->mc.real_vram_size;
+		rdev->mc.mc_vram_size = max(config_aper_size, rdev->mc.real_vram_size);
 	}
 }
 
@@ -3447,10 +3444,7 @@ void r100_bandwidth_update(struct radeon_device *rdev)
 	mc_latency_mclk.full += disp_latency_overhead.full + cur_latency_mclk.full;
 	mc_latency_sclk.full += disp_latency_overhead.full + cur_latency_sclk.full;
 
-	if (mc_latency_mclk.full > mc_latency_sclk.full)
-		disp_latency.full = mc_latency_mclk.full;
-	else
-		disp_latency.full = mc_latency_sclk.full;
+	disp_latency.full = max(mc_latency_mclk.full, mc_latency_sclk.full);
 
 	/* setup Max GRPH_STOP_REQ default value */
 	if (ASIC_IS_RV100(rdev))
-- 
2.20.1



