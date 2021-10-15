Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B642F846
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF886EDA8;
	Fri, 15 Oct 2021 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EB26E514
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:49 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315627;
 bh=qw7tVZ9fPz5TV4PBSVZRHvRtrIFKMES7KV0U7AIbfjM=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=AxvKb0xq0FUmgBAs0bTftwx2vRVny1wXn6T5Re0oLh8AgmGZHE6saqjH0lr+KBnDp
 HRNneBT65VsImC0tW+c+5n83jvRWUmiK+pfFLLktkC1qrMd6kdWibzg5RDfyx+seOW
 2JfJPMzXjozyiULDnwFt0NQwywt9Mqo2Fy2xSaBfv0vku3faKeAqM1u23tT83YhWGp
 TYlCvYlIaU/UeCEz7tg7HIkJk/VRLUK/fLJ3OnmrCif6OOd019HODH7hrS+NLQrDlA
 /PTInhSEHNIcZn5VA1gVnVvt/3jJIuPxk1w2jjVC3IvyGSkBrVy5HpYmBsX5q4NjPU
 Ggd7KxDOBtaog==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 2/6] drm/probe-helper: add
 drm_kms_helper_connector_hotplug_event
Message-ID: <20211015163336.95188-3-contact@emersion.fr>
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

This function is the same as drm_kms_helper_hotplug_event, but takes
a connector instead of a device.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_probe_helper.c | 23 +++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe=
_helper.c
index 61d5c57f23e1..3aef3b188c99 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -604,6 +604,9 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  *
  * This function must be called from process context with no mode
  * setting locks held.
+ *
+ * If only a single connector has changed, consider calling
+ * drm_kms_helper_connector_hotplug_event() instead.
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
@@ -616,6 +619,26 @@ void drm_kms_helper_hotplug_event(struct drm_device *d=
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
index 04c57564c397..48300aa6ca71 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -20,6 +20,7 @@ void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
 bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector);
 void drm_kms_helper_hotplug_event(struct drm_device *dev);
+void drm_kms_helper_connector_hotplug_event(struct drm_connector *connecto=
r);
=20
 void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
--=20
2.33.1


