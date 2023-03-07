Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D26AE13E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F98510E4B8;
	Tue,  7 Mar 2023 13:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B1B10E4B2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:49:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id i20so13118182lja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678196950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXWuxeHMpQCt72Y6URHGm/0rqCv9ixM2ky1A1nPsEmM=;
 b=lRaCrwCjzuZTd/Xsb+0P/8och9EZyiBfIT/7DLrod0VlJASk0XDUn0hjk+U+IJL73J
 nd1IW/YwVi+dStTkYE0TPxi6biLjky2lfCL4Mv4VcY9tB9/NwdLz8vh8JHOeoDSUNX/U
 heBAO6j0v9HAxc2YXGgL+424w/SNhQoCOFhK2A79XGSPCxMoh8rj8GNJCfJ64B+JspT8
 04+wk0ZO2MOuHdDritVHXqJLiYwjSbH39SvdHNcUx8xFkOC2jOx4Rmx5lOypsufA47Db
 cqIMGkCPGbtq2kgx9fACG9cWVGz7h+PeOcLmawrcT7DZwllFID9B1e9wBhe3BkCXYND0
 jBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXWuxeHMpQCt72Y6URHGm/0rqCv9ixM2ky1A1nPsEmM=;
 b=0VjYVclNPJq6NMDMuX80ispVkpf0Y+lxKXei5x7HXq0iKh9p6191D7u+kOZPlbn66b
 rsM7cakmCWFZIQsZhKZ2sMxoptr3UkMWXaZ2PyyrmqEoIHugz/EeCXFjZpYQ2GO1TMgU
 1mxxfdDJjeTnMXor+VzovI1kufn1kgDHDsuhpRTFa2C6qv9VqGGsv9e56jQWYUiKUK5n
 fIQKq5ul8FCtJLd3+wrtBAZnCXhmP+K8PKmtR2pdxXAxbUf1hbE3A+hVFprtKMsm7uzr
 xFBPW4PAv733hzdSRbVH4i3aiHK7uBG1QN0f+zD/MtOCfEhVSS0vSYFrSnMdEc6fpLvY
 BbCw==
X-Gm-Message-State: AO0yUKV2fJcDY2smlbtVvc4kOrm7LMQ2np9JEogGAGx/QRh6gA+TBTUu
 nVdaHvCzRwY0+6y9UXHOAM4dpA==
X-Google-Smtp-Source: AK7set/ikKt9+sjmxcf5w/pbvan9tKA/FOg+BAZvszPHwYqLdNe8nPDTUFUwf9D8cU/LT4b8/QbvVg==
X-Received: by 2002:a2e:b88e:0:b0:298:3a2d:4363 with SMTP id
 r14-20020a2eb88e000000b002983a2d4363mr5557984ljp.5.1678196950098; 
 Tue, 07 Mar 2023 05:49:10 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a2e91ce000000b0029597ebacd0sm2128991ljg.64.2023.03.07.05.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:49:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 10/10] drm/msm/dsi: use new helpers for DSC setup
Date: Tue,  7 Mar 2023 15:49:01 +0200
Message-Id: <20230307134901.322560-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
References: <20230307134901.322560-1-dmitry.baryshkov@linaro.org>
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

Use new DRM DSC helpers to setup DSI DSC configuration. The
initial_scale_value needs to be adjusted according to the standard, but
this is a separate change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 61 ++++--------------------------
 1 file changed, 8 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 18fa30e1e858..dda989727921 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1735,28 +1735,9 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
-static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
-	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
-	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
-};
-
-/* only 8bpc, 8bpp added */
-static char min_qp[DSC_NUM_BUF_RANGES] = {
-	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
-};
-
-static char max_qp[DSC_NUM_BUF_RANGES] = {
-	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
-};
-
-static char bpg_offset[DSC_NUM_BUF_RANGES] = {
-	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-};
-
 static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
 {
-	int i;
-	u16 bpp = dsc->bits_per_pixel >> 4;
+	int ret;
 
 	if (dsc->bits_per_pixel & 0xf) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
@@ -1768,49 +1749,23 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EOPNOTSUPP;
 	}
 
-	dsc->rc_model_size = 8192;
-	dsc->first_line_bpg_offset = 12;
-	dsc->rc_edge_factor = 6;
-	dsc->rc_tgt_offset_high = 3;
-	dsc->rc_tgt_offset_low = 3;
 	dsc->simple_422 = 0;
 	dsc->convert_rgb = 1;
 	dsc->vbr_enable = 0;
 
-	/* handle only bpp = bpc = 8 */
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
-		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+	drm_dsc_set_const_params(dsc);
+	drm_dsc_set_rc_buf_thresh(dsc);
 
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		dsc->rc_range_params[i].range_min_qp = min_qp[i];
-		dsc->rc_range_params[i].range_max_qp = max_qp[i];
-		/*
-		 * Range BPG Offset contains two's-complement signed values that fill
-		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
-		 */
-		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
+	/* handle only bpp = bpc = 8, pre-SCR panels */
+	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (ret) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		return ret;
 	}
 
-	dsc->initial_offset = 6144;		/* Not bpp 12 */
-	if (bpp != 8)
-		dsc->initial_offset = 2048;	/* bpp = 12 */
-
-	if (dsc->bits_per_component <= 10)
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
-	else
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
-
-	dsc->initial_xmit_delay = 512;
 	dsc->initial_scale_value = 32;
-	dsc->first_line_bpg_offset = 12;
 	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
-	/* bpc 8 */
-	dsc->flatness_min_qp = 3;
-	dsc->flatness_max_qp = 12;
-	dsc->rc_quant_incr_limit0 = 11;
-	dsc->rc_quant_incr_limit1 = 11;
-
 	return drm_dsc_compute_rc_parameters(dsc);
 }
 
-- 
2.39.2

