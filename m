Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8D12326F4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9226E7D9;
	Wed, 29 Jul 2020 21:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150CC6E30D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZUmMq7LOcytSQJLwWlWA10KHAFK/rR0ayzLy5+ncKQ=;
 b=cbJ9YaMxS2g2PlKgcaVRcrocm4ponH6sndDOCYbyL1Bjo7LQtMmffVTubHwc3cbnPICUB3
 vO7fovT6gyxAPhTRXjGj2Vszs48UTuC4J7aKolAQAZMt7gUYn3qXfvfa3iMUcwt+C5Xhxe
 p4T0HNiGyCuA1B+BgZWwwfinJ5+afpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-dxjl5SBXNtW7rFJNN47Wxw-1; Wed, 29 Jul 2020 17:37:16 -0400
X-MC-Unique: dxjl5SBXNtW7rFJNN47Wxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD96D1893DC0;
 Wed, 29 Jul 2020 21:37:14 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4F861176;
 Wed, 29 Jul 2020 21:37:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 4/9] drm/nouveau/kms/fbcon: Fix pm_runtime calls in
 nouveau_fbcon_output_poll_changed()
Date: Wed, 29 Jul 2020 17:36:58 -0400
Message-Id: <20200729213703.119137-5-lyude@redhat.com>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed two problems here:
* We're not dropping our runtime PM refs after getting an error
* We're not backing off when pm_runtime_get() indicates that there's
  already a resume in progress (-EINPROGRESS) (after which any delayed
  fbcon events will get handled anyway)

So, let's fix those.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 7fec8f5379fb ("drm/nouveau/drm/nouveau: Fix deadlock with fb_helper with async RPM requests")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4d9f3b5ae72d2..b936bf1c14dec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -503,10 +503,7 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 	ret = pm_runtime_get(dev->dev);
 	if (ret == 1 || ret == -EACCES) {
 		drm_fb_helper_hotplug_event(&fbcon->helper);
-
-		pm_runtime_mark_last_busy(dev->dev);
-		pm_runtime_put_autosuspend(dev->dev);
-	} else if (ret == 0) {
+	} else if (ret == 0 || ret == -EINPROGRESS) {
 		/* If the GPU was already in the process of suspending before
 		 * this event happened, then we can't block here as we'll
 		 * deadlock the runtime pmops since they wait for us to
@@ -516,11 +513,15 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 		NV_DEBUG(drm, "fbcon HPD event deferred until runtime resume\n");
 		fbcon->hotplug_waiting = true;
 		pm_runtime_put_noidle(drm->dev->dev);
+		goto out;
 	} else {
 		DRM_WARN("fbcon HPD event lost due to RPM failure: %d\n",
 			 ret);
 	}
 
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
+out:
 	mutex_unlock(&fbcon->hotplug_lock);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
