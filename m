Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4EACC0E6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2535A10E6A0;
	Tue,  3 Jun 2025 07:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nABqLkxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0CC10E687
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:11:22 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-747ef5996edso1240241b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934682; x=1749539482; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=nABqLkxFuGy5pfw3wU7sB+PPlg2Z8eu5ht+JQsB6B/e80FRaCUNlNOuxIJ/V6by4P4
 pZk1gv2epbvR2LVrCMMsZAe6IrxOMmsdPEZRLqmcyrebl5BiV2xTYQbvriFg9vKjwG8d
 Kc7prPmH5B18zAJbIIRkb6z9hX1YJCHdoewLV1+MAppYsb/Lwn8Fb0yMa2rdK5RjpT7v
 QnM0y42vYv2A7RgKH6GjXSNBxPB+5yTMXo3xgLrX2jJamOhJ/Zu6tBsokqxhuuFwFNaw
 toYukryihgImH9hsN6BwG1qa6Qz7cQo5vFOk1IOqfSUyjmtxVEU/ZoDRMU2eu8YUvPer
 nOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934682; x=1749539482;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=wZyxoB/x3yTlOgNkIpYu0aU25J+4QHJfL2YtICKBFuHDh0fjmDwv4+P7pRoG8zqvti
 haUa7uNKSq5Lmk8sBaCI3BXcCjekK198gjl0NVSaVzSq17Q3PKDcZ9EVXxzsUarD5EZu
 GleZdC7l5yyVqTOoWkWkkWLKEkG5JqFqtp7EVx4VK0TR/yIX2bb5BfiD9jfsEwwOquoP
 opijT0F2adsjtaBeBClhDF4x/cbOKotTYdfiHk6I+DXx4PBdcYfvSeL2nlLOj+B54si7
 IrXBl+8BeYlDTxo1nBK5W/ujEg7f8jJiK3ieYRHWqeH/qonrMNG+yF7l8hY7+NdpJgjb
 VYig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBewy8tbOqbJp4JsmTOUa1vX5glL3ZSlc0MSYKtSp5rthsL9TEUCi0dSCMrhf26jx7D5PuVWrpwfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8zs6m7qpkmByYGt17vkYjVFkOfECj2vVsPBaAL6+UdcahrNqa
 0IYNWq2PcFmj+jxrYXInLbFWFwXWQTZeqIKMV+OLWI1dqKxuZpkkxT6VKcF1/HrhXZc=
X-Gm-Gg: ASbGncv7qWLXkByTNhDmagZu+VS8Bl6OAWi8fKXK6h6E0moFofc17n1gmTiw2TxaWhm
 jpdPChK0zq7bize4LV02qN+mhT1C9HlG35ltaOMggrKCeTyJEmL9O/pPYwDdSx6YvVoFeligku1
 1Zk9bAqKJMlFI56meWQnh9rSTvg/AC/7DvsNZsYZ5/riTk9gIbrgRuXaGiN5MbFCjq/x35IMA/9
 ohPAUanNnSsUxMjm4v94L8QP9H/3QX3Nnxd9IT6aferXr463fGmLF90ip0bhmd7SYquraNZPWs+
 c7IlXVQMONKjhCwYHzXNipqq14lLjeQC5gFdAIcQ6iOFy+dZpQEq49gqllA+
X-Google-Smtp-Source: AGHT+IH0yPSQUYs3KibIp/x7iu1Nwa/LdAsHJOBdWwn18yMWEz2cHx1TONGezh4asP/Kv/HQW6UCEQ==
X-Received: by 2002:a05:6a00:b90:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-747c1c46345mr18149708b3a.20.1748934681648; 
 Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:07 +0800
Subject: [PATCH v11 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-8-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=CgR/9p+yyw53c62J4hPQLpiSpKACzV7q2lWs+QQNgAMiZCDbEiDbtB3b+Dw7VJHj5NfLllHTF
 +027St0KrfsDn0M/IkAQ5jiVE64mIN5CYIH8SaWl6j4l0k0+akcU2Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

