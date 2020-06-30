Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F32210490
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50F56E5D2;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jun 2020 12:08:06 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBC989B9A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 12:08:06 +0000 (UTC)
Received: from localhost (unknown [192.168.167.8])
 by lucky1.263xmail.com (Postfix) with ESMTP id 63168C5B40;
 Tue, 30 Jun 2020 20:01:48 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P21206T140696184932096S1593518501601014_; 
 Tue, 30 Jun 2020 20:01:48 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <cad8187021383091f0d1bb1c89de1551>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: daniel@ffwll.ch
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Andy Yan <andy.yan@rock-chips.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/connector: Add of_drm_find_connector
Date: Tue, 30 Jun 2020 20:01:40 +0800
Message-Id: <20200630120140.30733-1-andy.yan@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Andy Yan <andy.yan@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a function to look up a connector by
device tree node, like what of_drm_find_bridge/panel
does.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/drm_connector.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d877ddc6dc57..516376cd1868 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -743,6 +743,39 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter)
 }
 EXPORT_SYMBOL(drm_connector_list_iter_end);
 
+#ifdef CONFIG_OF
+/**
+ * of_drm_find_connector - look up a connector using a device tree node
+ * @np: device tree node of the connector
+ *
+ *
+ * Return: A pointer to the connector which match the specified device tree
+ * node or NULL if no panel matching the device tree node can be found, or
+ * -ENODEV: the device is not available (status != "okay" or "ok")
+ */
+struct drm_connector *of_drm_find_connector(struct drm_device *dev, const struct device_node *np)
+{
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->of_node == np) {
+			drm_connector_list_iter_end(&conn_iter);
+			return connector;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return NULL;
+}
+EXPORT_SYMBOL(of_drm_find_connector);
+#endif
+
+
 static const struct drm_prop_enum_list drm_subpixel_enum_list[] = {
 	{ SubPixelUnknown, "Unknown" },
 	{ SubPixelHorizontalRGB, "Horizontal RGB" },
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fd543d1db9b2..63932bfae84a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1129,6 +1129,9 @@ struct drm_connector {
 	/** @attr: sysfs attributes */
 	struct device_attribute *attr;
 
+	/** @of_node: device tree node */
+	struct device_node *of_node;
+
 	/**
 	 * @head:
 	 *
-- 
2.17.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
