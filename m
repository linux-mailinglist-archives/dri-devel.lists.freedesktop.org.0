Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94640737315
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6A10E309;
	Tue, 20 Jun 2023 17:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7DC10E309
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 17:42:50 +0000 (UTC)
Date: Tue, 20 Jun 2023 17:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687282966; x=1687542166;
 bh=f1Kc8oqWlPFor8YqOGNYwDBEV0GvUmsSs5+G7uA0uyA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=DlCMyeCCppKRkqMOtOH/BumNyQwWPNVeYg1jdqO9QHdLXA+8PgEbUzI6LDGKIFDMx
 TGEvVzCdf+nvGVvi4OtwPdWQ/Oljn0GFdfPCnlgCP7v+WhMK4vrbfxl4Celka7pd77
 aCTzcykBLgQfjDyWFE6GfoN2EhfesYwoojOdj0xJTZW3g2n1uOshfR8zjom1BpzB3j
 QSJ6bcPuD2ZUfo7bQd0fXWqSarG9vMIkUNDpiOL2qfGjja60FXzz714TqTljFMJFT7
 l970jYGrl2ky8HhRBmJp+ilP885pwNx2Y7m9WUwZJEoHIQH2FQKItNmHQAKUGqCPWF
 h5YQnFlKOOOwA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/sysfs: rename drm_sysfs_connector_status_event()
Message-ID: <20230620174231.260335-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Manasi Navare <navaremanasi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename drm_sysfs_connector_status_event() to
drm_sysfs_connector_property_event(). Indeed, "status" is a bit
vague: it can easily be confused with the connected/disconnected
status of the connector. This function has nothing to do with
connected/disconnected: it merely sends a notification that a
connector's property has changed (e.g. HDCP, privacy screen, etc).

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/display/drm_hdcp_helper.c |  4 ++--
 drivers/gpu/drm/drm_connector.c           |  8 ++++----
 drivers/gpu/drm/drm_sysfs.c               | 23 +++++++++++++----------
 include/drm/drm_sysfs.h                   |  4 ++--
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/di=
splay/drm_hdcp_helper.c
index e78999c72bd7..a3f0e6d96105 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -415,7 +415,7 @@ void drm_hdcp_update_content_protection(struct drm_conn=
ector *connector,
 =09=09return;
=20
 =09state->content_protection =3D val;
-=09drm_sysfs_connector_status_event(connector,
-=09=09=09=09 dev->mode_config.content_protection_property);
+=09drm_sysfs_connector_property_event(connector,
+=09=09=09=09=09   dev->mode_config.content_protection_property);
 }
 EXPORT_SYMBOL(drm_hdcp_update_content_protection);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 3ed4cfcb350c..bf8371dc2a61 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2730,10 +2730,10 @@ static int drm_connector_privacy_screen_notifier(
 =09drm_connector_update_privacy_screen_properties(connector, true);
 =09drm_modeset_unlock(&dev->mode_config.connection_mutex);
=20
-=09drm_sysfs_connector_status_event(connector,
-=09=09=09=09connector->privacy_screen_sw_state_property);
-=09drm_sysfs_connector_status_event(connector,
-=09=09=09=09connector->privacy_screen_hw_state_property);
+=09drm_sysfs_connector_property_event(connector,
+=09=09=09=09=09   connector->privacy_screen_sw_state_property);
+=09drm_sysfs_connector_property_event(connector,
+=09=09=09=09=09   connector->privacy_screen_hw_state_property);
=20
 =09return NOTIFY_DONE;
 }
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f62767ff34b2..b169b3e44a92 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -487,17 +487,17 @@ void drm_sysfs_connector_hotplug_event(struct drm_con=
nector *connector)
 EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);
=20
 /**
- * drm_sysfs_connector_status_event - generate a DRM uevent for connector
- * property status change
- * @connector: connector on which property status changed
- * @property: connector property whose status changed.
+ * drm_sysfs_connector_property_event - generate a DRM uevent for connecto=
r
+ * property change
+ * @connector: connector on which property changed
+ * @property: connector property which has changed.
  *
- * Send a uevent for the DRM device specified by @dev.  Currently we
+ * Send a uevent for the specified DRM connector and property.  Currently =
we
  * set HOTPLUG=3D1 and connector id along with the attached property id
- * related to the status change.
+ * related to the change.
  */
-void drm_sysfs_connector_status_event(struct drm_connector *connector,
-=09=09=09=09      struct drm_property *property)
+void drm_sysfs_connector_property_event(struct drm_connector *connector,
+=09=09=09=09=09struct drm_property *property)
 {
 =09struct drm_device *dev =3D connector->dev;
 =09char hotplug_str[] =3D "HOTPLUG=3D1", conn_id[21], prop_id[21];
@@ -511,11 +511,14 @@ void drm_sysfs_connector_status_event(struct drm_conn=
ector *connector,
 =09snprintf(prop_id, ARRAY_SIZE(prop_id),
 =09=09 "PROPERTY=3D%u", property->base.id);
=20
-=09DRM_DEBUG("generating connector status event\n");
+=09drm_dbg_kms(connector->dev,
+=09=09    "[CONNECTOR:%d:%s] generating connector property event for [PROP=
:%d:%s]\n",
+=09=09    connector->base.id, connector->name,
+=09=09    property->base.id, property->name);
=20
 =09kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
-EXPORT_SYMBOL(drm_sysfs_connector_status_event);
+EXPORT_SYMBOL(drm_sysfs_connector_property_event);
=20
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 6273cac44e47..96a5d858404b 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -12,6 +12,6 @@ void drm_class_device_unregister(struct device *dev);
=20
 void drm_sysfs_hotplug_event(struct drm_device *dev);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
-void drm_sysfs_connector_status_event(struct drm_connector *connector,
-=09=09=09=09      struct drm_property *property);
+void drm_sysfs_connector_property_event(struct drm_connector *connector,
+=09=09=09=09=09struct drm_property *property);
 #endif
--=20
2.41.0


