Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94510BD0B48
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503410E1C7;
	Sun, 12 Oct 2025 19:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MoVdsQ7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221510E1BA
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so549775466b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297041; x=1760901841; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
 b=MoVdsQ7lIgyXvWgz4hMh3BiLyajtE86zV/H8bUSVbe+lMkk2BKskT/xWq2Yjsf6+pV
 JDXb3CqHfYTc78pp6L1ZCORbn/I7YE/f64Ri01SGqw0LcLCQiCmtsYfq7bpPKfq1+oFt
 JjeUEnkXZzhqLykKoKHeFdrHiODQsaY2Y4BAD8gMXBLFgYwCTUD+ToaSp0gbRQRV7lXV
 dchS+MFaPSQQs4FV4/fhFfC+2jtU2/uP7A1VRWyKlAbrsssjCW3vQfhvK/pBRIe+Fxms
 XvrE/EyxjBjhMD6r+K1SG4jEf49dvFZgLThUdR0UNXL8xjTzuXlOsHtSPu83IE8oaV4O
 aiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297042; x=1760901842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
 b=KYsSTFoB3pgbxhrbxgi1qcdfgayH4KnbNrun2mPqRiQY4pk9n8fKja+j93vIRisbks
 lVfBy2/hz3D+ndqKEo252/1kJpQ3oO90F33+d7wpVajKl9ZjpkQsWoIyBRgbJ3vMlkKC
 iyTGdMLB3O9TW/p6cIbXqx2LznrgstWryOdDFW4S0ehzTjeeZD0HHFTIt74WBpChE+8X
 yZUZ/OYIBx+uYXxtyeJEZ7hGkCj87m28yBd7zZSc7zMkglvV7QVPjxlpRMO/egWKpgnP
 owVEoVDcEG5Bnz9vziY0A2sDP67MMut6OrqnH2XfQWSKtm/rXl7RB8yHuQ2zOfTRFYXD
 Bk9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGhFEjmTjt9ukiiEyk/0yaKzrpx3eJ3KkBAGmmXa1Dcy8sHsypTT88khIhvu1nx68QdW17w512oSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/ZHcgmu35yPV/IyouNht2Cut4RC/rEuq7F1bWFi59OxcFwLsx
 thHp7PWhXndWR9/y81/Ga4R5M1zYSNNJvcWmmwO1E0jRuYxjBmpiGiVa
X-Gm-Gg: ASbGncszYp9ptu3Oq1nJyUoOKVpugdg9iYk2LYdGAhMIqAzqodnBf/BZ2UKCqlPChiM
 TuG227Hht+hVAWoQlQi/TxEa8pZWF3UI2gm+RIyil3fB98ZnzaVfqX1ocDJvHPrGNVetqtDNd/M
 2o+7y+Vdbi/k9p6B0Adr+S5HusOQNMJ64ij6+EQ7LWRByrKciEMFqD8HQXXIgMGXrEcQ39qNAPN
 E+Sbz6ZA22Q57mA6P97CnTmvnFUu34i6zt8DZKf12mp15+K3JNveOPFoaZcPVVTHUBQeWbNzqqS
 3aOFxcqPrMFiWbf/1vDfYFdMoZELQb6UyKuBxjzFjlw5k0qNbTklsVO3u8cFvAciw/y7Ewv47O3
 rT9d3JECcCOB4KigRLWyact0GPcM6Jm3me97f6BmNZwl1JZnuqFRn5IGiwqq+YbNhnZ+45qbaCa
 YCCUA/jnaZ3ghPMwhkhm0v
X-Google-Smtp-Source: AGHT+IFB2WPpLvhhyF6jFh1SDHHRriNhPzMUznraEeE598jcJE65TAjpsOVtaGxdtE1HPt1fjYbNLA==
X-Received: by 2002:a17:906:7312:b0:b57:78fa:db40 with SMTP id
 a640c23a62f3a-b5778fae354mr614837566b.46.1760297041514; 
 Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for
 args
Date: Sun, 12 Oct 2025 21:23:18 +0200
Message-ID: <20251012192330.6903-19-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 14 ++++++++------
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |  4 ++--
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index d5b7241acdea..9b938e3dae9c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -109,17 +109,16 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 					      state->fb->format);
 			sun8i_vi_scaler_enable(mixer, layer->channel, true);
 		} else {
-			sun8i_ui_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase);
-			sun8i_ui_scaler_enable(mixer, layer->channel, true);
+			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase);
+			sun8i_ui_scaler_enable(layer, true);
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			sun8i_vi_scaler_enable(mixer, layer->channel, false);
 		else
-			sun8i_ui_scaler_enable(mixer, layer->channel, false);
+			sun8i_ui_scaler_enable(layer, false);
 	}
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 8b7a58e27517..fcd72c4fd49a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -127,14 +127,15 @@ static int sun8i_ui_scaler_coef_index(unsigned int step)
 	}
 }
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_GSU_CTRL_EN |
@@ -145,18 +146,19 @@ void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 	regmap_write(mixer->engine.regs, SUN8I_SCALER_GSU_CTRL(base), val);
 }
 
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 insize, outsize;
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
index 1ef4bd6f2718..872d88a58e7e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
@@ -35,8 +35,8 @@
 #define SUN8I_SCALER_GSU_CTRL_EN		BIT(0)
 #define SUN8I_SCALER_GSU_CTRL_COEFF_RDY		BIT(4)
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase);
 
-- 
2.51.0

