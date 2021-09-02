Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA23FEAFB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 11:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3F26E497;
	Thu,  2 Sep 2021 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB036E497
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 09:11:54 +0000 (UTC)
Date: Thu, 02 Sep 2021 09:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630573911;
 bh=IeKFquLOkYg8xBkDVgO6TgOkTaCu1dEVC4MZVq4Iehg=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=EnLOlea6mrfkReBiuHGYkthOpSorShO45AaS5qeDjyb6RI/K90yLSX8FSrDL1QMoL
 ralyKD+W/hTrxlma0EFmcK0hXjFSnHYEUfiLpDf3Ru0w8sLCgxMpAoDCkfTL16Yn/M
 LgQpEKHkReXKV4kkXHECkbfPO+GJrxJStiMB2+tI+Az1rhHWz1XutC3MOLvlbgSyKv
 Zd0b+kYN2lYdAbRTJaGI9BobUDFsppEr+XdV/uTcIAVFux+bspPpeF7tMlF1wwxLC1
 Hv2d8QxGvtjVcz8uomZC4S3vBo4hLMR4sGSa+FzqkDd5b+8VHu36O9JjGwqHXbPDxD
 5MXXkspY5vGdQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/lease: allow empty leases
Message-ID: <20210902091126.2312-1-contact@emersion.fr>
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

This can be used to create a separate DRM file description, thus
creating a new GEM handle namespace. See [1].

Example usage in wlroots is available at [2].

[1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
[2]: https://github.com/swaywm/wlroots/pull/3158

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Michel D=C3=A4nzer <michel@daenzer.net>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Keith Packard <keithp@keithp.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_lease.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..d72c2fac0ff1 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -489,12 +489,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev=
,
 =09if (!drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09return -EOPNOTSUPP;
=20
-=09/* need some objects */
-=09if (cl->object_count =3D=3D 0) {
-=09=09DRM_DEBUG_LEASE("no objects in lease\n");
-=09=09return -EINVAL;
-=09}
-
 =09if (cl->flags && (cl->flags & ~(O_CLOEXEC | O_NONBLOCK))) {
 =09=09DRM_DEBUG_LEASE("invalid flags\n");
 =09=09return -EINVAL;
@@ -510,23 +504,26 @@ int drm_mode_create_lease_ioctl(struct drm_device *de=
v,
=20
 =09object_count =3D cl->object_count;
=20
-=09object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
-=09=09=09array_size(object_count, sizeof(__u32)));
-=09if (IS_ERR(object_ids)) {
-=09=09ret =3D PTR_ERR(object_ids);
-=09=09goto out_lessor;
-=09}
-
+=09/* Handle leased objects, if any */
 =09idr_init(&leases);
+=09if (object_count !=3D 0) {
+=09=09object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
+=09=09=09=09=09 array_size(object_count, sizeof(__u32)));
+=09=09if (IS_ERR(object_ids)) {
+=09=09=09ret =3D PTR_ERR(object_ids);
+=09=09=09idr_destroy(&leases);
+=09=09=09goto out_lessor;
+=09=09}
=20
-=09/* fill and validate the object idr */
-=09ret =3D fill_object_idr(dev, lessor_priv, &leases,
-=09=09=09      object_count, object_ids);
-=09kfree(object_ids);
-=09if (ret) {
-=09=09DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
-=09=09idr_destroy(&leases);
-=09=09goto out_lessor;
+=09=09/* fill and validate the object idr */
+=09=09ret =3D fill_object_idr(dev, lessor_priv, &leases,
+=09=09=09=09      object_count, object_ids);
+=09=09kfree(object_ids);
+=09=09if (ret) {
+=09=09=09DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
+=09=09=09idr_destroy(&leases);
+=09=09=09goto out_lessor;
+=09=09}
 =09}
=20
 =09/* Allocate a file descriptor for the lease */
--=20
2.33.0


