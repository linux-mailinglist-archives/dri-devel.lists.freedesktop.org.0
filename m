Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23219AD171
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF3810E838;
	Wed, 23 Oct 2024 16:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cE/v9aoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3D710E236
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so72279595e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702227; x=1730307027;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
 b=cE/v9aoXlL4dzD+aw8OYl6vfnrDQCj7VmyR/D3xqEa/D1mTg31C48OHzi5c/HQNCPB
 VVPRnwYZeElcg2J3efPMk08gRvNpySsPYjQts8tXyMMljl1ggngUXXGMO6mbMSDQ2GhM
 /Ov/eUzEGVUThmqmNFTDcFuM1BBup0Azd+j3FnhTiVZib4B8RKc4Vt1QwvUDizy1hQhu
 THvlgMjbqD14ismdFSR8EuvrNMPBTuvg3aiDXrv9ASa7MR+h28G35YOCRe/+nYqYtx4H
 7gcNIhvT8nkbwljOIjSD3S7wjSYy8R4wpANfxDULU3KwyBwLMSj2BTq6NIb29B/CUpdf
 ymBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702227; x=1730307027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
 b=rAVB5ex4/sGCqwBJvd40/so2f3il8Ap1DrKeh/6Fv22lmr54x72d/1xBij9rGS8x61
 H9oGcsW7bmYEkL5aGoN3ug5AItj1DlquFQIAIi9rjTtvYnPXpweMF0+9bE8wCUqkrsDg
 jasTpwBmcfvs38DLjKuv0YEMwG+2yBuSBaRnHtbLDLyTTn+dmqKtUAN5MSSG1G2vAzMy
 6Fx8+CgytExTjd3Z/OkohXIwhgKMShXSQ/hcoLH7WGL2vy6zYp8tAeeYK5HC5CV7nFTO
 coHvP/5YYf0B8fcvPgLjm1K7MDILOF11HwrS41g+Q4WHqad1TuJKnSu2gfqE/JisQNB4
 MQEg==
X-Gm-Message-State: AOJu0YxrUr0LyR5pTx0s/DZIk+4iiB333mKsBf50hUdn40Bz0haTaYCe
 keVihjRINNSRHF1ut8FzVVuMljTctp9JDpGeJoiqY6fLWoxS2LTE4JCjLj06ZnU=
X-Google-Smtp-Source: AGHT+IFv4syC1FFikZ8gruyh5lMTHnF9kDQfrU5MuNhEjDl7pLUYMo9HHAxXod5ZqqEK/UZfyyrovw==
X-Received: by 2002:a05:600c:4ecb:b0:42f:8287:c24d with SMTP id
 5b1f17b1804b1-4318415cfccmr28210645e9.21.1729702227166; 
 Wed, 23 Oct 2024 09:50:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:16 +0100
Subject: [PATCH 19/37] drm/vc4: txp: Move the encoder type in the variant
 structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-19-1cc2d5594907@raspberrypi.com>
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

We'll have multiple TXP instances in the BCM2712, so we can't use a
single encoder type anymore. Let's tie the encoder type to the
compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 34e72e711a17..70b7a771ff47 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	enum vc4_encoder_type encoder_type;
 	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c2726ccde1cf..ecd2fc5edf45 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,6 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP,
 	.has_byte_enable = true,
 };
 
@@ -558,7 +559,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	vc4_encoder = &txp->encoder;
-	txp->encoder.type = VC4_ENCODER_TYPE_TXP;
+	txp->encoder.type = txp_data->encoder_type;
 
 	encoder = &vc4_encoder->base;
 	encoder->possible_crtcs = drm_crtc_mask(&vc4_crtc->base);

-- 
2.34.1

