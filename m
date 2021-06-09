Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CAB3A1EE2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD7E6EA8A;
	Wed,  9 Jun 2021 21:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E316EA8A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:23:39 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273816;
 bh=j7yl/H4BsB2mwIG4O6/p7uSwpgKfk2MFhmwLPFq+47s=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=rX1ijadZy8Lww5AY0ExdAaYWP3OQlwJ8dgM2kwx4xRn71DjEA6+a4BJeBjd43W3VK
 qducW8A6a56paBQyyzllWY6rbYXLOzlsEH2OsI/Iak1kMAoy5BUpj9a1dirQTr/JxO
 +L+5CgAFZnMZXnIYQj2OFj44BATx2/bf0vjo1eyOFKDt7eSqIlN1khpte41cFUJROh
 dAsULH3eIQX3ym3QaslsU5MA4HV5c/vwpcbnVJeXRi+tQyAo03/8KaRqMSRF/Xa6x/
 21LSxyPhVls4wCMcLopsAE4gPTF8zcmEEfaU7j8jeU1pyaQtgMu0bnyED286DWsH0L
 WIWed0BYiGULg==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 1/7] drm/sysfs: introduce drm_sysfs_connector_hotplug_event
Message-ID: <I7ivMNimkOH0GJ5SVonqiNBfYEunXBeQpK7ehs64Bk@cp4-web-028.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, alexander.deucher@amd.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function sends a hotplug uevent with a CONNECTOR property.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
 include/drm/drm_sysfs.h     |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 968a9560b4aa..8423e44c3035 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -343,6 +343,31 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_sysfs_hotplug_event);
=20
+/**
+ * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any conne=
ctor
+ * change
+ * @connector: connector which has changed
+ *
+ * Send a uevent for the DRM connector specified by @connector. This will =
send
+ * a uevent with the properties HOTPLUG=3D1 and CONNECTOR.
+ */
+void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
+{
+=09struct drm_device *dev =3D connector->dev;
+=09char hotplug_str[] =3D "HOTPLUG=3D1", conn_id[21];
+=09char *envp[] =3D { hotplug_str, conn_id, NULL };
+
+=09snprintf(conn_id, sizeof(conn_id),
+=09=09 "CONNECTOR=3D%u", connector->base.id);
+
+=09drm_dbg_kms(connector->dev,
+=09=09    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
+=09=09    connector->base.id, connector->name);
+
+=09kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);
+
 /**
  * drm_sysfs_connector_status_event - generate a DRM uevent for connector
  * property status change
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index d454ef617b2c..6273cac44e47 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -11,6 +11,7 @@ int drm_class_device_register(struct device *dev);
 void drm_class_device_unregister(struct device *dev);
=20
 void drm_sysfs_hotplug_event(struct drm_device *dev);
+void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_status_event(struct drm_connector *connector,
 =09=09=09=09      struct drm_property *property);
 #endif
--=20
2.31.1


