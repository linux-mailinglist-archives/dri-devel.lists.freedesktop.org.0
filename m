Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F39A0381D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 07:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9C210E2EF;
	Tue,  7 Jan 2025 06:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F0310E2EF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 06:46:09 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-2b8_qfueMdmshlCA4izSug-1; Tue,
 07 Jan 2025 01:46:05 -0500
X-MC-Unique: 2b8_qfueMdmshlCA4izSug-1
X-Mimecast-MFC-AGG-ID: 2b8_qfueMdmshlCA4izSug
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BFF9E19560B2; Tue,  7 Jan 2025 06:46:04 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.7])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EB37B3000706; Tue,  7 Jan 2025 06:46:02 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] [RFC] nouveau: hack fix for regression from 6.2
Date: Tue,  7 Jan 2025 16:46:00 +1000
Message-ID: <20250107064600.536897-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F9um-lpdivyVwDDP4vI8ELLJ2jEnMyFrKHLfDkgOuRM_1736232364
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

I recently got a regression report for RHEL 8.10 with a multi-card
GP106 setup. This led me down a rabbit hole of a few problems,
I've sent the cross-fence device fix but this is also needed to
make things work properly.

Hopefully I can at least work out how to restrict this to pre-Ampere
maybe? or find something else

This reverts 6762510bc8447dc4eb4c3d99541de6b31843e649
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Wed Jun 1 20:48:08 2022 +1000

    drm/nouveau/gr/gf100-: call FECS WFI_GOLDEN_SAVE method

The symptoms are on a dual GPU (turing and pascal) gnome-shell
gets a lot of

nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 2 [017fd2f000 gnome-she=
ll[1554]] subc 0 class c597 mthd 0d78 data 00000004

and nothing renders on the second GPU (the data errors are on the primary G=
PU).
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/gr/ctxgf100.c
index cb390e0134a23..fa4c2174ea089 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c
@@ -1514,7 +1514,7 @@ gf100_grctx_generate(struct gf100_gr *gr, struct gf10=
0_gr_chan *chan, struct nvk
=20
 =09grctx->main(chan);
=20
-=09if (!gr->firmware) {
+=09if (1) {// {!gr->firmware) {
 =09=09/* Trigger a context unload by unsetting the "next channel valid" bi=
t
 =09=09 * and faking a context switch interrupt.
 =09=09 */
--=20
2.43.0

