Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB228604973
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE1510EAF9;
	Wed, 19 Oct 2022 14:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329310EAF9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:38:38 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666190316; x=1666449516;
 bh=JPUWG2IfP44W0EAKPYUg/6hM4CLQ9vdjk+OtIUIpV3M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=JOmAHr0N8VNtieBkYVyZeCrTxusBjJ00q/IYuNzUS1U+zM6DMUyh35hi5Ii95/dUn
 lYd+S/7AkfDLP0VcIwIzzIqK5tTyyBEofPJYyz9NkhFJTcjgFd+1l/kpZOEJv5Bj0U
 7F10M03EWxQobFfensJJYeGeCLYSwD+v6FK+pl5I/qp9faOplixzRAeuqS4AEevTC8
 QQZxM8kXx1xgb4FRAC2cmKVmLSEpF1QRwh4E55LYO75K7BNAsKgSp/DSUZqplb18kD
 5m73PrIH0vWHvjQhWzKthDy6kQ3N3jA9AtkUGiGxkTiTAq39bRoxviFUXGgLOfQr4E
 qvqiikkqKOscw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 7/7] drm/atomic: log errors in drm_mode_atomic_ioctl()
Message-ID: <20221019143736.267324-7-contact@emersion.fr>
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
 drivers/gpu/drm/drm_atomic_uapi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c
index b996351beb57..eb18ab4e6ef8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1397,11 +1397,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
=20
 =09=09obj =3D drm_mode_object_find(dev, file_priv, obj_id, DRM_MODE_OBJECT=
_ANY);
 =09=09if (!obj) {
+=09=09=09drm_dbg_atomic(dev, "cannot find object ID %d", obj_id);
 =09=09=09ret =3D -ENOENT;
 =09=09=09goto out;
 =09=09}
=20
 =09=09if (!obj->properties) {
+=09=09=09drm_dbg_atomic(dev, "[OBJECT:%d] has no properties", obj_id);
 =09=09=09drm_mode_object_put(obj);
 =09=09=09ret =3D -ENOENT;
 =09=09=09goto out;
@@ -1428,6 +1430,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
=20
 =09=09=09prop =3D drm_mode_obj_find_prop_id(obj, prop_id);
 =09=09=09if (!prop) {
+=09=09=09=09drm_dbg_atomic(dev,
+=09=09=09=09=09       "[OBJECT:%d] cannot find property ID %d",
+=09=09=09=09=09       obj_id, prop_id);
 =09=09=09=09drm_mode_object_put(obj);
 =09=09=09=09ret =3D -ENOENT;
 =09=09=09=09goto out;
--=20
2.38.0


