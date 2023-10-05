Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DD7B9D42
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CD410E407;
	Thu,  5 Oct 2023 13:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4419E10E3FD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1696511804; x=1696771004;
 bh=kOhBFGbS2ZUNUCtKZ9QVq8iSXvwvdmAts+CrHGCN9G0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=IG39VJj2RJoynxlAD55DeQgDSROnZS5Q8U04DVaZajX12F8Ng0GIc9rRDgFrZRmwE
 15F0vgAy13b2F6vHz9piDrhHdjtTiylBkhYR7N0/DYD7ez8/r4O0SLH2X8gMnmS1AO
 uoQ3BjT2bgtxwhle8W8yD5P66eItqx0qA5v03fXF552L6lL5zBGkYRakab3qT3LEc9
 bhV039CR2CVXe5YwX08ZNfFiSZrBnB8HFEuHez6tqyYWe3SWUiZdn7kwRDqXG2eY7C
 XLQf7qvbZhMSXOPGdHYYsoyx6+UpvySzdNUhQr/w4oow59/QyaKPa5+pI44VV+SaW8
 v7cxRYuods/Rw==
Date: Thu, 05 Oct 2023 13:16:32 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/atomic-helper: relax unregistered connector check
Message-ID: <20231005131623.114379-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver might pull connectors which weren't submitted by
user-space into the atomic state. For instance,
intel_dp_mst_atomic_master_trans_check() pulls in connectors
sharing the same DP-MST stream. However, if the connector is
unregistered, this later fails with:

    [  559.425658] i915 0000:00:02.0: [drm:drm_atomic_helper_check_modeset]=
 [CONNECTOR:378:DP-7] is not registered

Skip the unregistered connector check to allow user-space to turn
off connectors one-by-one.

See this wlroots issue:
https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3407

Previous discussion:
https://lore.kernel.org/intel-gfx/Y6GX7z17WmDSKwta@ideak-desk.fi.intel.com/

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c
index 71d399397107..c9b8343eaa20 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -290,7 +290,8 @@ static int
 update_connector_routing(struct drm_atomic_state *state,
 =09=09=09 struct drm_connector *connector,
 =09=09=09 struct drm_connector_state *old_connector_state,
-=09=09=09 struct drm_connector_state *new_connector_state)
+=09=09=09 struct drm_connector_state *new_connector_state,
+=09=09=09 bool added_by_user)
 {
 =09const struct drm_connector_helper_funcs *funcs;
 =09struct drm_encoder *new_encoder;
@@ -339,9 +340,13 @@ update_connector_routing(struct drm_atomic_state *stat=
e,
 =09 * there's a chance the connector may have been destroyed during the
 =09 * process, but it's better to ignore that then cause
 =09 * drm_atomic_helper_resume() to fail.
+=09 *
+=09 * Last, we want to ignore connector registration when the connector
+=09 * was not pulled in the atomic state by user-space (ie, was pulled
+=09 * in by the driver, e.g. when updating a DP-MST stream).
 =09 */
 =09if (!state->duplicated && drm_connector_is_unregistered(connector) &&
-=09    crtc_state->active) {
+=09    added_by_user && crtc_state->active) {
 =09=09drm_dbg_atomic(connector->dev,
 =09=09=09       "[CONNECTOR:%d:%s] is not registered\n",
 =09=09=09       connector->base.id, connector->name);
@@ -620,7 +625,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev=
,
 =09struct drm_connector *connector;
 =09struct drm_connector_state *old_connector_state, *new_connector_state;
 =09int i, ret;
-=09unsigned int connectors_mask =3D 0;
+=09unsigned int connectors_mask =3D 0, user_connectors_mask =3D 0;
+
+=09for_each_oldnew_connector_in_state(state, connector, old_connector_stat=
e, new_connector_state, i)
+=09=09user_connectors_mask |=3D BIT(i);
=20
 =09for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_sta=
te, i) {
 =09=09bool has_connectors =3D
@@ -685,7 +693,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 =09=09 */
 =09=09ret =3D update_connector_routing(state, connector,
 =09=09=09=09=09       old_connector_state,
-=09=09=09=09=09       new_connector_state);
+=09=09=09=09=09       new_connector_state,
+=09=09=09=09=09=09   BIT(i) & user_connectors_mask);
 =09=09if (ret)
 =09=09=09return ret;
 =09=09if (old_connector_state->crtc) {
--=20
2.42.0


