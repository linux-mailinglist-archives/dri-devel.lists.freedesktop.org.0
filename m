Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIxtNqGGgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F0D4A24
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960EF10E522;
	Tue,  3 Feb 2026 05:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4843510E522
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:24:44 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-Hr2QNWtgNaqZMQuvqjmeug-1; Tue,
 03 Feb 2026 00:24:42 -0500
X-MC-Unique: Hr2QNWtgNaqZMQuvqjmeug-1
X-Mimecast-MFC-AGG-ID: Hr2QNWtgNaqZMQuvqjmeug_1770096281
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0F98318005A7; Tue,  3 Feb 2026 05:24:41 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 11A9C1800665; Tue,  3 Feb 2026 05:24:38 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
Date: Tue,  3 Feb 2026 15:21:11 +1000
Message-ID: <20260203052431.2219998-2-airlied@gmail.com>
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bxDT6SH2A8IgkDh0XO0smuF6xT3KjWGiEKl2DD51aF8_1770096281
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 796F0D4A24
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

There are two layers of sequence numbers, one at the msg level
and one at the rpc level.

570 firmware started asserting on the sequence numbers being
in the right order, and we would see nocat records with asserts
in them.

Add the rpc level sequence number support.

Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h     | 6 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 6 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gp=
u/drm/nouveau/include/nvkm/subdev/gsp.h
index b8b97e10ae83..64fed208e4cf 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -44,6 +44,9 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event=
 *, void *repv, u32 rep
  * NVKM_GSP_RPC_REPLY_NOWAIT - If specified, immediately return to the
  * caller after the GSP RPC command is issued.
  *
+ * NVKM_GSP_RPC_REPLY_NOSEQ - If specified, exactly like NOWAIT
+ * but don't emit RPC sequence number.
+ *
  * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire GSP
  * RPC message after the GSP RPC command is issued.
  *
@@ -53,6 +56,7 @@ typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event=
 *, void *repv, u32 rep
  */
 enum nvkm_gsp_rpc_reply_policy {
 =09NVKM_GSP_RPC_REPLY_NOWAIT =3D 0,
+=09NVKM_GSP_RPC_REPLY_NOSEQ,
 =09NVKM_GSP_RPC_REPLY_RECV,
 =09NVKM_GSP_RPC_REPLY_POLL,
 };
@@ -242,6 +246,8 @@ struct nvkm_gsp {
 =09/* The size of the registry RPC */
 =09size_t registry_rpc_size;
=20
+=09u32 rpc_seq;
+
 #ifdef CONFIG_DEBUG_FS
 =09/*
 =09 * Logging buffers in debugfs. The wrapper objects need to remain
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2a7e80c6d70f..6e7af2f737b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -704,7 +704,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
=20
 =09build_registry(gsp, rpc);
=20
-=09return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOSEQ);
=20
 fail:
 =09clean_registry(gsp);
@@ -921,7 +921,7 @@ r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 =09info->pciConfigMirrorSize =3D device->pci->func->cfg.size;
 =09r535_gsp_acpi_info(gsp, &info->acpiMethodData);
=20
-=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOSEQ);
 }
=20
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 0dc4782df8c0..3ca3de8f4340 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -557,6 +557,7 @@ r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
=20
 =09switch (policy) {
 =09case NVKM_GSP_RPC_REPLY_NOWAIT:
+=09case NVKM_GSP_RPC_REPLY_NOSEQ:
 =09=09break;
 =09case NVKM_GSP_RPC_REPLY_RECV:
 =09=09reply =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
@@ -588,6 +589,11 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
 =09=09=09       rpc->data, rpc->length - sizeof(*rpc), true);
 =09}
=20
+=09if (policy =3D=3D NVKM_GSP_RPC_REPLY_NOSEQ)
+=09=09rpc->sequence =3D 0;
+=09else
+=09=09rpc->sequence =3D gsp->rpc_seq++;
+
 =09ret =3D r535_gsp_cmdq_push(gsp, rpc);
 =09if (ret)
 =09=09return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 9d2fa4e66d59..996941c668ba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -176,7 +176,7 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
 =09info->bIsPrimary =3D video_is_primary_device(device->dev);
 =09info->bPreserveVideoMemoryAllocations =3D false;
=20
-=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
+=09return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOSEQ);
 }
=20
 static void
--=20
2.52.0

