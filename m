Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076328B9716
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 11:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FEE10F245;
	Thu,  2 May 2024 09:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XcP5fvc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DD510F245
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 09:03:47 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ec4b2400b6so23453035ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714640626; x=1715245426;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mSBBp0xVAK2Nv+uiyQY9w2gt3jv+iQ6l4RIpa967w98=;
 b=XcP5fvc4P3l7m9qmjjlM3AUHOqUDSSKnAi+KlD3H0cFkFINVTnlrwOTHDa58S81BBJ
 4rACZ42vXKP9tzn/L3b/SRMUrgWZSzMTiBlUCqlsf3v8kiQfQic5aU6lOfrK4sEWVjwI
 goNj3xTEit2nvYSrgLWo5lGzImLdM96RIb5wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714640626; x=1715245426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSBBp0xVAK2Nv+uiyQY9w2gt3jv+iQ6l4RIpa967w98=;
 b=pguEgUX9YCEUa37yBwh0Udi0e3CHVxVz+YoJmdRx51ewQcdbfiT3HLy1ORY+jLPBcp
 VqBVSJN1OTEjucn1md8fNiSV5/79AnjlnqqfuopCwH/My6AUMCEOw4MLwMkg16uCTV55
 6lp1s1RAUocQ6HOyifWeLEKmwu367IR6ULyfejNkyN/KFmebWcE/Hk92tmJPfwBFcaNI
 NbEy78QOKB8Q+4tNuraywma4QcKZgl8R9A104QPeTTOGXjuFAlAcKU+dTGjaA+e83tt+
 zDkYOnqxso0WG7rAEXc/WJhwqmjZx5OckH6CXmUxPgi61pYJBZ2OP5qZiDDj/1/HuNMo
 R3Qg==
X-Gm-Message-State: AOJu0YxXT1yjqJXxYvAUloMNgXaUIXXA5HKlns5ck/bkRkfS1NNwbq/l
 IlyOZPfUx/2P5qHL6nSnKiQXA8So3dRN57mpxgOqm5cwMY+wBVe1LgHYfBELtJ4onnaFo80NeX3
 w7A==
X-Google-Smtp-Source: AGHT+IEBuAfvynb9BlBVviwdLBMz5FWVRR1coQ299RAg2o7gZQK05GKLeQOsAHksMZJ/R+wmVm710A==
X-Received: by 2002:a17:902:db01:b0:1e2:1df:449b with SMTP id
 m1-20020a170902db0100b001e201df449bmr1720490plx.69.1714640626252; 
 Thu, 02 May 2024 02:03:46 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com
 (150.221.124.34.bc.googleusercontent.com. [34.124.221.150])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902d49100b001ebd73f61fcsm764983plg.121.2024.05.02.02.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 02:03:45 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 02 May 2024 09:03:32 +0000
Subject: [PATCH 2/2] drm/bridge: anx7625: Change TDM setting accroding to
 dt property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-anx-tdm-v1-2-894a9f634f44@chromium.org>
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
In-Reply-To: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
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

For some SoCs, the TDM setting is not to shift the first audio data bit,
which is not the default setting of anx7625. In such cases, the TDM
setting should be changed according to the device tree property.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 29d91493b101a..538edddf313c9 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1709,6 +1709,9 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	if(!of_property_read_bool(np, "no-shift-audio-data"))
+		pdata->shift_audio_data = 1;
+
 	return 0;
 }
 
@@ -1866,6 +1869,11 @@ static int anx7625_audio_hw_params(struct device *dev, void *data,
 					   ~TDM_SLAVE_MODE,
 					   I2S_SLAVE_MODE);
 
+	if (!ctx->pdata.shift_audio_data)
+		ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
+				       AUDIO_CONTROL_REGISTER,
+				       TDM_TIMING_MODE);
+
 	/* Word length */
 	switch (params->sample_width) {
 	case 16:
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 39ed35d338363..41b395725913a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -441,6 +441,7 @@ struct anx7625_platform_data {
 	u8 lane1_reg_data[DP_TX_SWING_REG_CNT];
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
+	int shift_audio_data;
 };
 
 struct anx7625_i2c_client {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

