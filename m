Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD0961C32
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031DC10E43E;
	Wed, 28 Aug 2024 02:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4830810E43B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:37:29 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-MVn9yAbrNfmeoM2mAZkiqw-1; Tue,
 27 Aug 2024 22:37:25 -0400
X-MC-Unique: MVn9yAbrNfmeoM2mAZkiqw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B43E81956080; Wed, 28 Aug 2024 02:37:24 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.9])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8AF5919560AA; Wed, 28 Aug 2024 02:37:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@redhat.com
Subject: [PATCH] nouveau: fix the fwsec sb verification register.
Date: Wed, 28 Aug 2024 12:37:19 +1000
Message-ID: <20240828023720.1596602-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

This aligns with what open gpu does, the 0x15 hex is just to trick you.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/fwsec.c
index 330d72b1a4af..52412965fac1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -324,7 +324,7 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
 =09=09return ret;
=20
 =09/* Verify. */
-=09err =3D nvkm_rd32(device, 0x001400 + (0xf * 4)) & 0x0000ffff;
+=09err =3D nvkm_rd32(device, 0x001400 + (0x15 * 4)) & 0x0000ffff;
 =09if (err) {
 =09=09nvkm_error(subdev, "fwsec-sb: 0x%04x\n", err);
 =09=09return -EIO;
--=20
2.45.2

