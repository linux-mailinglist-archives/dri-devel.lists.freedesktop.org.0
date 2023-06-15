Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3BE730D57
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 04:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220210E172;
	Thu, 15 Jun 2023 02:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 345 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jun 2023 02:47:11 UTC
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137910E172
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:47:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-i5oqHeJeOiOVgDHvcUPtEA-1; Wed, 14 Jun 2023 22:40:11 -0400
X-MC-Unique: i5oqHeJeOiOVgDHvcUPtEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F05800A15
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:40:10 +0000 (UTC)
Received: from nomad.redhat.com (vpn2-54-59.bne.redhat.com [10.64.54.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE718492CA6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:40:09 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: fix client work fence deletion race
Date: Thu, 15 Jun 2023 12:40:08 +1000
Message-Id: <20230615024008.1600281-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

This seems to have existed for ever but is now more apparant after
9bff18d13473a9fdf81d5158248472a9d8ecf2bd (drm/ttm: use per BO cleanup worke=
rs)

My analysis:
two threads are running,
one in the irq signalling the fence, in dma_fence_signal_timestamp_locked,
it has done the DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reache=
d the callbacks.

second thread in nouveau_cli_work_ready, where it sees the fence is signall=
ed, so then puts the
fence, cleanups the object and frees the work item, which contains the call=
back.

thread one goes again and tries to call the callback and causes the use-aft=
er-free.

Proposed fix:
lock the fence signalled check in nouveau_cli_work_ready, so either the cal=
lbacks are done
or the memory is freed.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouvea=
u/nouveau_drm.c
index cc7c5b4a05fd..1a45be769848 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -137,10 +137,16 @@ nouveau_name(struct drm_device *dev)
 static inline bool
 nouveau_cli_work_ready(struct dma_fence *fence)
 {
-=09if (!dma_fence_is_signaled(fence))
-=09=09return false;
-=09dma_fence_put(fence);
-=09return true;
+=09unsigned long flags;
+=09bool ret =3D true;
+=09spin_lock_irqsave(fence->lock, flags);
+=09if (!dma_fence_is_signaled_locked(fence))
+=09=09ret =3D false;
+=09spin_unlock_irqrestore(fence->lock, flags);
+
+=09if (ret =3D=3D true)
+=09=09dma_fence_put(fence);
+=09return ret;
 }
=20
 static void
--=20
2.40.1

