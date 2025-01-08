Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC45A068C1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52CD10E96A;
	Wed,  8 Jan 2025 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D785610E95B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:49:38 +0000 (UTC)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-MXEgMaHnNku7JH_KAJgf_A-1; Wed,
 08 Jan 2025 17:49:35 -0500
X-MC-Unique: MXEgMaHnNku7JH_KAJgf_A-1
X-Mimecast-MFC-AGG-ID: MXEgMaHnNku7JH_KAJgf_A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E94DC1955BED; Wed,  8 Jan 2025 22:49:33 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.7])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 40EC13000199; Wed,  8 Jan 2025 22:49:31 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] nouveau/fence: handle cross cli fences properly.
Date: Thu,  9 Jan 2025 08:49:29 +1000
Message-ID: <20250108224930.596928-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1YkKsyQbi-cvFmiUb40TzUnCguEi9q7UBDtraQANOf8_1736376574
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

The fence sync logic doesn't properly account for cases where
the syncing is between two different client spaces, whether
this be on a single device or multi-device.

In the pre-nv84 case this code might work, but post nv84
the fence context vma is used to work out the addr, which means
the vmm would have to match for the sync to work properly, it
should be fine to always just check if the vmm's match before
using the sync path.

This seems to happen fairly spuriously and I found it tracking down
a multi-card regression report, that seems to work by luck before this.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index ee5e9d40c166f..7b55ede567d84 100644
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
+=09=09=09=09local =3D prev && prev->vmm =3D=3D chan->vmm;
+=09=09=09=09if (local && (prev =3D=3D chan ||
+=09=09=09=09=09      fctx->sync(f, prev, chan) =3D=3D 0))
 =09=09=09=09=09must_wait =3D false;
 =09=09=09=09rcu_read_unlock();
 =09=09=09=09if (!must_wait)
--=20
2.43.0

