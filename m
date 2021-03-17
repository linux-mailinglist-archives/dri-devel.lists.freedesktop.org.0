Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7233FB98
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 00:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57B6E859;
	Wed, 17 Mar 2021 23:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA5F6E859
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616022122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pj6xifRYunGEycUYuurZ3sRU46oa4ZyECyQnLvPC/K8=;
 b=KmPlIPCSUO//pUStagn9uomGRts5yIKk0xNEyPb1i4fo5kvgttFZHoI6m/0pfP8D21H58f
 8xJ+RjlEwkcjwfU8QtFt2/H73jzWCTxoKofvIi4tFUdy8bcDeSpAYeympII4THi8JOa9CM
 zbRCeTRcfTcsXQsD/3WVJSJzUmoXitY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-oFcJVhP8MuC0N_5PqFTciA-1; Wed, 17 Mar 2021 19:01:57 -0400
X-MC-Unique: oFcJVhP8MuC0N_5PqFTciA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64FF6108BD07;
 Wed, 17 Mar 2021 23:01:54 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0B6610F0;
 Wed, 17 Mar 2021 23:01:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/kms/nv50-: Use NV_ATOMIC() in
 nv50_head_atomic_check_lut()
Date: Wed, 17 Mar 2021 19:01:45 -0400
Message-Id: <20210317230146.504182-2-lyude@redhat.com>
In-Reply-To: <20210317230146.504182-1-lyude@redhat.com>
References: <20210317230146.504182-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this is used in the atomic check, we should use the right debug macro
for it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index ec361d17e900..fb821dcf6bd2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -221,7 +221,10 @@ static int
 nv50_head_atomic_check_lut(struct nv50_head *head,
 			   struct nv50_head_atom *asyh)
 {
-	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct drm_device *dev = head->base.base.dev;
+	struct drm_crtc *crtc = &head->base.base;
+	struct nv50_disp *disp = nv50_disp(dev);
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_property_blob *olut = asyh->state.gamma_lut;
 	int size;
 
@@ -251,7 +254,8 @@ nv50_head_atomic_check_lut(struct nv50_head *head,
 	}
 
 	if (!head->func->olut(head, asyh, size)) {
-		DRM_DEBUG_KMS("Invalid olut\n");
+		NV_ATOMIC(drm, "Invalid size %d for gamma on [CRTC:%d:%s]\n",
+			  size, crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 	asyh->olut.handle = disp->core->chan.vram.handle;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
