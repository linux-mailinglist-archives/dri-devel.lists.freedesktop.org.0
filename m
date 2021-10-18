Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6943126F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0A6E867;
	Mon, 18 Oct 2021 08:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2CD6E863
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:47:39 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546858;
 bh=YQTkOvdAiABoAgJvHgRsVUQ62iLcGNwcFxXJ3n6mzBQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=uEia5BfW4xPgQ8xRemkEYMlbEuzx1D5OjtjbXqQqz6q4hZnr5jNf5X+xLYXRW65R2
 Nk5HiQ/XYnJYFyNVbfF6A0CiMJ1oIURm8Ml+fzG74cnpXxXSuKHyA7LTz6YColbA6x
 5Nv2R20aiIuJTAx5R0cUuRlmXiQFt5Grcx/XaDaqvvAuyQiquzX/FdoYOExJsM+A1y
 JtIQbrWrVcRephz8DMlyo+SFq53cRJwhkN2D0Eo0n2Bbpgwg+B/p48HpnlH0S54Vbv
 dIfisrWE5xnPhGzNyy4NOXztbQM2pHXaWpzTOq1H2tvfidcmtqG6v8XrHNGVRiKQt6
 IBEN9ZuGhnwbA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <20211018084707.32253-6-contact@emersion.fr>
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

If an hotplug event only updates a single connector, use
drm_kms_helper_connector_hotplug_event instead of
drm_kms_helper_hotplug_event.

Changes in v4:
- Simplify loop logic (Ville, Sam)
- Update drm_connector_helper_hpd_irq_event (Maxime)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_probe_helper.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe=
_helper.c
index 3aef3b188c99..682359512996 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -888,7 +888,7 @@ bool drm_connector_helper_hpd_irq_event(struct drm_conn=
ector *connector)
 =09mutex_unlock(&dev->mode_config.mutex);
=20
 =09if (changed) {
-=09=09drm_kms_helper_hotplug_event(dev);
+=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
 =09=09=09    connector->base.id,
 =09=09=09    connector->name);
@@ -927,9 +927,9 @@ EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
  */
 bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
-=09struct drm_connector *connector;
+=09struct drm_connector *connector, *first_changed_connector =3D NULL;
 =09struct drm_connector_list_iter conn_iter;
-=09bool changed =3D false;
+=09int changed =3D 0;
=20
 =09if (!dev->mode_config.poll_enabled)
 =09=09return false;
@@ -941,16 +941,25 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 =09=09if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
 =09=09=09continue;
=20
-=09=09if (check_connector_changed(connector))
-=09=09=09changed =3D true;
+=09=09if (check_connector_changed(connector)) {
+=09=09=09if (!first_changed_connector) {
+=09=09=09=09drm_connector_get(connector);
+=09=09=09=09first_changed_connector =3D connector;
+=09=09=09}
+
+=09=09=09changed++;
+=09=09}
 =09}
 =09drm_connector_list_iter_end(&conn_iter);
 =09mutex_unlock(&dev->mode_config.mutex);
=20
-=09if (changed) {
+=09if (changed =3D=3D 1)
+=09=09drm_kms_helper_connector_hotplug_event(first_changed_connector);
+=09else if (changed > 0)
 =09=09drm_kms_helper_hotplug_event(dev);
-=09=09DRM_DEBUG_KMS("Sent hotplug event\n");
-=09}
+
+=09if (first_changed_connector)
+=09=09drm_connector_put(first_changed_connector);
=20
 =09return changed;
 }
--=20
2.33.1


