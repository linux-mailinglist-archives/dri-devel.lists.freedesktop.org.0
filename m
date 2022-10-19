Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBD604969
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B17110F244;
	Wed, 19 Oct 2022 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008210F259
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:04 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190283; x=1666449483;
 bh=PDxabIOW9zboILGrHVwtaZSKqlTEi/EeacCbHYBWwm0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=EVqglfItFfSyWz9tFM17Xvidg8Tv49Cq12CnXH1MAcgTMgjkrNUe32uA1hMzWIzr8
 nH55kLLYE57DkJv/6BSw8MQ8Ctcuw+fBD6RYv0O24qMugzQwGiWClYRYJz4lT5qWL1
 KjLjf78HWCh2CUu4yC+bZVIHSPE8CKSZ3IWM0fH5YCzhROpkjU67eB1D2uX1tVCeEO
 3wRMMmZb4BhwU0cXYeL1CZJiYMYJOTrk+LlaR1w/559WilyOioNaWd6YckukJDM8LD
 jJLmA+5xhhPggxQ4iqTanmBUR0lY/AGAu9KK4qktJGSZdLLz6sJIc0pbDhYUUGxnAl
 aT39t8c68s8RQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/7] drm/atomic: log when getting/setting unknown properties
Message-ID: <20221019143736.267324-3-contact@emersion.fr>
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
 drivers/gpu/drm/drm_atomic_uapi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index 826cb2212b26..39f3f491c148 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -498,8 +498,13 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 =09=09*val =3D state->scaling_filter;
 =09else if (crtc->funcs->atomic_get_property)
 =09=09return crtc->funcs->atomic_get_property(crtc, state, property, val);
-=09else
+=09else {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
+=09=09=09       crtc->base.id, crtc->name,
+=09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
+=09}
=20
 =09return 0;
 }
@@ -645,6 +650,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 =09} else if (plane->funcs->atomic_get_property) {
 =09=09return plane->funcs->atomic_get_property(plane, state, property, val=
);
 =09} else {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
+=09=09=09       plane->base.id, plane->name,
+=09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
 =09}
=20
@@ -861,6 +870,10 @@ drm_atomic_connector_get_property(struct drm_connector=
 *connector,
 =09=09return connector->funcs->atomic_get_property(connector,
 =09=09=09=09state, property, val);
 =09} else {
+=09=09drm_dbg_atomic(dev,
+=09=09=09       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]\n",
+=09=09=09       connector->base.id, connector->name,
+=09=09=09       property->base.id, property->name);
 =09=09return -EINVAL;
 =09}
=20
@@ -899,6 +912,7 @@ int drm_atomic_get_property(struct drm_mode_object *obj=
,
 =09=09break;
 =09}
 =09default:
+=09=09drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
 =09=09ret =3D -EINVAL;
 =09=09break;
 =09}
@@ -1035,6 +1049,7 @@ int drm_atomic_set_property(struct drm_atomic_state *=
state,
 =09=09break;
 =09}
 =09default:
+=09=09drm_dbg_atomic(prop->dev, "[OBJECT:%d] has no properties\n", obj->id=
);
 =09=09ret =3D -EINVAL;
 =09=09break;
 =09}
--=20
2.38.0


