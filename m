Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C096226EB2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1489BFB;
	Mon, 20 Jul 2020 19:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5C89BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYp8hDLa0IjA98YGkayyQ6Kw4QTJdXG0itKNmWlfDu8=;
 b=D+AZrxRI/qkkeZwfA2/bhenx/3kS8rC6ELWZ7GULzMBIdufI0j6PIE3PUsdJDc3Zzzgdur
 2tOybFfbsrLztNjfwj7xzojsun9Ga/0JHj94H0AdQ8ZG3Necmejfi2OoAGPmYVpt1cKWTs
 DWYDXamhLMqPeoacAE+yYIiHRb9G2iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-Z5mpDVRvM2KND--pY5kLYQ-1; Mon, 20 Jul 2020 15:07:49 -0400
X-MC-Unique: Z5mpDVRvM2KND--pY5kLYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731AA1005504;
 Mon, 20 Jul 2020 19:07:48 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 844A35C1D4;
 Mon, 20 Jul 2020 19:07:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_legacy_vblank_post_modeset()
Date: Mon, 20 Jul 2020 15:07:34 -0400
Message-Id: <20200720190736.180297-4-lyude@redhat.com>
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

This function is only ever called from ioctl context, so we're
guaranteed to have interrupts enabled. Stop using the irqsave/irqrestore
variants of spin_(un)lock_irq() to make this more obvious.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 9891e82939e35..51f2e988205e7 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1551,7 +1551,6 @@ static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
 					   unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
 
 	/* vblank is not initialized (IRQ not installed ?), or has been freed */
 	if (!drm_dev_has_vblank(dev))
@@ -1561,9 +1560,9 @@ static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
 		return;
 
 	if (vblank->inmodeset) {
-		spin_lock_irqsave(&dev->vbl_lock, irqflags);
+		spin_lock_irq(&dev->vbl_lock);
 		drm_reset_vblank_timestamp(dev, pipe);
-		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+		spin_unlock_irq(&dev->vbl_lock);
 
 		if (vblank->inmodeset & 0x2)
 			drm_vblank_put(dev, pipe);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
