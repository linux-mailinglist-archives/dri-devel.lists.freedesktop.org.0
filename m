Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EFAC04EE
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41799B03F;
	Thu, 22 May 2025 06:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9089E59
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:30 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-uH4PLwQKMQOvrusz5BZ3AA-1; Thu,
 22 May 2025 02:55:28 -0400
X-MC-Unique: uH4PLwQKMQOvrusz5BZ3AA-1
X-Mimecast-MFC-AGG-ID: uH4PLwQKMQOvrusz5BZ3AA_1747896927
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5A4ED1955D83; Thu, 22 May 2025 06:55:27 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7F99E1958014; Thu, 22 May 2025 06:55:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] iosys-map: add new accessor interfaces and use them
 internally.
Date: Thu, 22 May 2025 16:52:10 +1000
Message-ID: <20250522065519.318013-2-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IUGFl_-B9bkDjsbRWoZ-BDRSx1L-rlj8Sde8piBtBiw_1747896927
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

This adds accessors inlines to the iosys-map. The intent is to
roll the iomem flag into the lower bits of the vaddr eventually.

First just add accessors to move all current in-tree users over to.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/iosys-map.h | 53 +++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 4696abfd311c..5ce5df1db60a 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -114,6 +114,21 @@ struct iosys_map {
 =09bool is_iomem;
 };
=20
+static inline bool iosys_map_is_iomem(const struct iosys_map *map)
+{
+=09return map->is_iomem;
+}
+
+static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
+{
+=09return map->vaddr_iomem;
+}
+
+static inline void *iosys_map_ptr(const struct iosys_map *map)
+{
+       return map->vaddr;
+}
+
 /**
  * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an address in sy=
stem memory
  * @vaddr_:=09A system-memory address
@@ -234,9 +249,9 @@ static inline bool iosys_map_is_equal(const struct iosy=
s_map *lhs,
  */
 static inline bool iosys_map_is_null(const struct iosys_map *map)
 {
-=09if (map->is_iomem)
-=09=09return !map->vaddr_iomem;
-=09return !map->vaddr;
+=09if (iosys_map_is_iomem(map))
+=09=09return !iosys_map_ioptr(map);
+=09return !iosys_map_ptr(map);
 }
=20
 /**
@@ -286,10 +301,10 @@ static inline void iosys_map_clear(struct iosys_map *=
map)
 static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_o=
ffset,
 =09=09=09=09       const void *src, size_t len)
 {
-=09if (dst->is_iomem)
-=09=09memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
+=09if (iosys_map_is_iomem(dst))
+=09=09memcpy_toio(iosys_map_ioptr(dst) + dst_offset, src, len);
 =09else
-=09=09memcpy(dst->vaddr + dst_offset, src, len);
+=09=09memcpy(iosys_map_ptr(dst) + dst_offset, src, len);
 }
=20
 /**
@@ -306,10 +321,10 @@ static inline void iosys_map_memcpy_to(struct iosys_m=
ap *dst, size_t dst_offset,
 static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map=
 *src,
 =09=09=09=09=09 size_t src_offset, size_t len)
 {
-=09if (src->is_iomem)
-=09=09memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
+=09if (iosys_map_is_iomem(src))
+=09=09memcpy_fromio(dst, iosys_map_ioptr(src) + src_offset, len);
 =09else
-=09=09memcpy(dst, src->vaddr + src_offset, len);
+=09=09memcpy(dst, iosys_map_ptr(src) + src_offset, len);
 }
=20
 /**
@@ -322,7 +337,7 @@ static inline void iosys_map_memcpy_from(void *dst, con=
st struct iosys_map *src,
  */
 static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
 {
-=09if (map->is_iomem)
+=09if (iosys_map_is_iomem(map))
 =09=09map->vaddr_iomem +=3D incr;
 =09else
 =09=09map->vaddr +=3D incr;
@@ -341,10 +356,10 @@ static inline void iosys_map_incr(struct iosys_map *m=
ap, size_t incr)
 static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 =09=09=09=09    int value, size_t len)
 {
-=09if (dst->is_iomem)
-=09=09memset_io(dst->vaddr_iomem + offset, value, len);
+=09if (iosys_map_is_iomem(dst))
+=09=09memset_io(iosys_map_ioptr(dst) + offset, value, len);
 =09else
-=09=09memset(dst->vaddr + offset, value, len);
+=09=09memset(iosys_map_ptr(dst) + offset, value, len);
 }
=20
 #ifdef CONFIG_64BIT
@@ -393,10 +408,10 @@ static inline void iosys_map_memset(struct iosys_map =
*dst, size_t offset,
  */
 #define iosys_map_rd(map__, offset__, type__) ({=09=09=09=09=09\
 =09type__ val_;=09=09=09=09=09=09=09=09=09\
-=09if ((map__)->is_iomem) {=09=09=09=09=09=09=09\
-=09=09__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);=
=09\
+=09if (iosys_map_is_iomem(map__)) {=09=09=09=09=09=09\
+=09=09__iosys_map_rd_io(val_, iosys_map_ioptr(map__) + (offset__), type__)=
;=09\
 =09} else {=09=09=09=09=09=09=09=09=09\
-=09=09__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);=09=09=
\
+=09=09__iosys_map_rd_sys(val_, iosys_map_ptr(map__) + (offset__), type__);=
=09\
 =09}=09=09=09=09=09=09=09=09=09=09\
 =09val_;=09=09=09=09=09=09=09=09=09=09\
 })
@@ -415,10 +430,10 @@ static inline void iosys_map_memset(struct iosys_map =
*dst, size_t offset,
  */
 #define iosys_map_wr(map__, offset__, type__, val__) ({=09=09=09=09=09\
 =09type__ val_ =3D (val__);=09=09=09=09=09=09=09=09\
-=09if ((map__)->is_iomem) {=09=09=09=09=09=09=09\
-=09=09__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);=
=09\
+=09if (iosys_map_is_iomem(map__)) {=09=09=09=09=09=09\
+=09=09__iosys_map_wr_io(val_, iosys_map_ioptr(map__) + (offset__), type__)=
;=09\
 =09} else {=09=09=09=09=09=09=09=09=09\
-=09=09__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);=09=09=
\
+=09=09__iosys_map_wr_sys(val_, iosys_map_ptr(map__) + (offset__), type__);=
=09\
 =09}=09=09=09=09=09=09=09=09=09=09\
 })
=20
--=20
2.49.0

