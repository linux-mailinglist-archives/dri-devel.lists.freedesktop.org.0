Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA30877B31
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 08:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D98910E58A;
	Mon, 11 Mar 2024 07:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933B10E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 07:20:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-n2FV6XfHPGKamH_MJCuxfw-1; Mon, 11 Mar 2024 03:20:41 -0400
X-MC-Unique: n2FV6XfHPGKamH_MJCuxfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37705803CE1;
 Mon, 11 Mar 2024 07:20:41 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4DE31C060A4;
 Mon, 11 Mar 2024 07:20:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] nouveau: reset the bo resource bus info after an eviction
Date: Mon, 11 Mar 2024 17:20:37 +1000
Message-ID: <20240311072037.287905-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Later attempts to refault the bo won't happen and the whole
GPU does to lunch. I think Christian's refactoring of this
code out to the driver broke this not very well tested path.

Fixes: 141b15e59175 ("drm/nouveau: move io_reserve_lru handling into the dr=
iver v5")
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index c6c544d7c911..a4e8f625fce6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1271,6 +1271,8 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, s=
truct ttm_resource *reg)
 =09=09=09drm_vma_node_unmap(&nvbo->bo.base.vma_node,
 =09=09=09=09=09   bdev->dev_mapping);
 =09=09=09nouveau_ttm_io_mem_free_locked(drm, nvbo->bo.resource);
+=09=09=09nvbo->bo.resource->bus.offset =3D 0;
+=09=09=09nvbo->bo.resource->bus.addr =3D NULL;
 =09=09=09goto retry;
 =09=09}
=20
--=20
2.43.2

