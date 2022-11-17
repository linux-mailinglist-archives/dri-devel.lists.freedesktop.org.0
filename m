Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AC62D46F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAF210E565;
	Thu, 17 Nov 2022 07:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AC410E565
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:54:51 +0000 (UTC)
Date: Thu, 17 Nov 2022 07:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1668671689; x=1668930889;
 bh=1cuoc+c0B+o0lfrnedqd5WCFg5h3m6La1/QER4aQjds=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Bj+htasW8sXvK2+HDk1XwIkbOUtnHrFev999/911vdVW1ELp7MGRqrPQnKlZwdEej
 erxwCVpxUqpZoKti3OJe6VQtE6209kejI63RQKNjnD2bmHt/H23rb93DZO3lWhFiFC
 9+DFC24V0+DBhZmdtD/5MxNhzWd79a0ppjJawgi6DHTdqSX24XHg+W0LPf0nyvz8z+
 GLzAujJdeGd0+TH1wVubUql6B3L8U8FZ3ByeSGtCHnOruFg4MyJCZcbmMQ7O81QLwu
 BUdTSUiC3AzlY3iq+co3aino06c/ps1bcTd3vnLLTIWUctaz4xsnCT++ZBx3xuE+5t
 Cl/wXYjFf21Jg==
To: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/atomic: add quirks for blind save/restore
Message-ID: <20221117075433.222968-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two quirks to make blind atomic save/restore [1] work correctly:

- Mark the DPMS property as immutable for atomic clients, since
  atomic clients cannot change it.
- Allow user-space to set content protection to "enabled", interpret
  it as "desired".

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3794

Signed-off-by: Simon Ser <contact@emersion.fr>
---

I don't have the motivation to write IGT tests for this.

 drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
 drivers/gpu/drm/drm_property.c    | 7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index c06d0639d552..95363aac7f69 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -741,8 +741,9 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,
 =09=09state->scaling_mode =3D val;
 =09} else if (property =3D=3D config->content_protection_property) {
 =09=09if (val =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-=09=09=09drm_dbg_kms(dev, "only drivers can set CP Enabled\n");
-=09=09=09return -EINVAL;
+=09=09=09/* Degrade ENABLED to DESIRED so that blind atomic
+=09=09=09 * save/restore works as intended. */
+=09=09=09val =3D DRM_MODE_CONTENT_PROTECTION_DESIRED;
 =09=09}
 =09=09state->content_protection =3D val;
 =09} else if (property =3D=3D config->hdcp_content_type_property) {
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.=
c
index dfec479830e4..dde42986f8cb 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -474,7 +474,14 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
 =09=09return -ENOENT;
=20
 =09strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
+
 =09out_resp->flags =3D property->flags;
+=09if (file_priv->atomic && property =3D=3D dev->mode_config.dpms_property=
) {
+=09=09/* Quirk: indicate that the legacy DPMS property is not
+=09=09 * writable from atomic user-space, so that blind atomic
+=09=09 * save/restore works as intended. */
+=09=09out_resp->flags |=3D DRM_MODE_PROP_IMMUTABLE;
+=09}
=20
 =09value_count =3D property->num_values;
 =09values_ptr =3D u64_to_user_ptr(out_resp->values_ptr);
--=20
2.38.1


