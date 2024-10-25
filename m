Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B89B0AEA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A75310EB4B;
	Fri, 25 Oct 2024 17:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iBQy+c8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957A10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4314c452180so23112355e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876587; x=1730481387;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0vbQi4zffHZmgrFZhlEz3qZo9PncYkAwxBP66oHpwT0=;
 b=iBQy+c8w9Pf1jZxpxjixV8wFQ8DojAxV8AyeFZUklZzpWUcisQQLVM0SIq//1//thJ
 Fy/XIqhGV3vFLsk7MQIxJQ+rEu5FMp9GfX0KrhopTrdB9/auqCr1Y/owXgjf0M1F8Ocb
 Zwmi0YfjIUQiWcI+ojQft3l+t/tGdRvoOrFmPKMS0R3qbPmPWyrgQv3I82r4Gmc8cGbC
 nDzasLqi/AmGwpHoczLlrzPsob0Oy+1+A8aRxR92ofhwdhuSRlZfp/OkeGRA0/XMHARe
 ME6rIjOEU9lrSW3Iq37n/+7YL72T8L/DfuSQ62pIwOaozRtwA5Nx8x3SvdccUgclzyv/
 SEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876587; x=1730481387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vbQi4zffHZmgrFZhlEz3qZo9PncYkAwxBP66oHpwT0=;
 b=BQ8cGvQT71qeDF9VT6y2x1dNXkEgV3yTT/mG5ib4vi8leBwOyqVueip/Pbdtdz2RGP
 Ra+1Al6JhbbAPOToUXCIceAYVzHZB3R5PJKuAufvNEw2RgQsyy7ian5yMVcupl+Chpc+
 mj4/5GMn6WVnu9Z2r312McFsOqkswUCvQYe32UxhU/cpddJ6m4fobfFMBHlGeCsN77GJ
 HvFPaZqwLDKNeI/LkEP2eBajG2k/dQdxmOEUdHKcgWvpyzE0qZvUPf7WVcA95t3OAAgC
 4tuXupzckVeCD7pv1XEtHt9hS+fZMxgnsC+GILPKmNNwTNPeV4CZU+XcdKcBl6Zg3ZqQ
 zzxA==
X-Gm-Message-State: AOJu0Yx3eB6HufLin6udNLQGe2Bp61tjXW/Aeko4O+3ReNiXEGzpJ4lX
 hiiviGvk+RYIwiFx9w11yackYC906phG5Zxq5h2+QlU1QWhRrK/e3umrQVk6Ago=
X-Google-Smtp-Source: AGHT+IH+29oPVsRqs2fqHrAWDnK5QD/g1okRZ89yJvrj7HxIWsx6pgAGD3QO00ZuQ026KdKRThmfow==
X-Received: by 2002:adf:ec8f:0:b0:374:cd3c:db6d with SMTP id
 ffacd0b85a97d-3803abc51c6mr5147977f8f.6.1729876587557; 
 Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:58 +0100
Subject: [PATCH v2 27/36] drm/vc4: Enable bg_fill if there are no planes
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-27-35efa83c8fc0@raspberrypi.com>
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

The default was to have enable_bg_fill disabled and the first
plane set it if it wasn't opaque and covering the whole screen.
However that meant that if no planes were enabled, then the
background fill wasn't enabled, and would give a striped
output from the uninitialised output buffer.

Initialise it to enabled to avoid this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2493ac17d78f..c8bc2b48648f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -936,7 +936,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
-	bool enable_bg_fill = false;
+	bool enable_bg_fill = true;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
 	unsigned int zpos = 0;

-- 
2.34.1

