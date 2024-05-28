Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D926A8D14A9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 08:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1F489919;
	Tue, 28 May 2024 06:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F057F10FFFC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:47:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-IkAEgiRtMOakeJBviBB-HQ-1; Tue,
 28 May 2024 02:47:33 -0400
X-MC-Unique: IkAEgiRtMOakeJBviBB-HQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 590B129AA390;
 Tue, 28 May 2024 06:47:33 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5751F28E5;
 Tue, 28 May 2024 06:47:32 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/uconn: drop WARN_ON and pointless ret setting.
Date: Tue, 28 May 2024 16:47:30 +1000
Message-ID: <20240528064730.9907-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

With GSP on my laptop I get an 0xff connector type, it appears
this is normal behaviour and we should ignore that connector.

Now we don't handle that all properly, but anywhere I try to
ignore it at that point causes driver load to fail, so let's
not do that, and just drop the warn and ret setting (which gets
set to 0 a few lines later).

Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..5f460e3d1bb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -211,8 +211,6 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *=
argv, u32 argc, struct nv
 =09=09case DCB_CONNECTOR_HDMI_1   :
 =09=09case DCB_CONNECTOR_HDMI_C   : args->v0.type =3D NVIF_CONN_V0_HDMI; b=
reak;
 =09=09default:
-=09=09=09WARN_ON(1);
-=09=09=09ret =3D -EINVAL;
 =09=09=09break;
 =09=09}
=20
--=20
2.45.1

