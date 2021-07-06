Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40783BC76B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FED89A59;
	Tue,  6 Jul 2021 07:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7A89A59
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:45:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B665E2267D;
 Tue,  6 Jul 2021 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625557546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pCqMVKA356077QUwAXe3E4qvn7wgqSHiy8HMHzQz0T0=;
 b=q+Lxpt/SxL8MFfF1KYOwBtoRDOIFgYjczMym86b026UvEuApB5AFP2Gwn9kHa0JWn6Ss8F
 Sh0rY22NDAjJfPqG4d7lMA4Wu6usism+zC9BZOt3G2p/IBjsUt7ILgnanL0ug+IBlVfJdj
 P5fWzJK33p0h+xbp0Nn1LLMgbF0NuxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625557546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pCqMVKA356077QUwAXe3E4qvn7wgqSHiy8HMHzQz0T0=;
 b=7XqPZYt+DWmuEPxiye3mfCE0fx7A5MJhwv3JEEkHy1VdzKZsaGBEZD9WG7W2CVMiNujO/I
 6Q6KpiHy1Pa2SyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7129E13A42;
 Tue,  6 Jul 2021 07:45:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +P+fGioK5GCnbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:45:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH] drm/meson: Convert to Linux IRQ interfaces
Date: Tue,  6 Jul 2021 09:45:45 +0200
Message-Id: <20210706074545.8763-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/meson/meson_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 3d0ccc7eef1b..bc0d60df04ae 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -94,9 +93,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 static const struct drm_driver meson_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
-	/* IRQ */
-	.irq_handler		= meson_irq,
-
 	/* CMA Ops */
 	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(meson_dumb_create),
 
@@ -335,7 +331,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto free_drm;
 
-	ret = drm_irq_install(drm, priv->vsync_irq);
+	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
 		goto free_drm;
 
@@ -354,7 +350,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return 0;
 
 uninstall_irq:
-	drm_irq_uninstall(drm);
+	free_irq(priv->vsync_irq, drm);
 free_drm:
 	drm_dev_put(drm);
 
@@ -382,7 +378,7 @@ static void meson_drv_unbind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	component_unbind_all(dev, drm);
-	drm_irq_uninstall(drm);
+	free_irq(priv->vsync_irq, drm);
 	drm_dev_put(drm);
 
 	if (priv->afbcd.ops) {
-- 
2.32.0

