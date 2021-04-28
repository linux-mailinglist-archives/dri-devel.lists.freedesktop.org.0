Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ECC36E149
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA636EC5F;
	Wed, 28 Apr 2021 21:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4F6EC65
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619646810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTsoK873a2Dm6X7mRRJSkYwSwPhXxig3g40NQFx14bo=;
 b=dXYNQet+YXKoKom3dbIZdvWQvfgUZ+9hCsl6qVkCUkMkcKTu8d64eEkjn2mov+R/ePVTr8
 1ESPbqMxya6TAUDXBzHZ38bGJ4IwEh6BB1Nl/D6ibrSbGysztFeLbYdhpW+1aelfdXPZS2
 ElEiTLgwT2DoxRWJmh49y2clg4XnYt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-KaZkwLzzNWyOyRv5LzZI1w-1; Wed, 28 Apr 2021 17:53:28 -0400
X-MC-Unique: KaZkwLzzNWyOyRv5LzZI1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8310518BA289;
 Wed, 28 Apr 2021 21:53:26 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B235C1BB;
 Wed, 28 Apr 2021 21:53:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with connector
 entries
Date: Wed, 28 Apr 2021 23:52:53 +0200
Message-Id: <20210428215257.500088-6-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Intel platforms we know that the ACPI connector device
node order will follow the order the driver (i915) decides.
The decision is made using the custom Intel ACPI OpRegion
(intel_opregion.c), though the driver does not actually know
that the values it sends to ACPI there are used for
associating a device node for the connectors, and assigning
address for them.

In reality that custom Intel ACPI OpRegion actually violates
ACPI specification (we supply dynamic information to objects
that are defined static, for example _ADR), however, it
makes assigning correct connector node for a connector entry
straightforward (it's one-on-one mapping).

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
[hdegoede@redhat.com: Move intel_acpi_assign_connector_fwnodes() to
 intel_acpi.c]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 40 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 833d0c1be4f1..9f266dfda7dd 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -263,3 +263,43 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 }
+
+/* NOTE: The connector order must be final before this is called. */
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_device *drm_dev = &i915->drm;
+	struct device *kdev = &drm_dev->pdev->dev;
+	struct fwnode_handle *fwnode = NULL;
+	struct drm_connector *connector;
+	struct acpi_device *adev;
+
+	drm_connector_list_iter_begin(drm_dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		/* Always getting the next, even when the last was not used. */
+		fwnode = device_get_next_child_node(kdev, fwnode);
+		if (!fwnode)
+			break;
+
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_eDP:
+		case DRM_MODE_CONNECTOR_DSI:
+			/*
+			 * Integrated displays have a specific address 0x1f on
+			 * most Intel platforms, but not on all of them.
+			 */
+			adev = acpi_find_child_device(ACPI_COMPANION(kdev),
+						      0x1f, 0);
+			if (adev) {
+				connector->fwnode = acpi_fwnode_handle(adev);
+				break;
+			}
+			fallthrough;
+		default:
+			connector->fwnode = fwnode;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
index e8b068661d22..d2435691f4b5 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.h
+++ b/drivers/gpu/drm/i915/display/intel_acpi.h
@@ -12,11 +12,14 @@ struct drm_i915_private;
 void intel_register_dsm_handler(void);
 void intel_unregister_dsm_handler(void);
 void intel_acpi_device_id_update(struct drm_i915_private *i915);
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
 #else
 static inline void intel_register_dsm_handler(void) { return; }
 static inline void intel_unregister_dsm_handler(void) { return; }
 static inline
 void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
+static inline
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
 #endif /* CONFIG_ACPI */
 
 #endif /* __INTEL_ACPI_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 828ef4c5625f..87cad549632c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14970,6 +14970,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 
 	drm_modeset_lock_all(dev);
 	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
+	intel_acpi_assign_connector_fwnodes(i915);
 	drm_modeset_unlock_all(dev);
 
 	for_each_intel_crtc(dev, crtc) {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
