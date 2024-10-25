Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907C9B0AC9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2F10EB36;
	Fri, 25 Oct 2024 17:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JtJLhptT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2BB10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:32 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso1664429f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876590; x=1730481390;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
 b=JtJLhptTznCpw2o8saEt4gYNmiwO5RJ9gWsnyb+wQW6tpRS0b0+unY6xRzautX/uPw
 FaQe1Fi89GorAauvoApPjbgvVLhY8vW3VZQP55uLMve5IvdewRnisa/A/0d4rKF0noOO
 Sh8obd7m8UwteoghGuzMYLaiMzdBXDxDX0qA3BhmBWsMR7IYU+dy9Hy8Mk7QWMr+Quap
 B44fJ1L4DwrPJ+7WcwNMBQrNZW69spKEpt+AnNwLCbbDRqjZK4seKLaTdljhgUW3JCJc
 Jz78FKlL0Dl5i3y1FeIdvn2YeaninHt6cUtfz7Lorub7qxTh0tOVidJ3VHCLwKoWexcg
 /oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876590; x=1730481390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
 b=byhneQvMA1Vozh2EjQ0BZ04xoCgfQiJUOylHGzY94c1GrRyIgqyekGFVb5OEmmYvud
 ysnM4lUj6PQjYRbFKUOUOwd/dPqB2b9VwF+XvEOuBNp+9g/Stk+aJcjF+jt7r7mG2Jz9
 qTge61O0Rz7rU1zuKwwTzr/48J32kWy1jBdVmrt71kU6kkPKQswrV6QLm/yS4hmIC0SJ
 BJMfH+UMnrgDJ8A/232upx6/sM2T+Me5EwV6dkf0SM6ueNvKeVpLT+UsX9azjB0LPMYH
 jelc92clDvEMiXUEh9+AaoljAFacflGC2duPdx9TgYkd0IoGEI0i88DJUayzN6kgzCie
 B0MA==
X-Gm-Message-State: AOJu0YzA46HDgygs2fFam/fzugRzfuCjvuxGMg3ECjH2pMNzIHgwNG7K
 TPdbHgcGNqtC31uEEEm70i3CTFmO1IJzX8cktosUrKV35NCwrR8fHw3DpZrKBcE=
X-Google-Smtp-Source: AGHT+IFzLQpTgUQ1GGNf1FFbit3NR6SLMLyJmHIlrv1yJ02k6Akx4PaydsdQXONZLxuVWGUKuRmYsg==
X-Received: by 2002:a5d:5224:0:b0:37d:53dd:4dec with SMTP id
 ffacd0b85a97d-38061137a3emr110320f8f.15.1729876590408; 
 Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:01 +0100
Subject: [PATCH v2 30/36] clk: bcm: rpi: Allow cpufreq driver to also
 adjust gpu clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-30-35efa83c8fc0@raspberrypi.com>
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

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..d374538e7108 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,6 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
 	};
 	int ret;
 

-- 
2.34.1

