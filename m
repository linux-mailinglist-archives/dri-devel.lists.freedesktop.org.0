Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888EC841A83
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 04:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2A10E985;
	Tue, 30 Jan 2024 03:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5A910E985
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 03:26:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-oJ2zMBrkOheVcWgMvIXe6g-1; Mon, 29 Jan 2024 22:26:46 -0500
X-MC-Unique: oJ2zMBrkOheVcWgMvIXe6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B663483BA86;
 Tue, 30 Jan 2024 03:26:45 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B110F1121306;
 Tue, 30 Jan 2024 03:26:44 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: use correct size for registry rpc.
Date: Tue, 30 Jan 2024 13:26:43 +1000
Message-ID: <20240130032643.2498315-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Timur pointed this out before, and it just slipped my mind,
but this might help some things work better, around pcie power
management.

Fixes: 8d55b0a940bb ("nouveau/gsp: add some basic registry entries.")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 9ee58e2a0eb2..5e1fa176aac4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1078,7 +1078,6 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 =09if (IS_ERR(rpc))
 =09=09return PTR_ERR(rpc);
=20
-=09rpc->size =3D sizeof(*rpc);
 =09rpc->numEntries =3D NV_GSP_REG_NUM_ENTRIES;
=20
 =09str_offset =3D offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
@@ -1094,6 +1093,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 =09=09strings +=3D name_len;
 =09=09str_offset +=3D name_len;
 =09}
+=09rpc->size =3D str_offset;
=20
 =09return nvkm_gsp_rpc_wr(gsp, rpc, false);
 }
--=20
2.43.0

