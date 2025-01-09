Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6DA06A15
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 01:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FBC10E2AC;
	Thu,  9 Jan 2025 00:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772D10E030
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 00:57:04 +0000 (UTC)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-inlg5nzvOJ-vpkKWYA24zQ-1; Wed,
 08 Jan 2025 19:55:58 -0500
X-MC-Unique: inlg5nzvOJ-vpkKWYA24zQ-1
X-Mimecast-MFC-AGG-ID: inlg5nzvOJ-vpkKWYA24zQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 75FAA1956087; Thu,  9 Jan 2025 00:55:57 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.7])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C10AC19560AA; Thu,  9 Jan 2025 00:55:55 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
Date: Thu,  9 Jan 2025 10:55:53 +1000
Message-ID: <20250109005553.623947-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CphM63C0OflHxCGthzkip3cHk1xycu3tkU440V82mTc_1736384157
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

This is the 3rd iteration of this after talking to Ben and
Danilo, I think this makes sense now.

The fence sync logic doesn't handle a fence sync across devices
as it tries to write to a channel offset from one device into
the fence bo from a different device, which won't work so well.

This patch fixes that to avoid using the sync path in the case
where the fences come from different nouveau drm devices.

This works fine on a single device as the fence bo is shared
across the devices, and mapped into each channels vma space,
the channel offsets are therefore okay to pass between sides,
so one channel can sync on the seqnos from the other by using
the offset into it's vma.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index ee5e9d40c166..a3eb1f447a29 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -367,11 +367,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct no=
uveau_channel *chan,
 =09=09=09if (f) {
 =09=09=09=09struct nouveau_channel *prev;
 =09=09=09=09bool must_wait =3D true;
+=09=09=09=09bool local;
=20
 =09=09=09=09rcu_read_lock();
 =09=09=09=09prev =3D rcu_dereference(f->channel);
-=09=09=09=09if (prev && (prev =3D=3D chan ||
-=09=09=09=09=09     fctx->sync(f, prev, chan) =3D=3D 0))
+=09=09=09=09local =3D prev && prev->drm =3D=3D chan->drm;
+=09=09=09=09if (local && (prev =3D=3D chan ||
+=09=09=09=09=09      fctx->sync(f, prev, chan) =3D=3D 0))
 =09=09=09=09=09must_wait =3D false;
 =09=09=09=09rcu_read_unlock();
 =09=09=09=09if (!must_wait)
--=20
2.43.0

