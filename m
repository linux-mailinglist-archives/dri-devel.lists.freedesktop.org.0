Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCC226EB6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83C589C0D;
	Mon, 20 Jul 2020 19:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E2D89C0D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8JGw1vp/HeS7n74dHX0UW8Z7hcMVJHzFu7NPlVByPJI=;
 b=Ys6/60IfpPWzisoqjUKpjqTbOwh8IpuLX3hYUVzuKm9lMDTo1Ul/PGBvOsDzEAvZRo03Cw
 yjoIWUFyYnWLJShx1jJehtth1mJ1AXhVB0WxZ98VqOl9uehdXUIotspBB4rFdle6cOO0OJ
 2Kg3jnnyjPeNxBnWqZ7wwcxZ0Oe1JBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45--93WF80dNeGefZDqPZf9ZA-1; Mon, 20 Jul 2020 15:07:51 -0400
X-MC-Unique: -93WF80dNeGefZDqPZf9ZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B011E107ACCA;
 Mon, 20 Jul 2020 19:07:49 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4745C22A;
 Mon, 20 Jul 2020 19:07:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_queue_vblank_event()
Date: Mon, 20 Jul 2020 15:07:35 -0400
Message-Id: <20200720190736.180297-5-lyude@redhat.com>
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

This one's easy - we're already calling kzalloc() in this function, so
we must already be guaranteed to have IRQs enabled when calling this.
So, use the plain _irq() variants of spin_(un)lock() to make this more
obvious.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 51f2e988205e7..64610070ba473 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1611,7 +1611,6 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct drm_pending_vblank_event *e;
 	ktime_t now;
-	unsigned long flags;
 	u64 seq;
 	int ret;
 
@@ -1633,7 +1632,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 			e->event.vbl.crtc_id = crtc->base.id;
 	}
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	spin_lock_irq(&dev->event_lock);
 
 	/*
 	 * drm_crtc_vblank_off() might have been called after we called
@@ -1670,12 +1669,12 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 		vblwait->reply.sequence = req_seq;
 	}
 
-	spin_unlock_irqrestore(&dev->event_lock, flags);
+	spin_unlock_irq(&dev->event_lock);
 
 	return 0;
 
 err_unlock:
-	spin_unlock_irqrestore(&dev->event_lock, flags);
+	spin_unlock_irq(&dev->event_lock);
 	kfree(e);
 err_put:
 	drm_vblank_put(dev, pipe);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
