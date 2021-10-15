Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8242F848
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F176ED8A;
	Fri, 15 Oct 2021 16:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830966ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:33:55 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634315633;
 bh=CnvreGlcEPa564fSRV4zjlMRLFUjbxEgCnXwMFyXIk0=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=BKC9Jq1ZOcXvZXG2vxG1aYAhvlokXn5ILNkbaK8IjQq7/OZ6WbWkCSK1ZFEskMNkT
 qyoVZg6hiIsAuiz9uofBuarbX6TM90CQnWheX/rao6n6VOPrh7lm4OHqivfy750ZYC
 6TFuCik0HKrgvLdv5KjDdbSFiZwsO1r+0cWI6lnEIPCAbPL0cSUntBVdOeqwPWwCAm
 HdGglogZhj6ykVx48osklVWpl2VkvN1zuQq3p4YguNCRB6lbE/AxGIbZEqCId5zJ9Q
 mFD40K0MqBw8ta0WSgfAX/mpN6kXv7b895LlWyihVc6hN3Sf2n9w9jpmFw3mOUceaE
 OmGeTwDphojEA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 4/6] amdgpu: use drm_kms_helper_connector_hotplug_event
Message-ID: <20211015163336.95188-5-contact@emersion.fr>
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
index 9b1fc54555ee..c261e57d9a22 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2652,7 +2652,7 @@ static void handle_hpd_irq(void *param)
 =09=09drm_modeset_unlock_all(dev);
=20
 =09=09if (aconnector->base.force =3D=3D DRM_FORCE_UNSPECIFIED)
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
=20
 =09} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
 =09=09if (new_connection_type =3D=3D dc_connection_none &&
@@ -2666,7 +2666,7 @@ static void handle_hpd_irq(void *param)
 =09=09drm_modeset_unlock_all(dev);
=20
 =09=09if (aconnector->base.force =3D=3D DRM_FORCE_UNSPECIFIED)
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09}
 =09mutex_unlock(&aconnector->hpd_lock);
=20
@@ -2833,7 +2833,7 @@ static void handle_hpd_rx_irq(void *param)
 =09=09=09dm_restore_drm_connector_state(dev, connector);
 =09=09=09drm_modeset_unlock_all(dev);
=20
-=09=09=09drm_kms_helper_hotplug_event(dev);
+=09=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09=09} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
=20
 =09=09=09if (aconnector->fake_enable)
@@ -2846,7 +2846,7 @@ static void handle_hpd_rx_irq(void *param)
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
index 87daa78a32b8..23e789855d17 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1241,7 +1241,7 @@ static ssize_t trigger_hotplug(struct file *f, const =
char __user *buf,
 =09=09dm_restore_drm_connector_state(dev, connector);
 =09=09drm_modeset_unlock_all(dev);
=20
-=09=09drm_kms_helper_hotplug_event(dev);
+=09=09drm_kms_helper_connector_hotplug_event(connector);
 =09} else if (param[0] =3D=3D 0) {
 =09=09if (!aconnector->dc_link)
 =09=09=09goto unlock;
@@ -1263,7 +1263,7 @@ static ssize_t trigger_hotplug(struct file *f, const =
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
2.33.1


