Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B189765DF7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9010E60B;
	Thu, 27 Jul 2023 21:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6410E610;
 Thu, 27 Jul 2023 21:23:05 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686efb9ee3cso1367277b3a.3; 
 Thu, 27 Jul 2023 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690492985; x=1691097785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
 b=RaNT9qlMtDR/GZE5drKBxRtW8BSnkseLvQSs+sHflUC50w5itkbK6pro3pZ1J1tBOT
 LfEYDwLMCq/N4mzwiBUE6eoK8DAfl4yn+VntE5lkpoyvYXQfrWNZ0qGCEfL2kaAxoZ58
 Z8WlJCakYXBepWynivVt52XB56STeL42FxkmVy3n1ZkuoBBX+HKFsoEqtfHTYPJ8XhCc
 frexCaIU3n9qQ6ucrEhofPS/vxhNIinArq+0awEar8BRJnaj6eZHZCM8sUnx/atA6ZQY
 13IBqNs47HOMbO7ssprY03XlnSxx0JyL9Oe8Wcrj9XH3iQ2yLkftQxhxPmX/KEaWhmPE
 9T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492985; x=1691097785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
 b=YGDgCmMCvtPNYLXpN97GFG4H1Z5nfmbIl5yaVTBR7/0Z6A76ptVchDB2prh8SGywhN
 +osaft1oFmCQJJxWiqthnNCowhcnYVkm3uib9l4R0XsGQJ3hXM/rTTjkCiIMme+jFuEk
 ISvR+6FORJR58+plQUOHSNq5lPALWYERC2JMD8LnHVW8r7bG3aMq3kFEvKiQLON7gyel
 H56sLCudWWxzUJr8pZnig4pYkacxsGiWOIpLWGjk7/gnIE45cphG389Bo1sbqGEhEN3C
 RK8ntRMyKkh9g1ZJODUQZxpERZSIgyx5dMXef/WClaFplis74VRS3eq9NF+LbZpeZDiK
 8zCA==
X-Gm-Message-State: ABy/qLZPa62r//VPds7079zL8QyON0B+MwV3dM0NAkRxaOFMWOc+vNCZ
 7dMabGGGKs+HsDFJXT6Ko+ymvd8o56E=
X-Google-Smtp-Source: APBJJlFShojh8wf8gGbvxxJWyU216prnSxYU8QP+KzuaiPFML3a/GNydE3puG72CsaVdlsZZCb1A/w==
X-Received: by 2002:a05:6a00:84b:b0:67a:b045:e290 with SMTP id
 q11-20020a056a00084b00b0067ab045e290mr464630pfk.4.1690492984989; 
 Thu, 27 Jul 2023 14:23:04 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a62e31a000000b00666b3706be6sm1892596pfh.107.2023.07.27.14.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:23:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/13] drm/msm/adreno: Allow SoC specific gpu device table
 entries
Date: Thu, 27 Jul 2023 14:20:11 -0700
Message-ID: <20230727212208.102501-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

There are cases where there are differences due to SoC integration.
Such as cache-coherency support, and (in the next patch) e-fuse to
speedbin mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3c531da417b9..e62bc895a31f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -258,6 +258,32 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+	}, {
+		.machine = "qcom,sm4350",
+		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
+	}, {
+		.machine = "qcom,sm6375",
+		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
+		.revn = 619,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a619_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a615_zap.mdt",
+		.hwcg = a615_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
@@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
 	/* identify gpu: */
 	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
 		const struct adreno_info *info = &gpulist[i];
+		if (info->machine && !of_machine_is_compatible(info->machine))
+			continue;
 		if (adreno_cmp_rev(info->rev, rev))
 			return info;
 	}
@@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent =
+		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	priv->has_cached_coherent =
-		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
-		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e08d41337169..d5335b99c64c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
 extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 
 struct adreno_info {
+	const char *machine;
 	struct adreno_rev rev;
 	uint32_t revn;
 	const char *fw[ADRENO_FW_MAX];
-- 
2.41.0

