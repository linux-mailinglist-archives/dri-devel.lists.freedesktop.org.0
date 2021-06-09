Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C43A1032
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 12:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4916E542;
	Wed,  9 Jun 2021 10:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2086E0C2;
 Wed,  9 Jun 2021 10:39:30 +0000 (UTC)
Date: Wed, 09 Jun 2021 10:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623235168;
 bh=hedE0JjbpZoNUwShmgNyyeuPFv8kbVONKT78BK3g7PU=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=EDzwYhDomx5qTPQJkMt//ArpOJQrxy+5RJBoRXzkBPXBNJfZRkogsz+eup7BB+HLm
 0N8P6jpPMFGTS8F822gNAbiYOmUJCRjRSaVvINPH/w/YPUy31DgvYrzpoSOF0rLnO7
 5rIPcds29gu7OPsTJYcyC8bYHi4KuPFIooZrBd4cA9Roqv8IEujFK/cfE7FbE0QLR8
 RLxuS1kI7SSfsAnmjQ8oxk0eUxKStrx+Q8TOujbzVlIt+gNebyZLhDT0gTZKRA54vh
 hLwZ/INUBYts5YVH5XdU12WQ0QGV1xnG/7lclHkuSvKNHfisF9jpDbQl9B397cEdzb
 5TKCFPgzM5kJA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/4] drm/probe-helper: add
 drm_kms_helper_connector_hotplug_event
Message-ID: <XCqV2rWILN8kzAmXWxJoFie29MNLKiENn7TGa0MG1w@cp3-web-016.plabs.ch>
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

This function is the same as drm_kms_helper_hotplug_event, but takes
a connector instead of a device.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_probe_helper.c | 20 ++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe=
_helper.c
index e7e1ee2aa352..510807a4a492 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -616,6 +616,26 @@ void drm_kms_helper_hotplug_event(struct drm_device *d=
ev)
 }
 EXPORT_SYMBOL(drm_kms_helper_hotplug_event);
=20
+/**
+ * drm_kms_helper_connector_hotplug_event - fire off a KMS connector hotpl=
ug event
+ * @connector: drm_connector which has changed
+ *
+ * This is the same as drm_kms_helper_hotplug_event(), except it fires a m=
ore
+ * fine-grained uevent for a single connector.
+ */
+void drm_kms_helper_connector_hotplug_event(struct drm_connector *connecto=
r)
+{
+=09struct drm_device *dev =3D connector->dev;
+
+=09/* send a uevent + call fbdev */
+=09drm_sysfs_connector_hotplug_event(connector);
+=09if (dev->mode_config.funcs->output_poll_changed)
+=09=09dev->mode_config.funcs->output_poll_changed(dev);
+
+=09drm_client_dev_hotplug(dev);
+}
+EXPORT_SYMBOL(drm_kms_helper_connector_hotplug_event);
+
 static void output_poll_execute(struct work_struct *work)
 {
 =09struct delayed_work *delayed_work =3D to_delayed_work(work);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.=
h
index 8d3ed2834d34..733147ea89be 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -19,6 +19,7 @@ void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
 void drm_kms_helper_hotplug_event(struct drm_device *dev);
+void drm_kms_helper_connector_hotplug_event(struct drm_connector *connecto=
r);
=20
 void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
--=20
2.31.1


