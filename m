Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB843A1EE9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C916E409;
	Wed,  9 Jun 2021 21:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A986E409
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:23:59 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273837;
 bh=+2TgIcQOpe6dmWJy4MxbUcLVMP5RuX6A82OSZZa8ORY=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=dZWWIo10Q2abgozgfk99fXufl469DDRbzNJg21EOrlRZCLDw+t1jaUbAKoE+8kPp7
 txwEtG60zIFryW9X5/tqOoiuNSjglmRKyGpkMDFQIKyRpKhQSzWx1qOTZzZcWmNZAo
 +xcvNQbS1ZujELOScfMpnlX3e1QGLoNg5tuLPuEb92+iW8MUKjYHJy3Xv2OUZG/5jR
 RMlIxuNLc8y1W5vQ702bTI/cLSoPzLJ09IEsn4AW90gs+XMKq6k4mpWn4mVZGobv3J
 OpDBkTia2zs1KGEQ9bW2ijtgRwyxZh2fzlKcrvCGZ3kgR7Zjl8Pg2csDBpVzihbU3k
 I9OggJHNMjvMg==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 4/7] amdgpu: use drm_kms_helper_connector_hotplug_event
Message-ID: <9EHiZemzDlTsVgq94MyyJvPwfH6OOcK7UR8RsDCr2GE@cp3-web-033.plabs.ch>
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

When updating a single connector, use
drm_kms_helper_connector_hotplug_event instead of
drm_kms_helper_hotplug_event.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 8 ++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3267eb2e35dd..4b91534ff324 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2638,7 +2638,7 @@ static void handle_hpd_irq(void *param)
 =09=09drm_modeset_unlock_all(dev);
=20
 =09=09if (aconnector->base.force =3D=3D DRM_FORCE_UNSPECIFIED)
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
=20
 =09} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
 =09=09if (new_connection_type =3D=3D dc_connection_none &&
@@ -2652,7 +2652,7 @@ static void handle_hpd_irq(void *param)
 =09=09drm_modeset_unlock_all(dev);
=20
 =09=09if (aconnector->base.force =3D=3D DRM_FORCE_UNSPECIFIED)
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09}
 =09mutex_unlock(&aconnector->hpd_lock);
=20
@@ -2805,7 +2805,7 @@ static void handle_hpd_rx_irq(void *param)
 =09=09=09dm_restore_drm_connector_state(dev, connector);
 =09=09=09drm_modeset_unlock_all(dev);
=20
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09=09} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
=20
 =09=09=09if (aconnector->fake_enable)
@@ -2818,7 +2818,7 @@ static void handle_hpd_rx_irq(void *param)
 =09=09=09dm_restore_drm_connector_state(dev, connector);
 =09=09=09drm_modeset_unlock_all(dev);
=20
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09=09}
 =09}
 #ifdef CONFIG_DRM_AMD_DC_HDCP
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 9fbbd0159119..221242b6e528 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1200,7 +1200,7 @@ static ssize_t trigger_hotplug(struct file *f, const =
char __user *buf,
 =09=09dm_restore_drm_connector_state(dev, connector);
 =09=09drm_modeset_unlock_all(dev);
=20
-=09=09drm_kms_helper_hotplug_event(dev);
+=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09} else if (param[0] =3D=3D 0) {
 =09=09if (!aconnector->dc_link)
 =09=09=09goto unlock;
@@ -1222,7 +1222,7 @@ static ssize_t trigger_hotplug(struct file *f, const =
char __user *buf,
 =09=09dm_restore_drm_connector_state(dev, connector);
 =09=09drm_modeset_unlock_all(dev);
=20
-=09=09drm_kms_helper_hotplug_event(dev);
+=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09}
=20
 unlock:
--=20
2.31.1


