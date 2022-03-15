Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239E4D99FA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 12:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7105A10E38D;
	Tue, 15 Mar 2022 11:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9EF10E373
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 11:07:21 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1dc0:e57f:6975:ecb9])
 by laurent.telenet-ops.be with bizsmtp
 id 6b7H2700U3jtd4z01b7H5H; Tue, 15 Mar 2022 12:07:19 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nU51J-004XNv-1l; Tue, 15 Mar 2022 12:07:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nU51I-002dRK-C8; Tue, 15 Mar 2022 12:07:16 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 4/5] drm: ssd130x: Reduce temporary buffer sizes
Date: Tue, 15 Mar 2022 12:07:06 +0100
Message-Id: <20220315110707.628166-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315110707.628166-1-geert@linux-m68k.org>
References: <20220315110707.628166-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ssd130x_clear_screen() allocates a temporary buffer sized to hold one
byte per pixel, while it only needs to hold one bit per pixel.

ssd130x_fb_blit_rect() allocates a temporary buffer sized to hold one
byte per pixel for the whole frame buffer, while it only needs to hold
one bit per pixel for the part that is to be updated.
Pass dst_pitch to drm_fb_xrgb8888_to_mono_reversed(), as we have already
calculated it anyway.

Fixes: a61732e808672cfa ("drm: Add driver for Solomon SSD130x OLED displays")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 7c99af4ce9dd4e5c..38b6c2c14f53644b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -440,7 +440,8 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 		.y2 = ssd130x->height,
 	};
 
-	buf = kcalloc(ssd130x->width, ssd130x->height, GFP_KERNEL);
+	buf = kcalloc(DIV_ROUND_UP(ssd130x->width, 8), ssd130x->height,
+		      GFP_KERNEL);
 	if (!buf)
 		return;
 
@@ -454,6 +455,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	unsigned int dst_pitch;
 	int ret = 0;
 	u8 *buf = NULL;
 
@@ -461,11 +463,12 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	rect->y1 = round_down(rect->y1, 8);
 	rect->y2 = min_t(unsigned int, round_up(rect->y2, 8), ssd130x->height);
 
-	buf = kcalloc(fb->width, fb->height, GFP_KERNEL);
+	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	buf = kcalloc(dst_pitch, drm_rect_height(rect), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	drm_fb_xrgb8888_to_mono(buf, 0, vmap, fb, rect);
+	drm_fb_xrgb8888_to_mono(buf, dst_pitch, vmap, fb, rect);
 
 	ssd130x_update_rect(ssd130x, buf, rect);
 
-- 
2.25.1

