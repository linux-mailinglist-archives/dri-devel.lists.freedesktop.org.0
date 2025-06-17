Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D816BADC134
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 07:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC5D10E467;
	Tue, 17 Jun 2025 05:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160F10E467
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 05:09:15 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-NoWKibbUOcmMBlI8OOrrZg-1; Tue,
 17 Jun 2025 01:09:11 -0400
X-MC-Unique: NoWKibbUOcmMBlI8OOrrZg-1
X-Mimecast-MFC-AGG-ID: NoWKibbUOcmMBlI8OOrrZg_1750136950
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 301C81800343; Tue, 17 Jun 2025 05:09:10 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.24.91])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DC11E30044D9; Tue, 17 Jun 2025 05:09:07 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: get zeroed pages for any device allocations we
 need
Date: Tue, 17 Jun 2025 15:09:04 +1000
Message-ID: <20250617050904.153255-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9prEoL3H3slGn3D96WlzcXl6RG8ngqLvWrqeKURVdj0_1750136950
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

This seems to remove some random behaviour around suspend/resume
operations, and ordering of memory allocations.

Cc: stable@vger.kernel.org
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index baf42339f93e..4460da3239b5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1583,7 +1583,7 @@ nvkm_gsp_sg(struct nvkm_device *device, u64 size, str=
uct sg_table *sgt)
 =09=09return ret;
=20
 =09for_each_sgtable_sg(sgt, sgl, i) {
-=09=09struct page *page =3D alloc_page(GFP_KERNEL);
+=09=09struct page *page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
=20
 =09=09if (!page) {
 =09=09=09nvkm_gsp_sg_free(device, sgt);
--=20
2.49.0

