Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E709AD17D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A3010E834;
	Wed, 23 Oct 2024 16:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="S/v2s2+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2DE10E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso62470795e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702249; x=1730307049;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
 b=S/v2s2+zU7TlW17Md/I0bkezrHxq4Q8TQH5JZsYNWG38KoAtQvVRzD/MR9Ugd86bXu
 Cq87aRA4LhsWB6VisluQmBOqQ33+FtJf+iy+djdtmd2wvyYkTVdPKzshFo8S/MLow6PE
 FMGNj4VauWR9APDaKWzOWKiI6JFJHVYBI30gjrHykfdEuNkUGCd6DO3htK/YgDysBC1x
 +446Wp6tyVp9E32YUUuCtSsLcdG30JfHWn+nQV2VDSREO/zBohCnbFx+RkZHseTvQkzU
 vcS84kcdBEqOVT1aYRJauWRWIMdSS7QcpSYbW+EadMVesNQPlehlr7uLTR/8aRQcZDNJ
 O3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702249; x=1730307049;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1187eCau7YQm+fLqvdnzaKIPua1eXW5DaRGJ7Ln3ZlQ=;
 b=mHx/PgiiKnzD670W9yglq7bAhJpna6uVesZ8FVU8/pdFMeV7v7ET347Gl4WC8JmgKh
 NX0N9zi/dPAC/zxS9PJqAj6Qg17dDeN8d1aq0LnDCC5u/urONotRwspZU6p0wNnvC8Hg
 mQ4bfTbf3M27MvQLMafgyVl9XEplOZZM2mcXjp7FFFtieedfdUBXkU5UMHh3tMTU9QtU
 iuEotrPxxRS8j+6XM53KrWnpwrqIM6G6g6+wG/l3myxjztE3zmb4ZxSnq8VmUzkEA0Oq
 v7c+dDxH37VlaXEI0Ft9RJafiIICEzH54zsqwteeyGJkVAUEdcowGmNmSFwDQ8qrW4dx
 CxZw==
X-Gm-Message-State: AOJu0YxINoNaMckyCDwZnfP/66sCbS+vjc2Ekr4I8OZ2CvEUISpNL+jD
 tav+aCiuUYU2qNYBqVKOpDVdU4EiaE+VUKIBL9fVzzrIJ4s/jO+bRjlFEmqXw/4=
X-Google-Smtp-Source: AGHT+IGnOy6934iu4X4nAJLDq42XcldaiFx0K1e85HTnwt0PFdy3j0mfVRmbr6x1y+nTvJQlVW7Bhg==
X-Received: by 2002:a05:600c:46d0:b0:431:4e25:fe42 with SMTP id
 5b1f17b1804b1-4318419f2dcmr33339855e9.32.1729702248667; 
 Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:26 +0100
Subject: [PATCH 29/37] drm/vc4: Drop planes that are completely off-screen
 or 0 crtc size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
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

It is permitted for a plane to be configured such that none
of it is on-screen via either negative dest rectangle X,Y
offset, or an offset that is greater than the crtc dimensions.

These planes were resized via drm_atomic_helper_check_plane_state
such that the source rectangle had a zero width or height, but
they still created a dlist entry even though they contributed
no pixels. In the case of vc6_plane_mode_set, that it could result
in negative values being written into registers, which caused
incorrect behaviour.

Drop planes that result in a source width or height of 0 pixels
or an on-screen size of 0 pixels to avoid the incorrect rendering.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c084967d3527..94737c587f20 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1230,6 +1230,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -1753,6 +1760,15 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen.
+		 * 0 destination size is a redundant plane.
+		 */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -2135,6 +2151,10 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h)
+		return 0;
+
 	ret = vc4_plane_allocate_lbm(new_plane_state);
 	if (ret)
 		return ret;

-- 
2.34.1

