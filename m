Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323F42F843
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D5D6ED99;
	Fri, 15 Oct 2021 16:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993046EDCA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:47 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315624;
 bh=G+FOKvcpvh9Ah07Dv52OX46vIKQvPQHN/sG+RPUHAl8=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=Oz1WF1H1CVYZLziWXSRWNmyaVdpwDB+1Y6RRSMIuA7JPc+cAoVeT4QoNcW0FwAda+
 oKtnSH2M3/kQVNLlvA0T/t+ksn3zHyt/T9yWPbqHBbZO8V+UfEzgPCvZU1UqtecCnh
 6d0LejST6d8aWm5LVNhUpaE3YQhyw7vvzg6fC97BQ9j5V57Oy4psdwN8k+6SU/rpZ7
 wa6coN5JmKG28/MdxNPBN67fmerJzmDlLDre0KUfE99V7Bc2ewP0mMnbzuA9jvSKnY
 aIsUlipAE6DeEUgAi/vYGZjGpa/o8r2t6TYMBCQtoVinxgBrsKNWOve5WI00dyG3FE
 YLggOb4OF+vyA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 1/6] drm/sysfs: introduce drm_sysfs_connector_hotplug_event
Message-ID: <20211015163336.95188-2-contact@emersion.fr>
In-Reply-To: <20211015163336.95188-1-contact@emersion.fr>
References: <20211015163336.95188-1-contact@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function sends a hotplug uevent with a CONNECTOR property.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
 include/drm/drm_sysfs.h     |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 76ff6ec3421b..430e00b16eec 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -409,6 +409,31 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
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
2.33.1


