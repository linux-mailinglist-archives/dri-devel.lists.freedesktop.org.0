Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB8AA6974
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B7D10E8A0;
	Fri,  2 May 2025 03:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5843810E8A0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 03:41:19 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-fwUZUgPpN7Sv2ssGXTfRWg-1; Thu,
 01 May 2025 23:41:10 -0400
X-MC-Unique: fwUZUgPpN7Sv2ssGXTfRWg-1
X-Mimecast-MFC-AGG-ID: fwUZUgPpN7Sv2ssGXTfRWg_1746157269
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CBE611955D82; Fri,  2 May 2025 03:41:08 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.70])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D53751800871; Fri,  2 May 2025 03:41:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: [PATCH 1/5] memcg: add GPU statistic
Date: Fri,  2 May 2025 13:36:00 +1000
Message-ID: <20250502034046.1625896-2-airlied@gmail.com>
In-Reply-To: <20250502034046.1625896-1-airlied@gmail.com>
References: <20250502034046.1625896-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Bh8EdIGLx5erm6g9Qj9nU-AutTxH114q0PbTGH2BOM_1746157269
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

Discrete and Integrated GPUs can use system RAM instead of
VRAM for all or some allocations. These allocations happen
via drm/ttm subsystem and are currently not accounted for
in cgroups.

Add a gpu statistic to allow a place to visualise allocations
once they are supported.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 3 +++
 include/linux/memcontrol.h              | 1 +
 mm/memcontrol.c                         | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-=
guide/cgroup-v2.rst
index 1a16ce68a4d7..e10a1dfa6051 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1480,6 +1480,9 @@ The following nested keys are defined.
 =09  vmalloc (npn)
 =09=09Amount of memory used for vmap backed memory.
=20
+=09  gpu (npn)
+=09=09Amount of memory used for GPU device system RAM.
+
 =09  shmem
 =09=09Amount of cached filesystem data that is swap-backed,
 =09=09such as tmpfs, shm segments, shared anonymous mmap()s
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 53364526d877..4058d4bd94ed 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -36,6 +36,7 @@ enum memcg_stat_item {
 =09MEMCG_SOCK,
 =09MEMCG_PERCPU_B,
 =09MEMCG_VMALLOC,
+=09MEMCG_GPU,
 =09MEMCG_KMEM,
 =09MEMCG_ZSWAP_B,
 =09MEMCG_ZSWAPPED,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c96c1f2b9cf5..25471a0fd0be 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -326,6 +326,7 @@ static const unsigned int memcg_stat_items[] =3D {
 =09MEMCG_SOCK,
 =09MEMCG_PERCPU_B,
 =09MEMCG_VMALLOC,
+=09MEMCG_GPU,
 =09MEMCG_KMEM,
 =09MEMCG_ZSWAP_B,
 =09MEMCG_ZSWAPPED,
@@ -1358,6 +1359,7 @@ static const struct memory_stat memory_stats[] =3D {
 =09{ "percpu",=09=09=09MEMCG_PERCPU_B=09=09=09},
 =09{ "sock",=09=09=09MEMCG_SOCK=09=09=09},
 =09{ "vmalloc",=09=09=09MEMCG_VMALLOC=09=09=09},
+=09{ "gpu",=09=09=09MEMCG_GPU=09=09=09},
 =09{ "shmem",=09=09=09NR_SHMEM=09=09=09},
 #ifdef CONFIG_ZSWAP
 =09{ "zswap",=09=09=09MEMCG_ZSWAP_B=09=09=09},
--=20
2.49.0

