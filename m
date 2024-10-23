Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF99AD180
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6618E10E83E;
	Wed, 23 Oct 2024 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VzuRKUe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309BF10E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so70324025e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702252; x=1730307052;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
 b=VzuRKUe661qXwl3v0+IR5Gu2Lic5f/GoRmH9iZ3WY2IhLWmsw3p6E/YDIbRJLQ+iNJ
 71tlbZErUUBALAUKnbMAv/N930bWEmKKmhrY8Jv4aPk+ZzFcAu3FkLhLaCuV4luWcuPT
 gKdusbuD4n+g5SVxSoVbrsM5OzoYbkCs36jKWiu5vQzACcT4FQ8IMnhOAKi14FckqQuD
 w3jaSywd4iRo6HHQFGp0cMdM2YlYbsTfMeZ/vkMjcwLLSsV3z5xvvGRluJ+KriX74iGf
 kXACl9Wk5GfcKhqEU+hFsalce69eCKJCqOcOJm2aXSqaET4jCOhYgY9iFp8Y3ZScIk1l
 lJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702252; x=1730307052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
 b=mGIRE7hbbiDDJgAPPFWVsxjZcvpa/EGlk3+AIUy2ce3D0wzfTrKHNwXpp/ucdTHmog
 gY7zaWJNM0zKqoMzASbMcNnP2jgstl29MCWMiuxKxHmsTCwW81z/EtbSrz0ctv2pXZFX
 evoYMQrIGSBS+ofNKPk1/bnKx1/3m0WAJ6J4HeZA6+SslCwYKM0dXuJYSUeVSH59rPpJ
 NPIYJGXx9TDseb7WvET4jwVSbJxGP5jsD0wBf0OhpnuRFpESVZvPnZdocqUp+ihTrBdP
 PW2ussOo3Xgv37cLqHKpYSfQqbqifogoebhQEZcYSgPawjlz23gTkFEdBDbAobdKLhFi
 hG5w==
X-Gm-Message-State: AOJu0Yw8D6gAKMh6xvO3hVzOYGFTqAoE0N/HbrasSdnKswYGLJVq2w+q
 tJupMJusREOVXyxVUpEf3SSv2tGFQGFL7Shc2v6mtAeU/QUzE0tJ9Dzo3FUHbiI=
X-Google-Smtp-Source: AGHT+IF+Ep5cy5ocAHASp/06u2OSiKjV3AGCYRQMjGhBm4svhBLkWe/K2mww/KQzVSfsztZblCEfXg==
X-Received: by 2002:a05:600c:358b:b0:431:46fe:4cad with SMTP id
 5b1f17b1804b1-4318413e307mr28468675e9.9.1729702252475; 
 Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:29 +0100
Subject: [PATCH 32/37] clk: bcm: rpi: Enable minimize for all firmware clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-32-1cc2d5594907@raspberrypi.com>
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

There isn't a reason not to minimise the clocks, and it saves
some power.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 274176a938c6..fd7ae0efcf07 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1

