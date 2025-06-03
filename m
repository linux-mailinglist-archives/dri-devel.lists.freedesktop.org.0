Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5DACCF96
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF1A10E1B0;
	Tue,  3 Jun 2025 22:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAF610E1B0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 22:09:12 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-ItTjBHXEPIaBOPwE8a4UTg-1; Tue,
 03 Jun 2025 18:09:08 -0400
X-MC-Unique: ItTjBHXEPIaBOPwE8a4UTg-1
X-Mimecast-MFC-AGG-ID: ItTjBHXEPIaBOPwE8a4UTg_1748988547
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 74D0918004AD; Tue,  3 Jun 2025 22:09:07 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.101])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 85AA6180045B; Tue,  3 Jun 2025 22:09:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH] drm/ttm: handle undefined printf arg evaluation order in
 debugfs
Date: Wed,  4 Jun 2025 08:09:01 +1000
Message-ID: <20250603220901.1217161-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h4cP5opjagtULXuPX347wSLZfR2DqHsPDj1aQOUvC7I_1748988547
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

When you read this debugfs file it's isn't guaranteed the count
will happen before the scan, but I think the intent is that it does.

printf argument evaluation order is undefined.

Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.=
c
index 4b16946d3248..14f5aee69ee5 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1280,9 +1280,11 @@ static int ttm_pool_debugfs_shrink_show(struct seq_f=
ile *m, void *data)
 =09=09.gfp_mask =3D GFP_NOFS,
 =09=09.nr_to_scan =3D TTM_SHRINKER_BATCH,
 =09};
+=09unsigned long count;
=20
 =09fs_reclaim_acquire(GFP_KERNEL);
-=09seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
+=09count =3D ttm_pool_shrinker_count(mm_shrinker, &sc),
+=09seq_printf(m, "%lu/%lu\n", count,
 =09=09   ttm_pool_shrinker_scan(mm_shrinker, &sc));
 =09fs_reclaim_release(GFP_KERNEL);
=20
--=20
2.49.0

