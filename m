Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK5HIrMInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E32180EB2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5910E479;
	Tue, 24 Feb 2026 02:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462510E479
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:10:56 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-Gu23DrAwPaW1DJz4qCirLA-1; Mon,
 23 Feb 2026 21:10:50 -0500
X-MC-Unique: Gu23DrAwPaW1DJz4qCirLA-1
X-Mimecast-MFC-AGG-ID: Gu23DrAwPaW1DJz4qCirLA_1771899048
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 580981956078; Tue, 24 Feb 2026 02:10:48 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 221763003D91; Tue, 24 Feb 2026 02:10:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 14/16] amdgpu: add support for memory cgroups
Date: Tue, 24 Feb 2026 12:06:31 +1000
Message-ID: <20260224020854.791201-15-airlied@gmail.com>
In-Reply-To: <20260224020854.791201-1-airlied@gmail.com>
References: <20260224020854.791201-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OWA04P2Fyl5ROpB_N9Ny3FquuUEPFL3sbOr9TPFc7bs_1771899048
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04E32180EB2
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

This adds support for adding a obj cgroup to a buffer object,
and passing in the placement flags to make sure it's accounted
properly.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  3 +++
 mm/memcontrol.c                            |  1 +
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c
index a6107109a2b8..d067e8565400 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -184,6 +184,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev=
, unsigned long size,
 =09bp.domain =3D initial_domain;
 =09bp.bo_ptr_size =3D sizeof(struct amdgpu_bo);
 =09bp.xcp_id_plus1 =3D xcp_id_plus1;
+=09bp.objcg =3D get_obj_cgroup_from_current();
=20
 =09r =3D amdgpu_bo_create_user(adev, &bp, &ubo);
 =09if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c
index 1fb956400696..248e9c5554de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -159,7 +159,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *=
abo, u32 domain)
 =09=09places[c].mem_type =3D
 =09=09=09abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 =09=09=09AMDGPU_PL_PREEMPT : TTM_PL_TT;
-=09=09places[c].flags =3D 0;
+=09=09places[c].flags =3D TTM_PL_FLAG_MEMCG;
 =09=09/*
 =09=09 * When GTT is just an alternative to VRAM make sure that we
 =09=09 * only use it as fallback and still try to fill up VRAM first.
@@ -174,7 +174,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *=
abo, u32 domain)
 =09=09places[c].fpfn =3D 0;
 =09=09places[c].lpfn =3D 0;
 =09=09places[c].mem_type =3D TTM_PL_SYSTEM;
-=09=09places[c].flags =3D 0;
+=09=09places[c].flags =3D TTM_PL_FLAG_MEMCG;
 =09=09c++;
 =09}
=20
@@ -654,16 +654,21 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 =09=09size =3D ALIGN(size, PAGE_SIZE);
 =09}
=20
-=09if (!amdgpu_bo_validate_size(adev, size, bp->domain))
+=09if (!amdgpu_bo_validate_size(adev, size, bp->domain)) {
+=09=09obj_cgroup_put(bp->objcg);
 =09=09return -ENOMEM;
+=09}
=20
 =09BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
=20
 =09*bo_ptr =3D NULL;
 =09bo =3D kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
-=09if (bo =3D=3D NULL)
+=09if (bo =3D=3D NULL) {
+=09=09obj_cgroup_put(bp->objcg);
 =09=09return -ENOMEM;
+=09}
 =09drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
+=09ttm_bo_set_cgroup(&bo->tbo, bp->objcg); /* hand the reference to the tt=
m bo */
 =09bo->tbo.base.funcs =3D &amdgpu_gem_object_funcs;
 =09bo->vm_bo =3D NULL;
 =09bo->preferred_domains =3D bp->preferred_domain ? bp->preferred_domain :
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.h
index 912c9afaf9e1..b03c34ce7809 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -55,6 +55,7 @@ struct amdgpu_bo_param {
 =09enum ttm_bo_type=09=09type;
 =09bool=09=09=09=09no_wait_gpu;
 =09struct dma_resv=09=09=09*resv;
+=09struct obj_cgroup               *objcg;
 =09void=09=09=09=09(*destroy)(struct ttm_buffer_object *bo);
 =09/* xcp partition number plus 1, 0 means any partition */
 =09int8_t=09=09=09=09xcp_id_plus1;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index e50c133e87df..5919db47f1a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -152,11 +152,14 @@ static void amdgpu_evict_flags(struct ttm_buffer_obje=
ct *bo,
 =09=09=09amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
 =09=09=09=09=09=09=09AMDGPU_GEM_DOMAIN_CPU);
 =09=09}
+=09=09for (int i =3D 0; i < abo->placement.num_placement; i++)
+=09=09=09abo->placements[i].flags &=3D ~TTM_PL_FLAG_MEMCG;
 =09=09break;
 =09case TTM_PL_TT:
 =09case AMDGPU_PL_PREEMPT:
 =09default:
 =09=09amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_CPU);
+=09=09abo->placements[0].flags &=3D ~TTM_PL_FLAG_MEMCG;
 =09=09break;
 =09}
 =09*placement =3D abo->placement;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 90bb3e00c258..25390e542dc8 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2779,6 +2779,7 @@ __always_inline struct obj_cgroup *current_obj_cgroup=
(void)
=20
 =09return objcg;
 }
+EXPORT_SYMBOL_GPL(current_obj_cgroup);
=20
 struct obj_cgroup *get_obj_cgroup_from_folio(struct folio *folio)
 {
--=20
2.52.0

