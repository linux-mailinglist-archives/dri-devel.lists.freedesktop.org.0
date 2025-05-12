Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B6AB2F7B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 08:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACB210E2B5;
	Mon, 12 May 2025 06:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FE710E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 06:20:08 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-8ZdlnH7lPFugSdi1PgcIOw-1; Mon,
 12 May 2025 02:20:04 -0400
X-MC-Unique: 8ZdlnH7lPFugSdi1PgcIOw-1
X-Mimecast-MFC-AGG-ID: 8ZdlnH7lPFugSdi1PgcIOw_1747030802
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BFD601800877; Mon, 12 May 2025 06:20:02 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EB28519560B0; Mon, 12 May 2025 06:19:57 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 7/7] nouveau: add memcg integration
Date: Mon, 12 May 2025 16:12:13 +1000
Message-ID: <20250512061913.3522902-8-airlied@gmail.com>
In-Reply-To: <20250512061913.3522902-1-airlied@gmail.com>
References: <20250512061913.3522902-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q-w2PZN0GPrv7B4iQ1sPbkIEXd25c8Kl2zRDj12NKkM_1747030802
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

This just adds the memcg init and memcg placement flag support.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  | 5 +++--
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index 2016c1e7242f..6bd8d9ed9f35 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -450,13 +450,13 @@ nouveau_bo_placement_set(struct nouveau_bo *nvbo, uin=
t32_t domain,
 =09if (domain & NOUVEAU_GEM_DOMAIN_GART) {
 =09=09pl[*n].mem_type =3D TTM_PL_TT;
 =09=09pl[*n].flags =3D busy & NOUVEAU_GEM_DOMAIN_GART ?
-=09=09=09TTM_PL_FLAG_FALLBACK : 0;
+=09=09=09TTM_PL_FLAG_FALLBACK : TTM_PL_FLAG_MEMCG;
 =09=09(*n)++;
 =09}
 =09if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
 =09=09pl[*n].mem_type =3D TTM_PL_SYSTEM;
 =09=09pl[*n].flags =3D busy & NOUVEAU_GEM_DOMAIN_CPU ?
-=09=09=09TTM_PL_FLAG_FALLBACK : 0;
+=09=09=09TTM_PL_FLAG_FALLBACK : TTM_PL_FLAG_MEMCG;
 =09=09(*n)++;
 =09}
=20
@@ -814,6 +814,7 @@ nouveau_bo_evict_flags(struct ttm_buffer_object *bo, st=
ruct ttm_placement *pl)
 =09case TTM_PL_VRAM:
 =09=09nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_GART,
 =09=09=09=09=09 NOUVEAU_GEM_DOMAIN_CPU);
+=09=09nvbo->placements[0].flags &=3D ~TTM_PL_FLAG_MEMCG;
 =09=09break;
 =09default:
 =09=09nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_CPU, 0);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index 67e3c99de73a..56899c89bdd8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -87,6 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 =09=09return;
 =09}
=20
+=09mem_cgroup_put(nvbo->bo.memcg);
 =09ttm_bo_put(&nvbo->bo);
=20
 =09pm_runtime_mark_last_busy(dev);
@@ -254,6 +255,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int =
align, uint32_t domain,
 =09if (IS_ERR(nvbo))
 =09=09return PTR_ERR(nvbo);
=20
+=09nvbo->bo.memcg =3D get_mem_cgroup_from_mm(current->mm);
 =09nvbo->bo.base.funcs =3D &nouveau_gem_object_funcs;
 =09nvbo->no_share =3D domain & NOUVEAU_GEM_DOMAIN_NO_SHARE;
=20
--=20
2.49.0

