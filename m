Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC907D2BB3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C6710E159;
	Mon, 23 Oct 2023 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732AF10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698047226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp0oGK3lMNWuN3geomtCKP1LRI8ilfYyc8y7jbzL1zY=;
 b=Kfu3TE/ug3OCf1XwYtkaJMkyQy3rRxbtfSFP3XQ3s7zHwPwrqlpeIHjzhF81N/nZ0SqhUB
 X96V4gP3ydkuBuGhNKJMIbs3+GPW1kS9JWwpDgsu21EsirmjGVY5x1fBRAawjjVuA3yQV9
 qVO6oL7CcaIuAKRHFNdwO/Xw2Gv9CwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-MG867VYgP8uVpqpvvUM4LA-1; Mon, 23 Oct 2023 03:47:03 -0400
X-MC-Unique: MG867VYgP8uVpqpvvUM4LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9642B88B770;
 Mon, 23 Oct 2023 07:47:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EAC6503B;
 Mon, 23 Oct 2023 07:46:56 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/9] drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
Date: Mon, 23 Oct 2023 09:46:12 +0200
Message-ID: <20231023074613.41327-9-aesteve@redhat.com>
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 banackm@vmware.com, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, mombasawalam@vmware.com, iforbes@vmware.com,
 Jonathan Corbet <corbet@lwn.net>, javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
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
index f03ffbacfe9b4..e535b58521533 100644
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
index 794c1d857677d..fc0c267f3f3ed 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -842,6 +842,31 @@ struct drm_get_cap {
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
2.41.0

