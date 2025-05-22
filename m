Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A965AC04E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 08:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007AC9B06F;
	Thu, 22 May 2025 06:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD9596096
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:55:50 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-e2VX1uTNPMuK6JOgmgZMaQ-1; Thu,
 22 May 2025 02:55:46 -0400
X-MC-Unique: e2VX1uTNPMuK6JOgmgZMaQ-1
X-Mimecast-MFC-AGG-ID: e2VX1uTNPMuK6JOgmgZMaQ_1747896945
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8D620180034E; Thu, 22 May 2025 06:55:45 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B03041958014; Thu, 22 May 2025 06:55:43 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/9] iosys: hide internal details of implementation.
Date: Thu, 22 May 2025 16:52:17 +1000
Message-ID: <20250522065519.318013-9-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
References: <20250522065519.318013-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C3tbO5jmNYS4yRYyAfnn3UKcRBJ3ym8rtdLCTshHp3s_1747896945
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

Now hide the current implementation details, to catch any new
users entering the tree and trying to trick us up.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 include/linux/iosys-map.h | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 5ce5df1db60a..a6c2cc9ca756 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -108,25 +108,25 @@
  */
 struct iosys_map {
 =09union {
-=09=09void __iomem *vaddr_iomem;
-=09=09void *vaddr;
+=09=09void __iomem *_vaddr_iomem;
+=09=09void *_vaddr;
 =09};
-=09bool is_iomem;
+=09bool _is_iomem;
 };
=20
 static inline bool iosys_map_is_iomem(const struct iosys_map *map)
 {
-=09return map->is_iomem;
+=09return map->_is_iomem;
 }
=20
 static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
 {
-=09return map->vaddr_iomem;
+=09return map->_vaddr_iomem;
 }
=20
 static inline void *iosys_map_ptr(const struct iosys_map *map)
 {
-       return map->vaddr;
+       return map->_vaddr;
 }
=20
 /**
@@ -135,8 +135,8 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
  */
 #define IOSYS_MAP_INIT_VADDR(vaddr_)=09\
 =09{=09=09=09=09\
-=09=09.vaddr =3D (vaddr_),=09\
-=09=09.is_iomem =3D false,=09\
+=09=09._vaddr =3D (vaddr_),=09\
+=09=09._is_iomem =3D false,=09\
 =09}
=20
 /**
@@ -145,8 +145,8 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
  */
 #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)=09\
 =09{=09=09=09=09=09=09\
-=09=09.vaddr_iomem =3D (vaddr_iomem_),=09=09\
-=09=09.is_iomem =3D true,=09=09=09\
+=09=09._vaddr_iomem =3D (vaddr_iomem_),=09=09\
+=09=09._is_iomem =3D true,=09=09=09\
 =09}
=20
 /**
@@ -197,8 +197,8 @@ static inline void *iosys_map_ptr(const struct iosys_ma=
p *map)
  */
 static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
 {
-=09map->vaddr =3D vaddr;
-=09map->is_iomem =3D false;
+=09map->_vaddr =3D vaddr;
+=09map->_is_iomem =3D false;
 }
=20
 /**
@@ -211,8 +211,8 @@ static inline void iosys_map_set_vaddr(struct iosys_map=
 *map, void *vaddr)
 static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
 =09=09=09=09=09     void __iomem *vaddr_iomem)
 {
-=09map->vaddr_iomem =3D vaddr_iomem;
-=09map->is_iomem =3D true;
+=09map->_vaddr_iomem =3D vaddr_iomem;
+=09map->_is_iomem =3D true;
 }
=20
 /**
@@ -229,12 +229,12 @@ static inline void iosys_map_set_vaddr_iomem(struct i=
osys_map *map,
 static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
 =09=09=09=09      const struct iosys_map *rhs)
 {
-=09if (lhs->is_iomem !=3D rhs->is_iomem)
+=09if (lhs->_is_iomem !=3D rhs->_is_iomem)
 =09=09return false;
-=09else if (lhs->is_iomem)
-=09=09return lhs->vaddr_iomem =3D=3D rhs->vaddr_iomem;
+=09else if (lhs->_is_iomem)
+=09=09return lhs->_vaddr_iomem =3D=3D rhs->_vaddr_iomem;
 =09else
-=09=09return lhs->vaddr =3D=3D rhs->vaddr;
+=09=09return lhs->_vaddr =3D=3D rhs->_vaddr;
 }
=20
 /**
@@ -279,11 +279,11 @@ static inline bool iosys_map_is_set(const struct iosy=
s_map *map)
  */
 static inline void iosys_map_clear(struct iosys_map *map)
 {
-=09if (map->is_iomem) {
-=09=09map->vaddr_iomem =3D NULL;
-=09=09map->is_iomem =3D false;
+=09if (map->_is_iomem) {
+=09=09map->_vaddr_iomem =3D NULL;
+=09=09map->_is_iomem =3D false;
 =09} else {
-=09=09map->vaddr =3D NULL;
+=09=09map->_vaddr =3D NULL;
 =09}
 }
=20
@@ -338,9 +338,9 @@ static inline void iosys_map_memcpy_from(void *dst, con=
st struct iosys_map *src,
 static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
 {
 =09if (iosys_map_is_iomem(map))
-=09=09map->vaddr_iomem +=3D incr;
+=09=09map->_vaddr_iomem +=3D incr;
 =09else
-=09=09map->vaddr +=3D incr;
+=09=09map->_vaddr +=3D incr;
 }
=20
 /**
--=20
2.49.0

