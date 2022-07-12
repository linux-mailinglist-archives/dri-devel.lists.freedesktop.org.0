Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85575710E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F5C10F7B8;
	Tue, 12 Jul 2022 03:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA610F573
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 03:33:11 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 543A8320CCB;
 Tue, 12 Jul 2022 04:33:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1657596790; bh=iNDEmj1DPV5QldHUZyexY/cuHeXQygPY2iYptZKUoIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aNakbyktE6GEZZbi2lPhSL6tFVppwiXve1Ggm6jsMdIcvxCZqK9Vi29QiEz2XsaGs
 zINs9IgQ875IeiPGUJCtJBV+PDcTelWlchdujLVC3/U8mSh+XzBsBPFXJVlR4dM8Am
 XLXEJKWgl054rft/mlTrYb9YHVQW/jn2OgRWoElNoVaE5yLaLa99Qmkbq9JzJ+D5VQ
 I/4/qCBKv7tuY0Y7x11wj0qd3pHDL2HV1ejyzyETENdnMLqiGBDaJ/U/VXiXgc7+dL
 VoaYLSu10TWt9W3sjcQINNNA9KOGk2Ypl984o4GK8x9wLc5/zysr1NDAI4WNuf7b94
 UbfP+l/+FEOyA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm: Introduce
 DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
Date: Mon, 11 Jul 2022 23:32:46 -0400
Message-Id: <20220712033246.1148476-9-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com, ppaalanen@gmail.com,
 mombasawalam@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Virtualized drivers place additional restrictions on the cursor plane
which breaks the contract of universal planes. To allow atomic
modesettings with virtualized drivers the clients need to advertise
that they're capable of dealing with those extra restrictions.

To do that introduce DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE which
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
---
 drivers/gpu/drm/drm_ioctl.c |  9 +++++++++
 include/uapi/drm/drm.h      | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8faad23dc1d8..f10590b061d7 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -362,6 +362,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE:
+		if (!drm_core_check_feature(dev, DRIVER_VIRTUAL))
+			return -EOPNOTSUPP;
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->supports_virtual_cursor_plane = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..f24a1941abca 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -836,6 +836,23 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
+ *
+ * If set to 1, the DRM core will expose cursor plane to be used for
+ * virtualized mouse cursor, without virtualized drivers will not expose
+ * the cursor plane in atomic contexts. Cursor planes in virtualized
+ * drivers come with some additional restrictions and are not truly
+ * universal, e.g. they need to act like one would expect from a mouse
+ * cursor and have correctly set hotspot properties.
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is always supported for atomic-capable virtualized drivers
+ * starting from kernel version 5.21.
+ */
+#define DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE	6
+
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.34.1

