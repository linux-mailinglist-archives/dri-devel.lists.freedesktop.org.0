Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670772A4275
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332D6E0A2;
	Tue,  3 Nov 2020 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7415E6E86D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:37:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C621AACD8;
 Tue,  3 Nov 2020 10:36:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 1/3] drm: Add USB helpers
Date: Tue,  3 Nov 2020 11:36:54 +0100
Message-Id: <20201103103656.17768-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103103656.17768-1-tzimmermann@suse.de>
References: <20201103103656.17768-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM drivers for USB devices can share a few helpers. It's currently only
a function to retrieve the USB device's structure from the DRM device.

Putting this code next to the DRM device would make all of DRM depend on
USB headers. So it's in a separate header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-internals.rst |  5 +++++
 include/drm/drm_usb_helper.h        | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 include/drm/drm_usb_helper.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 12272b168580..642679407f36 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -197,6 +197,11 @@ Utilities
 .. kernel-doc:: include/drm/drm_util.h
    :internal:
 
+USB helpers
+-----------
+
+.. kernel-doc:: include/drm/drm_usb_helper.h
+   :internal:
 
 Legacy Support Code
 ===================
diff --git a/include/drm/drm_usb_helper.h b/include/drm/drm_usb_helper.h
new file mode 100644
index 000000000000..6e8feff890ac
--- /dev/null
+++ b/include/drm/drm_usb_helper.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+#ifndef DRM_USB_HELPER_H
+#define DRM_USB_HELPER_H
+
+#include <linux/usb.h>
+
+#include <drm/drm_device.h>
+
+/**
+ * drm_dev_get_usb_device - Returns a DRM device's USB device
+ * @dev:	The DRM device
+ *
+ * For USB-based DRM devices, returns the corresponding USB device. The
+ * DRM device must store the USB interface's device in its dev field.
+ *
+ * RETURNS:
+ * The USB device
+ */
+static inline struct usb_device *drm_dev_get_usb_device(struct drm_device *dev)
+{
+	return interface_to_usbdev(to_usb_interface(dev->dev));
+}
+
+#endif
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
