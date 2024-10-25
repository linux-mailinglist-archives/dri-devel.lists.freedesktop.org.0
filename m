Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658649B0ADC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF2A10EB43;
	Fri, 25 Oct 2024 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="npiR+UZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A3010EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso1664264f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876582; x=1730481382;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
 b=npiR+UZPzNJoAgGZWd85vJ49g9VcFdF0oKH9yfFaPiK1GHQKBXeyIEPxQOTVpQY0I2
 FeDOBHZ0JSvs8vTJFZNArcfhBxEDPbO3cqc0PI7soBC2Bh6go2gliqvjq7O0fAmV1odY
 vYSuqY4WMfeUqeb9yMm6VKa/M+9BFF75jjnxZn/J0XWW/PFez75apw3hMqRn1F1SeZ29
 O++OrstPohthTneQi2wR8YBjEIZuL3bnvoDRvunNicPqkbDHtjp1RtLm1m2HEOptqBIQ
 BvNhBuAm/0KNiLYAaeSnv6rWrzwqvOiLxqWPV71FxkvPScCysCoV7k+LvDPbD/LCcQIA
 9sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876582; x=1730481382;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
 b=Ou1tXk1ofXRC5U6fCVY3H/OrrbtrE4R/rlOEq1oNwXw1TkSNBUv9ZXlbieGWU/q/nM
 QWtI/V0fBINcZsCJGLg09bZ0ckwkM8GvjCo8kc1ojD3cF+4Is6vvbToa4byjdLsdi6ji
 XSoXpZaQXd7+/X3kAk3DeZCEvx2AnRRog7yIN+4n3NnzO+5H0CIttGKTuw8+SjkvYTGF
 9RPjGVvA0grGm0g1uvEhQHWv1V1gGDsvO7jhqO/9uFRMdmalMa6/NH/0SvzGTH8kbzvw
 /A4xIZDI7EUv7QJbuZOQwtsWjhvUC+EUQRfcButnbvcNeXNIjQ737y2gGLheB1guNIgM
 lBfQ==
X-Gm-Message-State: AOJu0Yx01WwfNdJLE2wdVT01gvzAaGN1guV02HMvLu2PbTnRlsVI0y+z
 177baeME8VuP+/SvoXVnWVWraipAq9upDCVuNeKR5LoJTYJJ9CanGJZoLkgWhYE=
X-Google-Smtp-Source: AGHT+IEQsz/ieGCoAjrNeStjHY3m+yeckCVb8DDV3/P3RxReILzsgdvSRPsp1dMVqLFx8R4lAqslJA==
X-Received: by 2002:a05:6000:b0e:b0:37d:4fab:c198 with SMTP id
 ffacd0b85a97d-3806115a9bfmr105090f8f.26.1729876582551; 
 Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:53 +0100
Subject: [PATCH v2 22/36] drm/vc4: drv: Add support for 2712 D-step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-22-35efa83c8fc0@raspberrypi.com>
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

Add in the compatible string and VC4_GEN_ enum for the D-step

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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
index 7c2dccfdb58d..a353b51243a5 100644
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

