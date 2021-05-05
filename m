Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E148E373F9D
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D06EC0C;
	Wed,  5 May 2021 16:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6666EBC4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVxFrjTncAEC3B32m2RynpQKY9rbI1mhU2SrCxkxu8Y=;
 b=Puv9Ff0yu3VI6IQRF/IBLNRN88ECHI5E9ItBVQh0qH2fZFCB7x7XZwvED77Bi/utNXp/xQ
 0Okptm0xZvpQn18olac4zocpkv28fCLjGwrMk/ECC1Kw9/0gmMqy7SdUpawKlIV14U5dPr
 jv+SWxLuSO2mgq9ekeWsL7G6IqQ7u6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-ekF-0nBLOqui12RsgyWf3A-1; Wed, 05 May 2021 12:24:43 -0400
X-MC-Unique: ekF-0nBLOqui12RsgyWf3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3617803627;
 Wed,  5 May 2021 16:24:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C2A5C1C5;
 Wed,  5 May 2021 16:24:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 5/8] drm/i915: Associate ACPI connector nodes with connector
 entries (v2)
Date: Wed,  5 May 2021 18:24:12 +0200
Message-Id: <20210505162415.531876-6-hdegoede@redhat.com>
In-Reply-To: <20210505162415.531876-1-hdegoede@redhat.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
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

Changes in v2 (Hans de goede):
- Take a reference on the fwnode which we assign to the connector,
  for ACPI nodes this is a no-op but in the future we may see
  software-fwnodes assigned to connectors which are ref-counted.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 46 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 833d0c1be4f1..37077b19cf58 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -263,3 +263,49 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 }
+
+/* NOTE: The connector order must be final before this is called. */
+void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_device *drm_dev = &i915->drm;
+	struct fwnode_handle *fwnode = NULL;
+	struct drm_connector *connector;
+	struct acpi_device *adev;
+
+	drm_connector_list_iter_begin(drm_dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		/* Always getting the next, even when the last was not used. */
+		fwnode = device_get_next_child_node(drm_dev->dev, fwnode);
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
+			adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
+						      0x1f, 0);
+			if (adev) {
+				connector->fwnode =
+					fwnode_handle_get(acpi_fwnode_handle(adev));
+				break;
+			}
+			fallthrough;
+		default:
+			connector->fwnode = fwnode_handle_get(fwnode);
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	/*
+	 * device_get_next_child_node() takes a reference on the fwnode, if
+	 * we stopped iterating because we are out of connectors we need to
+	 * put this, otherwise fwnode is NULL and the put is a no-op.
+	 */
+	fwnode_handle_put(fwnode);
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
index f8320ab7592e..5294eb25c623 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11912,6 +11912,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 
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
