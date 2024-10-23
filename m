Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D39AD18E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B495110E847;
	Wed, 23 Oct 2024 16:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PsNoFMPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7613310E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso67277225e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702248; x=1730307048;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
 b=PsNoFMPqrd6gDN52yi0TfLZ9cOYlHdpC6lJeLuS/8K/nOR0mvuP/1MP3znfVu3uZ24
 joinvWBRVHCMwrSpUGdQuaMFJuQ8XbnkJb+JPBay/sRWEvwPQONOHoDtqmXkjVaiwwbH
 sBwLY1OnsK/BqOBeqaOm9MrIvYus7K/5CtgqoBHHbYwddxaZ6MLLGwwo5dlQ3FQoR6Tm
 pnFz1c9qUxyeRtnHm+/Ou6+gXJkehXhDIYq1iWCA7v6beYlRV30eBxlHvSr/j42Rel+y
 0L0uusy0+3WAv5KpBBs+yM85oMG7vucRUUQzQqx+0wqQJxiJxxEy4IW6T1HhZI57pAal
 KApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702248; x=1730307048;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
 b=SSjBhZgbDGCcl5yG/b6HGFiiBbZbioyfAJNKdF47hJk9dlVHZ0RKul+hat0xpI2y7e
 WBq/SeTfohJtqNQIHqJKOi+JPs2zd3cYPZEoGFKppQqpkXJfHE9mlonXXuLyzF3NG9pd
 q53Wq+0MDxLr2vDozb9DDARCdR+nCL0apCcjkhvBpU4I6pKLgx3BW896plNgf7ub1pQI
 HaN9jR31wxERAbfmMrdu4g4RZiGjmyJWwMeAsy2OZjPDtjVeVYi40pNXzIRBfdPHq5Rd
 cIN4Z4ic5RdcFD3T59RSH50i8UGbrkUT8SldO5CJm4ubkNoZvx98X0qWPjocT/tU8c3W
 4sjw==
X-Gm-Message-State: AOJu0Yw3601nzHnprSCifVIjLT8gBA28iMdAKWl20xhnaVQygAf3E4sh
 qYZogAhyHTRHZYAm/4YERebhQb5UKj6dLq1NS+Y0UZjtoK8la0GT6dyEN1rxq98=
X-Google-Smtp-Source: AGHT+IE4mgCaYm2elKT76LlNq3zUCFQBwxYPgla+kkQUxdQtty9ocFGx1hYzfLUy3hw38CapCGa/1g==
X-Received: by 2002:a05:600c:4ecd:b0:431:612f:189b with SMTP id
 5b1f17b1804b1-431841fdademr30938035e9.12.1729702247813; 
 Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:25 +0100
Subject: [PATCH 28/37] drm/vc4: Enable bg_fill if there are no planes enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
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

The default was to have enable_bg_fill disabled and the first
plane set it if it wasn't opaque and covering the whole screen.
However that meant that if no planes were enabled, then the
background fill wasn't enabled, and would give a striped
output from the uninitialised output buffer.

Initialise it to enabled to avoid this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f15aba4b81d7..5d40bbcb3b54 100644
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

