Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4780C328B9
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F310E64D;
	Tue,  4 Nov 2025 18:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNlNEJcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB8510E651
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-477563bcaacso7270705e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279825; x=1762884625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
 b=KNlNEJcHBZG2t67fbgxt4t5iK6MDruZ97nD0kfRoOIJIgdUUlS7b6LrBwWISLR0igP
 E72sHnzvK0AKemWtbqj2LX+gQQMhl+lAY07FFGin/wClmJUirIPM6hzw/ug74pb2PWUN
 ViKcJPK+0obhPiSekP85rghEZ1e3BVEIhzlKZ7Jc2t0QB6aUjl/lPUgFa4WDL82YE9R7
 x+NKtX3cdXGnCcoQ64Y1QLQQ63FHqr/kvynpCI1mQMcVJHXnRjl+Zr95emFRr1p4VVn0
 NNo8PgPDOBVFNiOBhC+2K6WNCnt/poXB9ovDxO25Jc0yhuGe1lMOroLlqeoCDWeli4Bw
 x0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279825; x=1762884625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
 b=bcmBF9xyl7geyjTFVjIFeYpNx7cSxEoOxu1WAJR2bwLAFUoQmpZ0ulzh7l7tyNiLQT
 CVtHpNv4hNDDRvK3KDlbSik72AZ40cOCsChIORsms2Rh0IeCLeUFcv7jxAQ8imMN/EDt
 cCZUcpy52Ghutysri+DXEjsKX10kUa7Kvbrs6M5LnFiSPmZJhy1keK2R5eD7G3J8Jquz
 pWtDUUd/n/ZotdY/uFngs3T7RDx/2RorTnae77ycwXPhD288ZH2KqulY0aY/vmawhrTy
 egAtcBLDSAozgdBf+swEtq3t21Rvoz9ATvzJGpnYClYEUm98ADAANoMWgNl0B+ZMsHvg
 FWsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVasoHfhF8OinGx0VY8f4cXpUJCOvYTk4kNd53IuBNPxX0CawOMNqZe3UsFaQNFbWM9j9y0KTIploE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvaIRyGLd4E6ntqBaARFAaaO20GNCppngoyDc+KXF3f/frTxjG
 Njo794XerEVYg8WG0/KtofkmqPjjWHDDhdQpWYdgI4yUzHZsMKuWLYbD
X-Gm-Gg: ASbGnctOJgWopP6UBRt3ubHg7YL2+h2vFQQAQQjEhurtUM1dNONlnMPMV+NTFknfvO0
 kildM5o8iib6hLeSov+WJkcQD5DmjgDPHJcJAt8ZW3RnAJPmSGX1hIeIX4asePDXNI/1UIWAJd5
 Uowki3xtgLy8u2m/eRZ9cXT1G9Rin/hoih0zr+uKaNtzU5lrLoIheJZxwdSHwM6iwpV3UNo3H6t
 dqyM8RmJmKlRFP+HSLKTiWrC4etnmlYvlCJf+g5uBxTGJkUMdfXJSNov7AbGRgcGOvreoPlY8qQ
 WHy7T+H9eyHCKiLvFOFl1saSy7qVnm01f910lGN029BeWzAa6IctgAfqoUXpKdClx6AhmTwuwAW
 pCZRnumqNIOiy5AR99b8Hh8qRxkqR0NSqlTqzMlc2egsGSRcKgNA11wGLhdQI3YdNUGf+UtIK54
 NuUuOt5BlFRbRZVhldgA==
X-Google-Smtp-Source: AGHT+IHm1TAQjaSzwnbLWrmSeHCsVmHtk5JoxXFn6C5ye+q9ij6rKyMSLmT96AnudZeM+B1bys7ikA==
X-Received: by 2002:a05:600c:34d5:b0:471:1306:aa0f with SMTP id
 5b1f17b1804b1-4775ce8df34mr2008325e9.38.1762279824672; 
 Tue, 04 Nov 2025 10:10:24 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for
 args
Date: Tue,  4 Nov 2025 19:09:30 +0100
Message-ID: <20251104180942.61538-19-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2

