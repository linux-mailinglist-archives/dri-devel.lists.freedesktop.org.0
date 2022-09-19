Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546ED5BCC7A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B3910E2B7;
	Mon, 19 Sep 2022 13:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778D10E270
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCC7F2233C;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag6pPjFMvxqBwyoL3aRE0AFHk2UIzWlxCWZZDPXJrYo=;
 b=PY0RbmuyRSO/dts6a4LKw4sQkuRha6XJMBuv7HH+hCdBcbffmmv37OKXGUdtjRLdiLflZI
 BcqqbRo1WpWPr86OZ3r+JNnF0ZF0rEv0XKXnljuLOpDBovJBkUFCMBe2bJhHyjRH3QO6ai
 XtRDaXW4gR9zrfb0ms8Tv/um43/N0Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag6pPjFMvxqBwyoL3aRE0AFHk2UIzWlxCWZZDPXJrYo=;
 b=MgjSe41BQKkIE+Sk7JCMzDejFF30DwYtLpOmqZpk0oBS1fB2asrnfM6bFUDDIECJ/VscxA
 +5TR3nyeHxUYVSBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A408113A96;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qM/UJsxoKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 05/16] drm/udl: Move connector to modesetting code
Date: Mon, 19 Sep 2022 15:03:57 +0200
Message-Id: <20220919130408.21486-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the connector next to the rest of the modesetting code. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/Makefile        |   2 +-
 drivers/gpu/drm/udl/udl_connector.c | 132 ----------------------------
 drivers/gpu/drm/udl/udl_connector.h |  21 -----
 drivers/gpu/drm/udl/udl_drv.h       |  11 +++
 drivers/gpu/drm/udl/udl_modeset.c   | 122 +++++++++++++++++++++++++
 5 files changed, 134 insertions(+), 154 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.h

diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
index 24d61f61d7db..3f6db179455d 100644
--- a/drivers/gpu/drm/udl/Makefile
+++ b/drivers/gpu/drm/udl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o
+udl-y := udl_drv.o udl_modeset.o udl_main.o udl_transfer.o
 
 obj-$(CONFIG_DRM_UDL) := udl.o
diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
deleted file mode 100644
index 538b47ffa67f..000000000000
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ /dev/null
@@ -1,132 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Red Hat
- * based in parts on udlfb.c:
- * Copyright (C) 2009 Roberto De Ioris <roberto@unbit.it>
- * Copyright (C) 2009 Jaya Kumar <jayakumar.lkml@gmail.com>
- * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
- */
-
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_edid.h>
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_probe_helper.h>
-
-#include "udl_connector.h"
-#include "udl_drv.h"
-
-static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
-{
-	struct udl_device *udl = data;
-	struct drm_device *dev = &udl->drm;
-	struct usb_device *udev = udl_to_usb_device(udl);
-	u8 *read_buff;
-	int ret;
-	size_t i;
-
-	read_buff = kmalloc(2, GFP_KERNEL);
-	if (!read_buff)
-		return -ENOMEM;
-
-	for (i = 0; i < len; i++) {
-		int bval = (i + block * EDID_LENGTH) << 8;
-
-		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
-				      0x02, (0x80 | (0x02 << 5)), bval,
-				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
-		if (ret < 0) {
-			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
-			goto err_kfree;
-		} else if (ret < 1) {
-			ret = -EIO;
-			drm_err(dev, "Read EDID byte %zu failed\n", i);
-			goto err_kfree;
-		}
-
-		buf[i] = read_buff[1];
-	}
-
-	kfree(read_buff);
-
-	return 0;
-
-err_kfree:
-	kfree(read_buff);
-	return ret;
-}
-
-static int udl_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct udl_connector *udl_connector = to_udl_connector(connector);
-
-	drm_connector_update_edid_property(connector, udl_connector->edid);
-	if (udl_connector->edid)
-		return drm_add_edid_modes(connector, udl_connector->edid);
-
-	return 0;
-}
-
-static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct udl_device *udl = to_udl(connector->dev);
-	struct udl_connector *udl_connector = to_udl_connector(connector);
-
-	/* cleanup previous EDID */
-	kfree(udl_connector->edid);
-
-	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
-	if (!udl_connector->edid)
-		return connector_status_disconnected;
-
-	return connector_status_connected;
-}
-
-static void udl_connector_destroy(struct drm_connector *connector)
-{
-	struct udl_connector *udl_connector = to_udl_connector(connector);
-
-	drm_connector_cleanup(connector);
-	kfree(udl_connector->edid);
-	kfree(udl_connector);
-}
-
-static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
-	.get_modes = udl_connector_helper_get_modes,
-};
-
-static const struct drm_connector_funcs udl_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = udl_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = udl_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-struct drm_connector *udl_connector_init(struct drm_device *dev)
-{
-	struct udl_connector *udl_connector;
-	struct drm_connector *connector;
-	int ret;
-
-	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
-	if (!udl_connector)
-		return ERR_PTR(-ENOMEM);
-
-	connector = &udl_connector->connector;
-	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
-	if (ret)
-		goto err_kfree;
-
-	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
-
-	connector->polled = DRM_CONNECTOR_POLL_HPD |
-			    DRM_CONNECTOR_POLL_CONNECT |
-			    DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return connector;
-
-err_kfree:
-	kfree(udl_connector);
-	return ERR_PTR(ret);
-}
diff --git a/drivers/gpu/drm/udl/udl_connector.h b/drivers/gpu/drm/udl/udl_connector.h
deleted file mode 100644
index 74ad68fd3cc9..000000000000
--- a/drivers/gpu/drm/udl/udl_connector.h
+++ /dev/null
@@ -1,21 +0,0 @@
-#ifndef __UDL_CONNECTOR_H__
-#define __UDL_CONNECTOR_H__
-
-#include <linux/container_of.h>
-
-#include <drm/drm_connector.h>
-
-struct edid;
-
-struct udl_connector {
-	struct drm_connector connector;
-	/* last udl_detect edid */
-	struct edid *edid;
-};
-
-static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct udl_connector, connector);
-}
-
-#endif //__UDL_CONNECTOR_H__
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index b4cc7cc568c7..d7a3d495f2e7 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -46,6 +46,17 @@ struct urb_list {
 	size_t size;
 };
 
+struct udl_connector {
+	struct drm_connector connector;
+	/* last udl_detect edid */
+	struct edid *edid;
+};
+
+static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct udl_connector, connector);
+}
+
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index c7adc29a53a1..93e7554e83fa 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -11,11 +11,13 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "udl_drv.h"
@@ -403,6 +405,126 @@ static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs
 	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
+/*
+ * Connector
+ */
+
+static int udl_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct udl_connector *udl_connector = to_udl_connector(connector);
+
+	drm_connector_update_edid_property(connector, udl_connector->edid);
+	if (udl_connector->edid)
+		return drm_add_edid_modes(connector, udl_connector->edid);
+
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
+	.get_modes = udl_connector_helper_get_modes,
+};
+
+static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct udl_device *udl = data;
+	struct drm_device *dev = &udl->drm;
+	struct usb_device *udev = udl_to_usb_device(udl);
+	u8 *read_buff;
+	int ret;
+	size_t i;
+
+	read_buff = kmalloc(2, GFP_KERNEL);
+	if (!read_buff)
+		return -ENOMEM;
+
+	for (i = 0; i < len; i++) {
+		int bval = (i + block * EDID_LENGTH) << 8;
+
+		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+				      0x02, (0x80 | (0x02 << 5)), bval,
+				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
+		if (ret < 0) {
+			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
+			goto err_kfree;
+		} else if (ret < 1) {
+			ret = -EIO;
+			drm_err(dev, "Read EDID byte %zu failed\n", i);
+			goto err_kfree;
+		}
+
+		buf[i] = read_buff[1];
+	}
+
+	kfree(read_buff);
+
+	return 0;
+
+err_kfree:
+	kfree(read_buff);
+	return ret;
+}
+
+static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct udl_device *udl = to_udl(connector->dev);
+	struct udl_connector *udl_connector = to_udl_connector(connector);
+
+	/* cleanup previous EDID */
+	kfree(udl_connector->edid);
+
+	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
+	if (!udl_connector->edid)
+		return connector_status_disconnected;
+
+	return connector_status_connected;
+}
+
+static void udl_connector_destroy(struct drm_connector *connector)
+{
+	struct udl_connector *udl_connector = to_udl_connector(connector);
+
+	drm_connector_cleanup(connector);
+	kfree(udl_connector->edid);
+	kfree(udl_connector);
+}
+
+static const struct drm_connector_funcs udl_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = udl_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = udl_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+struct drm_connector *udl_connector_init(struct drm_device *dev)
+{
+	struct udl_connector *udl_connector;
+	struct drm_connector *connector;
+	int ret;
+
+	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
+	if (!udl_connector)
+		return ERR_PTR(-ENOMEM);
+
+	connector = &udl_connector->connector;
+	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
+	if (ret)
+		goto err_kfree;
+
+	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD |
+			    DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return connector;
+
+err_kfree:
+	kfree(udl_connector);
+	return ERR_PTR(ret);
+}
+
 /*
  * Modesetting
  */
-- 
2.37.3

