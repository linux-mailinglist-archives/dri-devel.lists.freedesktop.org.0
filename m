Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203FC07466
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F044910EB0D;
	Fri, 24 Oct 2025 16:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="C9tbI/Tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006FB10EB0D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1761322961; x=1792858961;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+WE2yaCBvv0vhU6XUeTaDLKoasG+BrjfNW7CpxBLw0o=;
 b=C9tbI/TvKsf5NwsxeuXfUHQcnj8xsHozdX/rDmZTDlDhlzcI4l9w6vcb
 KRAios6vhzL2BCXmv6thUsW2IsvaQXcV4VAnZedt9Q6QWedmVyOBc9xo2
 XlssEfO6KfiHRU8rGaZn+VCPZES+Rex6+VNrYABxsbCXVww7GhC9lImKA
 DN9waa7xSnHICqv15OmTwTc78ORDn+SPsJYgXdjxdKgzU+Kt8sx1qoJE0
 S0fvoF3oB5v7lbkKhPw8/S6r4RaJh06FOfnuJfA4McNsVNBa7PENLg3im
 9C1fI+bbEEevF03OUdroXe+lenM1tGv2bCiDFVnEum07879lCHlyJmoQ2 g==;
X-CSE-ConnectionGUID: 1/m7iX3mTEmbXSXQqSy26w==
X-CSE-MsgGUID: gFqR2CZcRIqCIPV5T+TIbQ==
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="279593471"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:15:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.27; Fri, 24 Oct 2025 09:15:10 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 24 Oct 2025 09:15:08 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 24 Oct 2025 18:14:53 +0200
Subject: [PATCH 2/2] drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit
 after release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251024-lcd_fixes_mainlining-v1-2-79b615130dc3@microchip.com>
References: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
In-Reply-To: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=+WE2yaCBvv0vhU6XUeTaDLKoasG+BrjfNW7CpxBLw0o=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBo+6YFBLfw7N1TTb/DO1B9/4lSii4N6ky1uuH8r
 Hs6qa2nBeuJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaPumBQAKCRA+OeYT93tk
 Le9cD/0eacpdfmN8iVYqUf+wNb8zjrsZIWzGqiT2ltRIFNCrBbn+Ki4fmP6EDc801970iuUtL+/
 XSaYWIuDOQ1cHUR92mSZ3MwcjZExj+m+5ZGdcgBcfFAoGNL/tjGYbc6aQAmGyQRaBzULrail+5Z
 qjO1a98e/PXbY6Tv0zX25galcMcrrmWe//dvfMLw03ZAzNgrlmPgdBeqqyGa5vTr6XXiu67X2Pd
 rfIsZNDCMY9ws9DdJHEKHYyU/SM0z77bO2BSQDSn4sMF2gvbKUOrRzC2/+a+DaDtWJYnZuCS27A
 +A0aFcxhwKHTD/138z23LiwKt0zA8wC+VKrrlRXr3+UzRONu+oY+TJ3B+72kILhpeNUjE4YAEZy
 /NEVDBXiEM1PmoufWhEZfJAfTcBz964p6BtQUhI6vWGXJWMGRlsNFmd20k6XAlRoBgXligyeeVI
 4YkU2Tw8bvOhMh3717mNhPL3dyLEjvud0JSDqdiKXssTfhIQMunQD/XYmxJpepVxAJa0I8BDsVe
 K9tEj0GnHvdrM/NlQebRr02yYrHV77/P7R/tVpRewar/XMrrQ93FyTDOgn0teXsUAV5zhXR6/zO
 DSP2L24ruR0T9DlxftdCT94vR76W4UtnqsfnY5lAm7jszPwzqOnMBtSzqw98jFB19ppno3VN8ti
 O9exvuRtqEigfSw==
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

The atmel_hlcdc_plane_atomic_duplicate_state() callback was copying
the atmel_hlcdc_plane state structure without properly duplicating the
drm_plane_state. In particular, state->commit remained set to the old
state commit, which can lead to a use-after-free in the next
drm_atomic_commit() call.

Fix this by calling
__drm_atomic_helper_duplicate_plane_state(), which correctly clones
the base drm_plane_state (including the ->commit pointer).

It has been seen when closing and re-opening the device node while
another DRM client (e.g. fbdev) is still attached:

=============================================================================
BUG kmalloc-64 (Not tainted): Poison overwritten
-----------------------------------------------------------------------------

0xc611b344-0xc611b344 @offset=836. First byte 0x6a instead of 0x6b
FIX kmalloc-64: Restoring Poison 0xc611b344-0xc611b344=0x6b
Allocated in drm_atomic_helper_setup_commit+0x1e8/0x7bc age=178 cpu=0
pid=29
 drm_atomic_helper_setup_commit+0x1e8/0x7bc
 drm_atomic_helper_commit+0x3c/0x15c
 drm_atomic_commit+0xc0/0xf4
 drm_framebuffer_remove+0x4cc/0x5a8
 drm_mode_rmfb_work_fn+0x6c/0x80
 process_one_work+0x12c/0x2cc
 worker_thread+0x2a8/0x400
 kthread+0xc0/0xdc
 ret_from_fork+0x14/0x28
Freed in drm_atomic_helper_commit_hw_done+0x100/0x150 age=8 cpu=0
pid=169
 drm_atomic_helper_commit_hw_done+0x100/0x150
 drm_atomic_helper_commit_tail+0x64/0x8c
 commit_tail+0x168/0x18c
 drm_atomic_helper_commit+0x138/0x15c
 drm_atomic_commit+0xc0/0xf4
 drm_atomic_helper_set_config+0x84/0xb8
 drm_mode_setcrtc+0x32c/0x810
 drm_ioctl+0x20c/0x488
 sys_ioctl+0x14c/0xc20
 ret_fast_syscall+0x0/0x54
Slab 0xef8bc360 objects=21 used=16 fp=0xc611b7c0
flags=0x200(workingset|zone=0)
Object 0xc611b340 @offset=832 fp=0xc611b7c0

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 0e38587b868d5b5375fcaa5c0508e8e5690d8ff8..91df1273eac71512109a822000448d7641171dca 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1196,8 +1196,7 @@ atmel_hlcdc_plane_atomic_duplicate_state(struct drm_plane *p)
 		return NULL;
 	}
 
-	if (copy->base.fb)
-		drm_framebuffer_get(copy->base.fb);
+	__drm_atomic_helper_plane_duplicate_state(p, &copy->base);
 
 	return &copy->base;
 }

-- 
2.51.0

