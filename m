Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D73A1EED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2A06EB3C;
	Wed,  9 Jun 2021 21:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDDD6EAE2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:24:08 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273847;
 bh=D+ACLAmLPQ5dBv9UiHgwR4PZFqis8ssRuE9zja0/b20=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=hQBhLhVmqv1cyqvqr2JDFuq5p9TAS81wiRGwfJikG0bFfgXPU3906hromnuCmSj4Q
 F5sgltxwWTv8ROLXQnh7Q2UE3PcOziWxBP/bIRQ7EtmEdbGQobgieciRnD7o21/y+2
 9sW+pyDVe4MMVFsXDWwu1+cJqRGal6ac87Ri8UldQkPLkEaSyjjbAvU9cntZebnQe4
 geGAIgr2AIiN4WIymH9/GcKp1uWPCMaU8kCICDq2Hk93NNNy11vPyuu7OcwUtp2SFz
 /idqalXq5cUIihAZzl6bd8RAO+zrC8rMi7GB+ScOn9OSLVBybcKOkntBG6z8NKkWJ7
 9vGOpfXmBqdew==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 5/7] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <cSqLvJmgHix8R8X5lp2E2h6Z8zLOKxDkLfkm8mL3Zg@cp3-web-029.plabs.ch>
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

If an hotplug event only updates a single connector, use
drm_kms_helper_connector_hotplug_event instead of
drm_kms_helper_hotplug_event.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_probe_helper.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe=
_helper.c
index 8cc673267cba..f4130c1a90e2 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -843,7 +843,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
  */
 bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
-=09struct drm_connector *connector;
+=09struct drm_connector *connector, *changed_connector =3D NULL;
 =09struct drm_connector_list_iter conn_iter;
 =09enum drm_connector_status old_status;
 =09bool changed =3D false;
@@ -883,16 +883,27 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 =09=09 * Check if epoch counter had changed, meaning that we need
 =09=09 * to send a uevent.
 =09=09 */
-=09=09if (old_epoch_counter !=3D connector->epoch_counter)
+=09=09if (old_epoch_counter !=3D connector->epoch_counter) {
+=09=09=09if (changed) {
+=09=09=09=09if (changed_connector)
+=09=09=09=09=09drm_connector_put(changed_connector);
+=09=09=09=09changed_connector =3D NULL;
+=09=09=09} else {
+=09=09=09=09drm_connector_get(connector);
+=09=09=09=09changed_connector =3D connector;
+=09=09=09}
 =09=09=09changed =3D true;
+=09=09}
=20
 =09}
 =09drm_connector_list_iter_end(&conn_iter);
 =09mutex_unlock(&dev->mode_config.mutex);
=20
-=09if (changed) {
+=09if (changed_connector) {
+=09=09drm_kms_helper_connector_hotplug_event(changed_connector);
+=09=09drm_connector_put(changed_connector);
+=09} else if (changed) {
 =09=09drm_kms_helper_hotplug_event(dev);
-=09=09DRM_DEBUG_KMS("Sent hotplug event\n");
 =09}
=20
 =09return changed;
--=20
2.31.1


