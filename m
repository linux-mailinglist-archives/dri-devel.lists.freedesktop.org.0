Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A76A583F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B1A10E68E;
	Tue, 28 Feb 2023 11:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352010E054
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:47 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bi9so12754615lfb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BVMQK7LyIhryxNUXT8eWHbs2+VAiySTJ4vo2/0gkSQ=;
 b=Pn1RwiQjz0MR1w1gMhV+5SREdc3koDULeo7OA8m88pZitn5D+RzyBD0Xji0gD5nBDD
 XuU7JSVykbUQ/t431YLfRTTM8iOjHKX4CUBPHeYbDoVDxnv7ikV+MsfqzaGfF0Lt2WBE
 nXdA61PEzh/v1ZOkafQMwZR4y1K82iiJ+F0OhRoHqbooyxr62qlcOQjsPMUCQSQjvdJy
 f6FSWbMsgpJpJXfGFY3lOo9oQswan/y2hD3UIG2mEijlciTpgCmo3QNBynoX6HM9WxBc
 Yl5LFA/Pbr1bqCMzNFvP/qh1RzGbD1j2s/fb1j2ZOH3i+21JlzbNK9b6/jgKf6D33RMV
 cVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BVMQK7LyIhryxNUXT8eWHbs2+VAiySTJ4vo2/0gkSQ=;
 b=NsBt9ThDNo8pP7jGRHzk9YFNdE6Lra9/4DdX4XEk5elujsYuINiywULkrUeAv8ww9I
 JyaLA4V2MNXDbwH7mLsnMNnIi+PYrpNSIKnCNk3RfNCEwqLR/aC687EEBQVSS9QtYFXX
 m7B3gzprAnJcxlaXxX5lqwDsgAyHi/C8JD4zQOdNf6rJ/7RWGYX7kIm2LkSGVTL6tI2n
 EwBM3XVBJPlVsGPSTnOoPeZ1xj+aCNFGQxOX141DAqeS6u7xFe97c2jUtn8Nym5zskjK
 ICdbAp9BuX0vLt5j/V12yk6NhYCf+3HNur4HNAkErSBgXCbIevYedis+s+l8/JljV/8j
 90mA==
X-Gm-Message-State: AO0yUKVfyfDoQd2KM03D5JbNDk0i9gvx4xyZukNy1t6+he/KHSHOQid2
 ALKt9wV3g6sELmQug2ujTOImiw==
X-Google-Smtp-Source: AK7set+ojJ6IhSscuDuBOx0TafvnuielA8/wHbA+LXSsb8gcrjyFQ7HWnrLSvaj67JrO3t2Lemtruw==
X-Received: by 2002:a05:6512:6d0:b0:4dd:9eb6:443e with SMTP id
 u16-20020a05651206d000b004dd9eb6443emr863230lff.31.1677584025183; 
 Tue, 28 Feb 2023 03:33:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common helper
Date: Tue, 28 Feb 2023 13:33:34 +0200
Message-Id: <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
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

The rc_buf_thresh values are common to all DSC implementations. Move
them to the common helper together with the code to propagage them to
the drm_dsc_config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
 include/drm/display/drm_dsc_helper.h      |  1 +
 3 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index c869c6e51e2b..ab8679c158b5 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 }
 EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
 
+/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
+const u16 drm_dsc_rc_buf_thresh[] = {
+	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
+	7744, 7872, 8000, 8064
+};
+EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);
+
+/**
+ * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
+ * in accordance with the DSC 1.2 specification.
+ *
+ * @vdsc_cfg: DSC Configuration data partially filled by driver
+ */
+void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
+{
+	int i = 0;
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
+		/*
+		 * six 0s are appended to the lsb of each threshold value
+		 * internally in h/w.
+		 * Only 8 bits are allowed for programming RcBufThreshold
+		 */
+		vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
+	}
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
index d080741fd0b3..b4faab4c8fb3 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
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
@@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
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

