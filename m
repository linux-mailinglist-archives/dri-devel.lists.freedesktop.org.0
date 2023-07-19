Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C441D758AFC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD94F10E0BF;
	Wed, 19 Jul 2023 01:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5564110E3F1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:42:39 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id DCE333262B1;
 Wed, 19 Jul 2023 02:42:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730958; bh=ngSSVQ1ZWLzFyV/HcJIzA7zbUtNdg52kfW7YnCCdgCQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TDWzSzcBd3zRpSP1UnL3YQYiB/gm6ruiowMtUScn/1l95cJSah2U4Ost8gcsmWL8u
 0Nix/ul5b1fX7h3AR4fXPFe/YNI4Hp7R4bQYKuIKHvmFGLVOziFkD5Inmzdkn7GK4D
 i/tP9+5RfbOsMq1+mczBk1hBUbsKVVOxH+H3nN3WaHDesJU1i6sRw1Mt2N2prJdW5y
 Cddo+Ne1OCBExYUyvc+Dd7MuCRadwJZ4MYC6zChCAULqzBw0/4ilQOKg6qyg5jyMzq
 lWfHMYMDk0ZSgz2AuEiKLN6wk9gXWO7/I/I1dZMkWwm6bpxndychL9oQ7EmaufNp77
 VFHBeJJd300Yw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 8/9] drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
Date: Tue, 18 Jul 2023 21:42:17 -0400
Message-Id: <20230719014218.1700057-9-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Virtualized drivers place additional restrictions on the cursor plane
which breaks the contract of universal planes. To allow atomic
modesettings with virtualized drivers the clients need to advertise
that they're capable of dealing with those extra restrictions.

To do that introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT which
lets DRM know that the client is aware of and capable of dealing with
the extra restrictions on the virtual cursor plane.

Setting this option to true makes DRM expose the cursor plane on
virtualized drivers. The userspace is expected to set the hotspots
and handle mouse events on that plane.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_ioctl.c |  9 +++++++++
 include/uapi/drm/drm.h      | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8e9afe7af19c..06c6497fb4d0 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -361,6 +361,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT:
+		if (!drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT))
+			return -EOPNOTSUPP;
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->supports_virtualized_cursor_plane = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index a87bbbbca2d4..a8069294fe81 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -836,6 +836,31 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
+ *
+ * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio and
+ * virtualbox) have additional restrictions for cursor planes (thus
+ * making cursor planes on those drivers not truly universal,) e.g.
+ * they need cursor planes to act like one would expect from a mouse
+ * cursor and have correctly set hotspot properties.
+ * If this client cap is not set the DRM core will hide cursor plane on
+ * those virtualized drivers because not setting it implies that the
+ * client is not capable of dealing with those extra restictions.
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * Setting this property on drivers which do not special case
+ * cursor planes (i.e. non-virtualized drivers) will return
+ * EOPNOTSUPP, which can be used by userspace to gauge
+ * requirements of the hardware/drivers they're running on.
+ *
+ * This capability is always supported for atomic-capable virtualized
+ * drivers starting from kernel version 6.6.
+ */
+#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.39.2

