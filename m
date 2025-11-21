Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A109C7A671
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690810E8B2;
	Fri, 21 Nov 2025 15:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="qAC6QPRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3910E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737631; x=1795273631;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ha1BPyyylS6A6UQC8yFXbfo2wrOczjUDbfibr5RJHhA=;
 b=qAC6QPRkQRwURdxFKQLU/6xOGQOc1/AZMWyJSS4fTDJA2CG6HKGwv6kq
 ninawfABhoJ6ag36XUXRIqOf+ixqbwxHS8+wkGkvUV7VAF0hsMg3cMfxZ
 eIF+PDCMq7GgNnob174ziMeboSZSFCP8WGZlFxj+xmGVaeEKbPAcaWgIH
 IvIzTNNhTOpaRVwzpycd8dPYWGm2qeWm68Xs7vwBvw4PY2Jn3XAOFujwS
 iBokQBqUstUYzBMJ4oXFkiMtw8vIrSidZ4RmjgCAS6pV5X5f6qUYF3zUT
 lNItki8BcENAcKsAmE13A13OjuKvsFfrhQUsauRkQKGoZYgEycQSyew2E A==;
X-CSE-ConnectionGUID: f+FH760WRD6H6erujY1rjg==
X-CSE-MsgGUID: Q/Y3RxxUQlaQBonNfiT6Ww==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="216838770"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:07:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:45 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:40 +0100
Subject: [PATCH 8/8] drm/atmel-hlcdc: destroy properly the plane state in
 the reset callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-8-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=Ha1BPyyylS6A6UQC8yFXbfo2wrOczjUDbfibr5RJHhA=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WmebVV8yaA2DizdfbhYZClJXfHhgrXaRyl
 g4+2xwTdgGJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LdAMEACO166ARuG1OSAHJGOwYA6Ry41lcW+UR3weaiNx75oFreM6rbYIJjrNl/uvrXvDDtScVsG
 GC/vi7LBNC3EAilUM/mWp4thXccPIhVk/vBedBFNKoMUs7dlO1GtvYQYx7kX5dIxzDb/WVC73Kc
 NNwRoy/YDEt+2iL4z8pcfNYSjpkmsnNMeUC39KW6Ndd+uHp/XLsUNUdRUvgDeAXelUrkb+Ps6LE
 184Xqmmb5urU7wFSaPyqBkI26LcvvIIiGuFr6JrAzxYftG4blfZViLz/f7bE8G/BQ04MllUrQtC
 VFMm0WRzObp1D2K1Fkvurz+Zb9l016j8+ll9Bvdw4MOO5nUZ7UWMcXXgJOKSGqSPhywjVJrWGXb
 X0V/sUWiGn6gm5Dz2EBf3yDm4+YpfV03XPVgpZTpGFyOWTowiwljljQBB1GCmcw9OGdOZwVPMiI
 VSdatPjwA+ZV0/OHOg41o6RBpoTmzWDpvGEUEZqystixCqo0sRdIS1Xpnc/ggzfEXLl/BlvlNPl
 cnLiab4+UFcS4XmqoEdBjrf2ijm9lYBfInGEnqgAN+t7LpDGML7QVVPSBQWE5vKb8BjQdTR3omz
 koi2981qbPYxcRGxCJa9ghUlQkY/RbHKAnk6L7+xkOV+1/DEf4cOkGdY5N+CKvcaJDqST8sxrqr
 8LjDyPbLd9KzeRg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

If there is a plane state to destroy when doing a plane reset, destroy
it using the atmel_hlcdc_plane_destroy_state() function. So we call
__drm_atomic_helper_plane_destroy_state() and avoid code duplication.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 52 ++++++++++++-------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index c1f3aaae29fb9f6b947f81e2fb4e7a61e10ac5d9..81dc730362322a4bae9b48dca97b06baa1e331e7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1155,32 +1155,6 @@ static int atmel_hlcdc_plane_alloc_dscrs(struct drm_plane *p,
 	return -ENOMEM;
 }
 
-static void atmel_hlcdc_plane_reset(struct drm_plane *p)
-{
-	struct atmel_hlcdc_plane_state *state;
-
-	if (p->state) {
-		state = drm_plane_state_to_atmel_hlcdc_plane_state(p->state);
-
-		if (state->base.fb)
-			drm_framebuffer_put(state->base.fb);
-
-		kfree(state);
-		p->state = NULL;
-	}
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
-		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
-			kfree(state);
-			drm_err(p->dev,
-				"Failed to allocate initial plane state\n");
-			return;
-		}
-		__drm_atomic_helper_plane_reset(p, &state->base);
-	}
-}
-
 static struct drm_plane_state *
 atmel_hlcdc_plane_atomic_duplicate_state(struct drm_plane *p)
 {
@@ -1222,6 +1196,32 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 	kfree(state);
 }
 
+static void atmel_hlcdc_plane_reset(struct drm_plane *p)
+{
+	struct atmel_hlcdc_plane_state *state;
+	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
+	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
+
+	if (p->state) {
+		atmel_hlcdc_plane_atomic_destroy_state(p, p->state);
+		p->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state) {
+		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
+			kfree(state);
+			drm_err(p->dev,
+				"Failed to allocate initial plane state\n");
+			return;
+		}
+		__drm_atomic_helper_plane_reset(p, &state->base);
+	}
+
+	if (plane->layer.desc->layout.csc)
+		dc->desc->ops->lcdc_csc_init(plane, plane->layer.desc);
+}
+
 static const struct drm_plane_funcs layer_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,

-- 
2.51.0

