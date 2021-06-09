Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890713A102F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 12:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCDC6E0C2;
	Wed,  9 Jun 2021 10:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2A6E0C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 10:39:30 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4G0Nrw41Rqz4xHJ8;
 Wed,  9 Jun 2021 10:39:28 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="eaBTVDmh"
Date: Wed, 09 Jun 2021 10:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623235164;
 bh=h0rozdH40IzsogPIhwMBG0dTerXtw+4mOOIyo/7gKbs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=eaBTVDmhlubb8Tu5vnQ1cANI3GKE0cRN1lgPDu4+zG6ZYQ8AJXCKc8dSjAQg620t4
 rvFkIqLf7a21QovVU/V418kQ8Ezi9AiH/GOjqBj+/6sfQRzRv7bl1ZQlMzThp2DEzK
 limxsx+/oHLCsrAbE7uheBluHG+P0/VY6JvfhZeG7DEvWaFlSzXsFSA9Dxd1zPEmzI
 rx9vtp2PjIKzVk9n0b9yPoUsKx1zAHpq3lNzVsy3wpr2cv1qb/0TO5suvFvniwvCWv
 LSxJnIU+nxXIAC94LPrCZuQuvp3Hq9B1gpm3O0E2H6bpJgKVhJO2q6zkIFb8cyhzHM
 dDLZJImPq+jkA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/4] drm/sysfs: introduce drm_sysfs_connector_hotplug_event
Message-ID: <mpYHCnsBfIaxJEM7yrUVKKcVHXnFDEUtoK5NbmwA@cp4-web-034.plabs.ch>
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
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function sends a hotplug uevent with a CONNECTOR property.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
 include/drm/drm_sysfs.h     |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 968a9560b4aa..6b52a53c0c3e 100644
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
+=09snprintf(conn_id, ARRAY_SIZE(conn_id),
+=09=09 "CONNECTOR=3D%u", connector->base.id);
+
+=09drm_dbg(connector->dev,
+=09=09"generating hotplug event for [CONNECTOR:%d:%s]\n",
+=09=09connector->base.id, connector->name);
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


