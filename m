Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E05257C66
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8B56E2D6;
	Mon, 31 Aug 2020 15:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6352E6E2D6;
 Mon, 31 Aug 2020 15:30:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F760214DB;
 Mon, 31 Aug 2020 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887806;
 bh=E0S5fTo0mX+8r5130quZXaxIlSmWMKiZqSWg4n8H/MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SBdQvUHfyHBTyHOaW2nFffb4wFfwYa71b+Y8/Jq3gSLZ4B5OXmcTW0nEar37ry+6Z
 E/jUKETzywemRvIW/SY78HU4fWd2kE0hadAeBtBFYs/dPCFaPDqVTZWZgpxUP8lXhc
 rpFKkaBJklgI/fKfLEURQRurdMtszdP2+JXJjCOY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 21/42] drm/msm/a6xx: fix gmu start on newer
 firmware
Date: Mon, 31 Aug 2020 11:29:13 -0400
Message-Id: <20200831152934.1023912-21-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit f5749d6181fa7df5ae741788e5d96f593d3a60b6 ]

New Qualcomm firmware has changed a way it reports back the 'started'
event. Support new register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1d330204c465c..2dd1cf1ffbe25 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -207,6 +207,16 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
+	u32 mask, reset_val;
+
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_DTCM_START + 0xff8);
+	if (val <= 0x20010004) {
+		mask = 0xffffffff;
+		reset_val = 0xbabeface;
+	} else {
+		mask = 0x1ff;
+		reset_val = 0x100;
+	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
@@ -218,7 +228,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		val == 0xbabeface, 100, 10000);
+		(val & mask) == reset_val, 100, 10000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
