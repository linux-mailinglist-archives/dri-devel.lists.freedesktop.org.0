Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA16CEDA46
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 05:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FE10E00B;
	Fri,  2 Jan 2026 04:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463310E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 04:18:45 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-t0e2-MrSNGG4v6B8OmBF6w-1; Thu,
 01 Jan 2026 23:18:40 -0500
X-MC-Unique: t0e2-MrSNGG4v6B8OmBF6w-1
X-Mimecast-MFC-AGG-ID: t0e2-MrSNGG4v6B8OmBF6w_1767327519
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1938619560B2; Fri,  2 Jan 2026 04:18:39 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.60])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1215A1956056; Fri,  2 Jan 2026 04:18:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>
Subject: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
Date: Fri,  2 Jan 2026 14:18:29 +1000
Message-ID: <20260102041829.2748009-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p0lElvNVvOba3CbIZUABNEgWLfTzuOTiWS89ocJ4fZ8_1767327519
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

The changes to always loads fwsec sb causes problems on newer GPUs
which don't use this path.

Add hooks and pass through the device specific layers.

Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")
Cc: <stable@vger.kernel.org> # v6.16+
Cc: Lyude Paul <lyude@redhat.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
 7 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ad102.c
index 35d1fcef520bf..b3e994386334d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -29,6 +29,9 @@ ad102_gsp =3D {
 =09.sig_section =3D ".fwsignature_ad10x",
=20
 =09.booter.ctor =3D ga102_gsp_booter_ctor,
+=09
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
=20
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 5037602466604..8d4f40a443ce4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 }
=20
 int
-nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
 {
-=09return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
-=09=09=09=09   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
-}
-
-void
-nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
-{
-=09nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
+       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
+                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
 }
=20
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga100.c
index d201e8697226b..27a13aeccd3cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -47,6 +47,9 @@ ga100_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/ga102.c
index 917f7e2f6c466..a59fb74ef6315 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -158,6 +158,9 @@ ga102_gsp_r535 =3D {
=20
 =09.booter.ctor =3D ga102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+=09
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/priv.h
index 86bdd203bc107..9dd66a2e38017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
=20
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
=20
-int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
 int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
-void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
+int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
=20
 struct nvkm_gsp_fwif {
 =09int version;
@@ -52,6 +51,11 @@ struct nvkm_gsp_func {
 =09=09=09    struct nvkm_falcon *, struct nvkm_falcon_fw *);
 =09} booter;
=20
+=09struct {
+=09=09int (*ctor)(struct nvkm_gsp *);
+=09=09void (*dtor)(struct nvkm_gsp *);
+=09} fwsec_sb;
+
 =09void (*dtor)(struct nvkm_gsp *);
 =09int (*oneinit)(struct nvkm_gsp *);
 =09int (*init)(struct nvkm_gsp *);
@@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
 extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
 int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct fi=
rmware *,
 =09=09=09  struct nvkm_falcon *, struct nvkm_falcon_fw *);
+int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
+void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
 int tu102_gsp_init(struct nvkm_gsp *);
 int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
@@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum=
 nvkm_subdev_type, int,
 =09=09  struct nvkm_gsp **);
=20
+static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+{
+=09if (gsp->func->fwsec_sb.ctor)
+=09=09return gsp->func->fwsec_sb.ctor(gsp);
+=09return 0;
+}
+
+static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
+{
+=09if (gsp->func->fwsec_sb.dtor)
+=09=09gsp->func->fwsec_sb.dtor(gsp);
+}
+
 extern const struct nvkm_gsp_func gv100_gsp;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu102.c
index 81e56da0474a1..04b642a1f7305 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -30,6 +30,18 @@
 #include <nvfw/fw.h>
 #include <nvfw/hs.h>
=20
+int
+tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
+{
+=09return nvkm_gsp_fwsec_sb_init(gsp);
+}
+
+void
+tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
+{
+=09nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
+}
+
 static int
 tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
 {
@@ -370,6 +382,9 @@ tu102_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/tu116.c
index 97eb046c25d07..58cf258424218 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -30,6 +30,9 @@ tu116_gsp =3D {
=20
 =09.booter.ctor =3D tu102_gsp_booter_ctor,
=20
+=09.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
+=09.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
+
 =09.dtor =3D r535_gsp_dtor,
 =09.oneinit =3D tu102_gsp_oneinit,
 =09.init =3D tu102_gsp_init,
--=20
2.52.0

