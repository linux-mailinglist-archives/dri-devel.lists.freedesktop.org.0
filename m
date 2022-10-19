Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09240604971
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632010EAFA;
	Wed, 19 Oct 2022 14:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBDE10F246
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:15 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190294; x=1666449494;
 bh=AJ/NhkKI17Ftil+Sy94WvvfneYSB2CFlvcaabqi8NjY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=fAqjS9KF+nV2DKrSKTp03jcytUjhsoRbeqy4UK3QGxzKlzg7wH4tJJ49u8BbnYiu7
 VzQwovnTyj244NxclseYSjMrLX+SigvVQYkZRq1llKb3e151vdpeHzmdEjo2hpmY7b
 59CF6AVZsrh0Mc5DELSgdprESa/dfnrAALFQp9+TgE9hcyTCABlEE77dBOYTe0rKw8
 A2iyLi/KmEnjfLvwgwsFrL//NY4du1IW4YDT6J6u+r/fIULs9Vb0PecG6EURLqI5/b
 dV4WGtO+gOZB+/QPTpr0V5VMYYZYuv5QIgxwhbLqU5yZ31SZXzQy9jUdIgLciv3FXm
 hc2AjrbKVsgHw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 4/7] drm/atomic: log when CRTC_ID prop value is invalid
Message-ID: <20221019143736.267324-4-contact@emersion.fr>
In-Reply-To: <20221019143736.267324-1-contact@emersion.fr>
References: <20221019143736.267324-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 39f3f491c148..5aa2ecd1af3d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -539,8 +539,12 @@ static int drm_atomic_plane_set_property(struct drm_pl=
ane *plane,
 =09} else if (property =3D=3D config->prop_crtc_id) {
 =09=09struct drm_crtc *crtc =3D drm_crtc_find(dev, file_priv, val);
=20
-=09=09if (val && !crtc)
+=09=09if (val && !crtc) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[PROP:%d:%s] cannot find CRTC with ID %llu\n",
+=09=09=09=09       property->base.id, property->name, val);
 =09=09=09return -EACCES;
+=09=09}
 =09=09return drm_atomic_set_crtc_for_plane(state, crtc);
 =09} else if (property =3D=3D config->prop_crtc_x) {
 =09=09state->crtc_x =3D U642I64(val);
@@ -695,8 +699,12 @@ static int drm_atomic_connector_set_property(struct dr=
m_connector *connector,
 =09if (property =3D=3D config->prop_crtc_id) {
 =09=09struct drm_crtc *crtc =3D drm_crtc_find(dev, file_priv, val);
=20
-=09=09if (val && !crtc)
+=09=09if (val && !crtc) {
+=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09       "[PROP:%d:%s] cannot find CRTC with ID %llu\n",
+=09=09=09=09       property->base.id, property->name, val);
 =09=09=09return -EACCES;
+=09=09}
 =09=09return drm_atomic_set_crtc_for_connector(state, crtc);
 =09} else if (property =3D=3D config->dpms_property) {
 =09=09/* setting DPMS property requires special handling, which
--=20
2.38.0


