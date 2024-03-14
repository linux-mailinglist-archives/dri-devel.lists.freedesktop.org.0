Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3052587B62F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5EC10EA18;
	Thu, 14 Mar 2024 01:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C029210E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:45:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-QWl8yqlGOp2WSlimDf4IBw-1; Wed,
 13 Mar 2024 21:45:25 -0400
X-MC-Unique: QWl8yqlGOp2WSlimDf4IBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1D838157BC;
 Thu, 14 Mar 2024 01:45:25 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3330D492BD0;
 Thu, 14 Mar 2024 01:45:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: dakr@redhat.com,
	nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: don't check devinit disable on GSP.
Date: Thu, 14 Mar 2024 11:45:21 +1000
Message-ID: <20240314014521.2695233-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

GSP should be handling this and I can see no evidence in opengpu
driver that this register should be touched.

Fixed acceleration on 2080 Ti GPUs.

Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/devinit/r535.c
index 666eb93b1742..11b4c9c274a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
@@ -41,7 +41,6 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
=20
 =09rm->dtor =3D r535_devinit_dtor;
 =09rm->post =3D hw->post;
-=09rm->disable =3D hw->disable;
=20
 =09ret =3D nv50_devinit_new_(rm, device, type, inst, pdevinit);
 =09if (ret)
--=20
2.43.2

