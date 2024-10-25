Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2159B0AC3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522E710EB34;
	Fri, 25 Oct 2024 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LkpGVaW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6930410EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:18 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-37d58377339so1728779f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876577; x=1730481377;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
 b=LkpGVaW5eyksQNPoj598RrBrvWx5CDGi1rXq+R9dC9lL2ZaqLmm4XhOdJp8M2SiNYG
 fnK8bOgaxbP0UU0wvEPoYJaaHkSa4RcTm9b87FKXj6wv27w3vO/XVjnydqkq317dLkzm
 jMxGGLauXNEQ71/79aGMlOjdWSFEf4zlAJiWgbUSpRTj2S1vOq3/F7P/QGM2ch1NPHZX
 yUUOdDnbCSxpuScm48ooKl+fTsGHlpu/vowkH4VFM/13MnTXIjF2pVdBNODerBFQ2reg
 bl2PjawyD/oEY4kjjMn+Y7DRWTC/NTKCPyykI2aqhYkejNe1LgWKDGWshy4sU25VIheq
 qqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876577; x=1730481377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
 b=vC6fNkyUz25Il/Ccz9aVe3zgIRovO1+yIe2psTtVmo5eDu0r8qNq9nKJNh28nT+o+Q
 7CvjMbm986w3cJWxR9keNT8siqmjaMDd3IpNQZTXw07c+KeIPmJYRrysufhysfgzCjmY
 Luqik6G3mLTd67e8sAnVKVxxkDhyds/w2r+E6Zn0YQ3AKgjJBLA72UQwsmOQjHUIgt2a
 4XUynzxr+rJp24mxwQb29b7kSc/40kzV0/YsMb8bvfKfOgkMJXcEB+dBWBeeyVHPSJ6x
 MzzyyEpsmhuKH2FQ3uWDL1Yvl9sSYkdfsrNYb1qUYT/GAhwcBFbbUTbutyp3XFamEcAz
 ozeg==
X-Gm-Message-State: AOJu0Yyk2p8mS3lP2q3wDR7xgJN236fSQl1hwMerVzFLM816ndf9zTax
 Tf99P2HlvymGJaGePewUWnHTkxp1PwsZNo6I2AdJix7cC8U4EO79OYechuawJEg=
X-Google-Smtp-Source: AGHT+IGP9nRcQ2kzvdL+ddPuHATxPAjofcN1yD5KA+iaTZo+WrIoFCmEwqLiAauQ9eDZll9Qzpuj9A==
X-Received: by 2002:a5d:444f:0:b0:37c:c832:cf95 with SMTP id
 ffacd0b85a97d-3806123eecfmr110629f8f.50.1729876576741; 
 Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:47 +0100
Subject: [PATCH v2 16/36] drm/vc4: txp: Add horizontal and vertical size
 offset toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-16-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

The new writeback controllers that can be found on the BCM2712 require
to have their horizontal and vertical size reduced by one.

Let's tie that behaviour to the compatible so we can support both the
new and old controllers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 27deb4cde02d..984fddae0048 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -539,6 +539,7 @@ struct vc4_crtc_data {
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 	unsigned int has_byte_enable:1;
+	unsigned int size_minus_one:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index eaf30b2cfb5b..d2ee872e9c0b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -291,6 +291,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
+	unsigned int hdisplay;
+	unsigned int vdisplay;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,9 +332,17 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
+
+	hdisplay = mode->hdisplay ?: 1;
+	vdisplay = mode->vdisplay ?: 1;
+	if (txp_data->size_minus_one) {
+		hdisplay -= 1;
+		vdisplay -= 1;
+	}
+
 	TXP_WRITE(TXP_DIM,
-		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, TXP_HEIGHT));
+		  VC4_SET_FIELD(hdisplay, TXP_WIDTH) |
+		  VC4_SET_FIELD(vdisplay, TXP_HEIGHT));
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 

-- 
2.34.1

