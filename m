Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0709AD17E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC20810E83C;
	Wed, 23 Oct 2024 16:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DCH4dAKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644AD10E236
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so72278965e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702224; x=1730307024;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
 b=DCH4dAKldl3XEBSavrkAa0ntWkTAZtVnXzjZuDYNTTOZTj6ZHxJ0s6njlF8FCkccNo
 ID/tVHFaF3WHPLX5pBg9GiQcohlIUgzGi55lrD6WLf112vLAvW9c455B/KGciwG1ISvU
 o0l2Tmi5HZGdgetYPr8LJdmFxAtTvg5ksI6DK9BbpM09JufT4QeRd5IqOx/MR9TjE3fu
 KYY2BFPR07FvwsGL26G3gY8Vd8LVjVXaLuMbTlTnBMGlF7k09zPo69KIUlnngLDhy2wL
 EEQDXBCZQFs3fScGwNC+1joAWQJPrY9BK6UL7rDr+xXaRDzaY+PfG9rQLPYPhQNjVVuG
 DYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702224; x=1730307024;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
 b=tBmuLxWFKGQui2Q89S+92N73bCUnkqzIgASLfPy6qDJA4/FHdzYJcGcK98/kj9Zo3R
 Xu+tqkhmkWKeQVaOL4bKc45IEBS8D6CKZWc4q5TwhXBrnTPzXbDMOFJgQhjYQYwgWNAS
 w54IIZk9DDBNtT7o6X05ae3W+v8ACk7PWDe8iR1c0mVNnSrp92EdhYkNHjHX6fMzZhW9
 EMz/bkIsl9ESDpbtQMEU+QP9jiLu4G+rQMy2u6sA+VJCsFi7z4R/ZsOgLzNCEcQNjW/s
 AZ6/fQsYr+I6yxVk5eZH/VVR//sFtsIG2LYnkUHUTUUPz/LI+LvUAfPJjEHG9ywD+Emv
 1f3Q==
X-Gm-Message-State: AOJu0YwyKACZxHm/ztGJkuiXU4HRWRv8q2nhwxE7cCoBijH12HPdl1NV
 m5m8dPd6oiDAWXc1D2u0ikLF4jni3g/7Ehc6Pz4hLUdpYHnHlISuthg3cpERoYs=
X-Google-Smtp-Source: AGHT+IFQpdDu/f44Xgfd+NG6WrKmi4zfDWeKblhsLQsMneFB4Oq57+PB7CTMU6NnjVTgfyxomcFzlA==
X-Received: by 2002:a05:600c:3b16:b0:431:5ed4:7e7d with SMTP id
 5b1f17b1804b1-4318415b482mr26031435e9.18.1729702223590; 
 Wed, 23 Oct 2024 09:50:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:13 +0100
Subject: [PATCH 16/37] drm/vc4: txp: Add byte enable toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-16-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
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

The MOPLET doesn't have the BYTE_ENABLE field to set, but the TXP and
MOP do, so let's add a boolean to control whether or not we need to set
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e08c90245f94..27deb4cde02d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int has_byte_enable:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6fe378b454ca..eaf30b2cfb5b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -287,6 +287,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
+	const struct vc4_txp_data *txp_data = txp->data;
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
@@ -309,9 +310,11 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	ctrl = TXP_GO | TXP_EI |
-	       VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
 	       VC4_SET_FIELD(txp_fmts[i], TXP_FORMAT);
 
+	if (txp_data->has_byte_enable)
+		ctrl |= VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+
 	if (fb->format->has_alpha)
 		ctrl |= TXP_ALPHA_ENABLE;
 	else
@@ -492,6 +495,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.has_byte_enable = true,
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)

-- 
2.34.1

