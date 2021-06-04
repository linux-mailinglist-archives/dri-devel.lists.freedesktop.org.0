Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306039C0BA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48F6F8D5;
	Fri,  4 Jun 2021 19:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D861A6F8DB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622836143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juMatxoZ5WJNsERIZBWsd2D6FjcNfB9F4FH1g1FxQVo=;
 b=fCQFHaUbWYEYi5sEXdvR+k/BCP9JbWBRANRZMAebmf8Rfd2zbPKQJnmMyy9fLmUXQl2/rS
 4bqMUVPu5UD5gFVsNKByE76UuTVEExEf/myTXs2DUXH2h8h15s34gC1E0AbraUbLZP7fp9
 uumD7UOJsN4RJR8ANy51y9kC/FG4mLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-tCMTjzQoOFaAlECh5sX-gA-1; Fri, 04 Jun 2021 15:49:02 -0400
X-MC-Unique: tCMTjzQoOFaAlECh5sX-gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21FF10074A8;
 Fri,  4 Jun 2021 19:48:59 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D697620DE;
 Fri,  4 Jun 2021 19:48:57 +0000 (UTC)
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
Subject: [PATCH 4/8] drm/connector: Add support for out-of-band hotplug
 notification (v3)
Date: Fri,  4 Jun 2021 21:48:36 +0200
Message-Id: <20210604194840.14655-5-hdegoede@redhat.com>
In-Reply-To: <20210604194840.14655-1-hdegoede@redhat.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new drm_connector_oob_hotplug_event() function and
oob_hotplug_event drm_connector_funcs member.

On some hardware a hotplug event notification may come from outside the
display driver / device. An example of this is some USB Type-C setups
where the hardware muxes the DisplayPort data and aux-lines but does
not pass the altmode HPD status bit to the GPU's DP HPD pin.

In cases like this the new drm_connector_oob_hotplug_event() function can
be used to report these out-of-band events.

Changes in v2:
- Make drm_connector_oob_hotplug_event() take a fwnode as argument and
  have it call drm_connector_find_by_fwnode() internally. This allows
  making drm_connector_find_by_fwnode() a drm-internal function and
  avoids code outside the drm subsystem potentially holding on the
  a drm_connector reference for a longer period.

Changes in v3:
- Drop the data argument to the drm_connector_oob_hotplug_event
  function since it is not used atm. This can be re-added later when
  a use for it actually arises.

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 14644053a678..88ff7a011002 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2592,6 +2592,33 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 	return found;
 }
 
+/**
+ * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * @connector: connector to report the event on
+ *
+ * On some hardware a hotplug event notification may come from outside the display
+ * driver / device. An example of this is some USB Type-C setups where the hardware
+ * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
+ * status bit to the GPU's DP HPD pin.
+ *
+ * This function can be used to report these out-of-band events after obtaining
+ * a drm_connector reference through calling drm_connector_find_by_fwnode().
+ */
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
+{
+	struct drm_connector *connector;
+
+	connector = drm_connector_find_by_fwnode(connector_fwnode);
+	if (IS_ERR(connector))
+		return;
+
+	if (connector->funcs->oob_hotplug_event)
+		connector->funcs->oob_hotplug_event(connector);
+
+	drm_connector_put(connector);
+}
+EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+
 
 /**
  * DOC: Tile group
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b4b08c7a538e..1d896a8e3fa7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1079,6 +1079,14 @@ struct drm_connector_funcs {
 	 */
 	void (*atomic_print_state)(struct drm_printer *p,
 				   const struct drm_connector_state *state);
+
+	/**
+	 * @oob_hotplug_event:
+	 *
+	 * This will get called when a hotplug-event for a drm-connector
+	 * has been received from a source outside the display driver / device.
+	 */
+	void (*oob_hotplug_event)(struct drm_connector *connector);
 };
 
 /**
@@ -1661,6 +1669,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.31.1

