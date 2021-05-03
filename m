Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007E371861
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FCE6E8DE;
	Mon,  3 May 2021 15:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88976E8DF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620056845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeCeXUium7Wh3hsnPteAwXOlLceBZAZ917D6FzQcyzs=;
 b=KdjE2Ummkf5Pft3ImWbmLU63yhj2D6j8Xu9zBbr5GPByG/S34+rdU7bODVCC2XBrej9BcK
 AnxkQd/Te0lEEPkhHj0W5ZYMKQK4GBPmTz7Nf8cqDSXmauokKHyFBP9Se49tRjWdxHe1et
 Pm4vxWOYXTMV0OFc/xGtxvCTQ6BLDjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-W99B98H3PeGhRKvsRLhGkQ-1; Mon, 03 May 2021 11:47:22 -0400
X-MC-Unique: W99B98H3PeGhRKvsRLhGkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F2AD818411;
 Mon,  3 May 2021 15:47:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD811007610;
 Mon,  3 May 2021 15:47:17 +0000 (UTC)
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
Subject: [PATCH 8/9] usb: typec: altmodes/displayport: Notify drm subsys of
 hotplug events
Date: Mon,  3 May 2021 17:46:46 +0200
Message-Id: <20210503154647.142551-9-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Use the new drm_connector_find_by_fwnode() and
drm_connector_oob_hotplug_event() functions to let drm/kms drivers
know about DisplayPort over Type-C hotplug events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
---
 drivers/usb/typec/altmodes/Kconfig       |  1 +
 drivers/usb/typec/altmodes/displayport.c | 40 +++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 60d375e9c3c7..1a6b5e872b0d 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
 
 config TYPEC_DP_ALTMODE
 	tristate "DisplayPort Alternate Mode driver"
+	depends on DRM
 	help
 	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
 	  displays and adapters to be attached to the USB Type-C
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index aa669b9cf70e..f00dfc5c14b6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -11,8 +11,10 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include <drm/drm_connector.h>
 #include "displayport.h"
 
 #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
@@ -62,12 +64,30 @@ struct dp_altmode {
 	struct work_struct work;
 	struct typec_altmode *alt;
 	const struct typec_altmode *port;
+	struct fwnode_handle *connector_fwnode;
 };
 
+static void dp_altmode_notify_connector(struct dp_altmode *dp)
+{
+	struct drm_connector_oob_hotplug_event_data data = { };
+	u8 pin_assign = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
+
+	data.connected = dp->data.status & DP_STATUS_HPD_STATE;
+	data.orientation = typec_altmode_get_orientation(dp->alt);
+
+	if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
+		data.dp_lanes = 4;
+	else if (pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
+		data.dp_lanes = 2;
+
+	drm_connector_oob_hotplug_event(dp->connector_fwnode, &data);
+}
+
 static int dp_altmode_notify(struct dp_altmode *dp)
 {
 	unsigned long conf;
 	u8 state;
+	int ret;
 
 	if (dp->data.conf) {
 		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
@@ -76,7 +96,12 @@ static int dp_altmode_notify(struct dp_altmode *dp)
 		conf = TYPEC_STATE_USB;
 	}
 
-	return typec_altmode_notify(dp->alt, conf, &dp->data);
+	ret = typec_altmode_notify(dp->alt, conf, &dp->data);
+	if (ret)
+		return ret;
+
+	dp_altmode_notify_connector(dp);
+	return 0;
 }
 
 static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
@@ -512,6 +537,7 @@ static const struct attribute_group dp_altmode_group = {
 int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
+	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
 	int ret;
 
@@ -540,6 +566,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->desc = "DisplayPort";
 	alt->ops = &dp_altmode_ops;
 
+	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
+	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (IS_ERR(dp->connector_fwnode))
+		dp->connector_fwnode = NULL;
+
 	typec_altmode_set_drvdata(alt, dp);
 
 	dp->state = DP_STATE_ENTER;
@@ -555,6 +586,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
 	cancel_work_sync(&dp->work);
+
+	if (dp->connector_fwnode) {
+		dp->data.conf = 0;
+		dp->data.status = 0;
+		dp_altmode_notify_connector(dp);
+		fwnode_handle_put(dp->connector_fwnode);
+	}
 }
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
