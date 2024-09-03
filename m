Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C89691D2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF6410E3CA;
	Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OINRIvKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2DE10E3BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:22:59 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f3e9fb6ee9so60001011fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333777; x=1725938577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0b2tP8OogQhAD1iHDJFAy53Wy0WW52N9JDrZmCScDm0=;
 b=OINRIvKDB0sQf4gZc77U3FQ/ZlR2Itu6nw9NUoUMJ3c7dEkW8B6uGSl0GPuyqGJQwg
 B3Slj23RjB3zMC0znVNGgnStu7rEKCP34dKEVHoBXY8509MsznkBbkcIJCj+N5hQaQ3i
 CEuibwMSAis+2C9tFzSvgawd0b5KrYZEPY3k9Tlcpr0tnbyLZTtBesL4vP80b9TLDbgA
 NQoPpPRKol3j+gfs5/ajd5FTYx7NmVNrYzaIX+sF/OrP3lEY1hP1qSUVROXemPGDAEqr
 H5dIVRwj0HA6vAoiRhtFzREgNYIccWf5uD1ZNx0nqJeqjUCTRoesKIIUcEbylQcgS2Mk
 Lnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333777; x=1725938577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0b2tP8OogQhAD1iHDJFAy53Wy0WW52N9JDrZmCScDm0=;
 b=GxBKST/gbKvTB7tpiatpTPa7PS6U5HqAhbZDkE5BIcFYmKhsY65HhwMIi4aTqHhdXs
 D5pk98giBkbvstdfoo6jwBZQihJmFk6Aie6FICKjNENnNpKsp+TI973dNSPIfWvQQxvD
 nPlmY6KNheRTCZ0/dBQnofqRrfGksOpzAWKZwbLntcElhHqi/a5F9D0Rt4Q0MdNKevkQ
 tQpJTIDNgjViJvNNmKtArrh+P96L1VIsPfoDiP3uT8vDcxCiHDGbxAe0uE7MtmCnPD6u
 mqTBKnR1Vah0M1QH5/6Kc+QEHKPYg28CuYd4XiMtgNXryuV0fAUQvHT+ij9zOrwrxZfa
 ppDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYH18bjKv4UjBeauCKx2rZlEtdR0UGErsokWo+c0xQa3T5lXH/k5bjwR13LHbIOZ2eVk97hl2hNn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9AFWRSGkF5Gz4A6TcdkgBCdK866gqHCxX3w21Gk+Ygbi+j6ud
 dJ7wSQo/Z1O9TS6QzMGdzlsa+AZ823G+Li9Ygz8mIwFrVVOWoFp26ol2CsnMLxI=
X-Google-Smtp-Source: AGHT+IF609hyxGru/0DwXLOm+aBppJnb/2O5mseMolEQbXXJ+G32pmFtPFZsBHipYB4ednMd14J6qQ==
X-Received: by 2002:a2e:5109:0:b0:2ec:637a:c212 with SMTP id
 38308e7fff4ca-2f636a7ff93mr27956781fa.39.1725333776413; 
 Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:47 +0300
Subject: [PATCH v6 04/15] drm/msm/dpu: drop
 dpu_format_check_modified_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-4-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3r29oRaw22hTRdemyvT0BFMQ814IpSnij8irLxE78YM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELa+Mg47GRvTWkAKtgMV38RWmxyBsMCzKBK
 /uRDH6xsNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1VdgB/4y/saMcEJda+LUaovBSmDs9uEcuONDbHzpCSddpYxDPDcMDx1ckgRSXn9YalM2yWPnC5b
 MoNA6niJb/VDoSJ6cT2winkIM3u5OALdEtNMVx6TE3oNQMXS++o04dQ82koqh12Qku/U51VS6AG
 cjwzCeFCqEztLKeemIMH6Gf2dHpQYX8SzN70YQaknfa4dvo8vnp3FcN/JMIhJklLVtTkPDA3Cmv
 dfE/UjooXvnUS2e+rIh0KWyZUUSDLB7QnCUe0u1VfJR//8vyq+W4kxKaWHnro6W/CiPUwawEn/T
 TpvbsT/15GAr6n5+YHEzXQtDXEwcyL+uXK3qxAOyPG8pcaG2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The msm_kms_funcs::check_modified_format() callback is not used by the
driver. Drop it completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 -----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
 drivers/gpu/drm/msm/msm_kms.h               |  6 ----
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 6b1e9a617da3..027eb5ecff08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -423,46 +423,3 @@ int dpu_format_populate_layout(
 
 	return ret;
 }
-
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos)
-{
-	const struct drm_format_info *info;
-	struct dpu_hw_fmt_layout layout;
-	uint32_t bos_total_size = 0;
-	int ret, i;
-
-	if (!fmt || !cmd || !bos) {
-		DRM_ERROR("invalid arguments\n");
-		return -EINVAL;
-	}
-
-	info = drm_format_info(fmt->pixel_format);
-	if (!info)
-		return -EINVAL;
-
-	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
-			&layout, cmd->pitches);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < info->num_planes; i++) {
-		if (!bos[i]) {
-			DRM_ERROR("invalid handle for plane %d\n", i);
-			return -EINVAL;
-		}
-		if ((i == 0) || (bos[i] != bos[0]))
-			bos_total_size += bos[i]->size;
-	}
-
-	if (bos_total_size < layout.total_size) {
-		DRM_ERROR("buffers total size too small %u expected %u\n",
-				bos_total_size, layout.total_size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 210d0ed5f0af..ef1239c95058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,22 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_format_check_modified_format - validate format and buffers for
- *                   dpu non-standard, i.e. modified format
- * @kms:             kms driver
- * @msm_fmt:         pointer to the msm_fmt base pointer of an msm_format
- * @cmd:             fb_cmd2 structure user request
- * @bos:             gem buffer object list
- *
- * Return: error code on failure, 0 on success
- */
-int dpu_format_check_modified_format(
-		const struct msm_kms *kms,
-		const struct msm_format *msm_fmt,
-		const struct drm_mode_fb_cmd2 *cmd,
-		struct drm_gem_object **bos);
-
 /**
  * dpu_format_populate_layout - populate the given format layout based on
  *                     mmu, fb, and format found in the fb
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9bcae53c4f45..daa42f289d2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1025,7 +1025,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.complete_commit = dpu_kms_complete_commit,
 	.enable_vblank   = dpu_kms_enable_vblank,
 	.disable_vblank  = dpu_kms_disable_vblank,
-	.check_modified_format = dpu_format_check_modified_format,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1e0c54de3716..e60162744c66 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -92,12 +92,6 @@ struct msm_kms_funcs {
 	 * Format handling:
 	 */
 
-	/* do format checking on format modified through fb_cmd2 modifiers */
-	int (*check_modified_format)(const struct msm_kms *kms,
-			const struct msm_format *msm_fmt,
-			const struct drm_mode_fb_cmd2 *cmd,
-			struct drm_gem_object **bos);
-
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);

-- 
2.39.2

