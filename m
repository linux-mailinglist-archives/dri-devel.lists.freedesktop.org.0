Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B976A5851
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E2E10E699;
	Tue, 28 Feb 2023 11:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F110E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f41so12666089lfv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9V86A2md5AFKxxweDVxCd3trlMEX/YOC63STCoTsC+I=;
 b=oGJEbNHNR5uGkKIkjfKgNYJ03WRvYp9fIZq3ZekYrrllrb6YwK0yar0RIrhbq3ugB/
 jpQw9vA6foXUCut6whgeR8EAnboHctaCfETxFsZjV3xq4d8AALn6MLuj4UToudXZg68w
 dRhuLDUjKd0Osttcx7lkpOBQg/vprbHCijhLrLkn5yUeAsZN0pgM8stRqSqdsRuXi1M4
 D3Bj7/MYUWRJu9xJ15CUv6V1HMUMxs6gdxgDOYM+hrk659lqXss2B/cf0aClTgDYiwQS
 VrzLYiBbR2HnyNZN2Jw3VAZT/DHWGGTDChrXp62wmRiq8aZiuhIrnIX9sVPoCvg/hpIi
 r36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9V86A2md5AFKxxweDVxCd3trlMEX/YOC63STCoTsC+I=;
 b=zg4MslH7UrhJkD31puKBK+HHu26vZBzsIaJcViGFJ7kRa94mzCNOQcRQGNixRnkUoO
 PtDKK2qYMOZd016YivIsU1cCJT9ukfY3zykBbnfWkEfbaEvUfi1GUMWO5rXiuce3iX6g
 +HNkcyT4bqU0a31jL1nJrHzFOLNcm/jM4uUJBTEbc1O4EOmD1LC5mnYUAnZy6C/MQfOL
 kpQd9+VdqkwS+a1NZ/UWTwsvfSOnwmqI5LVeqsSdU+Fgu8kLDLKhb44VuMMcJ1AB2TcO
 5sjHULtb+D2024qhFpYS+rQkT8A9NEYfjFvG3Al3Lv1Y/ViEZaVY/3Z1a48COkeUZ4rm
 kq3Q==
X-Gm-Message-State: AO0yUKX3yqZN4S49xydC6ZhvGySWYlONegIAIkuGeXo4DJ3WixNjVm/z
 zMBxIosNoNJla5YG0l8kYLH+sw==
X-Google-Smtp-Source: AK7set+n/2PiXvFr2eyiUh555VPt5RaU22iRUStwrr6Z2d8rLRtWtUH6Q/Ik5KsFIEbRjuu543CCGA==
X-Received: by 2002:ac2:5df6:0:b0:4db:df32:3f89 with SMTP id
 z22-20020ac25df6000000b004dbdf323f89mr511097lfq.9.1677584028715; 
 Tue, 28 Feb 2023 03:33:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 06/10] drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR)
 parameters
Date: Tue, 28 Feb 2023 13:33:38 +0200
Message-Id: <20230228113342.2051425-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The array of rc_parameters contains a mixture of parameters from DSC 1.1
and DSC 1.2 standards. Split these tow configuration arrays in
preparation to adding more configuration data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 127 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
 include/drm/display/drm_dsc_helper.h      |   7 +-
 3 files changed, 119 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index a6d11f474656..51794b40526a 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -326,11 +326,81 @@ struct rc_parameters_data {
 
 #define DSC_BPP(bpp)	((bpp) << 4)
 
+static const struct rc_parameters_data rc_parameters_pre_scr[] = {
+{ DSC_BPP(8), 8,
+	/* 8BPP/8BPC */
+	{ 512, 12, 6144, 3, 12, 11, 11, {
+		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
+		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 10,
+	/* 8BPP/10BPC */
+	{ 512, 12, 6144, 7, 16, 15, 15, {
+		/*
+		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
+		 * VESA DSC 1.1 Table E-5 sets it to 4.
+		 */
+		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
+		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(8), 12,
+	/* 8BPP/12BPC */
+	{ 512, 12, 6144, 11, 20, 19, 19, {
+		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+		{ 21, 23, -12 }
+		}
+	}
+},
+{ DSC_BPP(12), 8,
+	/* 12BPP/8BPC */
+	{ 341, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
+		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(12), 10,
+	/* 12BPP/10BPC */
+	{ 341, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
+		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
+		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(12), 12,
+	/* 12BPP/12BPC */
+	{ 341, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
+		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
+		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
+		{ 21, 23, -12 }
+		}
+	}
+},
+{ /* sentinel */ }
+};
+
 /*
  * Selected Rate Control Related Parameter Recommended Values
  * from DSC_v1.11 spec & C Model release: DSC_model_20161212
  */
-static const struct rc_parameters_data rc_parameters[] = {
+static const struct rc_parameters_data rc_parameters_1_2_444[] = {
 { DSC_BPP(6), 8,
 	/* 6BPP/8BPC */
 	{ 768, 15, 6144, 3, 13, 11, 11, {
@@ -390,22 +460,18 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ 512, 12, 6144, 3, 12, 11, 11, {
 		{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
-		{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
+		{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
 		}
 	}
 },
 { DSC_BPP(8), 10,
 	/* 8BPP/10BPC */
 	{ 512, 12, 6144, 7, 16, 15, 15, {
-		/*
-		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
-		 * VESA DSC 1.1 Table E-5 sets it to 4.
-		 */
-		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
+		{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
 		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
+		{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
 		}
 	}
 },
@@ -414,9 +480,9 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ 512, 12, 6144, 11, 20, 19, 19, {
 		{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
 		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-		{ 21, 23, -12 }
+		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
+		{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
+		{ 20, 21, -12 }
 		}
 	}
 },
@@ -500,8 +566,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ 341, 15, 2048, 3, 12, 11, 11, {
 		{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
 		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
-		{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
-		{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
+		{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
 		}
 	}
 },
@@ -510,8 +576,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ 341, 15, 2048, 7, 16, 15, 15, {
 		{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
 		{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
-		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
-		{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
+		{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
 		}
 	}
 },
@@ -520,9 +586,9 @@ static const struct rc_parameters_data rc_parameters[] = {
 	{ 341, 15, 2048, 11, 20, 19, 19, {
 		{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
 		{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
-		{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
-		{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
-		{ 21, 23, -12 }
+		{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
+		{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
+		{ 18, 19, -12 }
 		}
 	}
 },
@@ -604,7 +670,8 @@ static const struct rc_parameters_data rc_parameters[] = {
 { /* sentinel */ }
 };
 
-static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
+static const struct rc_parameters *get_rc_params(const struct rc_parameters_data *rc_parameters,
+						 u16 dsc_bpp,
 						 u8 bits_per_component)
 {
 	int i;
@@ -622,13 +689,27 @@ static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
  * accordance with the DSC 1.1 or 1.2 specification and DSC C Model
  *
  * @vdsc_cfg: DSC Configuration data partially filled by driver
+ * @kind: operating mode and standard to follow
  */
-int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind)
 {
+	const struct rc_parameters_data *data;
 	const struct rc_parameters *rc_params;
 	int i;
 
-	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
+	switch (kind) {
+	case DRM_DSC_1_2_444:
+		data = rc_parameters_1_2_444;
+		break;
+	case DRM_DSC_1_1_PRE_SCR:
+		data = rc_parameters_pre_scr;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rc_params = get_rc_params(data,
+				  vdsc_cfg->bits_per_pixel,
 				  vdsc_cfg->bits_per_component);
 	if (!rc_params)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 1ee8d13c9d64..4d220d24fa73 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -156,7 +156,15 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	if (DISPLAY_VER(dev_priv) >= 13) {
 		calculate_rc_params(vdsc_cfg);
 	} else {
-		ret = drm_dsc_setup_rc_params(vdsc_cfg);
+		if ((compressed_bpp == 8 ||
+		     compressed_bpp == 12) &&
+		    (vdsc_cfg->bits_per_pixel == 8 ||
+		     vdsc_cfg->bits_per_pixel == 10 ||
+		     vdsc_cfg->bits_per_pixel == 12))
+			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_1_PRE_SCR);
+		else
+			ret = drm_dsc_setup_rc_params(vdsc_cfg, DRM_DSC_1_2_444);
+
 		if (ret)
 			return ret;
 
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 1681791f65a5..c634bb2935d3 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -10,12 +10,17 @@
 
 #include <drm/display/drm_dsc.h>
 
+enum drm_dsc_params_kind {
+	DRM_DSC_1_2_444,
+	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
+};
+
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
-int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
+int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
-- 
2.39.2

