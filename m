Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8C9AD160
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87BE10E7E5;
	Wed, 23 Oct 2024 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IM1Dpn8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E9D10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so77162655e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702218; x=1730307018;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
 b=IM1Dpn8ln8eM5grKE7SNsjK5kekplBb1C5ual2Tk72Yz0OXr6333UAYie/72unmOBb
 1pX8KVe4JKi4u+Bu4Jt4ou1p7oMtfX5/ShwRDX9rf7aovYQFKbDEPjPme0Fl/krfLLK0
 bhpeXe7owE1Kdb5sEdS6JRYAELRpcEluox1XwLMkFekyibI3PGKJ4slasIDPuiKu0gCU
 UtZuCQUiEsiA7JFpF8NLsnE0L+OqJ+EHh4ZKCwRiz4TDk3i7Jd/tc3nr5CHk/zEfbxOL
 XSDlnXMWHwcod4HhOSF3grwLi+SmSgqHUFCtfsP96fmrDSJ33mGltoz+ndW0qliOO8dV
 uUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702218; x=1730307018;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
 b=hq7fgkThjL1vnxQWnMFz1gHTi60Rq6HdAk1ON7nJL6ZWKX7zmw95ONCOG0vFozAFJr
 RRK1qNbswuy70mJfhaHWB5wZTEeLR5oNtQXEZs4QQRFpPu6pvKAInAqOn4MKPFvcn1SM
 pPbp5uzuZ2jkfDN4HHFIQCWD8pX/AXdvy+J+zA8ZBChptpPkG6+74paJL6aqChyNAezR
 65T2Uc78XLpINCzzN7X+CyuJhkwTCqIHDpDgdn2i7uGZlSVNSBP8DYnNYK4Uu1oetTrh
 4OA7npt5/b0v+TFQT+fzqRiuzoscx/wziXBfimJMmLT27Ls4gxI6aKrTYD9wwWNMEepe
 luJQ==
X-Gm-Message-State: AOJu0YzXFPjdJ8AY+6/MgTMMgwK7sKh+vpOweo4bIaRj0cnzAsFXqGio
 6oaOadvExJeq2oL3epirUzSyomeNPnTw1k/np+AhMuVf/PIB6FIWNsQk3A6UHZ8=
X-Google-Smtp-Source: AGHT+IGRXt+xjnUqmt434Ic5Jf/wCUKhHYDJmvv7fkNd+2lWuUEM38OLLC7VPFEj10VF2wQhrQ46vw==
X-Received: by 2002:a05:600c:1d9b:b0:431:4e82:ffa6 with SMTP id
 5b1f17b1804b1-43184188334mr32238395e9.24.1729702217658; 
 Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:07 +0100
Subject: [PATCH 10/37] drm/vc4: drv: Support BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-10-1cc2d5594907@raspberrypi.com>
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

