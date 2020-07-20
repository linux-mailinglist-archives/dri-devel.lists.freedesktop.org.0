Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A9226EB1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3781889AC9;
	Mon, 20 Jul 2020 19:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7889AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PchI2xNWPaPeMD+/aLFeAV9uqsA6o3tGDxXbbP2ElkQ=;
 b=THM4/fH6DjTQfVvqpvGYZifsku+PL7DmN+8507DnCrdO6Q+VEwyIDSxi9RXDop4+1Vp+fY
 gry144rkh+LQdq8MXNgDMT+ykwBrk7yePjC9RFFeUanowofj9cqk/AfWBzjN5b6BAuoWUn
 IbKhxCwdCH/nnKzs0NoEmd05b1W1Q90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-e8gq-JDJP2u3PZqlLzi5Uw-1; Mon, 20 Jul 2020 15:07:48 -0400
X-MC-Unique: e8gq-JDJP2u3PZqlLzi5Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A0B18C63C0;
 Mon, 20 Jul 2020 19:07:45 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 850CE5C1D4;
 Mon, 20 Jul 2020 19:07:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_reset()
Date: Mon, 20 Jul 2020 15:07:32 -0400
Message-Id: <20200720190736.180297-2-lyude@redhat.com>
In-Reply-To: <20200720190736.180297-1-lyude@redhat.com>
References: <20200720190736.180297-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the drivers in the kernel tree only call this from one of the
following contexts:

* drm_crtc_funcs->reset
* During initial module load

Since both of these contexts are guaranteed to have interrupts enabled
beforehand, there's no need to use the irqsave/irqrestore variants of
spin_(un)lock(). So, fix this to make the irq context of this function
more obvious.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f402c75b9d343..6af78aecea9d4 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1363,11 +1363,10 @@ EXPORT_SYMBOL(drm_crtc_vblank_off);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned long irqflags;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
-	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	spin_lock_irq(&dev->vbl_lock);
 	/*
 	 * Prevent subsequent drm_vblank_get() from enabling the vblank
 	 * interrupt by bumping the refcount.
@@ -1376,7 +1375,7 @@ void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 		atomic_inc(&vblank->refcount);
 		vblank->inmodeset = 1;
 	}
-	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+	spin_unlock_irq(&dev->vbl_lock);
 
 	drm_WARN_ON(dev, !list_empty(&dev->vblank_event_list));
 	drm_WARN_ON(dev, !list_empty(&vblank->pending_work));
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
