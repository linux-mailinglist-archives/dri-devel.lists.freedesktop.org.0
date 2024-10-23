Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6069AD157
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6010E195;
	Wed, 23 Oct 2024 16:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="s5HPq5dT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05DE10E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so72276445e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702209; x=1730307009;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m0VXG7M0+edMYKBQpiJHMGtp1VEyRPMm6kVJ0JBtPBU=;
 b=s5HPq5dTfzDtj6mfU6IANvbB+3ycZPUPFGd7zN5OxQkerKGxUgQA7qid7QfVy6gGG6
 E4adk/oPKa6zNfJ4NPUhgYDyOrOZq8qGYGGYF21hTmmC6H54TE8q9A2PJ5a9EFSLvRnQ
 3mJLyQ1GpE6Nxd5fNuMO0Zloq8xjhACYZnLRe6EbEoH+XicUUyyaW1UbBXhHFz+oWQmY
 6+kJikDr83zb/IdFKmGo1NL2lWW3UdGGHd7nh+XVcXyFAP3XFHnQ3om2n80Dr7uoRMZ2
 CVigw8bdl/lgaOrc/ZnRJ3g0glY44WWcf2HljVgZzO5Lo0d8XF0WiBHW7SiGxwMrMqOe
 uWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702209; x=1730307009;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0VXG7M0+edMYKBQpiJHMGtp1VEyRPMm6kVJ0JBtPBU=;
 b=EcLDepRRrgfen4PN6v5uXaQOy8h20ttbe2Oy9WGN8t8qAjgFut/9vHWdotU/MoJb5H
 HxmOuctZykKOR5yFrp8PI3SzCp+2pdNcNH/pwRo8+APRk7P1DzhJl9WmMPHqGR9HW/x1
 gZge+7xESEyBJJx131COaHH4dW2Vhqmt2fKGSOc4RyGTiMKdMTfbKA59NLaSWi11kjdc
 xUJYyUj/8B+MhVJAaqNcPWwhYttw3gMf2xW8gSOpVHASU/2aAhfp56t+uAixT2ZIGXwB
 NBvSUtDNcvqnpjnnmsEfEgcuWwgxfFGLXYlZuxZ4L1BogZyFkc0igP6EqK4Vt1ViOior
 XJ+w==
X-Gm-Message-State: AOJu0YzZYHaRuQ0ksjeA4bUE8tvCMNXeV+OULusWsnYiqHgFpywYGa6g
 kVl7ZkdY4dOaD1S2T9JF2OWHvcpww83cJyArFq3tG4zBwwPHTzyA785xdPVC3Dg=
X-Google-Smtp-Source: AGHT+IERCELF/aNULiFYaJhFKCUgkKnhHnsR2hcb6th/CbnCs93DrujrebahUME8WNgVcpsKAm29Eg==
X-Received: by 2002:a05:6000:1887:b0:37c:f933:48a9 with SMTP id
 ffacd0b85a97d-37efcef117cmr2285226f8f.1.1729702209268; 
 Wed, 23 Oct 2024 09:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:49:58 +0100
Subject: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
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

Pi 0-3 have no deep colour support and only 24bpp output,
so max_bpc should remain as 8, and no HDR metadata property
should be registered.

Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb36..6ebcc38be291 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -640,6 +640,11 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (vc4_hdmi->variant->supports_hdr)
+		drm_connector_attach_max_bpc_property(connector, 8, 12);
+	else
+		drm_connector_attach_max_bpc_property(connector, 8, 8);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;

-- 
2.34.1

