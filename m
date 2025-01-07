Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC88A0379D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 07:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6FA10E225;
	Tue,  7 Jan 2025 06:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2025 06:05:05 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697C910E225
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 06:05:05 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-VDkKrUhtPpyaxdSYzwfX6Q-1; Tue,
 07 Jan 2025 00:58:51 -0500
X-MC-Unique: VDkKrUhtPpyaxdSYzwfX6Q-1
X-Mimecast-MFC-AGG-ID: VDkKrUhtPpyaxdSYzwfX6Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DAE11956048; Tue,  7 Jan 2025 05:58:50 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.7])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B6ED41955F4A; Tue,  7 Jan 2025 05:58:48 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] nouveau/fence: handle cross device fences properly.
Date: Tue,  7 Jan 2025 15:58:46 +1000
Message-ID: <20250107055846.536589-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U4XN6h9hudLKfHlU1PfFMFVlWONiH0R96s-SQHRwKIo_1736229530
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

If we have two nouveau controlled devices and one passes a dma-fence
to the other, when we hit the sync path it can cause the second device
to try and put a sync wait in it's pushbuf for the seqno of the context
on the first device.

Since fence contexts are vmm bound, check the if vmm's match between
both users, this should ensure that fence seqnos don't get used wrongly
on incorrect channels.

This seems to happen fairly spuriously and I found it tracking down
a multi-card regression report, that seems to work by luck before this.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index ee5e9d40c166f..5743c82f4094b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouv=
eau_channel *chan,
=20
 =09=09=09=09rcu_read_lock();
 =09=09=09=09prev =3D rcu_dereference(f->channel);
-=09=09=09=09if (prev && (prev =3D=3D chan ||
+=09=09=09=09if (prev && (prev->vmm =3D=3D chan->vmm) &&
+=09=09=09=09    (prev =3D=3D chan ||
 =09=09=09=09=09     fctx->sync(f, prev, chan) =3D=3D 0))
 =09=09=09=09=09must_wait =3D false;
 =09=09=09=09rcu_read_unlock();
--=20
2.43.0

