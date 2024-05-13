Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D58C4132
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B04110E77A;
	Mon, 13 May 2024 12:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD5D10E150
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:56:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E28EC5BECE;
 Mon, 13 May 2024 12:56:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A37C913A52;
 Mon, 13 May 2024 12:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iOSFJvwNQmZpfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 May 2024 12:56:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/10] drm/mgag200: Allocate instance of struct mga_i2c_chan
 dynamically
Date: Mon, 13 May 2024 14:51:09 +0200
Message-ID: <20240513125620.6337-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513125620.6337-1-tzimmermann@suse.de>
References: <20240513125620.6337-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: E28EC5BECE
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

Allocate instances of struct mga_i2c_chan in mgag200_ddc_create()
and return a pointer to the contained i2c adapter. The callers of
the function are now independent from struct mga_i2c_chan.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_ddc.h     | 11 +++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  4 ----
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 11 ++++++-----
 drivers/gpu/drm/mgag200/mgag200_i2c.c     | 20 +++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  1 +
 12 files changed, 79 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h

diff --git a/drivers/gpu/drm/mgag200/mgag200_ddc.h b/drivers/gpu/drm/mgag200/mgag200_ddc.h
new file mode 100644
index 0000000000000..fa21d197cc783
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_ddc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __MGAG200_DDC_H__
+#define __MGAG200_DDC_H__
+
+struct i2c_adapter;
+struct mga_device;
+
+struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev);
+
+#endif
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index c7d4047301bfb..3c834bfd82cf4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -294,7 +294,6 @@ struct mga_device {
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct mga_i2c_chan i2c;
 	struct drm_connector connector;
 };
 
@@ -453,7 +452,4 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
 void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
 void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
 
-				/* mgag200_i2c.c */
-int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c);
-
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index bf5d7fe525a3f..39a29d8ffca6e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
@@ -201,8 +202,8 @@ static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -238,16 +239,16 @@ static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index fad62453a91db..619fee7ffdf5e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 void mgag200_g200eh_init_registers(struct mga_device *mdev)
@@ -200,8 +201,8 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -237,16 +238,16 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200eh_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 0f7d8112cd49f..a172b8a4500a0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 /*
@@ -104,8 +105,8 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -141,16 +142,16 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200eh3_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 8d4538b710477..a11c91331e43e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200er_init_registers(struct mga_device *mdev)
@@ -243,8 +244,8 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -280,16 +281,16 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200er_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 56e6f986bff31..dfb641b83842a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200ev_init_registers(struct mga_device *mdev)
@@ -244,8 +245,8 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -281,16 +282,16 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200ev_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 170934414d7dd..525b7f75e6228 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200ew3_init_registers(struct mga_device *mdev)
@@ -113,8 +114,8 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -150,16 +151,16 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200ew3_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index ff2b3c6622e7a..ef7606b529ea1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
@@ -375,8 +376,8 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -412,16 +413,16 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200se_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 9baa727ac6f9f..e4def62b1e575 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 void mgag200_g200wb_init_registers(struct mga_device *mdev)
@@ -247,8 +248,8 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
 	struct drm_connector *connector = &mdev->connector;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -284,16 +285,16 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &mgag200_g200wb_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret) {
 		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index effd7c057fce0..46fa9f1b4e469 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -33,6 +33,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static int mga_i2c_read_gpio(struct mga_device *mdev)
@@ -95,7 +96,7 @@ static void mgag200_i2c_release(struct drm_device *dev, void *res)
 	i2c_del_adapter(&i2c->adapter);
 }
 
-int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
+static int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 {
 	struct drm_device *dev = &mdev->base;
 	const struct mgag200_device_info *info = mdev->info;
@@ -129,3 +130,20 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 
 	return drmm_add_action_or_reset(dev, mgag200_i2c_release, i2c);
 }
+
+struct i2c_adapter *mgag200_ddc_create(struct mga_device *mdev)
+{
+	struct mga_i2c_chan *i2c;
+	struct drm_device *dev = &mdev->base;
+	int ret;
+
+	i2c = drmm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return ERR_PTR(-ENOMEM);
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &i2c->adapter;
+}
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fc54851d3384d..cd1f48b2f9986 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -24,6 +24,7 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 
+#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 /*
-- 
2.45.0

