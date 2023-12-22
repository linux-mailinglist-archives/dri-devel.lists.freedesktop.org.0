Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA981C3E5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D3A10E732;
	Fri, 22 Dec 2023 04:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E1210E718
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-vUwgAl2UPMaYfnsd3-Kbbg-1; Thu,
 21 Dec 2023 23:33:17 -0500
X-MC-Unique: vUwgAl2UPMaYfnsd3-Kbbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E27872932480;
 Fri, 22 Dec 2023 04:33:16 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E42912026D66;
 Fri, 22 Dec 2023 04:33:15 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 03/11] nouveau: fix disp disabling with GSP
Date: Fri, 22 Dec 2023 14:31:52 +1000
Message-ID: <20231222043308.3090089-4-airlied@gmail.com>
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

This func ptr here is normally static allocation, but gsp r535
uses a dynamic pointer, so we need to handle that better.

This fixes a crash with GSP when you use config=3Ddisp=3D0 to avoid
disp problems.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/base.c
index 457ec5db794d..b24eb1e560bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -209,7 +209,7 @@ nvkm_disp_dtor(struct nvkm_engine *engine)
 =09=09nvkm_head_del(&head);
 =09}
=20
-=09if (disp->func->dtor)
+=09if (disp->func && disp->func->dtor)
 =09=09disp->func->dtor(disp);
=20
 =09return data;
@@ -243,8 +243,10 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, stru=
ct nvkm_device *device,
 =09spin_lock_init(&disp->client.lock);
=20
 =09ret =3D nvkm_engine_ctor(&nvkm_disp, device, type, inst, true, &disp->e=
ngine);
-=09if (ret)
+=09if (ret) {
+=09=09disp->func =3D NULL;
 =09=09return ret;
+=09}
=20
 =09if (func->super) {
 =09=09disp->super.wq =3D create_singlethread_workqueue("nvkm-disp");
--=20
2.43.0

