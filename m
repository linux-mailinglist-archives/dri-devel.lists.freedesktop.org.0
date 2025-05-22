Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEAAC04EB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24A299B05;
	Thu, 22 May 2025 06:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75FD9AFCE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:53 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-lJ1ZJiI8PmGye1zVo6DHww-1; Thu,
 22 May 2025 02:55:49 -0400
X-MC-Unique: lJ1ZJiI8PmGye1zVo6DHww-1
X-Mimecast-MFC-AGG-ID: lJ1ZJiI8PmGye1zVo6DHww_1747896948
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1AFAC180056F; Thu, 22 May 2025 06:55:48 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 439C21958014; Thu, 22 May 2025 06:55:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
Date: Thu, 22 May 2025 16:52:18 +1000
Message-ID: <20250522065519.318013-10-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Z4HMl9Xf743Bn3sEUn6jqjqquasLPTlEDK7wVCFv1Y_1747896948
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

This reduces this struct from 16 to 8 bytes, and it gets embedded
into a lot of things.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/iosys-map.h | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index a6c2cc9ca756..44479966ce24 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -99,29 +99,27 @@
  *=09iosys_map_incr(&map, len); // go to first byte after the memcpy
  */
=20
+#define _IOSYS_MAP_IS_IOMEM 1
 /**
  * struct iosys_map - Pointer to IO/system memory
  * @vaddr_iomem:=09The buffer's address if in I/O memory
  * @vaddr:=09=09The buffer's address if in system memory
- * @is_iomem:=09=09True if the buffer is located in I/O memory, or false
- *=09=09=09otherwise.
  */
 struct iosys_map {
 =09union {
 =09=09void __iomem *_vaddr_iomem;
 =09=09void *_vaddr;
 =09};
-=09bool _is_iomem;
 };
=20
 static inline bool iosys_map_is_iomem(const struct iosys_map *map)
 {
-=09return map->_is_iomem;
+=09return ((unsigned long)map->_vaddr) & _IOSYS_MAP_IS_IOMEM;
 }
=20
 static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
 {
-=09return map->_vaddr_iomem;
+=09return (void __iomem *)((unsigned long)map->_vaddr_iomem & ~_IOSYS_MAP_=
IS_IOMEM);
 }
=20
 static inline void *iosys_map_ptr(const struct iosys_map *map)
@@ -136,7 +134,6 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
 #define IOSYS_MAP_INIT_VADDR(vaddr_)=09\
 =09{=09=09=09=09\
 =09=09._vaddr =3D (vaddr_),=09\
-=09=09._is_iomem =3D false,=09\
 =09}
=20
 /**
@@ -145,8 +142,7 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
  */
 #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)=09\
 =09{=09=09=09=09=09=09\
-=09=09._vaddr_iomem =3D (vaddr_iomem_),=09=09\
-=09=09._is_iomem =3D true,=09=09=09\
+=09=09._vaddr_iomem =3D (void __iomem *)(((unsigned long)(vaddr_iomem_) | =
_IOSYS_MAP_IS_IOMEM)), \
 =09}
=20
 /**
@@ -198,7 +194,6 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
 static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
 {
 =09map->_vaddr =3D vaddr;
-=09map->_is_iomem =3D false;
 }
=20
 /**
@@ -211,8 +206,7 @@ static inline void iosys_map_set_vaddr(struct iosys_map=
 *map, void *vaddr)
 static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
 =09=09=09=09=09     void __iomem *vaddr_iomem)
 {
-=09map->_vaddr_iomem =3D vaddr_iomem;
-=09map->_is_iomem =3D true;
+=09map->_vaddr_iomem =3D (void __iomem *)((unsigned long)vaddr_iomem | _IO=
SYS_MAP_IS_IOMEM);
 }
=20
 /**
@@ -229,12 +223,9 @@ static inline void iosys_map_set_vaddr_iomem(struct io=
sys_map *map,
 static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
 =09=09=09=09      const struct iosys_map *rhs)
 {
-=09if (lhs->_is_iomem !=3D rhs->_is_iomem)
+=09if (lhs->_vaddr !=3D rhs->_vaddr)
 =09=09return false;
-=09else if (lhs->_is_iomem)
-=09=09return lhs->_vaddr_iomem =3D=3D rhs->_vaddr_iomem;
-=09else
-=09=09return lhs->_vaddr =3D=3D rhs->_vaddr;
+=09return true;
 }
=20
 /**
@@ -279,12 +270,7 @@ static inline bool iosys_map_is_set(const struct iosys=
_map *map)
  */
 static inline void iosys_map_clear(struct iosys_map *map)
 {
-=09if (map->_is_iomem) {
-=09=09map->_vaddr_iomem =3D NULL;
-=09=09map->_is_iomem =3D false;
-=09} else {
-=09=09map->_vaddr =3D NULL;
-=09}
+=09map->_vaddr =3D NULL;
 }
=20
 /**
--=20
2.49.0

