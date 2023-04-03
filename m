Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08676D406E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC86F10E45D;
	Mon,  3 Apr 2023 09:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098EF10E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k37so37229124lfv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
 b=K1azTHao1MjTShcSN2oVWr5jewh1WrWWg/uSMSPj0cZSepspTsLsUE8yhji0HfGlfS
 Xve42Pem8Gr7gFEsGncWjK88pEu2u/i54aUpnGnXjzo8Gwvj3yFzOep9DoXyfwXT2Jit
 igZD8lH7oN4vqdNNl3G7fM5pnI/IhAVqrmckxc8lwS1+AQgJIc7Ku6fK3yyAOHqX3ZSr
 xTHl8NoZXJGgUAeu8KkoXVYT5m4+1DsEM+CHdnCF3zczgCJ+cr2bfYWtbBMDzkRNiLlP
 NuT9FxUS+CrO8IGrxTIWQ3IAEhN9rtrXvg14nnfc/pkPsaKuB48sSSizzX8124BUZiNp
 C7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/vvD74dTg6Ok9D3o7oMegz307H2NDMir9mYubi5ivw=;
 b=0CFiVt/mAAdWGsnnie/x9qgrU2RMF5oKHIBv7kbQP8OJwS65Y+56abm1JxG6/XuZNi
 Hq3rJvWQ00n0LlC49V5hJ0lz+cYQTMcbG7JupPUxtvxkFPfB6764Y4dMnjRCjqAMafYt
 IyqPmVYOzVc5JMmy4yKExUtXl5TOb4ohXcy04mFS8HwW3wfYf9lj4nhogyFodqiu0yjE
 YAi8npzI8hCVL/mZ+QyWuoNDXQPszARoemQ0UulsG5WsZbUNwuFVK5jCTPGKOqceiCbl
 Be+delq5GyfwhzTzRiSOONq0MzOFwuKmzLLryYDLVFvU1aCxELnRt5XBzLi3KKAVD8wd
 01NQ==
X-Gm-Message-State: AAQBX9eMOsylIS7eJ3DZ8RwSOk1l2N2Sehd/kIaUaElw+i0tG0e2VxoT
 KdioRw5bywNlz9rN6klxlrKDCQ==
X-Google-Smtp-Source: AKy350bJEhdvMEKnfbjk6VbrKH8zClgxGzO1FgBv9sn94U6YU1pIrLcBf8WPtHz6DgtOTGbP557o1Q==
X-Received: by 2002:ac2:54ae:0:b0:4ea:f8f0:545f with SMTP id
 w14-20020ac254ae000000b004eaf8f0545fmr10148214lfk.52.1680513801365; 
 Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 10/12] drm/display/dsc: Add flatness and initial scale
 value calculations
Date: Mon,  3 Apr 2023 12:23:11 +0300
Message-Id: <20230403092313.235320-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jessica Zhang <quic_jesszhan@quicinc.com>

Add helpers to calculate det_thresh_flatness and initial_scale_value as
these calculations are defined within the DSC spec.

Changes in v2:
- Renamed det_thresh_flatness to flatness_det_thresh
- Set initial_scale_value directly in helper

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/display/drm_dsc_helper.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 4448c482b092..bfa7f3acafcb 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -26,5 +26,16 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline void drm_dsc_set_initial_scale_value(struct drm_dsc_config *dsc)
+{
+	dsc->initial_scale_value = 8 * dsc->rc_model_size /
+		(dsc->rc_model_size - dsc->initial_offset);
+}
+
+static inline int drm_dsc_calculate_flatness_det_thresh(struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+
 #endif /* _DRM_DSC_HELPER_H_ */
 
-- 
2.39.2

