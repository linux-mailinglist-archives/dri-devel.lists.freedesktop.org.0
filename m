Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441C6CCEEF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 02:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355F10E4C5;
	Wed, 29 Mar 2023 00:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717010E345
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 00:37:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id q16so18041082lfe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680050233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBLZXjMuSqv/THSupIP/Bwkp1hXIGmJfu8xFDaJQMH0=;
 b=MfnSMtlZusS4/T37NeWys1JKQVNWFLAlyeQHgx8t9SsojIz9DEqivAmt2e6uZYnwzl
 MkIn9p/8Wp88aAYR9/Yh2yHAHJPCCepEFwCN3czXcTzfEMUGbjFxyEMQwJjK8I15gj55
 i2RV3LSJUGoUbdp0r2R47fjnsGO/ZP02ZA8w/rcqyqxZs1YkmMefyIsuGTnGCK41ID0k
 gswI5CDqsQ7aP4Qh7f0tGAHcsB2dwGUW9wIof+4eozNqGVxKGyFSukEw0qpEEjCel+bj
 H70YQLpYOfHBJyvr4HN8Z9v9+ed7tQ8gH6olGw4002FRUYo3CoL68fAm4FRy/9Ggoq4B
 jiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680050233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBLZXjMuSqv/THSupIP/Bwkp1hXIGmJfu8xFDaJQMH0=;
 b=z//ezM9Mo19xBoCDiJ1lDsyR4KTOPM/kxcsGz63xA5DcdA6gRnywlSLl04vMS40oUd
 wpY2Yf7rLOOvkpJfPbkAdjXOPQEqs6fdButaxcsUiicO4iekLXZPCZasTZNVWtAxPNNq
 TgxWvadDCmPXsfRvQHvbuva/VVsQfeZaJn4Mb5rwxcOIkYdP5bb5Kj99qVq6Z1JJl736
 x5ZCTTOZIiPQelGs+AMmbMgti08h9Bj6DdKf3cgHYCWRJhi76mG5GCp99/S9DnKFAeBH
 NYOQz4rIgoxVG3nMreYNKsSy0ARRYvQNMkWcZ9IHzsZPD5wwL/H3SpQoYslpAVAhHvwc
 Kwsw==
X-Gm-Message-State: AAQBX9fO1z1e3CRS94lPbZnhYf/50oGJ0/qn23XTX90mErNwOUsI0PMM
 OZ2YKJMh+Li/kQO9Y0Ghj4MrFA==
X-Google-Smtp-Source: AKy350YWYrXfyOMVLXmf5oYg68NONG1SerMhEOHmdsuQ6YZNO1SKxTn+KSIpB3RTTTUWtIbVQrnkDg==
X-Received: by 2002:ac2:5219:0:b0:4e9:6033:20d3 with SMTP id
 a25-20020ac25219000000b004e9603320d3mr4639486lfl.24.1680050233245; 
 Tue, 28 Mar 2023 17:37:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y3-20020ac24463000000b004db00b4c671sm5254138lfl.7.2023.03.28.17.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 17:37:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
Date: Wed, 29 Mar 2023 03:37:02 +0300
Message-Id: <20230329003710.1073261-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329003710.1073261-1-dmitry.baryshkov@linaro.org>
References: <20230329003710.1073261-1-dmitry.baryshkov@linaro.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rc_buf_thresh values are common to all DSC implementations. Move
them to the common helper together with the code to propagage them to
the drm_dsc_config.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 35 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +---------------
 include/drm/display/drm_dsc_helper.h      |  1 +
 3 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index c869c6e51e2b..be91abe2cfb2 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -270,6 +270,41 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 }
 EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
 
+/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
+static const u16 drm_dsc_rc_buf_thresh[] = {
+	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
+	7744, 7872, 8000, 8064
+};
+
+/**
+ * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
+ * in accordance with the DSC 1.2 specification.
+ *
+ * @vdsc_cfg: DSC Configuration data partially filled by driver
+ */
+void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
+{
+	int i;
+
+	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
+		     DSC_NUM_BUF_RANGES - 1);
+	BUILD_BUG_ON(ARRAY_SIZE(drm_dsc_rc_buf_thresh) !=
+		     ARRAY_SIZE(vdsc_cfg->rc_buf_thresh));
+
+	for (i = 0; i < ARRAY_SIZE(drm_dsc_rc_buf_thresh); i++)
+		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
+
+	/*
+	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
+	 * as per C Model
+	 */
+	if (vdsc_cfg->bits_per_pixel == 6 << 4) {
+		vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
+		vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
+	}
+}
+EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
+
 /**
  * drm_dsc_compute_rc_parameters() - Write rate control
  * parameters to the dsc configuration defined in
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 20ce13b0a16b..5388dc88f4a6 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -37,12 +37,6 @@ enum COLUMN_INDEX_BPC {
 	MAX_COLUMN_INDEX
 };
 
-/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
-static const u16 rc_buf_thresh[] = {
-	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
-	7744, 7872, 8000, 8064
-};
-
 struct rc_parameters {
 	u16 initial_xmit_delay;
 	u8 first_line_bpg_offset;
@@ -475,23 +469,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
 	vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
 
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
-		/*
-		 * six 0s are appended to the lsb of each threshold value
-		 * internally in h/w.
-		 * Only 8 bits are allowed for programming RcBufThreshold
-		 */
-		vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
-	}
-
-	/*
-	 * For 6bpp, RC Buffer threshold 12 and 13 need a different value
-	 * as per C Model
-	 */
-	if (compressed_bpp == 6) {
-		vdsc_cfg->rc_buf_thresh[12] = 0x7C;
-		vdsc_cfg->rc_buf_thresh[13] = 0x7D;
-	}
+	drm_dsc_set_rc_buf_thresh(vdsc_cfg);
 
 	/*
 	 * From XE_LPD onwards we supports compression bpps in steps of 1
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 8b41edbbabab..706ba1d34742 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
+void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
-- 
2.39.2

