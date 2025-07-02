Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781FAF6634
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E110E7AD;
	Wed,  2 Jul 2025 23:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C0910E7AE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 23:27:19 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-T3tA0_UbOA-ewe5BGFB0Zw-1; Wed,
 02 Jul 2025 19:27:15 -0400
X-MC-Unique: T3tA0_UbOA-ewe5BGFB0Zw-1
X-Mimecast-MFC-AGG-ID: T3tA0_UbOA-ewe5BGFB0Zw_1751498834
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 876D91800287; Wed,  2 Jul 2025 23:27:14 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.31])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F09981956087; Wed,  2 Jul 2025 23:27:10 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] nouveau/gsp: add a 50ms delay between fbsr and driver unload
 rpcs
Date: Thu,  3 Jul 2025 09:27:07 +1000
Message-ID: <20250702232707.175679-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yxTiEYJUj9li62DqGmcSQWZOnbv69g27AqyYZQDB7HE_1751498834
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

This fixes a bunch of command hangs after runtime suspend/resume.

This fixes a regression caused by code movement in the commit below,
the commit seems to just change timings enough to cause this to happen
now, and adding the sleep seems to avoid it.

I've spent some time trying to root cause it to no great avail,
it seems like a bug on the firmware side, but it could be a bug
in our rpc handling that I can't find.

Either way, we should land the workaround to fix the problem,
while we continue to work out the root cause.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Fixes: 21b039715ce9 ("drm/nouveau/gsp: add hals for fbsr.suspend/resume()")
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index baf42339f93e..ff362a6d9f5c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1744,6 +1744,9 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 =09=09=09nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
 =09=09=09return ret;
 =09=09}
+
+=09=09/* without this Turing ends up resetting all channels after resume. =
*/
+=09=09msleep(50);
 =09}
=20
 =09ret =3D r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
--=20
2.49.0

