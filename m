Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BE66106E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 18:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209110E337;
	Sat,  7 Jan 2023 17:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DF110E1A9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 17:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1673112192; cv=none; d=zohomail.in; s=zohoarc; 
 b=OvJ/K1tYG9hrdhNSFaZhuNFES0p5ZVbnbuofdK0Vf7V6TpS7x4DxktgL1/cynCo5h5Ia4g+pcUl7Dg8fQvkCl1OPEwkv47fv91vyCsW7bSU0mEwY5rwMfk4NDKLbNQCbFfKA0kcnqN8NbfVTHNqCi39WMU43sR9HfMZDf+xgcDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1673112192;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=4B/yhGIoBjfbicria+SnqvD0RZrkccqeOcCw0+ipmeg=; 
 b=Ih5VfdGZWWJ/lqFZQEDBvDPnAoXJRWSHd7IKPUT96/o5HrbKIAZkgT5BZtXDLrGt4P9KG/lE9H4ZT73pC6dUz58rN9I8vug0FzSNiW+ktHiB+g+s8MNWAiswXYyeO15nab5fB3MXRG8Y14aYwJVjUZ6uExt0grLwG6aqSf0gW+k=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673112192; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=4B/yhGIoBjfbicria+SnqvD0RZrkccqeOcCw0+ipmeg=;
 b=i6+6PGK+w7l/HhrUNhQ1WoycvuRU2Wm24uLeyRFkHu9AzwimY63c/LDverKKoNNf
 NnnM+lqkmd7e7Abl6o8WpSAbeAD4ZTmWcmdLrhpVk1bVkbr9yxL1rSAtoMuZX0IKnOr
 N+EoQ0siZFIBJgR/ePW7/bfog6lkxMVI/XKYL/gU=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1673112190429279.6322489615774;
 Sat, 7 Jan 2023 22:53:10 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Jim Cromie <jim.cromie@gmail.com>
Message-ID: <e6a6580b44cd2a1b2ed4946fce010172777033b5.1673110890.git.code@siddh.me>
Subject: [PATCH v5 10/10] drm/drm_lease: Remove usage of deprecated
 DRM_DEBUG_LEASE
Date: Sat,  7 Jan 2023 22:52:30 +0530
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673110890.git.code@siddh.me>
References: <cover.1673110890.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_LEASE is deprecated in favor of
drm_dbg_lease().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_lease.c | 64 ++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index c442d5e766d1..08b4f29f8b61 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -213,11 +213,11 @@ static struct drm_master *drm_lease_create(struct drm=
_master *lessor, struct idr
 =09int id;
 =09void *entry;
=20
-=09DRM_DEBUG_LEASE("lessor %d\n", lessor->lessee_id);
+=09drm_dbg_lease(dev, "lessor %d\n", lessor->lessee_id);
=20
 =09lessee =3D drm_master_create(lessor->dev);
 =09if (!lessee) {
-=09=09DRM_DEBUG_LEASE("drm_master_create failed\n");
+=09=09drm_dbg_lease(dev, "drm_master_create failed\n");
 =09=09return ERR_PTR(-ENOMEM);
 =09}
=20
@@ -231,7 +231,7 @@ static struct drm_master *drm_lease_create(struct drm_m=
aster *lessor, struct idr
 =09=09=09error =3D -EBUSY;
=20
 =09=09if (error !=3D 0) {
-=09=09=09DRM_DEBUG_LEASE("object %d failed %d\n", object, error);
+=09=09=09drm_dbg_lease(dev, "object %d failed %d\n", object, error);
 =09=09=09goto out_lessee;
 =09=09}
 =09}
@@ -249,7 +249,8 @@ static struct drm_master *drm_lease_create(struct drm_m=
aster *lessor, struct idr
=20
 =09/* Move the leases over */
 =09lessee->leases =3D *leases;
-=09DRM_DEBUG_LEASE("new lessee %d %p, lessor %d %p\n", lessee->lessee_id, =
lessee, lessor->lessee_id, lessor);
+=09drm_dbg_lease(dev, "new lessee %d %p, lessor %d %p\n",
+=09=09      lessee->lessee_id, lessee, lessor->lessee_id, lessor);
=20
 =09mutex_unlock(&dev->mode_config.idr_mutex);
 =09return lessee;
@@ -268,7 +269,7 @@ void drm_lease_destroy(struct drm_master *master)
=20
 =09mutex_lock(&dev->mode_config.idr_mutex);
=20
-=09DRM_DEBUG_LEASE("drm_lease_destroy %d\n", master->lessee_id);
+=09drm_dbg_lease(dev, "drm_lease_destroy %d\n", master->lessee_id);
=20
 =09/* This master is referenced by all lessees, hence it cannot be destroy=
ed
 =09 * until all of them have been
@@ -277,7 +278,8 @@ void drm_lease_destroy(struct drm_master *master)
=20
 =09/* Remove this master from the lessee idr in the owner */
 =09if (master->lessee_id !=3D 0) {
-=09=09DRM_DEBUG_LEASE("remove master %d from device list of lessees\n", ma=
ster->lessee_id);
+=09=09drm_dbg_lease(dev, "remove master %d from device list of lessees\n",
+=09=09=09      master->lessee_id);
 =09=09idr_remove(&(drm_lease_owner(master)->lessee_idr), master->lessee_id=
);
 =09}
=20
@@ -292,7 +294,7 @@ void drm_lease_destroy(struct drm_master *master)
 =09=09drm_master_put(&master->lessor);
 =09}
=20
-=09DRM_DEBUG_LEASE("drm_lease_destroy done %d\n", master->lessee_id);
+=09drm_dbg_lease(dev, "drm_lease_destroy done %d\n", master->lessee_id);
 }
=20
 static void _drm_lease_revoke(struct drm_master *top)
@@ -308,7 +310,8 @@ static void _drm_lease_revoke(struct drm_master *top)
 =09 * the tree is fully connected, we can do this without recursing
 =09 */
 =09for (;;) {
-=09=09DRM_DEBUG_LEASE("revoke leases for %p %d\n", master, master->lessee_=
id);
+=09=09drm_dbg_lease(master->dev, "revoke leases for %p %d\n",
+=09=09=09      master, master->lessee_id);
=20
 =09=09/* Evacuate the lease */
 =09=09idr_for_each_entry(&master->leases, entry, object)
@@ -408,7 +411,7 @@ static int fill_object_idr(struct drm_device *dev,
=20
 =09ret =3D validate_lease(dev, object_count, objects, universal_planes);
 =09if (ret) {
-=09=09DRM_DEBUG_LEASE("lease validation failed\n");
+=09=09drm_dbg_lease(dev, "lease validation failed\n");
 =09=09goto out_free_objects;
 =09}
=20
@@ -418,7 +421,7 @@ static int fill_object_idr(struct drm_device *dev,
 =09=09struct drm_mode_object *obj =3D objects[o];
 =09=09u32 object_id =3D objects[o]->id;
=20
-=09=09DRM_DEBUG_LEASE("Adding object %d to lease\n", object_id);
+=09=09drm_dbg_lease(dev, "Adding object %d to lease\n", object_id);
=20
 =09=09/*
 =09=09 * We're using an IDR to hold the set of leased
@@ -430,8 +433,8 @@ static int fill_object_idr(struct drm_device *dev,
 =09=09 */
 =09=09ret =3D idr_alloc(leases, &drm_lease_idr_object , object_id, object_=
id + 1, GFP_KERNEL);
 =09=09if (ret < 0) {
-=09=09=09DRM_DEBUG_LEASE("Object %d cannot be inserted into leases (%d)\n"=
,
-=09=09=09=09=09object_id, ret);
+=09=09=09drm_dbg_lease(dev, "Object %d cannot be inserted into leases (%d)=
\n",
+=09=09=09=09      object_id, ret);
 =09=09=09goto out_free_objects;
 =09=09}
 =09=09if (obj->type =3D=3D DRM_MODE_OBJECT_CRTC && !universal_planes) {
@@ -439,15 +442,15 @@ static int fill_object_idr(struct drm_device *dev,
=20
 =09=09=09ret =3D idr_alloc(leases, &drm_lease_idr_object, crtc->primary->b=
ase.id, crtc->primary->base.id + 1, GFP_KERNEL);
 =09=09=09if (ret < 0) {
-=09=09=09=09DRM_DEBUG_LEASE("Object primary plane %d cannot be inserted in=
to leases (%d)\n",
-=09=09=09=09=09=09object_id, ret);
+=09=09=09=09drm_dbg_lease(dev, "Object primary plane %d cannot be inserted=
 into leases (%d)\n",
+=09=09=09=09=09      object_id, ret);
 =09=09=09=09goto out_free_objects;
 =09=09=09}
 =09=09=09if (crtc->cursor) {
 =09=09=09=09ret =3D idr_alloc(leases, &drm_lease_idr_object, crtc->cursor-=
>base.id, crtc->cursor->base.id + 1, GFP_KERNEL);
 =09=09=09=09if (ret < 0) {
-=09=09=09=09=09DRM_DEBUG_LEASE("Object cursor plane %d cannot be inserted =
into leases (%d)\n",
-=09=09=09=09=09=09=09object_id, ret);
+=09=09=09=09=09drm_dbg_lease(dev, "Object cursor plane %d cannot be insert=
ed into leases (%d)\n",
+=09=09=09=09=09=09      object_id, ret);
 =09=09=09=09=09goto out_free_objects;
 =09=09=09=09}
 =09=09=09}
@@ -490,14 +493,14 @@ int drm_mode_create_lease_ioctl(struct drm_device *de=
v,
 =09=09return -EOPNOTSUPP;
=20
 =09if (cl->flags && (cl->flags & ~(O_CLOEXEC | O_NONBLOCK))) {
-=09=09DRM_DEBUG_LEASE("invalid flags\n");
+=09=09drm_dbg_lease(dev, "invalid flags\n");
 =09=09return -EINVAL;
 =09}
=20
 =09lessor =3D drm_file_get_master(lessor_priv);
 =09/* Do not allow sub-leases */
 =09if (lessor->lessor) {
-=09=09DRM_DEBUG_LEASE("recursive leasing not allowed\n");
+=09=09drm_dbg_lease(dev, "recursive leasing not allowed\n");
 =09=09ret =3D -EINVAL;
 =09=09goto out_lessor;
 =09}
@@ -520,7 +523,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 =09=09=09=09      object_count, object_ids);
 =09=09kfree(object_ids);
 =09=09if (ret) {
-=09=09=09DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
+=09=09=09drm_dbg_lease(dev, "lease object lookup failed: %i\n", ret);
 =09=09=09idr_destroy(&leases);
 =09=09=09goto out_lessor;
 =09=09}
@@ -534,7 +537,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 =09=09goto out_lessor;
 =09}
=20
-=09DRM_DEBUG_LEASE("Creating lease\n");
+=09drm_dbg_lease(dev, "Creating lease\n");
 =09/* lessee will take the ownership of leases */
 =09lessee =3D drm_lease_create(lessor, &leases);
=20
@@ -545,7 +548,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 =09}
=20
 =09/* Clone the lessor file to create a new file for us */
-=09DRM_DEBUG_LEASE("Allocating lease file\n");
+=09drm_dbg_lease(dev, "Allocating lease file\n");
 =09lessee_file =3D file_clone_open(lessor_file);
 =09if (IS_ERR(lessee_file)) {
 =09=09ret =3D PTR_ERR(lessee_file);
@@ -560,7 +563,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 =09lessee_priv->authenticated =3D 1;
=20
 =09/* Pass fd back to userspace */
-=09DRM_DEBUG_LEASE("Returning fd %d id %d\n", fd, lessee->lessee_id);
+=09drm_dbg_lease(dev, "Returning fd %d id %d\n", fd, lessee->lessee_id);
 =09cl->fd =3D fd;
 =09cl->lessee_id =3D lessee->lessee_id;
=20
@@ -568,7 +571,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 =09fd_install(fd, lessee_file);
=20
 =09drm_master_put(&lessor);
-=09DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
+=09drm_dbg_lease(dev, "drm_mode_create_lease_ioctl succeeded\n");
 =09return 0;
=20
 out_lessee:
@@ -579,7 +582,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
=20
 out_lessor:
 =09drm_master_put(&lessor);
-=09DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
+=09drm_dbg_lease(dev, "drm_mode_create_lease_ioctl failed: %d\n", ret);
 =09return ret;
 }
=20
@@ -601,7 +604,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 =09=09return -EOPNOTSUPP;
=20
 =09lessor =3D drm_file_get_master(lessor_priv);
-=09DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
+=09drm_dbg_lease(dev, "List lessees for %d\n", lessor->lessee_id);
=20
 =09mutex_lock(&dev->mode_config.idr_mutex);
=20
@@ -610,7 +613,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 =09=09/* Only list un-revoked leases */
 =09=09if (!idr_is_empty(&lessee->leases)) {
 =09=09=09if (count_lessees > count) {
-=09=09=09=09DRM_DEBUG_LEASE("Add lessee %d\n", lessee->lessee_id);
+=09=09=09=09drm_dbg_lease(dev, "Add lessee %d\n",
+=09=09=09=09=09      lessee->lessee_id);
 =09=09=09=09ret =3D put_user(lessee->lessee_id, lessee_ids + count);
 =09=09=09=09if (ret)
 =09=09=09=09=09break;
@@ -619,7 +623,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 =09=09}
 =09}
=20
-=09DRM_DEBUG_LEASE("Lessor leases to %d\n", count);
+=09drm_dbg_lease(dev, "Lessor leases to %d\n", count);
 =09if (ret =3D=3D 0)
 =09=09arg->count_lessees =3D count;
=20
@@ -651,7 +655,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 =09=09return -EOPNOTSUPP;
=20
 =09lessee =3D drm_file_get_master(lessee_priv);
-=09DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
+=09drm_dbg_lease(dev, "get lease for %d\n", lessee->lessee_id);
=20
 =09mutex_lock(&dev->mode_config.idr_mutex);
=20
@@ -665,7 +669,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 =09count =3D 0;
 =09idr_for_each_entry(object_idr, entry, object) {
 =09=09if (count_objects > count) {
-=09=09=09DRM_DEBUG_LEASE("adding object %d\n", object);
+=09=09=09drm_dbg_lease(dev, "adding object %d\n", object);
 =09=09=09ret =3D put_user(object, object_ids + count);
 =09=09=09if (ret)
 =09=09=09=09break;
@@ -696,7 +700,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
 =09struct drm_master *lessee;
 =09int ret =3D 0;
=20
-=09DRM_DEBUG_LEASE("revoke lease for %d\n", arg->lessee_id);
+=09drm_dbg_lease(dev, "revoke lease for %d\n", arg->lessee_id);
=20
 =09/* Can't lease without MODESET */
 =09if (!drm_core_check_feature(dev, DRIVER_MODESET))
--=20
2.39.0


