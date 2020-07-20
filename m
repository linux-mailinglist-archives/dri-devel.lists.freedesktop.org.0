Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BC226EB7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA77F89DE6;
	Mon, 20 Jul 2020 19:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187C289DD3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDSn77KHLgCft4skfPmD/XyPr1U9WWAni3dIC85rwNI=;
 b=JR+5VCouAd3ZMKevhcXaqdTqqiixEiB/TSdQGEvY4GpWZDgxE3gvms4XIjoUdXFevwh3j7
 EKOIRp7OlBmWffFVPZih2x+TCFOwHgMwJIRSr9jIg1v8nxPXGlbjXnuqaxmmFiZpn0+qXO
 MK+i08n77nx9MmuqfmjdDBDiAhxLbeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110--RtHis-JPYOB2lF7FzpPVg-1; Mon, 20 Jul 2020 15:07:52 -0400
X-MC-Unique: -RtHis-JPYOB2lF7FzpPVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F19DC800688;
 Mon, 20 Jul 2020 19:07:50 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 036995C1D4;
 Mon, 20 Jul 2020 19:07:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_queue_sequence_ioctl()
Date: Mon, 20 Jul 2020 15:07:36 -0400
Message-Id: <20200720190736.180297-6-lyude@redhat.com>
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

This is an ioctl callback, so we're guaranteed to have IRQs enabled when
calling this function. Use the plain _irq() variants of spin_(un)lock()
to make this more obvious.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 64610070ba473..b18e1efbbae1a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -2066,7 +2066,6 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	u64 seq;
 	u64 req_seq;
 	int ret;
-	unsigned long spin_flags;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -2114,7 +2113,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	e->event.base.length = sizeof(e->event.seq);
 	e->event.seq.user_data = queue_seq->user_data;
 
-	spin_lock_irqsave(&dev->event_lock, spin_flags);
+	spin_lock_irq(&dev->event_lock);
 
 	/*
 	 * drm_crtc_vblank_off() might have been called after we called
@@ -2145,11 +2144,11 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 		queue_seq->sequence = req_seq;
 	}
 
-	spin_unlock_irqrestore(&dev->event_lock, spin_flags);
+	spin_unlock_irq(&dev->event_lock);
 	return 0;
 
 err_unlock:
-	spin_unlock_irqrestore(&dev->event_lock, spin_flags);
+	spin_unlock_irq(&dev->event_lock);
 	drm_crtc_vblank_put(crtc);
 err_free:
 	kfree(e);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
