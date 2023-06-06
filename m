Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95E725842
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7991A10E464;
	Wed,  7 Jun 2023 08:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E90510E254
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 18:30:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686076232; cv=none; d=zohomail.in; s=zohoarc; 
 b=WNp8Pukgf/HL0XGQhyy9rRB5QA0YZghX4Y7y+kZxr8THtmqRr6gX7Oshu7bShn8aAlxA8ZaB84MO7hnXgtkkX/qmxr6U4tJY6Kq7X28xzG06kqzjdFoV9ukiGKeaum9ew7gOYb7BjXc4EFKhb/BiFZ4ZQYN1M76C+gcN7q9XzdY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686076232;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=BgzSV4zM0uBx9Jq0evguMtQofoPTwOxJGZ9B/Xy12gs=; 
 b=eQAspYIy/7T2PbTVFZpjDktVYj9P3jCCtgcSsjan0JDi9E4XwAZetqaV7UC2vYujBKpcFp1xI6SWeNlqlR8Orpo1UIn0S9L4ubm5h9x5jUdIv+QsdEf94vJydPZNWQaCVQpynHQ+8OTE6sprDol7YRRWFcrIWyr582Nm8JQGVHM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686076232; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=BgzSV4zM0uBx9Jq0evguMtQofoPTwOxJGZ9B/Xy12gs=;
 b=dpgt1Msj6/0FV7sSD7g7M0arBuMW6QANcZPEdMeOmeVoEVCp7YepLfhGQXmxZeaK
 7GZuXqa0o+tH9DhIQG+h5FT0ndgwicZI/8ApOwYORVYteIVPf1/KxQ3qGlAmlncOiv7
 BsElSowkJV5daIjJPcDKv5DWN5smk6/qJQsaLVjE=
Received: from kampyooter.. (122.176.141.156 [122.176.141.156]) by mx.zoho.in
 with SMTPS id 1686076230543126.82664378124241;
 Wed, 7 Jun 2023 00:00:30 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <68016c8cd0037b8db3cf37586635932876311b80.1686075579.git.code@siddh.me>
Subject: [PATCH v10 8/9] drm: Remove usage of deprecated DRM_DEBUG_KMS in DRM
 core
Date: Wed,  7 Jun 2023 00:00:09 +0530
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:26 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_KMS is deprecated in favor of
drm_dbg_kms().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_client_modeset.c | 112 +++++++++++++++------------
 drivers/gpu/drm/drm_color_mgmt.c     |   4 +-
 drivers/gpu/drm/drm_connector.c      |  21 ++---
 drivers/gpu/drm/drm_crtc.c           |  36 ++++-----
 drivers/gpu/drm/drm_crtc_helper.c    |  54 ++++++-------
 drivers/gpu/drm/drm_debugfs_crc.c    |   5 +-
 drivers/gpu/drm/drm_displayid.c      |   4 +-
 drivers/gpu/drm/drm_edid.c           |  17 ++--
 drivers/gpu/drm/drm_lease.c          |   2 +-
 drivers/gpu/drm/drm_mipi_dbi.c       |   7 +-
 drivers/gpu/drm/drm_modes.c          |  10 +--
 drivers/gpu/drm/drm_plane.c          |  32 ++++----
 drivers/gpu/drm/drm_probe_helper.c   |  39 +++++-----
 drivers/gpu/drm/drm_rect.c           |   4 +-
 drivers/gpu/drm/drm_sysfs.c          |   8 +-
 15 files changed, 187 insertions(+), 168 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_cli=
ent_modeset.c
index e2403b8c6347..4e08ae688b83 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -242,8 +242,9 @@ static void drm_client_connectors_enabled(struct drm_co=
nnector **connectors,
 =09for (i =3D 0; i < connector_count; i++) {
 =09=09connector =3D connectors[i];
 =09=09enabled[i] =3D drm_connector_enabled(connector, true);
-=09=09DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-=09=09=09      connector->display_info.non_desktop ? "non desktop" : str_y=
es_no(enabled[i]));
+=09=09drm_dbg_kms(connector->dev, "connector %d enabled? %s\n",
+=09=09=09    connector->base.id,
+=09=09=09    connector->display_info.non_desktop ? "non desktop" : str_yes=
_no(enabled[i]));
=20
 =09=09any_enabled |=3D enabled[i];
 =09}
@@ -303,7 +304,7 @@ static bool drm_client_target_cloned(struct drm_device =
*dev,
 =09}
=20
 =09if (can_clone) {
-=09=09DRM_DEBUG_KMS("can clone using command line\n");
+=09=09drm_dbg_kms(dev, "can clone using command line\n");
 =09=09return true;
 =09}
=20
@@ -328,7 +329,7 @@ static bool drm_client_target_cloned(struct drm_device =
*dev,
 =09}
=20
 =09if (can_clone) {
-=09=09DRM_DEBUG_KMS("can clone using 1024x768\n");
+=09=09drm_dbg_kms(dev, "can clone using 1024x768\n");
 =09=09return true;
 =09}
 =09drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n"=
);
@@ -352,8 +353,9 @@ static int drm_client_get_tile_offsets(struct drm_conne=
ctor **connectors,
 =09=09=09continue;
=20
 =09=09if (!modes[i] && (h_idx || v_idx)) {
-=09=09=09DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
-=09=09=09=09      connector->base.id);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "no modes for connector tiled %d %d\n",
+=09=09=09=09    i, connector->base.id);
 =09=09=09continue;
 =09=09}
 =09=09if (connector->tile_h_loc < h_idx)
@@ -364,7 +366,8 @@ static int drm_client_get_tile_offsets(struct drm_conne=
ctor **connectors,
 =09}
 =09offsets[idx].x =3D hoffset;
 =09offsets[idx].y =3D voffset;
-=09DRM_DEBUG_KMS("returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_=
idx);
+=09drm_dbg_kms(NULL, "returned %d %d for %d %d\n",
+=09=09    hoffset, voffset, h_idx, v_idx);
 =09return 0;
 }
=20
@@ -421,14 +424,16 @@ static bool drm_client_target_preferred(struct drm_co=
nnector **connectors,
 =09=09=09drm_client_get_tile_offsets(connectors, connector_count, modes, o=
ffsets, i,
 =09=09=09=09=09=09    connector->tile_h_loc, connector->tile_v_loc);
 =09=09}
-=09=09DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
-=09=09=09      connector->base.id);
+=09=09drm_dbg_kms(connector->dev,
+=09=09=09    "looking for cmdline mode on connector %d\n",
+=09=09=09    connector->base.id);
=20
 =09=09/* got for command line mode first */
 =09=09modes[i] =3D drm_connector_pick_cmdline_mode(connector);
 =09=09if (!modes[i]) {
-=09=09=09DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
-=09=09=09=09      connector->base.id, connector->tile_group ? connector->t=
ile_group->id : 0);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "looking for preferred mode on connector %d %d\n",
+=09=09=09=09    connector->base.id, connector->tile_group ? connector->til=
e_group->id : 0);
 =09=09=09modes[i] =3D drm_connector_has_preferred_mode(connector, width, h=
eight);
 =09=09}
 =09=09/* No preferred modes, pick one off the list */
@@ -450,16 +455,17 @@ static bool drm_client_target_preferred(struct drm_co=
nnector **connectors,
 =09=09=09    (connector->tile_h_loc =3D=3D 0 &&
 =09=09=09     connector->tile_v_loc =3D=3D 0 &&
 =09=09=09     !drm_connector_get_tiled_mode(connector))) {
-=09=09=09=09DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\=
n",
-=09=09=09=09=09      connector->base.id);
+=09=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09=09    "Falling back to non tiled mode on Connector %d\n",
+=09=09=09=09=09    connector->base.id);
 =09=09=09=09modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
 =09=09=09} else {
 =09=09=09=09modes[i] =3D drm_connector_get_tiled_mode(connector);
 =09=09=09}
 =09=09}
=20
-=09=09DRM_DEBUG_KMS("found mode %s\n", modes[i] ? modes[i]->name :
-=09=09=09  "none");
+=09=09drm_dbg_kms(connector->dev, "found mode %s\n",
+=09=09=09    modes[i] ? modes[i]->name : "none");
 =09=09conn_configured |=3D BIT_ULL(i);
 =09}
=20
@@ -619,15 +625,17 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
 =09=09=09num_connectors_detected++;
=20
 =09=09if (!enabled[i]) {
-=09=09=09DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
-=09=09=09=09      connector->name);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "connector %s not enabled, skipping\n",
+=09=09=09=09    connector->name);
 =09=09=09conn_configured |=3D BIT(i);
 =09=09=09continue;
 =09=09}
=20
 =09=09if (connector->force =3D=3D DRM_FORCE_OFF) {
-=09=09=09DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
-=09=09=09=09      connector->name);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "connector %s is disabled by user, skipping\n",
+=09=09=09=09    connector->name);
 =09=09=09enabled[i] =3D false;
 =09=09=09continue;
 =09=09}
@@ -637,8 +645,9 @@ static bool drm_client_firmware_config(struct drm_clien=
t_dev *client,
 =09=09=09if (connector->force > DRM_FORCE_OFF)
 =09=09=09=09goto bail;
=20
-=09=09=09DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
-=09=09=09=09      connector->name);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "connector %s has no encoder or crtc, skipping\n",
+=09=09=09=09    connector->name);
 =09=09=09enabled[i] =3D false;
 =09=09=09conn_configured |=3D BIT(i);
 =09=09=09continue;
@@ -655,28 +664,32 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
 =09=09 */
 =09=09for (j =3D 0; j < count; j++) {
 =09=09=09if (crtcs[j] =3D=3D new_crtc) {
-=09=09=09=09DRM_DEBUG_KMS("fallback: cloned configuration\n");
+=09=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09=09    "fallback: cloned configuration\n");
 =09=09=09=09goto bail;
 =09=09=09}
 =09=09}
=20
-=09=09DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
-=09=09=09      connector->name);
+=09=09drm_dbg_kms(connector->dev,
+=09=09=09    "looking for cmdline mode on connector %s\n",
+=09=09=09    connector->name);
=20
 =09=09/* go for command line mode first */
 =09=09modes[i] =3D drm_connector_pick_cmdline_mode(connector);
=20
 =09=09/* try for preferred next */
 =09=09if (!modes[i]) {
-=09=09=09DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
-=09=09=09=09      connector->name, connector->has_tile);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "looking for preferred mode on connector %s %d\n",
+=09=09=09=09    connector->name, connector->has_tile);
 =09=09=09modes[i] =3D drm_connector_has_preferred_mode(connector, width, h=
eight);
 =09=09}
=20
 =09=09/* No preferred mode marked by the EDID? Are there any modes? */
 =09=09if (!modes[i] && !list_empty(&connector->modes)) {
-=09=09=09DRM_DEBUG_KMS("using first mode listed on connector %s\n",
-=09=09=09=09      connector->name);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "using first mode listed on connector %s\n",
+=09=09=09=09    connector->name);
 =09=09=09modes[i] =3D list_first_entry(&connector->modes,
 =09=09=09=09=09=09    struct drm_display_mode,
 =09=09=09=09=09=09    head);
@@ -695,8 +708,9 @@ static bool drm_client_firmware_config(struct drm_clien=
t_dev *client,
 =09=09=09 * This is crtc->mode and not crtc->state->mode for the
 =09=09=09 * fastboot check to work correctly.
 =09=09=09 */
-=09=09=09DRM_DEBUG_KMS("looking for current mode on connector %s\n",
-=09=09=09=09      connector->name);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "looking for current mode on connector %s\n",
+=09=09=09=09    connector->name);
 =09=09=09modes[i] =3D &connector->state->crtc->mode;
 =09=09}
 =09=09/*
@@ -705,18 +719,20 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
 =09=09 */
 =09=09if (connector->has_tile &&
 =09=09    num_tiled_conns < connector->num_h_tile * connector->num_v_tile)=
 {
-=09=09=09DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-=09=09=09=09      connector->base.id);
+=09=09=09drm_dbg_kms(connector->dev,
+=09=09=09=09    "Falling back to non tiled mode on Connector %d\n",
+=09=09=09=09    connector->base.id);
 =09=09=09modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
 =09=09}
 =09=09crtcs[i] =3D new_crtc;
=20
-=09=09DRM_DEBUG_KMS("connector %s on [CRTC:%d:%s]: %dx%d%s\n",
-=09=09=09      connector->name,
-=09=09=09      connector->state->crtc->base.id,
-=09=09=09      connector->state->crtc->name,
-=09=09=09      modes[i]->hdisplay, modes[i]->vdisplay,
-=09=09=09      modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
+=09=09drm_dbg_kms(connector->dev,
+=09=09=09    "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
+=09=09=09    connector->name,
+=09=09=09    connector->state->crtc->base.id,
+=09=09=09    connector->state->crtc->name,
+=09=09=09    modes[i]->hdisplay, modes[i]->vdisplay,
+=09=09=09    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
=20
 =09=09fallback =3D false;
 =09=09conn_configured |=3D BIT(i);
@@ -732,15 +748,15 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
 =09 */
 =09if (num_connectors_enabled !=3D num_connectors_detected &&
 =09    num_connectors_enabled < dev->mode_config.num_crtc) {
-=09=09DRM_DEBUG_KMS("fallback: Not all outputs enabled\n");
-=09=09DRM_DEBUG_KMS("Enabled: %i, detected: %i\n", num_connectors_enabled,
-=09=09=09      num_connectors_detected);
+=09=09drm_dbg_kms(NULL, "fallback: Not all outputs enabled\n");
+=09=09drm_dbg_kms(NULL, "Enabled: %i, detected: %i\n",
+=09=09=09    num_connectors_enabled, num_connectors_detected);
 =09=09fallback =3D true;
 =09}
=20
 =09if (fallback) {
 bail:
-=09=09DRM_DEBUG_KMS("Not using firmware configuration\n");
+=09=09drm_dbg_kms(NULL, "Not using firmware configuration\n");
 =09=09memcpy(enabled, save_enabled, count);
 =09=09ret =3D false;
 =09}
@@ -777,7 +793,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09int i, ret =3D 0;
 =09bool *enabled;
=20
-=09DRM_DEBUG_KMS("\n");
+=09drm_dbg_kms(dev, "\n");
=20
 =09if (!width)
 =09=09width =3D dev->mode_config.max_width;
@@ -819,7 +835,7 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09for (i =3D 0; i < connector_count; i++)
 =09=09total_modes_count +=3D connectors[i]->funcs->fill_modes(connectors[i=
], width, height);
 =09if (!total_modes_count)
-=09=09DRM_DEBUG_KMS("No connectors reported connected with modes\n");
+=09=09drm_dbg_kms(dev, "No connectors reported connected with modes\n");
 =09drm_client_connectors_enabled(connectors, connector_count, enabled);
=20
 =09if (!drm_client_firmware_config(client, connectors, connector_count, cr=
tcs,
@@ -834,8 +850,8 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09=09=09=09=09=09 offsets, enabled, width, height))
 =09=09=09drm_err(client->dev, "Unable to find initial modes\n");
=20
-=09=09DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
-=09=09=09      width, height);
+=09=09drm_dbg_kms(dev, "picking CRTCs for %dx%d config\n",
+=09=09=09    width, height);
=20
 =09=09drm_client_pick_crtcs(client, connectors, connector_count,
 =09=09=09=09      crtcs, modes, 0, width, height);
@@ -853,8 +869,8 @@ int drm_client_modeset_probe(struct drm_client_dev *cli=
ent, unsigned int width,
 =09=09=09struct drm_mode_set *modeset =3D drm_client_find_modeset(client, =
crtc);
 =09=09=09struct drm_connector *connector =3D connectors[i];
=20
-=09=09=09DRM_DEBUG_KMS("desired mode %s set on crtc %d (%d,%d)\n",
-=09=09=09=09      mode->name, crtc->base.id, offset->x, offset->y);
+=09=09=09drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
+=09=09=09=09    mode->name, crtc->base.id, offset->x, offset->y);
=20
 =09=09=09if (WARN_ON_ONCE(modeset->num_connectors =3D=3D DRM_CLIENT_MAX_CL=
ONED_CONNECTORS ||
 =09=09=09=09=09 (dev->mode_config.num_crtc > 1 && modeset->num_connectors =
=3D=3D 1))) {
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_m=
gmt.c
index d021497841b8..a2761a6ce11f 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -612,7 +612,7 @@ int drm_color_lut_check(const struct drm_property_blob =
*lut, u32 tests)
 =09=09if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
 =09=09=09if (entry[i].red !=3D entry[i].blue ||
 =09=09=09    entry[i].red !=3D entry[i].green) {
-=09=09=09=09DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
+=09=09=09=09drm_dbg_kms(NULL, "All LUT entries must have equal r/g/b\n");
 =09=09=09=09return -EINVAL;
 =09=09=09}
 =09=09}
@@ -621,7 +621,7 @@ int drm_color_lut_check(const struct drm_property_blob =
*lut, u32 tests)
 =09=09=09if (entry[i].red < entry[i - 1].red ||
 =09=09=09    entry[i].green < entry[i - 1].green ||
 =09=09=09    entry[i].blue < entry[i - 1].blue) {
-=09=09=09=09DRM_DEBUG_KMS("LUT entries must never decrease.\n");
+=09=09=09=09drm_dbg_kms(NULL, "LUT entries must never decrease.\n");
 =09=09=09=09return -EINVAL;
 =09=09=09}
 =09=09}
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index dca8dd4ab93f..adedaf05418a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -181,13 +181,14 @@ static void drm_connector_get_cmdline_mode(struct drm=
_connector *connector)
 =09=09=09=09=09=09    mode->panel_orientation);
 =09}
=20
-=09DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
-=09=09      connector->name, mode->name,
-=09=09      mode->xres, mode->yres,
-=09=09      mode->refresh_specified ? mode->refresh : 60,
-=09=09      mode->rb ? " reduced blanking" : "",
-=09=09      mode->margins ? " with margins" : "",
-=09=09      mode->interlace ?  " interlaced" : "");
+=09drm_dbg_kms(connector->dev,
+=09=09    "cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
+=09=09    connector->name, mode->name,
+=09=09    mode->xres, mode->yres,
+=09=09    mode->refresh_specified ? mode->refresh : 60,
+=09=09    mode->rb ? " reduced blanking" : "",
+=09=09    mode->margins ? " with margins" : "",
+=09=09    mode->interlace ?  " interlaced" : "");
 }
=20
 static void drm_connector_free(struct kref *kref)
@@ -247,9 +248,9 @@ static int __drm_connector_init(struct drm_device *dev,
 =09/* connector index is used with 32bit bitmasks */
 =09ret =3D ida_alloc_max(&config->connector_ida, 31, GFP_KERNEL);
 =09if (ret < 0) {
-=09=09DRM_DEBUG_KMS("Failed to allocate %s connector index: %d\n",
-=09=09=09      drm_connector_enum_list[connector_type].name,
-=09=09=09      ret);
+=09=09drm_dbg_kms(dev, "Failed to allocate %s connector index: %d\n",
+=09=09=09    drm_connector_enum_list[connector_type].name,
+=09=09=09    ret);
 =09=09goto out_put;
 =09}
 =09connector->index =3D ret;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..adc426561e17 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -730,10 +730,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *da=
ta,
=20
 =09crtc =3D drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
 =09if (!crtc) {
-=09=09DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
+=09=09drm_dbg_kms(dev, "Unknown CRTC ID %d\n", crtc_req->crtc_id);
 =09=09return -ENOENT;
 =09}
-=09DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+=09drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
=20
 =09plane =3D crtc->primary;
=20
@@ -756,7 +756,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data=
,
 =09=09=09=09old_fb =3D plane->fb;
=20
 =09=09=09if (!old_fb) {
-=09=09=09=09DRM_DEBUG_KMS("CRTC doesn't have current FB\n");
+=09=09=09=09drm_dbg_kms(dev, "CRTC doesn't have current FB\n");
 =09=09=09=09ret =3D -EINVAL;
 =09=09=09=09goto out;
 =09=09=09}
@@ -767,8 +767,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data=
,
 =09=09} else {
 =09=09=09fb =3D drm_framebuffer_lookup(dev, file_priv, crtc_req->fb_id);
 =09=09=09if (!fb) {
-=09=09=09=09DRM_DEBUG_KMS("Unknown FB ID%d\n",
-=09=09=09=09=09=09crtc_req->fb_id);
+=09=09=09=09drm_dbg_kms(dev, "Unknown FB ID%d\n", crtc_req->fb_id);
 =09=09=09=09ret =3D -ENOENT;
 =09=09=09=09goto out;
 =09=09=09}
@@ -781,7 +780,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data=
,
 =09=09}
 =09=09if (!file_priv->aspect_ratio_allowed &&
 =09=09    (crtc_req->mode.flags & DRM_MODE_FLAG_PIC_AR_MASK) !=3D DRM_MODE=
_FLAG_PIC_AR_NONE) {
-=09=09=09DRM_DEBUG_KMS("Unexpected aspect-ratio flag bits\n");
+=09=09=09drm_dbg_kms(dev, "Unexpected aspect-ratio flag bits\n");
 =09=09=09ret =3D -EINVAL;
 =09=09=09goto out;
 =09=09}
@@ -789,8 +788,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data=
,
=20
 =09=09ret =3D drm_mode_convert_umode(dev, mode, &crtc_req->mode);
 =09=09if (ret) {
-=09=09=09DRM_DEBUG_KMS("Invalid mode (ret=3D%d, status=3D%s)\n",
-=09=09=09=09      ret, drm_get_mode_status_name(mode->status));
+=09=09=09drm_dbg_kms(dev, "Invalid mode (ret=3D%d, status=3D%s)\n",
+=09=09=09=09    ret, drm_get_mode_status_name(mode->status));
 =09=09=09drm_mode_debug_printmodeline(mode);
 =09=09=09goto out;
 =09=09}
@@ -807,9 +806,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data=
,
 =09=09=09=09=09=09=09   fb->format->format,
 =09=09=09=09=09=09=09   fb->modifier);
 =09=09=09if (ret) {
-=09=09=09=09DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
-=09=09=09=09=09      &fb->format->format,
-=09=09=09=09=09      fb->modifier);
+=09=09=09=09drm_dbg_kms(dev, "Invalid pixel format %p4cc, modifier 0x%llx\=
n",
+=09=09=09=09=09    &fb->format->format, fb->modifier);
 =09=09=09=09goto out;
 =09=09=09}
 =09=09}
@@ -822,14 +820,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *da=
ta,
 =09}
=20
 =09if (crtc_req->count_connectors =3D=3D 0 && mode) {
-=09=09DRM_DEBUG_KMS("Count connectors is 0 but mode set\n");
+=09=09drm_dbg_kms(dev, "Count connectors is 0 but mode set\n");
 =09=09ret =3D -EINVAL;
 =09=09goto out;
 =09}
=20
 =09if (crtc_req->count_connectors > 0 && (!mode || !fb)) {
-=09=09DRM_DEBUG_KMS("Count connectors is %d but no mode or fb set\n",
-=09=09=09  crtc_req->count_connectors);
+=09=09drm_dbg_kms(dev, "Count connectors is %d but no mode or fb set\n",
+=09=09=09    crtc_req->count_connectors);
 =09=09ret =3D -EINVAL;
 =09=09goto out;
 =09}
@@ -861,14 +859,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *da=
ta,
=20
 =09=09=09connector =3D drm_connector_lookup(dev, file_priv, out_id);
 =09=09=09if (!connector) {
-=09=09=09=09DRM_DEBUG_KMS("Connector id %d unknown\n",
-=09=09=09=09=09=09out_id);
+=09=09=09=09drm_dbg_kms(dev, "Connector id %d unknown\n",
+=09=09=09=09=09    out_id);
 =09=09=09=09ret =3D -ENOENT;
 =09=09=09=09goto out;
 =09=09=09}
-=09=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-=09=09=09=09=09connector->base.id,
-=09=09=09=09=09connector->name);
+=09=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
+=09=09=09=09    connector->base.id,
+=09=09=09=09    connector->name);
=20
 =09=09=09connector_set[i] =3D connector;
 =09=09}
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_h=
elper.c
index b74b4301a471..59e7b86eab93 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -338,7 +338,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 =09=09if (encoder_funcs->mode_fixup) {
 =09=09=09if (!(ret =3D encoder_funcs->mode_fixup(encoder, mode,
 =09=09=09=09=09=09=09      adjusted_mode))) {
-=09=09=09=09DRM_DEBUG_KMS("Encoder fixup failed\n");
+=09=09=09=09drm_dbg_kms(dev, "Encoder fixup failed\n");
 =09=09=09=09goto done;
 =09=09=09}
 =09=09}
@@ -347,11 +347,11 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 =09if (crtc_funcs->mode_fixup) {
 =09=09if (!(ret =3D crtc_funcs->mode_fixup(crtc, mode,
 =09=09=09=09=09=09adjusted_mode))) {
-=09=09=09DRM_DEBUG_KMS("CRTC fixup failed\n");
+=09=09=09drm_dbg_kms(dev, "CRTC fixup failed\n");
 =09=09=09goto done;
 =09=09}
 =09}
-=09DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+=09drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
=20
 =09drm_mode_copy(&crtc->hwmode, adjusted_mode);
=20
@@ -390,8 +390,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 =09=09if (!encoder_funcs)
 =09=09=09continue;
=20
-=09=09DRM_DEBUG_KMS("[ENCODER:%d:%s] set [MODE:%s]\n",
-=09=09=09encoder->base.id, encoder->name, mode->name);
+=09=09drm_dbg_kms(dev, "[ENCODER:%d:%s] set [MODE:%s]\n",
+=09=09=09    encoder->base.id, encoder->name, mode->name);
 =09=09if (encoder_funcs->mode_set)
 =09=09=09encoder_funcs->mode_set(encoder, mode, adjusted_mode);
 =09}
@@ -567,7 +567,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09int ret;
 =09int i;
=20
-=09DRM_DEBUG_KMS("\n");
+=09drm_dbg_kms(NULL, "\n");
=20
 =09BUG_ON(!set);
 =09BUG_ON(!set->crtc);
@@ -586,13 +586,13 @@ int drm_crtc_helper_set_config(struct drm_mode_set *s=
et,
 =09=09set->fb =3D NULL;
=20
 =09if (set->fb) {
-=09=09DRM_DEBUG_KMS("[CRTC:%d:%s] [FB:%d] #connectors=3D%d (x y) (%i %i)\n=
",
-=09=09=09      set->crtc->base.id, set->crtc->name,
-=09=09=09      set->fb->base.id,
-=09=09=09      (int)set->num_connectors, set->x, set->y);
+=09=09drm_dbg_kms(dev, "[CRTC:%d:%s] [FB:%d] #connectors=3D%d (x y) (%i %i=
)\n",
+=09=09=09    set->crtc->base.id, set->crtc->name,
+=09=09=09    set->fb->base.id,
+=09=09=09    (int)set->num_connectors, set->x, set->y);
 =09} else {
-=09=09DRM_DEBUG_KMS("[CRTC:%d:%s] [NOFB]\n",
-=09=09=09      set->crtc->base.id, set->crtc->name);
+=09=09drm_dbg_kms(dev, "[CRTC:%d:%s] [NOFB]\n",
+=09=09=09    set->crtc->base.id, set->crtc->name);
 =09=09drm_crtc_helper_disable(set->crtc);
 =09=09return 0;
 =09}
@@ -642,7 +642,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09if (set->crtc->primary->fb !=3D set->fb) {
 =09=09/* If we have no fb then treat it as a full mode set */
 =09=09if (set->crtc->primary->fb =3D=3D NULL) {
-=09=09=09DRM_DEBUG_KMS("crtc has no fb, full mode set\n");
+=09=09=09drm_dbg_kms(dev, "crtc has no fb, full mode set\n");
 =09=09=09mode_changed =3D true;
 =09=09} else if (set->fb->format !=3D set->crtc->primary->fb->format) {
 =09=09=09mode_changed =3D true;
@@ -654,7 +654,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09=09fb_changed =3D true;
=20
 =09if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
-=09=09DRM_DEBUG_KMS("modes are different, full mode set\n");
+=09=09drm_dbg_kms(dev, "modes are different, full mode set\n");
 =09=09drm_mode_debug_printmodeline(&set->crtc->mode);
 =09=09drm_mode_debug_printmodeline(set->mode);
 =09=09mode_changed =3D true;
@@ -690,7 +690,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09=09=09=09=09fail =3D 1;
=20
 =09=09=09=09if (connector->dpms !=3D DRM_MODE_DPMS_ON) {
-=09=09=09=09=09DRM_DEBUG_KMS("connector dpms not on, full mode switch\n");
+=09=09=09=09=09drm_dbg_kms(dev, "connector dpms not on, full mode switch\n=
");
 =09=09=09=09=09mode_changed =3D true;
 =09=09=09=09}
=20
@@ -699,7 +699,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
 =09=09}
=20
 =09=09if (new_encoder !=3D connector->encoder) {
-=09=09=09DRM_DEBUG_KMS("encoder changed, full mode switch\n");
+=09=09=09drm_dbg_kms(dev, "encoder changed, full mode switch\n");
 =09=09=09mode_changed =3D true;
 =09=09=09/* If the encoder is reused for another connector, then
 =09=09=09 * the appropriate crtc will be set later.
@@ -740,17 +740,17 @@ int drm_crtc_helper_set_config(struct drm_mode_set *s=
et,
 =09=09=09goto fail;
 =09=09}
 =09=09if (new_crtc !=3D connector->encoder->crtc) {
-=09=09=09DRM_DEBUG_KMS("crtc changed, full mode switch\n");
+=09=09=09drm_dbg_kms(dev, "crtc changed, full mode switch\n");
 =09=09=09mode_changed =3D true;
 =09=09=09connector->encoder->crtc =3D new_crtc;
 =09=09}
 =09=09if (new_crtc) {
-=09=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
-=09=09=09=09      connector->base.id, connector->name,
-=09=09=09=09      new_crtc->base.id, new_crtc->name);
+=09=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
+=09=09=09=09    connector->base.id, connector->name,
+=09=09=09=09    new_crtc->base.id, new_crtc->name);
 =09=09} else {
-=09=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [NOCRTC]\n",
-=09=09=09=09      connector->base.id, connector->name);
+=09=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [NOCRTC]\n",
+=09=09=09=09    connector->base.id, connector->name);
 =09=09}
 =09}
 =09drm_connector_list_iter_end(&conn_iter);
@@ -761,8 +761,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set=
,
=20
 =09if (mode_changed) {
 =09=09if (drm_helper_crtc_in_use(set->crtc)) {
-=09=09=09DRM_DEBUG_KMS("attempting to set mode from"
-=09=09=09=09=09" userspace\n");
+=09=09=09drm_dbg_kms(dev, "attempting to set mode from userspace\n");
 =09=09=09drm_mode_debug_printmodeline(set->mode);
 =09=09=09set->crtc->primary->fb =3D set->fb;
 =09=09=09if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
@@ -774,10 +773,11 @@ int drm_crtc_helper_set_config(struct drm_mode_set *s=
et,
 =09=09=09=09ret =3D -EINVAL;
 =09=09=09=09goto fail;
 =09=09=09}
-=09=09=09DRM_DEBUG_KMS("Setting connector DPMS state to on\n");
+=09=09=09drm_dbg_kms(dev, "Setting connector DPMS state to on\n");
 =09=09=09for (i =3D 0; i < set->num_connectors; i++) {
-=09=09=09=09DRM_DEBUG_KMS("\t[CONNECTOR:%d:%s] set DPMS on\n", set->connec=
tors[i]->base.id,
-=09=09=09=09=09      set->connectors[i]->name);
+=09=09=09=09drm_dbg_kms(dev, "\t[CONNECTOR:%d:%s] set DPMS on\n",
+=09=09=09=09=09    set->connectors[i]->base.id,
+=09=09=09=09=09    set->connectors[i]->name);
 =09=09=09=09set->connectors[i]->funcs->dpms(set->connectors[i], DRM_MODE_D=
PMS_ON);
 =09=09=09}
 =09=09}
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugf=
s_crc.c
index a59ef3f0e4a1..f29d286f4760 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -131,8 +131,9 @@ static ssize_t crc_control_write(struct file *file, con=
st char __user *ubuf,
 =09=09return 0;
=20
 =09if (len > PAGE_SIZE - 1) {
-=09=09DRM_DEBUG_KMS("Expected < %lu bytes into crtc crc control\n",
-=09=09=09      PAGE_SIZE);
+=09=09drm_dbg_kms(crtc->dev,
+=09=09=09    "Expected < %lu bytes into crtc crc control\n",
+=09=09=09    PAGE_SIZE);
 =09=09return -E2BIG;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayi=
d.c
index 27ffeee09e4f..7e591bc0883f 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -31,8 +31,8 @@ validate_displayid(const u8 *displayid, int length, int i=
dx)
 =09if (IS_ERR(base))
 =09=09return base;
=20
-=09DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
-=09=09      base->rev, base->bytes, base->prod_id, base->ext_count);
+=09drm_dbg_kms(NULL, "base revision 0x%x, length %d, %d %d\n",
+=09=09    base->rev, base->bytes, base->prod_id, base->ext_count);
=20
 =09/* +1 for DispID checksum */
 =09dispid_length =3D sizeof(*base) + base->bytes + 1;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0454da505687..791152c4afd4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1986,7 +1986,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, =
bool print_bad_edid,
=20
 =09status =3D edid_block_check(block, is_base_block);
 =09if (status =3D=3D EDID_BLOCK_HEADER_REPAIR) {
-=09=09DRM_DEBUG_KMS("Fixing EDID header, your hardware may be failing\n");
+=09=09drm_dbg_kms(NULL, "Fixing EDID header, your hardware may be failing\=
n");
 =09=09edid_header_fix(block);
=20
 =09=09/* Retry with fixed header, update status if that worked. */
@@ -2172,8 +2172,9 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned i=
nt block, size_t len)
 =09=09ret =3D i2c_transfer(adapter, &msgs[3 - xfers], xfers);
=20
 =09=09if (ret =3D=3D -ENXIO) {
-=09=09=09DRM_DEBUG_KMS("drm: skipping non-existent adapter %s\n",
-=09=09=09=09=09adapter->name);
+=09=09=09drm_dbg_kms(NULL,
+=09=09=09=09    "drm: skipping non-existent adapter %s\n",
+=09=09=09=09    adapter->name);
 =09=09=09break;
 =09=09}
 =09} while (ret !=3D xfers && --retries);
@@ -5589,7 +5590,7 @@ static int _drm_edid_to_sad(const struct drm_edid *dr=
m_edid,
 =09}
 =09cea_db_iter_end(&iter);
=20
-=09DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
+=09drm_dbg_kms(NULL, "Found %d Short Audio Descriptors\n", count);
=20
 =09return count;
 }
@@ -5634,7 +5635,7 @@ static int _drm_edid_to_speaker_allocation(const stru=
ct drm_edid *drm_edid,
 =09}
 =09cea_db_iter_end(&iter);
=20
-=09DRM_DEBUG_KMS("Found %d Speaker Allocation Data Blocks\n", count);
+=09drm_dbg_kms(NULL, "Found %d Speaker Allocation Data Blocks\n", count);
=20
 =09return count;
 }
@@ -5761,7 +5762,7 @@ static bool _drm_detect_monitor_audio(const struct dr=
m_edid *drm_edid)
 =09drm_edid_iter_end(&edid_iter);
=20
 =09if (has_audio) {
-=09=09DRM_DEBUG_KMS("Monitor has basic audio support\n");
+=09=09drm_dbg_kms(NULL, "Monitor has basic audio support\n");
 =09=09goto end;
 =09}
=20
@@ -5772,8 +5773,8 @@ static bool _drm_detect_monitor_audio(const struct dr=
m_edid *drm_edid)
 =09=09=09int i;
=20
 =09=09=09for (i =3D 0; i < cea_db_payload_len(db); i +=3D 3)
-=09=09=09=09DRM_DEBUG_KMS("CEA audio format %d\n",
-=09=09=09=09=09      (data[i] >> 3) & 0xf);
+=09=09=09=09drm_dbg_kms(NULL, "CEA audio format %d\n",
+=09=09=09=09=09    (data[i] >> 3) & 0xf);
 =09=09=09has_audio =3D true;
 =09=09=09break;
 =09=09}
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index af72fc38bb7c..c1b8717b5794 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -403,7 +403,7 @@ static int fill_object_idr(struct drm_device *dev,
 =09=09}
=20
 =09=09if (!drm_mode_object_lease_required(objects[o]->type)) {
-=09=09=09DRM_DEBUG_KMS("invalid object for lease\n");
+=09=09=09drm_dbg_kms(dev, "invalid object for lease\n");
 =09=09=09ret =3D -EINVAL;
 =09=09=09goto out_free_objects;
 =09=09}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index ab5dd5933a1a..793fdd7da1d0 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -265,7 +265,8 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, st=
ruct drm_framebuffer *fb,
=20
 =09full =3D width =3D=3D fb->width && height =3D=3D fb->height;
=20
-=09DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_R=
ECT_ARG(rect));
+=09drm_dbg_kms(fb->dev, "Flushing [FB:%d] " DRM_RECT_FMT "\n",
+=09=09    fb->base.id, DRM_RECT_ARG(rect));
=20
 =09if (!dbi->dc || !full || swap ||
 =09    fb->format->format =3D=3D DRM_FORMAT_XRGB8888) {
@@ -408,7 +409,7 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pi=
pe *pipe)
 {
 =09struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(pipe->crtc.dev);
=20
-=09DRM_DEBUG_KMS("\n");
+=09drm_dbg_kms(&dbidev->drm, "\n");
=20
 =09if (dbidev->backlight)
 =09=09backlight_disable(dbidev->backlight);
@@ -627,7 +628,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev =
*dbidev,
 =09drm->mode_config.max_height =3D dbidev->mode.vdisplay;
 =09dbidev->rotation =3D rotation;
=20
-=09DRM_DEBUG_KMS("rotation =3D %u\n", rotation);
+=09drm_dbg_kms(drm, "rotation =3D %u\n", rotation);
=20
 =09return 0;
 }
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index f5171bf91eae..440e3b015cc6 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -53,11 +53,11 @@
  * drm_mode_debug_printmodeline - print a mode to dmesg
  * @mode: mode to print
  *
- * Describe @mode using DRM_DEBUG.
+ * Describe @mode using drm_dbg_kms().
  */
 void drm_mode_debug_printmodeline(const struct drm_display_mode *mode)
 {
-=09DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+=09drm_dbg_kms(NULL, "Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 }
 EXPORT_SYMBOL(drm_mode_debug_printmodeline);
=20
@@ -1813,9 +1813,9 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 =09=09=09}
 =09=09=09if (verbose) {
 =09=09=09=09drm_mode_debug_printmodeline(mode);
-=09=09=09=09DRM_DEBUG_KMS("Not using %s mode: %s\n",
-=09=09=09=09=09      mode->name,
-=09=09=09=09=09      drm_get_mode_status_name(mode->status));
+=09=09=09=09drm_dbg_kms(dev, "Not using %s mode: %s\n",
+=09=09=09=09=09    mode->name,
+=09=09=09=09=09    drm_get_mode_status_name(mode->status));
 =09=09=09}
 =09=09=09drm_mode_destroy(dev, mode);
 =09=09}
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 1e8727b7bce9..12fed5f812a1 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -275,7 +275,7 @@ static int __drm_universal_plane_init(struct drm_device=
 *dev,
 =09plane->format_types =3D kmalloc_array(format_count, sizeof(uint32_t),
 =09=09=09=09=09    GFP_KERNEL);
 =09if (!plane->format_types) {
-=09=09DRM_DEBUG_KMS("out of memory when allocating plane\n");
+=09=09drm_dbg_kms(dev, "out of memory when allocating plane\n");
 =09=09drm_mode_object_unregister(dev, &plane->base);
 =09=09return -ENOMEM;
 =09}
@@ -302,7 +302,7 @@ static int __drm_universal_plane_init(struct drm_device=
 *dev,
 =09=09=09=09=09 GFP_KERNEL);
=20
 =09if (format_modifier_count && !plane->modifiers) {
-=09=09DRM_DEBUG_KMS("out of memory when allocating plane\n");
+=09=09drm_dbg_kms(dev, "out of memory when allocating plane\n");
 =09=09kfree(plane->format_types);
 =09=09drm_mode_object_unregister(dev, &plane->base);
 =09=09return -ENOMEM;
@@ -786,7 +786,7 @@ static int __setplane_check(struct drm_plane *plane,
=20
 =09/* Check whether this plane is usable on this CRTC */
 =09if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
-=09=09DRM_DEBUG_KMS("Invalid crtc for plane\n");
+=09=09drm_dbg_kms(plane->dev, "Invalid crtc for plane\n");
 =09=09return -EINVAL;
 =09}
=20
@@ -794,8 +794,9 @@ static int __setplane_check(struct drm_plane *plane,
 =09ret =3D drm_plane_check_pixel_format(plane, fb->format->format,
 =09=09=09=09=09   fb->modifier);
 =09if (ret) {
-=09=09DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
-=09=09=09      &fb->format->format, fb->modifier);
+=09=09drm_dbg_kms(fb->dev,
+=09=09=09    "Invalid pixel format %p4cc, modifier 0x%llx\n",
+=09=09=09    &fb->format->format, fb->modifier);
 =09=09return ret;
 =09}
=20
@@ -804,8 +805,8 @@ static int __setplane_check(struct drm_plane *plane,
 =09    crtc_x > INT_MAX - (int32_t) crtc_w ||
 =09    crtc_h > INT_MAX ||
 =09    crtc_y > INT_MAX - (int32_t) crtc_h) {
-=09=09DRM_DEBUG_KMS("Invalid CRTC coordinates %ux%u+%d+%d\n",
-=09=09=09      crtc_w, crtc_h, crtc_x, crtc_y);
+=09=09drm_dbg_kms(crtc->dev, "Invalid CRTC coordinates %ux%u+%d+%d\n",
+=09=09=09    crtc_w, crtc_h, crtc_x, crtc_y);
 =09=09return -ERANGE;
 =09}
=20
@@ -982,24 +983,23 @@ int drm_mode_setplane(struct drm_device *dev, void *d=
ata,
 =09 */
 =09plane =3D drm_plane_find(dev, file_priv, plane_req->plane_id);
 =09if (!plane) {
-=09=09DRM_DEBUG_KMS("Unknown plane ID %d\n",
-=09=09=09      plane_req->plane_id);
+=09=09drm_dbg_kms(dev, "Unknown plane ID %d\n", plane_req->plane_id);
 =09=09return -ENOENT;
 =09}
=20
 =09if (plane_req->fb_id) {
 =09=09fb =3D drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
 =09=09if (!fb) {
-=09=09=09DRM_DEBUG_KMS("Unknown framebuffer ID %d\n",
-=09=09=09=09      plane_req->fb_id);
+=09=09=09drm_dbg_kms(dev, "Unknown framebuffer ID %d\n",
+=09=09=09=09    plane_req->fb_id);
 =09=09=09return -ENOENT;
 =09=09}
=20
 =09=09crtc =3D drm_crtc_find(dev, file_priv, plane_req->crtc_id);
 =09=09if (!crtc) {
 =09=09=09drm_framebuffer_put(fb);
-=09=09=09DRM_DEBUG_KMS("Unknown crtc ID %d\n",
-=09=09=09=09      plane_req->crtc_id);
+=09=09=09drm_dbg_kms(dev, "Unknown crtc ID %d\n",
+=09=09=09=09    plane_req->crtc_id);
 =09=09=09return -ENOENT;
 =09=09}
 =09}
@@ -1048,7 +1048,7 @@ static int drm_mode_cursor_universal(struct drm_crtc =
*crtc,
 =09=09if (req->handle) {
 =09=09=09fb =3D drm_internal_framebuffer_create(dev, &fbreq, file_priv);
 =09=09=09if (IS_ERR(fb)) {
-=09=09=09=09DRM_DEBUG_KMS("failed to wrap cursor buffer in drm framebuffer=
\n");
+=09=09=09=09drm_dbg_kms(dev, "failed to wrap cursor buffer in drm framebuf=
fer\n");
 =09=09=09=09return PTR_ERR(fb);
 =09=09=09}
=20
@@ -1119,7 +1119,7 @@ static int drm_mode_cursor_common(struct drm_device *=
dev,
=20
 =09crtc =3D drm_crtc_find(dev, file_priv, req->crtc_id);
 =09if (!crtc) {
-=09=09DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
+=09=09drm_dbg_kms(dev, "Unknown CRTC ID %d\n", req->crtc_id);
 =09=09return -ENOENT;
 =09}
=20
@@ -1340,7 +1340,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 =09 * to modifier changes.
 =09 */
 =09if (old_fb->format->format !=3D fb->format->format) {
-=09=09DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer forma=
t.\n");
+=09=09drm_dbg_kms(dev, "Page flip is not allowed to change frame buffer fo=
rmat.\n");
 =09=09ret =3D -EINVAL;
 =09=09goto out;
 =09}
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe=
_helper.c
index 2fb9bf901a2c..6cdaf84735cd 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -532,8 +532,8 @@ int drm_helper_probe_single_connector_modes(struct drm_=
connector *connector,
=20
 =09drm_modeset_acquire_init(&ctx, 0);
=20
-=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
-=09=09=09connector->name);
+=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
+=09=09    connector->name);
=20
 retry:
 =09ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
@@ -576,11 +576,12 @@ int drm_helper_probe_single_connector_modes(struct dr=
m_connector *connector,
 =09 * check here, and if anything changed start the hotplug code.
 =09 */
 =09if (old_status !=3D connector->status) {
-=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
-=09=09=09      connector->base.id,
-=09=09=09      connector->name,
-=09=09=09      drm_get_connector_status_name(old_status),
-=09=09=09      drm_get_connector_status_name(connector->status));
+=09=09drm_dbg_kms(dev,
+=09=09=09    "[CONNECTOR:%d:%s] status updated from %s to %s\n",
+=09=09=09    connector->base.id,
+=09=09=09    connector->name,
+=09=09=09    drm_get_connector_status_name(old_status),
+=09=09=09    drm_get_connector_status_name(connector->status));
=20
 =09=09/*
 =09=09 * The hotplug event code might call into the fb
@@ -599,8 +600,8 @@ int drm_helper_probe_single_connector_modes(struct drm_=
connector *connector,
 =09drm_kms_helper_poll_enable(dev);
=20
 =09if (connector->status =3D=3D connector_status_disconnected) {
-=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
-=09=09=09connector->base.id, connector->name);
+=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
+=09=09=09    connector->base.id, connector->name);
 =09=09drm_connector_update_edid_property(connector, NULL);
 =09=09drm_mode_prune_invalid(dev, &connector->modes, false);
 =09=09goto exit;
@@ -658,8 +659,8 @@ int drm_helper_probe_single_connector_modes(struct drm_=
connector *connector,
=20
 =09drm_mode_sort(&connector->modes);
=20
-=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
-=09=09=09connector->name);
+=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes :\n",
+=09=09    connector->base.id, connector->name);
 =09list_for_each_entry(mode, &connector->modes, head) {
 =09=09drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
 =09=09drm_mode_debug_printmodeline(mode);
@@ -793,14 +794,14 @@ static void output_poll_execute(struct work_struct *w=
ork)
 =09=09=09old =3D drm_get_connector_status_name(old_status);
 =09=09=09new =3D drm_get_connector_status_name(connector->status);
=20
-=09=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] "
-=09=09=09=09      "status updated from %s to %s\n",
-=09=09=09=09      connector->base.id,
-=09=09=09=09      connector->name,
-=09=09=09=09      old, new);
-=09=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
-=09=09=09=09      connector->base.id, connector->name,
-=09=09=09=09      old_epoch_counter, connector->epoch_counter);
+=09=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] "
+=09=09=09=09    "status updated from %s to %s\n",
+=09=09=09=09    connector->base.id,
+=09=09=09=09    connector->name,
+=09=09=09=09    old, new);
+=09=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n"=
,
+=09=09=09=09    connector->base.id, connector->name,
+=09=09=09=09    old_epoch_counter, connector->epoch_counter);
=20
 =09=09=09changed =3D true;
 =09=09}
diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 85c79a38c13a..8f4abcb1cbd8 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -228,9 +228,9 @@ EXPORT_SYMBOL(drm_rect_calc_vscale);
 void drm_rect_debug_print(const char *prefix, const struct drm_rect *r, bo=
ol fixed_point)
 {
 =09if (fixed_point)
-=09=09DRM_DEBUG_KMS("%s" DRM_RECT_FP_FMT "\n", prefix, DRM_RECT_FP_ARG(r))=
;
+=09=09drm_dbg_kms(NULL, "%s" DRM_RECT_FP_FMT "\n", prefix, DRM_RECT_FP_ARG=
(r));
 =09else
-=09=09DRM_DEBUG_KMS("%s" DRM_RECT_FMT "\n", prefix, DRM_RECT_ARG(r));
+=09=09drm_dbg_kms(NULL, "%s" DRM_RECT_FMT "\n", prefix, DRM_RECT_ARG(r));
 }
 EXPORT_SYMBOL(drm_rect_debug_print);
=20
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b7c6754b4688..0edd0df29cb3 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -209,10 +209,10 @@ static ssize_t status_store(struct device *device,
 =09=09ret =3D -EINVAL;
=20
 =09if (old_force !=3D connector->force || !connector->force) {
-=09=09DRM_DEBUG_KMS("[CONNECTOR:%d:%s] force updated from %d to %d or repr=
obing\n",
-=09=09=09      connector->base.id,
-=09=09=09      connector->name,
-=09=09=09      old_force, connector->force);
+=09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] force updated from %d to %d or r=
eprobing\n",
+=09=09=09    connector->base.id,
+=09=09=09    connector->name,
+=09=09=09    old_force, connector->force);
=20
 =09=09connector->funcs->fill_modes(connector,
 =09=09=09=09=09     dev->mode_config.max_width,
--=20
2.39.2


