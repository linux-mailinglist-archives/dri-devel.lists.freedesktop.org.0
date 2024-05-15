Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AB8C5F4F
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 05:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3410E12F;
	Wed, 15 May 2024 03:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Wed, 15 May 2024 03:02:04 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48210E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 03:02:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-9ONzL3uLPC-C5qeCSVMneQ-1; Tue, 14 May 2024 22:55:51 -0400
X-MC-Unique: 9ONzL3uLPC-C5qeCSVMneQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5457080021D;
 Wed, 15 May 2024 02:55:51 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD12C15BB9;
 Wed, 15 May 2024 02:55:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] nouveau: set placement to original placement on uvmm validate.
Date: Wed, 15 May 2024 12:55:41 +1000
Message-ID: <20240515025542.2156774-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

When a buffer is evicted for memory pressure or TTM evict all,
the placement is set to the eviction domain, this means the
buffer never gets revalidated on the next exec to the correct domain.

I think this should be fine to use the initial domain from the
object creation, as least with VM_BIND this won't change after
init so this should be the correct answer.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouve=
au/nouveau_uvmm.c
index ee02cd833c5e..84a36fe7c37d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1803,6 +1803,7 @@ nouveau_uvmm_bo_validate(struct drm_gpuvm_bo *vm_bo, =
struct drm_exec *exec)
 {
 =09struct nouveau_bo *nvbo =3D nouveau_gem_object(vm_bo->obj);
=20
+=09nouveau_bo_placement_set(nvbo, nvbo->valid_domains, 0);
 =09return nouveau_bo_validate(nvbo, true, false);
 }
=20
--=20
2.45.0

