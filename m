Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7981AE60A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 21:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595516E891;
	Fri, 17 Apr 2020 19:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C56E88D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587152557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZcv3qDQzlPILR5fV5Bw6/0wcQ4spw3syCzjc3k3oHE=;
 b=SKB2EddjvXmY4LTMw6tp+4R1QcbraBgkuAvhnIB7WG8zPYqpqzFopS7d95fUbWnYNan873
 Qz202efjZGc/qRCNq1755IMDV2QmcxaXTF9OCwXhB5JJa+9lOGSDbapxAla9qlWIJyixEe
 REGkoxMTKDIoq9KZ7R2lIRkhLQkROG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-AUMdPxmLMxGasXEyDn67TQ-1; Fri, 17 Apr 2020 15:42:35 -0400
X-MC-Unique: AUMdPxmLMxGasXEyDn67TQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10316149C6;
 Fri, 17 Apr 2020 19:42:34 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE34A5D9CA;
 Fri, 17 Apr 2020 19:42:30 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v3 04/11] drm/nouveau/kms/nv50-: Unroll error cleanup in
 nv50_head_create()
Date: Fri, 17 Apr 2020 15:40:51 -0400
Message-Id: <20200417194145.36350-5-lyude@redhat.com>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
References: <20200417194145.36350-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll be rolling back more things in this function, and the way it's
structured is a bit confusing. So, let's clean this up a bit and just
unroll in the event of failure.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 8f6455697ba7..e29ea40e7c33 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -507,20 +507,28 @@ nv50_head_create(struct drm_device *dev, int index)
 
 	if (disp->disp->object.oclass < GV100_DISP) {
 		ret = nv50_base_new(drm, head->base.index, &base);
+		if (ret)
+			goto fail_free;
+
 		ret = nv50_ovly_new(drm, head->base.index, &ovly);
+		if (ret)
+			goto fail_free;
 	} else {
 		ret = nv50_wndw_new(drm, DRM_PLANE_TYPE_PRIMARY,
 				    head->base.index * 2 + 0, &base);
+		if (ret)
+			goto fail_free;
+
 		ret = nv50_wndw_new(drm, DRM_PLANE_TYPE_OVERLAY,
 				    head->base.index * 2 + 1, &ovly);
-	}
-	if (ret == 0)
-		ret = nv50_curs_new(drm, head->base.index, &curs);
-	if (ret) {
-		kfree(head);
-		return ERR_PTR(ret);
+		if (ret)
+			goto fail_free;
 	}
 
+	ret = nv50_curs_new(drm, head->base.index, &curs);
+	if (ret)
+		goto fail_free;
+
 	crtc = &head->base.base;
 	drm_crtc_init_with_planes(dev, crtc, &base->plane, &curs->plane,
 				  &nv50_head_func, "head-%d", head->base.index);
@@ -533,11 +541,16 @@ nv50_head_create(struct drm_device *dev, int index)
 
 	if (head->func->olut_set) {
 		ret = nv50_lut_init(disp, &drm->client.mmu, &head->olut);
-		if (ret) {
-			nv50_head_destroy(crtc);
-			return ERR_PTR(ret);
-		}
+		if (ret)
+			goto fail_crtc_cleanup;
 	}
 
 	return head;
+
+fail_crtc_cleanup:
+	drm_crtc_cleanup(crtc);
+fail_free:
+	kfree(head);
+
+	return ERR_PTR(ret);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
