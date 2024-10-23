Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EF9AD182
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B20910E840;
	Wed, 23 Oct 2024 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lLd5D2da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286D10E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4314c452180so7942525e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702250; x=1730307050;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
 b=lLd5D2daNwoy+UBI/ddRUO9dEAe+tu/43EoVpD3rcqxkRA3cKPeZIlhPu7p25rPBW1
 Dihe31Gd8Qvy7bm2ROu8CVa9ak5qmDutx+7aGLAi9JB5w3mWh1et7VdgmeqJoefgAFZn
 tTRq6jmb4Iouoh9uFlk3sZnBc0picdgPnMz7B9NM+iDNg6XfWr3MM0xBh1YMqUJkVWvn
 x1kV2VSB5Lh2K0TarLJMgShqIuG2Nlh+XWycISePiYzpvbLusjLczabR5/oUiXFxz2Ds
 AC8nKNK9hGB/4gzHNef2LFEUJZRCO+JyA+aVR96bhnAwga4BL/1ERGRjQA/vjWC+2viP
 GrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702250; x=1730307050;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
 b=KLq1f1w5OynnYddsuTT0m1CyLRJrOtFMtvrS2zM1+orbkqynYgCs8yeoYzf0qsYHlp
 jirJkpwyRdbmcLFOySrTKip62fmdoMEqY9j33tIoU1i6qSLpjK3QLcdKnXaj3rDL3rS+
 YVwSlO6ShiXDueNV3edBe7hP3yI2q+OF9cfBZolBf1iTnzhlr3PL81O1D7gkhYK7khb7
 QfG+N4+lyaRvngHmQFFjTAXLQ5PWcCV5yHNTYl7n9ZL+mdZpTH1qWzTU7rAL/8lN0Iaa
 PzQQJoUNYr9354ESU26Zqy48Q/67AbokLCzVcb+5A/51FGMAIETONO68LfEshw8KDb/m
 NMxQ==
X-Gm-Message-State: AOJu0YwyGF7A2gNICcVu6kmJzvaRPw5g3eDuhY6lGozS5d3hAhIa+tjm
 NmozxphN8QZiY/FAtqBWWVpNrn+6B5b2Huzl17PfOjh5O/P0cVi8Smecfn4D52c=
X-Google-Smtp-Source: AGHT+IHiThpqNk1aykeI/HCv+JYxamwU4EBdrmtK4EAyvKSVy0PZGtmgt/LXmRWsriS/yuXmN6RtIA==
X-Received: by 2002:adf:e88d:0:b0:37d:47eb:b586 with SMTP id
 ffacd0b85a97d-37ef12592e5mr5273994f8f.4.1729702249886; 
 Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:27 +0100
Subject: [PATCH 30/37] clk: bcm: rpi: Add ISP to exported clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-30-1cc2d5594907@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
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

From: Dom Cobley <popcornmix@gmail.com>

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1

