Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98933D092E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 08:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B616E90A;
	Wed, 21 Jul 2021 06:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD05B6E90A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:49:40 +0000 (UTC)
Date: Wed, 21 Jul 2021 06:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1626850177;
 bh=8mug2TdzWrgrCG50/7cDxViq7+ytWS/Aq1BXN5MufR0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=XxJTulcCnKocrCIYtzgofEK9lsIzAI06MnHg2FIfcTGOKuG4tnJDltUHZinwGFjF8
 yEzN6MsrXhWRJalIZ7cxPiDzAtoUnUopV6cCtJH9F3/suRly+QXJJAgCm/YElAJ2pI
 QrhBwybR4XUrqBB+zRUMh5sRbAe4L7G/5vKVLaMG0CmkvR1pY06EVwT6GVWdJJqMPf
 AnrUwETiWYqkjQkoQmJiCvJmVmnj/T5E2v2L9DpeCi/Jjk95bWmdjTjoBHQvNiVysR
 koc46Cn/JKfQquvWqjXZukvxwS3LPzM2RgL4tuDFv5fNX2LKV5ruYOS8hd3WTKm4//
 TpiXbbSg7n7vA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document drm_mode_get_property
Message-ID: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not obvious what the fields mean and how they should be used.
The most important detail is the link to drm_property.flags, which
describes how property types work.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/uapi/drm/drm_mode.h | 52 ++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 98bf130feda5..dfdb595875aa 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -546,17 +546,61 @@ struct drm_mode_property_enum {
 =09char name[DRM_PROP_NAME_LEN];
 };
=20
+/**
+ * struct drm_mode_get_property - Get property metadata.
+ *
+ * User-space can perform a GETPROPERTY ioctl to retrieve information abou=
t a
+ * property.
+ *
+ * The meaning of the @values_ptr field changes depending on the property =
type.
+ * See &drm_property.flags for more details.
+ *
+ * The @enum_blob_ptr and @count_enum_blobs fields are only meaningful whe=
n the
+ * property has the type &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK. Fo=
r
+ * backwards compatibility, the kernel will always set @count_enum_blobs t=
o
+ * zero when the property has the type &DRM_MODE_PROP_BLOB. User-space mus=
t
+ * ignore these two fields if the property has a different type.
+ *
+ * User-space is expected to retrieve values and enums by performing this =
ioctl
+ * at least twice: the first time to retrieve the number of elements, the
+ * second time to retrieve the elements themselves.
+ *
+ * To retrieve the number of elements, set @count_values and @count_enum_b=
lobs
+ * to zero, then call the ioctl. @count_values will be updated with the nu=
mber
+ * of elements. If the property has the type &DRM_MODE_PROP_ENUM or
+ * &DRM_MODE_PROP_BITMASK, @count_enum_blobs will be updated as well.
+ *
+ * To retrieve the elements themselves, allocate an array for @values_ptr =
and
+ * set @count_values to its capacity. If the property has the type
+ * &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK, allocate an array for
+ * @enum_blob_ptr and set @count_enum_blobs to its capacity. Calling the i=
octl
+ * again will fill the arrays.
+ */
 struct drm_mode_get_property {
-=09__u64 values_ptr; /* values and blob lengths */
-=09__u64 enum_blob_ptr; /* enum and blob id ptrs */
+=09/** @values_ptr: Pointer to a ``__u64`` array. */
+=09__u64 values_ptr;
+=09/** @enum_blob_ptr: Pointer to a struct drm_mode_property_enum array. *=
/
+=09__u64 enum_blob_ptr;
=20
+=09/**
+=09 * @prop_id: Object ID of the property which should be retrieved. Set
+=09 * by the caller.
+=09 */
 =09__u32 prop_id;
+=09/**
+=09 * @flags: ``DRM_MODE_PROP_*`` bitfield. See &drm_property.flags for
+=09 * a definition of the flags.
+=09 */
 =09__u32 flags;
+=09/**
+=09 * @name: Symbolic property name. User-space should use this field to
+=09 * recognize properties.
+=09 */
 =09char name[DRM_PROP_NAME_LEN];
=20
+=09/** @count_values: Number of elements in @values_ptr. */
 =09__u32 count_values;
-=09/* This is only used to count enum values, not blobs. The _blobs is
-=09 * simply because of a historical reason, i.e. backwards compat. */
+=09/** @count_enum_blobs: Number of elements in @enum_blob_ptr. */
 =09__u32 count_enum_blobs;
 };
=20
--=20
2.32.0


