Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144717DC5D3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AFD10E3FC;
	Tue, 31 Oct 2023 05:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61410E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 05:19:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-5BeEYA72Obazo_n9NKduBA-1; Tue,
 31 Oct 2023 01:19:53 -0400
X-MC-Unique: 5BeEYA72Obazo_n9NKduBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE51C3810B0B;
 Tue, 31 Oct 2023 05:19:52 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE9D440C6EB9;
 Tue, 31 Oct 2023 05:19:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] nouveau/gsp: add some basic registry entries.
Date: Tue, 31 Oct 2023 15:18:47 +1000
Message-ID: <20231031051943.1957328-4-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-1-airlied@gmail.com>
References: <20231031051943.1957328-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

The nvidia driver sets these two basic registry entries always,
so copy it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 45 ++++++++++++++-----
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index b6f6b5e747d4..5bd38b1de226 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1029,26 +1029,51 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp=
 *gsp, bool suspend)
 =09return nvkm_gsp_rpc_wr(gsp, rpc, true);
 }
=20
+/* dword only */
+struct nv_gsp_registry_entries {
+=09const char *name;
+=09uint32_t value;
+};
+
+#define NV_GSP_REG_NUM_ENTRIES 2
+
+static const struct nv_gsp_registry_entries r535_registry_entries[NV_GSP_R=
EG_NUM_ENTRIES] =3D {
+=09{ "RMSecBusResetEnable", 1 },
+=09{ "RMForcePcieConfigSave", 1 },
+};
+
 static int
 r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 {
 =09PACKED_REGISTRY_TABLE *rpc;
 =09char *strings;
+=09int str_offset;
+=09int i;
+=09size_t rpc_size =3D sizeof(*rpc) + sizeof(rpc->entries[0]) * NV_GSP_REG=
_NUM_ENTRIES;
=20
-=09rpc =3D nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
-=09=09=09       sizeof(*rpc) + sizeof(rpc->entries[0]) + 1);
+=09/* add strings + null terminator */
+=09for (i =3D 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
+=09=09rpc_size +=3D strlen(r535_registry_entries[i].name) + 1;
+
+=09rpc =3D nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, rpc_si=
ze);
 =09if (IS_ERR(rpc))
 =09=09return PTR_ERR(rpc);
=20
 =09rpc->size =3D sizeof(*rpc);
-=09rpc->numEntries =3D 1;
-=09rpc->entries[0].nameOffset =3D offsetof(typeof(*rpc), entries[1]);
-=09rpc->entries[0].type =3D 1;
-=09rpc->entries[0].data =3D 0;
-=09rpc->entries[0].length =3D 4;
-
-=09strings =3D (char *)&rpc->entries[1];
-=09strings[0] =3D '\0';
+=09rpc->numEntries =3D NV_GSP_REG_NUM_ENTRIES;
+
+=09str_offset =3D offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
+=09strings =3D (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
+=09for (i =3D 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
+=09=09int name_len =3D strlen(r535_registry_entries[i].name) + 1;
+=09=09rpc->entries[i].nameOffset =3D str_offset;
+=09=09rpc->entries[i].type =3D 1;
+=09=09rpc->entries[i].data =3D r535_registry_entries[i].value;
+=09=09rpc->entries[i].length =3D 4;
+=09=09memcpy(strings, r535_registry_entries[i].name, name_len);
+=09=09strings +=3D name_len;
+=09=09str_offset +=3D name_len;
+=09}
=20
 =09return nvkm_gsp_rpc_wr(gsp, rpc, false);
 }
--=20
2.41.0

