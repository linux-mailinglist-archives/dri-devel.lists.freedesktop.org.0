Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF44E43126E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E12388E41;
	Mon, 18 Oct 2021 08:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A924F88EF2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:47:33 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546851;
 bh=+y0rRtkssxzbjvE8UQNuS0lAQ3Z8DvWBR4Uu8yw+/UQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ofvSsBMv5bTcGKh5yB1e+vktQxS+GHSgRbQXKIpP0m6Yl5mNRNh234VwoFlfs9lNj
 yt5oVQEraNRHXpOl/mrkvH7Acb5K9znCaEkVRiupvHviy5jwsQ03OhBE7r9PEL1dlR
 6GrycMfqI7mD690CECJeN6nFYkiEXKP+KTRvMrhtBxmOLFZ3hBkQfWGWuubWAkFkAj
 zkty9XvvdUfINc5iFT9Do5dcBASLTqsOWp+WTkXln/DpRlT639BjEJdEQjKcqawqio
 MuqEXIFwXeHSR9h54IOhW7+nnn84kU7MvfkMMkYTSOkg5i+6CJmWN0VViC/3aRLKHZ
 FSah0XGnYPAMw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Sam Ravnborg <sam@ravnborg.org>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v4 2/6] drm/probe-helper: add
 drm_kms_helper_connector_hotplug_event
Message-ID: <20211018084707.32253-3-contact@emersion.fr>
In-Reply-To: <20211018084707.32253-1-contact@emersion.fr>
References: <20211018084707.32253-1-contact@emersion.fr>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Harry Wentland <harry.wentland@amd.com>
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


