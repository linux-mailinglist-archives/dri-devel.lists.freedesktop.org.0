Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A3AA6979
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290A10E152;
	Fri,  2 May 2025 03:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516B310E152
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 03:41:31 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-dRAZkU2mPzmt0XtBGIKjtg-1; Thu,
 01 May 2025 23:41:27 -0400
X-MC-Unique: dRAZkU2mPzmt0XtBGIKjtg-1
X-Mimecast-MFC-AGG-ID: dRAZkU2mPzmt0XtBGIKjtg_1746157285
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B0241800879; Fri,  2 May 2025 03:41:25 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CCD5F1800871; Fri,  2 May 2025 03:41:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 4/5] amdgpu: add support for memcg integration
Date: Fri,  2 May 2025 13:36:03 +1000
Message-ID: <20250502034046.1625896-5-airlied@gmail.com>
In-Reply-To: <20250502034046.1625896-1-airlied@gmail.com>
References: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IJo4h6EehKc_WMUTgMzvKy2NXZ3SRyEF9HSitYES9bY_1746157285
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

This adds the memcg object for any user allocated object,
and adds account_op to necessary paths which might populate
a tt object.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     |  7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 14 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c
index 82df06a72ee0..1a275224b4a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -787,6 +787,7 @@ static int amdgpu_cs_bo_validate(void *param, struct am=
dgpu_bo *bo)
 =09struct ttm_operation_ctx ctx =3D {
 =09=09.interruptible =3D true,
 =09=09.no_wait_gpu =3D false,
+=09=09.account_op =3D true,
 =09=09.resv =3D bo->tbo.base.resv
 =09};
 =09uint32_t domain;
@@ -839,7 +840,11 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parse=
r *p,
 =09=09=09=09union drm_amdgpu_cs *cs)
 {
 =09struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
-=09struct ttm_operation_ctx ctx =3D { true, false };
+=09struct ttm_operation_ctx ctx =3D {
+=09=09.interruptible =3D true,
+=09=09.no_wait_gpu =3D false,
+=09=09.account_op =3D true,
+=09};
 =09struct amdgpu_vm *vm =3D &fpriv->vm;
 =09struct amdgpu_bo_list_entry *e;
 =09struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c
index 69429df09477..bdad9a862ed3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -89,6 +89,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object =
*gobj)
 =09struct amdgpu_bo *aobj =3D gem_to_amdgpu_bo(gobj);
=20
 =09amdgpu_hmm_unregister(aobj);
+=09mem_cgroup_put(aobj->tbo.memcg);
 =09ttm_bo_put(&aobj->tbo);
 }
=20
@@ -116,6 +117,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev=
, unsigned long size,
 =09bp.domain =3D initial_domain;
 =09bp.bo_ptr_size =3D sizeof(struct amdgpu_bo);
 =09bp.xcp_id_plus1 =3D xcp_id_plus1;
+=09bp.memcg =3D get_mem_cgroup_from_mm(current->mm);
=20
 =09r =3D amdgpu_bo_create_user(adev, &bp, &ubo);
 =09if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c
index 0b9987781f76..777cf05ebac8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -632,6 +632,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 =09struct ttm_operation_ctx ctx =3D {
 =09=09.interruptible =3D (bp->type !=3D ttm_bo_type_kernel),
 =09=09.no_wait_gpu =3D bp->no_wait_gpu,
+=09=09.account_op =3D true,
 =09=09/* We opt to avoid OOM on system pages allocations */
 =09=09.gfp_retry_mayfail =3D true,
 =09=09.allow_res_evict =3D bp->type !=3D ttm_bo_type_kernel,
@@ -657,16 +658,21 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 =09=09size =3D ALIGN(size, PAGE_SIZE);
 =09}
=20
-=09if (!amdgpu_bo_validate_size(adev, size, bp->domain))
+=09if (!amdgpu_bo_validate_size(adev, size, bp->domain)) {
+=09=09mem_cgroup_put(bp->memcg);
 =09=09return -ENOMEM;
+=09}
=20
 =09BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
=20
 =09*bo_ptr =3D NULL;
 =09bo =3D kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
-=09if (bo =3D=3D NULL)
+=09if (bo =3D=3D NULL) {
+=09=09mem_cgroup_put(bp->memcg);
 =09=09return -ENOMEM;
+=09}
 =09drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
+=09bo->tbo.memcg =3D bp->memcg;
 =09bo->tbo.base.funcs =3D &amdgpu_gem_object_funcs;
 =09bo->vm_bo =3D NULL;
 =09bo->preferred_domains =3D bp->preferred_domain ? bp->preferred_domain :
@@ -1341,7 +1347,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_objec=
t *bo)
 vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 {
 =09struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->bdev);
-=09struct ttm_operation_ctx ctx =3D { false, false };
+=09struct ttm_operation_ctx ctx =3D { .interruptible =3D false,
+=09=09=09=09=09 .no_wait_gpu =3D false,
+=09=09=09=09=09 .account_op =3D true };
 =09struct amdgpu_bo *abo =3D ttm_to_amdgpu_bo(bo);
 =09int r;
=20
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.h
index 375448627f7b..9a4c506cfb76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -55,6 +55,7 @@ struct amdgpu_bo_param {
 =09enum ttm_bo_type=09=09type;
 =09bool=09=09=09=09no_wait_gpu;
 =09struct dma_resv=09=09=09*resv;
+=09struct mem_cgroup               *memcg;
 =09void=09=09=09=09(*destroy)(struct ttm_buffer_object *bo);
 =09/* xcp partition number plus 1, 0 means any partition */
 =09int8_t=09=09=09=09xcp_id_plus1;
--=20
2.49.0

