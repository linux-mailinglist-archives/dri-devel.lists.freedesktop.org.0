Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E11758AFD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F4010E3EC;
	Wed, 19 Jul 2023 01:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE1F10E3F2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:42:40 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 7248A3262B6;
 Wed, 19 Jul 2023 02:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730959; bh=5pvP7ou4tTt9c7uiOWK9JZ2IMgYt+qy5f2CKcoNIqgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CrIHbI+2A1Dz2XiHviLEX4FmKapZh7S06NIYUDjUyO3nOQ/3Jpn5XsTSF5mPejqLc
 aEaDDbJQRmEJswGhSIah7FMoIp7fxI60qp9sR2DlLD7lCEF26Z1/1KCYImLUJcWZbc
 4pCTLH6n4l1lVN3TRu+yr7P1wrsL7TmW3sxt3wZJZ3GJj2/RgHEJS9TzlRFJIVEVzP
 Z23Ru/me3nYwDFcoaN/ezsnkVU5DjEwy8xMqv8FNwG3F8tnTvQnm2eFDLxf1A0+vbg
 pLySXVw/Wfy0NKZQBavgfiuoR7bKq8uXtiZ1dATygL56BmNSelm5+zcekl5cDEuuXr
 Oo+wqne9iY2iA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Date: Tue, 18 Jul 2023 21:42:18 -0400
Message-Id: <20230719014218.1700057-10-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719014218.1700057-1-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Banack <banackm@vmware.com>

To clarify the intent and reasoning behind the hotspot properties
introduce userspace documentation that goes over cursor handling
in para-virtualized environments.

The documentation is generic enough to not special case for any
specific hypervisor and should apply equally to all.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 Documentation/gpu/drm-kms.rst |  6 ++++
 drivers/gpu/drm/drm_plane.c   | 58 ++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index c92d425cb2dd..7159b3e90a8a 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -577,6 +577,12 @@ Variable Refresh Properties
 .. kernel-doc:: drivers/gpu/drm/drm_connector.c
    :doc: Variable refresh properties
 
+Cursor Hotspot Properties
+---------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_plane.c
+   :doc: hotspot properties
+
 Existing KMS Properties
 -----------------------
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 1dc00ad4c33c..f3f2eae83cca 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -230,6 +230,61 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
+/**
+ * DOC: hotspot properties
+ *
+ * HOTSPOT_X: property to set mouse hotspot x offset.
+ * HOTSPOT_Y: property to set mouse hotspot y offset.
+ *
+ * When the plane is being used as a cursor image to display a mouse pointer,
+ * the "hotspot" is the offset within the cursor image where mouse events
+ * are expected to go.
+ *
+ * Positive values move the hotspot from the top-left corner of the cursor
+ * plane towards the right and bottom.
+ *
+ * Most display drivers do not need this information because the
+ * hotspot is not actually connected to anything visible on screen.
+ * However, this is necessary for display drivers like the para-virtualized
+ * drivers (eg qxl, vbox, virtio, vmwgfx), that are attached to a user console
+ * with a mouse pointer.  Since these consoles are often being remoted over a
+ * network, they would otherwise have to wait to display the pointer movement to
+ * the user until a full network round-trip has occurred.  New mouse events have
+ * to be sent from the user's console, over the network to the virtual input
+ * devices, forwarded to the desktop for processing, and then the cursor plane's
+ * position can be updated and sent back to the user's console over the network.
+ * Instead, with the hotspot information, the console can anticipate the new
+ * location, and draw the mouse cursor there before the confirmation comes in.
+ * To do that correctly, the user's console must be able predict how the
+ * desktop will process mouse events, which normally requires the desktop's
+ * mouse topology information, ie where each CRTC sits in the mouse coordinate
+ * space.  This is typically sent to the para-virtualized drivers using some
+ * driver-specific method, and the driver then forwards it to the console by
+ * way of the virtual display device or hypervisor.
+ *
+ * The assumption is generally made that there is only one cursor plane being
+ * used this way at a time, and that the desktop is feeding all mouse devices
+ * into the same global pointer.  Para-virtualized drivers that require this
+ * should only be exposing a single cursor plane, or find some other way
+ * to coordinate with a userspace desktop that supports multiple pointers.
+ * If the hotspot properties are set, the cursor plane is therefore assumed to be
+ * used only for displaying a mouse cursor image, and the position of the combined
+ * cursor plane + offset can therefore be used for coordinating with input from a
+ * mouse device.
+ *
+ * The cursor will then be drawn either at the location of the plane in the CRTC
+ * console, or as a free-floating cursor plane on the user's console
+ * corresponding to their desktop mouse position.
+ *
+ * DRM clients which would like to work correctly on drivers which expose
+ * hotspot properties should advertise DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.
+ * Setting this property on drivers which do not special case
+ * cursor planes will return EOPNOTSUPP, which can be used by userspace to
+ * gauge requirements of the hardware/drivers they're running on. Advertising
+ * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT implies that the userspace client will be
+ * correctly setting the hotspot properties.
+ */
+
 /**
  * drm_plane_create_hotspot_properties - creates the mouse hotspot
  * properties and attaches them to the given cursor plane
@@ -237,7 +292,8 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
  * @plane: drm cursor plane
  *
  * This function enables the mouse hotspot property on a given
- * cursor plane.
+ * cursor plane. Look at the documentation for hotspot properties
+ * to get a better understanding for what they're used for.
  *
  * RETURNS:
  * Zero for success or -errno
-- 
2.39.2

