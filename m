Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F19AD168
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2710E236;
	Wed, 23 Oct 2024 16:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="esL7dm50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC3610E236
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso42937585e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702231; x=1730307031;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
 b=esL7dm50GGAVFFXl/gV7GP0f/gcIaCpGB7/3HqYz6jMww8A0Fv0eeXDZyGbG5HPgUf
 yqgaqor7THzRbkY2PUfVi0NQBKWLoMcBtj37DNPU/Jgqalzf0GHL0bqDY1H/F4OZKJf2
 qKnEBzVkU1Vni6yAxvGWxDZ7CSwLtfEXXB1Sjo/xIzk7iQ8zVak36E1PsJRqEHpqf9zT
 WNlef93i/7OUhnxP60D4tDBsOWaNVd+irHV2XV8DwoCWS0Gf0O9IJDAy4jvHaM57hAP/
 tWbjVccl3WlpfNZdZgXJ11ZDZD0iRCJgRRVNiYwi/jNhaLOpY9dWl13VVl2YKdmpestC
 B3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702231; x=1730307031;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
 b=XO2k0P/UiAOsdvoRIWGkX5bU07mrTU0i9LnOtpSV48OLXyECzKdCvef/rbbPUyzXJV
 8335h2OCG8f6TDwmIuVPIphfG7e24FrX8mhj8/9ZpXFrk+iSfa8iFEATZZ9LiKZM9blc
 O8F61o0SOKdTeiqCBFZ0PYwiCXrmQ2HSPU7WgNVKidCUxPUdFdPTePBAupKwRc2W+i5Y
 RCFhWZjo7MiRNLA0LMJgosrQqT3S6CPgvEtv00zW64O9AJH1AgJ1DxW2RwMNviIiFvOq
 RNN+r2BnzJc9tO0jxHxAhCaGdoSxMfIhXb9V+WcjuSF258VNJTVOJQZgwv0B4NqnAZfX
 GOsw==
X-Gm-Message-State: AOJu0YxVAIqMjVm3MpJEcfGIXOT75Ajg5dnFOLqoMpadIQ9McFwi3Tz/
 wp3k6XNC1RxsUisxfz3uGeHaPD+fry1zBzeO+oO4fhuMOYEIozfucnINDGBh9ks=
X-Google-Smtp-Source: AGHT+IGFlT9aIT0ELBQ3fGLuocjkqWYAz5lioaoVMV3JghaR5fVi3lzSzAvTX/9JlAsFJlj3SG7awA==
X-Received: by 2002:a05:600c:4f10:b0:431:5bf2:2d4 with SMTP id
 5b1f17b1804b1-431841a2ee1mr29394055e9.29.1729702231586; 
 Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:20 +0100
Subject: [PATCH 23/37] drm/vc4: drv: Add support for 2712 D-step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
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

Add in the compatible string and VC4_GEN_ enum for the D-step

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c  | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h  | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c  | 4 ++++
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 94e01ce2b1ef..fb91e771e345 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -466,6 +466,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	/* NB GEN_6_C will be corrected on D0 hw to GEN_6_D via vc4_hvs_bind */
 	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index de2107e593c2..e3983a44e35e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -85,6 +85,7 @@ enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
 	VC4_GEN_6_C,
+	VC4_GEN_6_D,
 };
 
 struct vc4_dev {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5606ded928e4..b698f7070510 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1532,6 +1532,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (vc4->gen >= VC4_GEN_6_C) {
 		hvs->regset.regs = vc6_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc6_hvs_regs);
+
+		if (VC4_GET_FIELD(HVS_READ(SCALER6_VERSION), SCALER6_VERSION) ==
+						SCALER6_VERSION_D0)
+			vc4->gen = VC4_GEN_6_D;
 	} else {
 		hvs->regset.regs = vc4_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 731b13742ef5..df44a4a4009f 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -527,6 +527,9 @@
 #define SCALER5_DLIST_START			0x00004000
 
 #define SCALER6_VERSION				0x00000000
+# define SCALER6_VERSION_MASK			VC4_MASK(7, 0)
+# define SCALER6_VERSION_C0			0x00000053
+# define SCALER6_VERSION_D0			0x00000054
 #define SCALER6_CXM_SIZE			0x00000004
 #define SCALER6_LBM_SIZE			0x00000008
 #define SCALER6_UBM_SIZE			0x0000000c

-- 
2.34.1

