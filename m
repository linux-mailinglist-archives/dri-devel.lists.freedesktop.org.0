Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED79B0AB7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118A410EB29;
	Fri, 25 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gGK87qVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33F010E3ED
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d4821e6b4so1429397f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876562; x=1730481362;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mE1J+qWE3+MY5OdGTFndB6Yv1OgEwWzvu24HL6ntl3Y=;
 b=gGK87qVGNXZfoIrQ9YDCHCFUrTdbcm/9bIQT057aKlKmMwHVXo4cJC9/xtOjARWrOu
 4WAHDrd63AY3PwWIWXfhjY63RS1rjjClstIIo8rQRWLg6seENn+GAHTvOCwOOLknkg5E
 Z8KJPmq1YcBsS13mAProWKyelrz9KEY31tRTONDGDWOO6DdMoKY47IoVOERzOPXzFSDv
 rpmr6F55WKVcGmrb0gDNvEJ1Pw3bNsiFuB2E8FWTr9lcHLGzlXoswz/F+ZUvk7IDLqLp
 Q/IfnREvBXZqOiOqfZvXfNkXPULxfJFQPljQzva15UVUcJk82aFQVGHHtIKKXtY1Bvx4
 E/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876562; x=1730481362;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mE1J+qWE3+MY5OdGTFndB6Yv1OgEwWzvu24HL6ntl3Y=;
 b=UNNv2Wv77erZttHTeGpYyRavf91FCrGe6mqMXT6jT5x6rllwIJ+PurhBI9YBAsHEqi
 ptHABpVFR/pXz0NBeIDEIBlKmCdxJJSk+ysYiHDF0mvBki/lVxCcId6fBH2H0jj3Bavt
 kTC+OeKqpg4nK7o1SK4HFF4xGPzM1Hpe20JDCd+HjjGSiU5ulGuCON6gULuMORxxpV78
 xGmyVF5UOVuffsm9zjfz147M4me2tvr9PW6hGuQkEM2PsQAVSJzacP6K7BSGmBdr//Ag
 qlTAaKmABYzLjnSSl+AaZN8INN5716bhsEc1k6jWqAuQ75HVfk3ahyl70clI1LorQwsl
 TaTA==
X-Gm-Message-State: AOJu0Yxsqu0XVC0iB2jLdZoAYV+TtaIoSi1FhI9yfTimjvNgDHaUWo8+
 Ckhbn9q3nxMU98wRB+hHVFb9EDpEZJzF24t/Bg/Dk5FL3xit8R9D5wveTBhLOPE=
X-Google-Smtp-Source: AGHT+IEHBMyfg8LeLTWXyBsyEhO7uNb2SflsZSQOS0RHT+/8zxN2LWxj0WgsnINVEDyefqmgv9Nkcw==
X-Received: by 2002:adf:a29b:0:b0:37d:3f5c:5a83 with SMTP id
 ffacd0b85a97d-38061128754mr107580f8f.19.1729876561858; 
 Fri, 25 Oct 2024 10:16:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:32 +0100
Subject: [PATCH v2 01/36] drm/vc4: Use of_device_get_match_data to set
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-1-35efa83c8fc0@raspberrypi.com>
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

Use of_device_get_match_data to retrieve the generation value
as set in the struct of_device_id, rather than manually comparing
compatible strings.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index d47e5967592f..3099292f22a5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -300,10 +300,7 @@ static int vc4_drm_bind(struct device *dev)
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
-	if (of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5"))
-		gen = VC4_GEN_5;
-	else
-		gen = VC4_GEN_4;
+	gen = (enum vc4_gen)of_device_get_match_data(dev);
 
 	if (gen > VC4_GEN_4)
 		driver = &vc5_drm_driver;
@@ -462,9 +459,9 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_of_match[] = {
-	{ .compatible = "brcm,bcm2711-vc5", },
-	{ .compatible = "brcm,bcm2835-vc4", },
-	{ .compatible = "brcm,cygnus-vc4", },
+	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
+	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vc4_of_match);

-- 
2.34.1

