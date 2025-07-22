Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BFB0CF5A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A03C10E5C1;
	Tue, 22 Jul 2025 01:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669C310E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:50:53 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-x3gnI-77NLeDNv8nxrq9bw-1; Mon,
 21 Jul 2025 21:50:49 -0400
X-MC-Unique: x3gnI-77NLeDNv8nxrq9bw-1
X-Mimecast-MFC-AGG-ID: x3gnI-77NLeDNv8nxrq9bw_1753149048
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12F3E1956046; Tue, 22 Jul 2025 01:50:48 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.7])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9B73A19560A3; Tue, 22 Jul 2025 01:50:43 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 10/15] ttm: add objcg pointer to bo and tt
Date: Tue, 22 Jul 2025 11:43:23 +1000
Message-ID: <20250722014942.1878844-11-airlied@gmail.com>
In-Reply-To: <20250722014942.1878844-1-airlied@gmail.com>
References: <20250722014942.1878844-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IsKWp1cu2AjZCTVcEM2k2CiEaEojjdfjG-AkztZWtlA_1753149048
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

This just adds the obj cgroup pointer to the bo and tt structs,
and sets it between them.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 +
 include/drm/ttm/ttm_bo.h     | 6 ++++++
 include/drm/ttm/ttm_tt.h     | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8f38de3b2f1c..0c54d5e2bfdd 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 =09ttm->caching =3D caching;
 =09ttm->restore =3D NULL;
 =09ttm->backup =3D NULL;
+=09ttm->objcg =3D bo->objcg;
 }
=20
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6edff0ec9b72..c33b3667ae76 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -135,6 +135,12 @@ struct ttm_buffer_object {
 =09 * reservation lock.
 =09 */
 =09struct sg_table *sg;
+
+=09/**
+=09 * @objcg: object cgroup to charge this to if it ends up using system m=
emory.
+=09 * NULL means don't charge.
+=09 */
+=09struct obj_cgroup *objcg;
 };
=20
 #define TTM_BO_MAP_IOMEM_MASK 0x80
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 15d4019685f6..c13fea4c2915 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -126,6 +126,8 @@ struct ttm_tt {
 =09enum ttm_caching caching;
 =09/** @restore: Partial restoration from backup state. TTM private */
 =09struct ttm_pool_tt_restore *restore;
+=09/** @objcg: Object cgroup for this TT allocation */
+=09struct obj_cgroup *objcg;
 };
=20
 /**
--=20
2.49.0

