Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DA4558E5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070826E942;
	Thu, 18 Nov 2021 10:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52FB6E942
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:20:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637230853; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wCXlJiM/UiX0WSdbdKpzYfQcNlXk6PajYynsqDsTg30=;
 b=N7RwHBr19+Fp5F1BM+8BuT/kT4flRJpo9GEWY6Ztgkp5sNMuvfP17hmSbw2H/qdqwOaGt7oL
 /UbIUpBeZherRAhn6sczaPR8snzkZ/Vkfiw2taF57P8HPPK/QVLebV2LBNyLZYgeH6/KM3sI
 uhVizkWO4QkpseyTpTrVHheGzjI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619629051e1d2f52330ea0a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:20:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E99CDC4361B; Thu, 18 Nov 2021 10:20:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F27DDC43619;
 Thu, 18 Nov 2021 10:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F27DDC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 3/4] drm/msm/a6xx: Fix uinitialized use of gpu_scid
Date: Thu, 18 Nov 2021 15:50:31 +0530
Message-Id: <20211118154903.3.Ie4ac321feb10168af569d9c2b4cf6828bed8122c@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
References: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid a possible uninitialized use of gpu_scid variable to fix the
below smatch warning:
	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
	error: uninitialized symbol 'gpu_scid'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 33da25b..68ee58f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1424,17 +1424,24 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	u32 gpu_scid, cntl1_regval = 0;
+	u32 cntl1_regval = 0;
 
 	if (IS_ERR(a6xx_gpu->llc_mmio))
 		return;
 
 	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
-		gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
 
 		gpu_scid &= 0x1f;
 		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
 			       (gpu_scid << 15) | (gpu_scid << 20);
+
+		/* On A660, the SCID programming for UCHE traffic is done in
+		 * A6XX_GBIF_SCACHE_CNTL0[14:10]
+		 */
+		if (adreno_is_a660_family(adreno_gpu))
+			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
+				(1 << 8), (gpu_scid << 10) | (1 << 8));
 	}
 
 	/*
@@ -1471,13 +1478,6 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
-
-	/* On A660, the SCID programming for UCHE traffic is done in
-	 * A6XX_GBIF_SCACHE_CNTL0[14:10]
-	 */
-	if (adreno_is_a660_family(adreno_gpu))
-		gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
-			(1 << 8), (gpu_scid << 10) | (1 << 8));
 }
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

