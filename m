Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F249B0AD6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8780710EB3F;
	Fri, 25 Oct 2024 17:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rwBkcbcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7F10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so1772000f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876570; x=1730481370;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
 b=rwBkcbcl3E8Vk/vzk5Cwsfh1+NI1XUDM/8w7+qmCDjSdE1ys6KXzCOlxNinArjFFWG
 Wt8Ae0806L6bpk4zkOkxXSIU6kG8JG3s9rMTpiIXcuS8x4EJk7ruO9bP8WibQv2dq4qX
 8x+u6UHQAGIpwO28KD9u0J6FRThAeUqodKKByCUP6zTMinvt5B0Z31I0OBjRfkJS5zwQ
 6XK6s7dLBNUU6qykk1k3ti/16rhqNnyhBQEDGhoFf6jd9VhVjqKbUGMe7sg6S0uJ5Rgh
 UWaf1iDlxetpczeN9638WuLf6SN9lkgFDyjor0wmYQpzzUUtD4L4G5L/nCRT0KUTOgsX
 NZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876570; x=1730481370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
 b=G7PC/BMm7NkJb0Y/tHqKD11yDyQs5K9/UA2YACXGSETMSvaGsceXGd4E1ZETd/Shh7
 Z72p68chZsYtOd4Ag/jWmpvmGElxBXkX3+8EpeNdnRD+NAxn1A1mAYnMGPYwWQ38T264
 gXFon6753djCO1XKzAOPahJUvsiEoMF3ncWSQGNpkQZ4dujP/gu36/0n/wfXWvgPldgN
 lHMQEMZkp2e6qABXXj4xoaDViim6RZuiXXcc1UElvKQTJw9v8NjMwtjUJO4hDYf5eH9o
 R8GE8jR15O4hH11MddHOK4C5r9Y22ktFx/MiELDwqVMo/RXVdHhCfR1yy5fT+i8YExLn
 C5iQ==
X-Gm-Message-State: AOJu0YzOzhogMw5yHfBDRW/JDyimXyA84Aek5Uktb2Z5FHqeb6kcURFR
 w9qmS2l+cJrxVL1NKEYXQCcmT1pjPCOet5GFvhP6J8VjdmEFPozK8zHXv8nib3k=
X-Google-Smtp-Source: AGHT+IGCwZV5fbmeF0D4Xme2MrSeeStQPCABILFJnZu8X/UbpKfmCgg7tE2q1WXeLJuU2hjtaGAprQ==
X-Received: by 2002:a5d:56d2:0:b0:37e:f4a1:2b58 with SMTP id
 ffacd0b85a97d-38061172aa9mr141238f8f.16.1729876569829; 
 Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:40 +0100
Subject: [PATCH v2 09/36] drm/vc4: drv: Support BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-9-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has an improved display pipeline, most notably with a
different HVS and only HDMI and writeback outputs.

Let's introduce it as a new VideoCore generation and compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 3099292f22a5..417a5b456d80 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -460,6 +460,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
 	{},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c6be1997f1c7..14b0a7ef2683 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,6 +84,7 @@ struct vc4_perfmon {
 enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
+	VC4_GEN_6_C,
 };
 
 struct vc4_dev {

-- 
2.34.1

