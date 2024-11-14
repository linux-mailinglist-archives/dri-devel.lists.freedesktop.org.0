Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D6F9C7F8D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 01:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA76E10E787;
	Thu, 14 Nov 2024 00:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2024 00:53:02 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD010E781
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 00:53:02 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-NRVQ-rYhMOmeXWr6Fm4fJw-1; Wed,
 13 Nov 2024 19:46:09 -0500
X-MC-Unique: NRVQ-rYhMOmeXWr6Fm4fJw-1
X-Mimecast-MFC-AGG-ID: NRVQ-rYhMOmeXWr6Fm4fJw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9C17619560AA; Thu, 14 Nov 2024 00:46:07 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.106])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 05A5D1956089; Thu, 14 Nov 2024 00:46:05 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: fw: sync dma after setup is called.
Date: Thu, 14 Nov 2024 10:46:03 +1000
Message-ID: <20241114004603.3095485-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KwTO0ufI4VoU88BpfC0CXH4QkkNBEU2kuWppX6dPLqo_1731545167
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

When this code moved to non-coherent allocator the sync was put too
early for some firmwares which called the setup function, move the
sync down after the setup function.

Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Fixes: 9b340aeb26d5 ("nouveau/firmware: use dma non-coherent allocator")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nou=
veau/nvkm/falcon/fw.c
index a1c8545f1249..cac6d64ab67d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
@@ -89,11 +89,6 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nv=
km_subdev *user,
 =09=09nvkm_falcon_fw_dtor_sigs(fw);
 =09}
=20
-=09/* after last write to the img, sync dma mappings */
-=09dma_sync_single_for_device(fw->fw.device->dev,
-=09=09=09=09   fw->fw.phys,
-=09=09=09=09   sg_dma_len(&fw->fw.mem.sgl),
-=09=09=09=09   DMA_TO_DEVICE);
=20
 =09FLCNFW_DBG(fw, "resetting");
 =09fw->func->reset(fw);
@@ -105,6 +100,12 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct =
nvkm_subdev *user,
 =09=09=09goto done;
 =09}
=20
+=09/* after last write to the img, sync dma mappings */
+=09dma_sync_single_for_device(fw->fw.device->dev,
+=09=09=09=09   fw->fw.phys,
+=09=09=09=09   sg_dma_len(&fw->fw.mem.sgl),
+=09=09=09=09   DMA_TO_DEVICE);
+
 =09ret =3D fw->func->load(fw);
 =09if (ret)
 =09=09goto done;
--=20
2.47.0

