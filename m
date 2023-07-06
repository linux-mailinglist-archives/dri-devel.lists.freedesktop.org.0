Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F9574A5A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436F10E4D7;
	Thu,  6 Jul 2023 21:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBC910E4CD;
 Thu,  6 Jul 2023 21:11:11 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-666e916b880so629417b3a.2; 
 Thu, 06 Jul 2023 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677870; x=1691269870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
 b=JCDNN0TKWRrI+QaDO5E9GGJcybEUdSCCbXOC5XaDfjBjVZKt93yukr/fM7xood2FCR
 I0YJFsI1kGAoE9Sk03IYm+skf9+yaXeBoz6uWJ5ORqX8bA7zhVy33mgalkWmCGQ4D3yl
 jLv8Ga5DbvgWVhh863w7uND4+UV0ghjM2lZNwm8e8KmlbtbQMYoYKTlJgDdNbI+XOWzy
 VyrlH90btmzQTjiNFW+502FnvjdP+h+TbUw56jhGax8HXLdXOOSCizBO9yHh6UpuyA9Y
 S6mZ8gUTge22HasmDH6y23iSIsEepM7e77t4dDqNyUsYKvuHPx1bL1VhDIgEOorIa10x
 zE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677870; x=1691269870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fpkuwfxk56jmaUIMhgMkkTmtHlSU19KWQefXBhwqKCg=;
 b=R421uVQs0jk9tinfX4j9TQffs8hB+p3TDePUlhroSj2sekWOCH/UG7RyErhqEumivZ
 uNiTxcJBu57v1q1j22oyM+fqSpBMRBhuA3gtb5WxLvUKgqAvnO+bPQxXDsr7Ku0jODAn
 /nbujSE5qUVXdwldbf0jqeLqrp1jRoUZMr8q7BIs7kEBOtUAqj5jS5oxViUfgFvGLzrx
 x81hbZXVBiWMaYvFmUAfDQChTCTjCLPlGjwq4LxwPvPHFmC2HLvtrHB9grC+FS2hjr4n
 P4/MN03Xp2n3VChJwSMPU3TK/tHOREGyDUOQhqhBruIqmJO2MwAQpETaDSWQ5Hfi8jg4
 Kbhg==
X-Gm-Message-State: ABy/qLa5GZ+TZ6eATdEhQMhU9AWpmYZVse+j++J8YCcNx6z0W/E1KLnQ
 rdWSGiRVRTVSml2tyODIJJ0l6t2AG44=
X-Google-Smtp-Source: APBJJlGeEDqK9wYyWfo2/1THXZ2nOwWQcgbqh+XoB76TslJdWmagiMHSCGYlEw5a/70hEMRiTGmRcQ==
X-Received: by 2002:a05:6a00:1a15:b0:668:753a:b150 with SMTP id
 g21-20020a056a001a1500b00668753ab150mr3128134pfv.21.1688677870268; 
 Thu, 06 Jul 2023 14:11:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 y25-20020aa78559000000b0063f1a1e3003sm1658094pfn.166.2023.07.06.14.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu device table
 entries
Date: Thu,  6 Jul 2023 14:10:39 -0700
Message-ID: <20230706211045.204925-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
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

