Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E39B0ACA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8210EB37;
	Fri, 25 Oct 2024 17:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nHpC5Q8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF32A10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4319399a411so7994315e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876593; x=1730481393;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
 b=nHpC5Q8f2jc/oBjRNGl31jHMH+O/v11bh0E6mSD3k012kyH6JRBdctzA+ie+RAgiwP
 MOTtdxsT6mqZXi6CnzysKfVZMBI7wOXGlda68Pn1oFxClJ3P1zuelMngoQ3Y6xpZoK0z
 3AKDGfd/2D5BMMAykHLNcIZ/Xa+lAn1fNkXMkhhi9kU2mfScJR5mj79T5BoqaG0oiLpy
 XIXq60RCenrLZzBvkpue/tj8tWwXnA3NkbSHKM1BAMzxYUe+6iSUrZrsr6cgEBWUpeWX
 XcGblLRKATwNEGLLAIoU+U1WlBMnfV7XNLdMprkYWCd+bVMHkqGqlO2Rp7/Z4idBNS5b
 O6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876593; x=1730481393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
 b=eVJYptW7PRH9T3KK5RXxbf/U60MaLSUbx/gCw897CGVvufTyOE1o7LhGDOhJEdvg5D
 Ejm4/Np61ZzQDn3mCFUeep7zU4q4WLjmJKYefh/wDZR8L4/+PpYvElV/l8RslnZu8u4G
 UnHjhFBV+ut5LfimrgZS7fCHefmEO0r1q7HYPQx/i5tqk1HNmXy1L2WdA9JYbaHhJgxm
 rtmETeTbwfnZ34wucUZJDTufu0+3Hy30eGMd6cmM2OLAgQkh1j1If6CYZU8oyPoq8vY9
 0YRCBuhk5WS0cGDTzoV62X/Ttq2C78tEW5fea9RQSML8ZZjScRl93WvEMqf5EIf7O/+m
 FzGQ==
X-Gm-Message-State: AOJu0Yz++cEt2Jn1RXauny49/Pa+EMF6INNw2IQLif/WG0v9zE2tTItB
 Vy/AA75pNtjsKfpgFyl9HSb1o+WYlAt7tjx+5xaPul6Y20Ribyy1Ai/SpkYiXS4=
X-Google-Smtp-Source: AGHT+IHe5tCoSz92UO987eOIzi01b4rnj6tRANtMPS83mpXtoleIp32yTkc1Cq0CRABNQvTNNn9/Eg==
X-Received: by 2002:a5d:63cf:0:b0:37c:d57d:71cd with SMTP id
 ffacd0b85a97d-380611ff862mr97480f8f.52.1729876593018; 
 Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:04 +0100
Subject: [PATCH v2 33/36] clk: bcm: rpi: Add disp clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-33-35efa83c8fc0@raspberrypi.com>
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

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index b12d86720207..0e1fe3759530 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -139,6 +140,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		.export = true,
 		.minimize = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 

-- 
2.34.1

