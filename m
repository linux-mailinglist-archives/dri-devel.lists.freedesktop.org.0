Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7A98DE60
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0FB10E633;
	Wed,  2 Oct 2024 15:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="F2x940EX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9E310E1D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 15:06:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37cdac05af9so4398000f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1727881611; x=1728486411;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3wuudxDZwL1ziyHfxVsUQH/I2F8ewPn5gbw+DbZPTKE=;
 b=F2x940EXglEIbiqIk+00mLfAOnXvp8vt4A/2yiuGRcAgErAaXhlkjVfQF0Pk2zfp1W
 IQvICGhOTTbKd/ozf6R1ORLuu3mW4Q13lZ05u0I4NeQ/5Y/tVOaq6Z+Wyux3nmHwsYeh
 Npru29FHpMzf7HHhNMqZcNJYhm32Ja04ADYvXFU2mdF1F65+rctm2S+bK1310TuL7UBu
 uiqMbfA7OxK8H14VQz0yT2tK7NYRuPoe/mQgRiCKGCi5Xf/vM8L/sx6yCejKhc2DckpF
 GdzNBPlGCsKy9/VWH1YVh3+2gBtpo76HntV1F6GYVfRVnUX5ReI+tDA2tpf/ET321COi
 uRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727881611; x=1728486411;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wuudxDZwL1ziyHfxVsUQH/I2F8ewPn5gbw+DbZPTKE=;
 b=hWO5Si/pKBkx6wrMLFTuB3eSA6arN56xcNBXXSF98/fDj/8rxed78ZKc07FpPjXB8q
 MBEwEx4E5d9H0g4zdXEFGszX4PrtyiPS9hYMX2O1334Tu/keWxpwj/DdGTpWXORrsHcC
 SsW3XpJUla6pS69c8mHJ1yeI1HaqzPS5cxUgrM4jrhR4rwtIE1LiEmjsAKdmcyOLF33e
 oXfkGqUM4TUbhmmYFarnJP1gklASHV93Ol16B/cmLXWiuk1+sBRWAK+6iQhZdhMMKgho
 TbKgSqs2HpY/m1yHPSAeoRdEAFvsV2lxjXFCYtCphFdczaw9/cMXTTQwDLLLCK6JSVIk
 UjVg==
X-Gm-Message-State: AOJu0YwHRlMvOZDHX9VjZp2tqUEOV+fvZwMGqNB3+jUr40WlCpa4L9R5
 mTIVhUAXk+QLi++Ek7iTKVBLQom/JgWl5EffQTht3mVioSRugbrouxI1FU8zFTU=
X-Google-Smtp-Source: AGHT+IHWOP5x5OgGMlJLFrprCPz4xB9T/rqwZqubCZ2Ex7qOQhyYFFIozvlL0zfFLPyvvUeHBp07Mw==
X-Received: by 2002:a5d:64a5:0:b0:37c:d53a:612e with SMTP id
 ffacd0b85a97d-37cfba189d3mr2738282f8f.51.1727881611322; 
 Wed, 02 Oct 2024 08:06:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f79ec0a44sm20794485e9.17.2024.10.02.08.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:06:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 02 Oct 2024 16:06:19 +0100
Subject: [PATCH 1/2] drm/vc4: Run default client setup for all variants.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-vc4_fbdev_fix-v1-1-8737bd11b147@raspberrypi.com>
References: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
In-Reply-To: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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

Commit 45903624e9fc ("drm/vc4: Run DRM default client setup")
only added DRM_FBDEV_DMA_DRIVER_OPS for the vc4 (Pi0-3) driver
definition, which caused an issue on vc5 (Pi4) as there was no
fbdev_probe function defined.

Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 13a1ecddbca3..a238f76a6073 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver = {
 #endif
 
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &vc4_drm_fops,
 

-- 
2.34.1

