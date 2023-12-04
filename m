Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B528041E3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 23:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6907C10E42D;
	Mon,  4 Dec 2023 22:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64010E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 22:55:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-nW6CuBGeNveh9Dz4ZPXJzA-1; Mon,
 04 Dec 2023 17:55:22 -0500
X-MC-Unique: nW6CuBGeNveh9Dz4ZPXJzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C34D1C0512C;
 Mon,  4 Dec 2023 22:55:22 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DDFDC1596F;
 Mon,  4 Dec 2023 22:55:20 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: add three notifier callbacks that we see in
 normal operation
Date: Tue,  5 Dec 2023 08:55:19 +1000
Message-ID: <20231204225519.358885-1-airlied@gmail.com>
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These seem to get called, but it doesn't look like we have to care too much
at this point.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index f6725a5f5bfb..8b368df2e798 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1505,6 +1505,26 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, v=
oid *repv, u32 repc)
 =09return 0;
 }
=20
+static int
+r535_gsp_msg_perf_bridgeless_info_update(void *priv, u32 fn, void *repv, u=
32 repc)
+{
+=09return 0;
+}
+
+static int
+r535_gsp_msg_ucode_libos_print(void *priv, u32 fn, void *repv, u32 repc)
+{
+=09/* work out what we should do here. */
+=09return 0;
+}
+
+static int
+r535_gsp_msg_gsp_send_user_shared_data(void *priv, u32 fn, void *repv, u32=
 repc)
+{
+=09/* this seems to send some sort of assert counts from gsp */
+=09return 0;
+}
+
 static void
 nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
 {
@@ -2104,7 +2124,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 =09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
 =09=09=09      r535_gsp_msg_mmu_fault_queued, gsp);
 =09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg=
_os_error_log, gsp);
-
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDAT=
E, r535_gsp_msg_perf_bridgeless_info_update, gsp);
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, r535_gs=
p_msg_ucode_libos_print, gsp);
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA,=
 r535_gsp_msg_gsp_send_user_shared_data, gsp);
 =09ret =3D r535_gsp_rm_boot_ctor(gsp);
 =09if (ret)
 =09=09return ret;
--=20
2.43.0

