Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A8226EB5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54C89DDD;
	Mon, 20 Jul 2020 19:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E6E89C0D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zurpX8t5Oe22ZRXjmmq6bc4/JlbLHckZjRUTW5w4qAk=;
 b=DQcxVpFDr/WLjSYWMoxmVxyYVeDFcGfy6/Dt8cagfQUBDeXKhae8N16hFT6mw0Fa7aj4Nu
 zQEWsCHf4NvZOLrOJRoUt1/1CgR2rX2Dguc20Xu9xJxb5/pTQEk80c4K86PA5aGnwiFKx6
 ImRurjPimzeIqJy5pARyAo7H/BFcvGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-x33gDq3ePcmvY2Y9hhPL9Q-1; Mon, 20 Jul 2020 15:07:48 -0400
X-MC-Unique: x33gDq3ePcmvY2Y9hhPL9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39B038005B0;
 Mon, 20 Jul 2020 19:07:47 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0A6B5C22A;
 Mon, 20 Jul 2020 19:07:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_on()
Date: Mon, 20 Jul 2020 15:07:33 -0400
Message-Id: <20200720190736.180297-3-lyude@redhat.com>
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

This is only called from:
* Atomic modesetting hooks
* Module probing routines
* Legacy modesetting hooks

All of which have IRQs enabled, so we can also get rid of
irqsave/restore here to make the IRQ context of this function more
obvious.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 6af78aecea9d4..9891e82939e35 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1428,12 +1428,11 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
-	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
 
@@ -1451,7 +1450,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	 */
 	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
 		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
-	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+	spin_unlock_irq(&dev->vbl_lock);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
