Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIdTBKmGgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B549DD4A58
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D810E54E;
	Tue,  3 Feb 2026 05:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468E710E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:24:53 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-YhQNwizKN5mhsBjUvdj2Nw-1; Tue,
 03 Feb 2026 00:24:49 -0500
X-MC-Unique: YhQNwizKN5mhsBjUvdj2Nw-1
X-Mimecast-MFC-AGG-ID: YhQNwizKN5mhsBjUvdj2Nw_1770096288
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 33E0A1956089; Tue,  3 Feb 2026 05:24:48 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2EE361800285; Tue,  3 Feb 2026 05:24:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] nouveau/gsp: fix suspend/resume regression on r570
 firmware
Date: Tue,  3 Feb 2026 15:21:13 +1000
Message-ID: <20260203052431.2219998-4-airlied@gmail.com>
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: foi1j7Az7HiwaalZ6UbqjDWDX6EhbQPnFvj5-HgZWoY_1770096288
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
X-Rspamd-Queue-Id: B549DD4A58
X-Rspamd-Action: no action

From: Dave Airlie <airlied@redhat.com>

The r570 firmware with certain GPUs (at least RTX6000) needs this
flag to reflect the suspend vs runtime PM state of the driver.

This uses that info to set the correct flags to the firmware.

This fixes a regression on RTX6000 and other GPUs since r570 firmware
was enabled.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 150e22fde2ac..e962d0e8f837 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -208,7 +208,7 @@ r535_fbsr_resume(struct nvkm_gsp *gsp)
 }
=20
 static int
-r535_fbsr_suspend(struct nvkm_gsp *gsp)
+r535_fbsr_suspend(struct nvkm_gsp *gsp, bool runtime)
 {
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09struct nvkm_device *device =3D subdev->device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2f028a30e07d..7fb13434c051 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1748,7 +1748,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend=
_state suspend)
 =09=09sr->sysmemAddrOfSuspendResumeData =3D gsp->sr.radix3.lvl0.addr;
 =09=09sr->sizeOfSuspendResumeData =3D len;
=20
-=09=09ret =3D rm->api->fbsr->suspend(gsp);
+=09=09ret =3D rm->api->fbsr->suspend(gsp, suspend =3D=3D NVKM_RUNTIME_SUSP=
END);
 =09=09if (ret) {
 =09=09=09nvkm_gsp_mem_dtor(&gsp->sr.meta);
 =09=09=09nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 2945d5b4e570..8ef8b4f65588 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -62,7 +62,7 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 }
=20
 static int
-r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
+r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size, bool =
runtime)
 {
 =09NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS *ctrl;
 =09struct nvkm_gsp_object memlist;
@@ -81,7 +81,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt=
, u64 size)
 =09ctrl->hClient =3D gsp->internal.client.object.handle;
 =09ctrl->hSysMem =3D memlist.handle;
 =09ctrl->sysmemAddrOfSuspendResumeData =3D gsp->sr.meta.addr;
-=09ctrl->bEnteringGcoffState =3D 1;
+=09ctrl->bEnteringGcoffState =3D runtime ? 1 : 0;
=20
 =09ret =3D nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 =09if (ret)
@@ -92,7 +92,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt=
, u64 size)
 }
=20
 static int
-r570_fbsr_suspend(struct nvkm_gsp *gsp)
+r570_fbsr_suspend(struct nvkm_gsp *gsp, bool runtime)
 {
 =09struct nvkm_subdev *subdev =3D &gsp->subdev;
 =09struct nvkm_device *device =3D subdev->device;
@@ -133,7 +133,7 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 =09=09return ret;
=20
 =09/* Initialise FBSR on RM. */
-=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, size);
+=09ret =3D r570_fbsr_init(gsp, &gsp->sr.fbsr, size, runtime);
 =09if (ret) {
 =09=09nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
 =09=09return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 393ea775941f..4f0ae6cc085c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -78,7 +78,7 @@ struct nvkm_rm_api {
 =09} *device;
=20
 =09const struct nvkm_rm_api_fbsr {
-=09=09int (*suspend)(struct nvkm_gsp *);
+=09=09int (*suspend)(struct nvkm_gsp *, bool runtime);
 =09=09void (*resume)(struct nvkm_gsp *);
 =09} *fbsr;
=20
--=20
2.52.0

