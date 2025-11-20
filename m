Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E96C737EB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 11:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0803210E738;
	Thu, 20 Nov 2025 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="ciBuhvLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70C110E738
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763635166; x=1795171166;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=J8677a+liVG90mEXv9sUxatagrhtLr9kVbgkaIMED9k=;
 b=ciBuhvLU/LCW2VQcscDR71pH4KEbZhATPArQp8chP9iGHi40PxpU2haT
 Pr87cRMd5xcz8dJNLbSbiPJNL72lLgh0rBHXY6LlS1FjcRNo5TPzplexp
 NaLOxeQloZoSAOkhrGVP3RL1J7eGmCsqS648VOYcnzsUZYpuUR61hsKtj
 a0Oq26gxJDZO944WC+PGXDJORmyDVBQH22su10jvkz7pZrnkiO9fUlPKb
 ta1G5QLZmWoW/8+vnToNiPj1ZhfO4kbna8u+mcDp69oppJBiGVFr/kaeA
 lURaY3UQxDcfMRXE9A54xynKx+h+4luwDyCfaoydCb2Ec056syXRy7EEU w==;
X-CSE-ConnectionGUID: CRxBPCVgQ9SsmEJbGIfOAw==
X-CSE-MsgGUID: QCtY8nKtR9OFt9OeKqLWkA==
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="280805056"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Nov 2025 03:39:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 20 Nov 2025 03:38:55 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 20 Nov 2025 03:38:51 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 20 Nov 2025 11:38:25 +0100
Subject: [PATCH] drm/atmel-hlcdc: don't reject the commit if the src rect
 has fractional parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251120-lcd_scaling_fix-v1-1-5ffc98557923@microchip.com>
X-B4-Tracking: v=1; b=H4sIAKDvHmkC/x2MWwqAIBAArxL7nZBmz6tEiOhWC2HhQgTi3ZM+Z
 2AmAWMkZJirBBEfYrpCAVlX4A4bdhTkC4NqVCelnMTpvGFnTwq72egVVo9a+bFvm8FBqe6IRf/
 HZc35Ax/cGzZhAAAA
X-Change-ID: 20251119-lcd_scaling_fix-a4842d86307c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=J8677a+liVG90mEXv9sUxatagrhtLr9kVbgkaIMED9k=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGke77ujhG0mz7EN48i1rGCi4D8K2xJSiOvxcRnnxhoCbQtaw
 YkCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpHu+7AAoJED455hP3e2QtrH0QAM4W
 lw39V1i5i43IF2lUfGx/fxjDop/Icuar7mjQHPxvS4JNNCCA26vKkZHIIACvZWr2BHy/O9N2H5n
 ETDdVR0FGab9W3R7gZhPfJ9cqbDKFRBYt36ooF2CZCwNf1HpFuqDyfpMgw/S1V1htgKZha7Fwhn
 p5rRbvzACyTfCbbC6rQ/ET60yqwt36/Iu4mua4b0lcd4eLRp12I2Gg/fcm8ki0UomfsAD0isYr8
 zH9q1l9fm9gUHSwE2bkTEGnEmbW+9WQQuZKvAOl4tSyA2Zs99WMdqtvMi2R1qMpCil/mZ7ciVUo
 PoJ2vGZ5MGtqox/yemhbgoL4g2JbltsECiuYzV0sj8io9wfeonfbt8+50/fi6TjXiw06x3vau+R
 H+X4ZODyrGPmqE+Pqv8rOrpIDlDEp0nCsjLEkLRMaa936FaMF9w2/+oPAgQeSddbxyjPEj3utpk
 3LWRqKhldh/3nJXSKt07UsRRY32TiAUBS4+W3Yvelsj82FVWKvs3VZPrQVJwuYGb9o9plh4iUUf
 MAh+bJQ++mU50rN+9J+TYW1KrxM3gNl9FfVXEsF88xEIqX95rK/4p9oU/TXI/Ri5ZaIRVHdp2tC
 J89blAAxoQZsz6r1zWNpCtW/l5asYSCHA8Af2h+oqfzGjUbWndRCPEY0U2aIsEU6FzgVwPPJhlm
 yaIEa
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

Don’t reject the commit when the source rectangle has fractional parts.
This can occur due to scaling: drm_atomic_helper_check_plane_state() calls
drm_rect_clip_scaled(), which may introduce fractional parts while
computing the clipped source rectangle. This does not imply the commit is
invalid, so we should accept it instead of discarding it.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 92132be9823f1e705d266f9547702ea9530bd043..bccfe055c087e5632d60503e8e4bcb3d9e18ce50 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -79,8 +79,6 @@ drm_plane_state_to_atmel_hlcdc_plane_state(struct drm_plane_state *s)
 	return container_of(s, struct atmel_hlcdc_plane_state, base);
 }
 
-#define SUBPIXEL_MASK			0xffff
-
 static uint32_t rgb_formats[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB4444,
@@ -745,24 +743,15 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	if (ret || !s->visible)
 		return ret;
 
-	hstate->src_x = s->src.x1;
-	hstate->src_y = s->src.y1;
-	hstate->src_w = drm_rect_width(&s->src);
-	hstate->src_h = drm_rect_height(&s->src);
+	hstate->src_x = s->src.x1 >> 16;
+	hstate->src_y = s->src.y1 >> 16;
+	hstate->src_w = drm_rect_width(&s->src) >> 16;
+	hstate->src_h = drm_rect_height(&s->src) >> 16;
 	hstate->crtc_x = s->dst.x1;
 	hstate->crtc_y = s->dst.y1;
 	hstate->crtc_w = drm_rect_width(&s->dst);
 	hstate->crtc_h = drm_rect_height(&s->dst);
 
-	if ((hstate->src_x | hstate->src_y | hstate->src_w | hstate->src_h) &
-	    SUBPIXEL_MASK)
-		return -EINVAL;
-
-	hstate->src_x >>= 16;
-	hstate->src_y >>= 16;
-	hstate->src_w >>= 16;
-	hstate->src_h >>= 16;
-
 	hstate->nplanes = fb->format->num_planes;
 	if (hstate->nplanes > ATMEL_HLCDC_LAYER_MAX_PLANES)
 		return -EINVAL;

---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251119-lcd_scaling_fix-a4842d86307c

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

