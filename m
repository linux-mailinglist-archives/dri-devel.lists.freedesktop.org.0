Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553181C3DF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3D10E388;
	Fri, 22 Dec 2023 04:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7510E218
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-4AZm-7rYO_yapjGl3xHLgQ-1; Thu, 21 Dec 2023 23:33:14 -0500
X-MC-Unique: 4AZm-7rYO_yapjGl3xHLgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE56D101A52A;
 Fri, 22 Dec 2023 04:33:13 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFB0F2026D66;
 Fri, 22 Dec 2023 04:33:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 01/11] nouveau/gsp: add three notifier callbacks that we see
 in normal operation (v2)
Date: Fri, 22 Dec 2023 14:31:50 +1000
Message-ID: <20231222043308.3090089-2-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-1-airlied@gmail.com>
References: <20231222043308.3090089-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Add NULL callbacks for some things GSP calls that we don't handle, but know=
 about
so we avoid the logging.

v2: Timur suggested allowing null fn.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 44fb86841c05..7f831f41b598 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -298,7 +298,8 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 rep=
c)
 =09=09struct nvkm_gsp_msgq_ntfy *ntfy =3D &gsp->msgq.ntfy[i];
=20
 =09=09if (ntfy->fn =3D=3D msg->function) {
-=09=09=09ntfy->func(ntfy->priv, ntfy->fn, msg->data, msg->length - sizeof(=
*msg));
+=09=09=09if (ntfy->func)
+=09=09=09=09ntfy->func(ntfy->priv, ntfy->fn, msg->data, msg->length - size=
of(*msg));
 =09=09=09break;
 =09=09}
 =09}
@@ -2186,7 +2187,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 =09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
 =09=09=09      r535_gsp_msg_mmu_fault_queued, gsp);
 =09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg=
_os_error_log, gsp);
-
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDAT=
E, NULL, NULL);
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NULL, N=
ULL);
+=09r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_SEND_USER_SHARED_DATA,=
 NULL, NULL);
 =09ret =3D r535_gsp_rm_boot_ctor(gsp);
 =09if (ret)
 =09=09return ret;
--=20
2.43.0

