Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F404752342
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3A10E6CE;
	Thu, 13 Jul 2023 13:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1340710E6D5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
 by xavier.telenet-ops.be with bizsmtp
 id LdHN2A00N3wy6xv01dHNtD; Thu, 13 Jul 2023 15:17:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwC3-001GrG-4q;
 Thu, 13 Jul 2023 15:17:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwCA-00GWyz-RB;
 Thu, 13 Jul 2023 15:17:22 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 8/8] drm/ssd130x: Switch preferred_bpp/depth to 1
Date: Thu, 13 Jul 2023 15:17:16 +0200
Message-Id: <6b97ca629131a8c1c047947a21b2c558ece9ce87.1689252746.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The native display format is R1.  Hence change the preferred_depth and
preferred_bpp to 1, to avoid the overhead of using XR24 and the
associated conversions when using fbdev emulation and its text console.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 130e33a1ba3cba00..93af2e5fc816b5f0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -945,7 +945,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	drm->mode_config.max_width = max_width;
 	drm->mode_config.min_height = mode->vdisplay;
 	drm->mode_config.max_height = max_height;
-	drm->mode_config.preferred_depth = 24;
+	drm->mode_config.preferred_depth = 1;
 	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
 
 	/* Primary plane */
@@ -1075,7 +1075,7 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	if (ret)
 		return ERR_PTR(dev_err_probe(dev, ret, "DRM device register failed\n"));
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, 1);
 
 	return ssd130x;
 }
-- 
2.34.1

