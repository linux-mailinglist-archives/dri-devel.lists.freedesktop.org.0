Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94B7EBA03
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 00:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CB210E403;
	Tue, 14 Nov 2023 23:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A707510E403
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:28 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66d190a8f87so35999916d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002827; x=1700607627; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCsm7VCedF16OrkkHsKZ3GlEGsmWacvBMw8jR+/V2pU=;
 b=aKDza6OOh4io8K8PVUqWuraHjXS6IynCGkqMx4lrvP5wjCqxWa77CE4P8YRaMQDPsp
 emqit4CiVBJBdMdGRzmmerGBaFzEr+qCF1twPQGhUBten2uCZ6xfq4joG7Sq2BcpScFQ
 ZII9Zt09b+yGD2uHZ6q2KI46V9I5pte4DLDU09ja9gT/KIEh26YM/yQ6zhH0CspregYc
 ViuKJyR0+dqlI6obIae4oDLZO9TF+7N5/zy2ivdsS1LavU6Xk0UcIhxhmZScwAxlUEtR
 HlJsQLrchZgrQGJMt1XwvSrVG/J84augZ4KyxiwpjVeNW1txnJa06Xicmu9clYZ9FCXq
 W6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002827; x=1700607627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HCsm7VCedF16OrkkHsKZ3GlEGsmWacvBMw8jR+/V2pU=;
 b=mTwvM3mpDd0mVt4ZMqPumqgOLnNdYdJHuDMuHEUDdRAX/DmKcHrqwyc/MfgNulwAdp
 DezulwNXn82cgi4ijMg30drrxAH82IE+q3c/s6b+bnn94Gz5dMHM+rsMnJuVKUFz/46a
 RLQPKwsa9rUwxaBrj1ac2TuZ4gSQMKIq0bCr68lghKJ7mBsNoNH/IbM4Ut7ZAHTIIWn1
 hCgwMPlpIlPJzGv7iNFTsdqwwjlPx+MXf1HjcPIy8tkFdQlQHdlPGNU6FwICDUPGuvyy
 T5JE8Yjh850LtzUo7t1UJejQAyI8qLvQf/892Gl0qO4Rz+aS9zoH7Z0wncBlkag9PLh7
 kgzA==
X-Gm-Message-State: AOJu0YymN0PGDvmtUvRSLOg4Pwy9QnaANJZWHjhpYLdO2WJSQTffdZVV
 2HlYpspnvAcp6mjf5YeBQWyDgw==
X-Google-Smtp-Source: AGHT+IGhxfGR9iFdmqeZtNyN8JXoHEt4QSyhdvoHgLMcAm8gIgPgRQ/R51UTcNkf5EfuQLRv6LpEbw==
X-Received: by 2002:a0c:be88:0:b0:677:9fb2:26e9 with SMTP id
 n8-20020a0cbe88000000b006779fb226e9mr3489562qvi.14.1700002827707; 
 Tue, 14 Nov 2023 15:00:27 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:27 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/msm/dpu: fix video mode DSC for DSI
Date: Tue, 14 Nov 2023 17:58:29 -0500
Message-Id: <20231114225857.19702-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add necessary DPU changes for DSC to work with DSI video mode.

Note this changes the logic to enable HCTL to match downstream, it will
now be enabled for the no-DSC no-widebus case.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 13 ++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  1 +
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..d745c8678b9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2477,7 +2477,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	return INTF_MODE_NONE;
 }
 
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *encoder = phys_enc->parent;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77..7e27a7da0887 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -332,7 +332,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  *   used for this encoder.
  * @phys_enc: Pointer to physical encoder structure
  */
-unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
+unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
 
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda711883..df10800a9615 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -100,6 +100,8 @@ static void drm_mode_to_intf_timing_params(
 	}
 
 	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	if (dpu_encoder_helper_get_dsc(phys_enc))
+		timing->compression_en = true;
 
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
@@ -112,6 +114,15 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index e8b8908d3e12..d6fe45a6da2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -166,10 +166,21 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
+	if (!p->compression_en || p->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
+
 	if (p->wide_bus_en)
-		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
+	if (p->compression_en)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
+	if (p->compression_en && dp_intf)
+		DPU_ERROR("missing adjustments for DSC+DP\n");
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index c539025c418b..15a5fdadd0a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
 	u32 hsync_skew;
 
 	bool wide_bus_en;
+	bool compression_en;
 };
 
 struct dpu_hw_intf_prog_fetch {
-- 
2.26.1

