Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7618230DAD7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBE86EAAB;
	Wed,  3 Feb 2021 13:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DE96EAAC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612358187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIQiGfgSUKUQ4lTI2ex1yiuCPVjrmXrlcR2znxklmvA=;
 b=BDjNxegj2PM12pszzBreN0Rg49K12dDgMa7G2ArI65kA+OfKNFScrSDstsEioE8X3E0zUF
 4qCT1p0zdAq9Y6V6+ZQu9cXystyQmatZ9SF0DHQyQfMNczdY4BsaQtq6tqJRPG0ccmsi5C
 wvsz//2hYjbLFqvKsg8TqEzaX0fID+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-P3MjeksvMd-vYzW12ilQag-1; Wed, 03 Feb 2021 08:16:26 -0500
X-MC-Unique: P3MjeksvMd-vYzW12ilQag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7B6C107ACE6;
 Wed,  3 Feb 2021 13:16:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D8C60C5F;
 Wed,  3 Feb 2021 13:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 09075180085A; Wed,  3 Feb 2021 14:16:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/qxl: simplify qxl_fence_wait
Date: Wed,  3 Feb 2021 14:16:15 +0100
Message-Id: <20210203131615.1714021-7-kraxel@redhat.com>
In-Reply-To: <20210203131615.1714021-1-kraxel@redhat.com>
References: <20210203131615.1714021-1-kraxel@redhat.com>
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
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have the new release_event wait queue we can just
use that in qxl_fence_wait() and simplify the code alot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 42 +++----------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 43a5436853b7..b6f4b8dcf228 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -59,53 +59,19 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 {
 	struct qxl_device *qdev;
 	struct qxl_release *release;
-	int count = 0, sc = 0;
-	bool have_drawable_releases;
 	unsigned long cur, end = jiffies + timeout;
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
 	release = container_of(fence, struct qxl_release, base);
-	have_drawable_releases = release->type == QXL_RELEASE_DRAWABLE;
-
-retry:
-	sc++;
 
 	if (dma_fence_is_signaled(fence))
 		goto signaled;
 
 	qxl_io_notify_oom(qdev);
-
-	for (count = 0; count < 11; count++) {
-		if (!qxl_queue_garbage_collect(qdev, true))
-			break;
-
-		if (dma_fence_is_signaled(fence))
-			goto signaled;
-	}
-
-	if (dma_fence_is_signaled(fence))
-		goto signaled;
-
-	if (have_drawable_releases || sc < 4) {
-		if (sc > 2)
-			/* back off */
-			usleep_range(500, 1000);
-
-		if (time_after(jiffies, end))
-			return 0;
-
-		if (have_drawable_releases && sc > 300) {
-			DMA_FENCE_WARN(fence, "failed to wait on release %llu "
-				       "after spincount %d\n",
-				       fence->context & ~0xf0000000, sc);
-			goto signaled;
-		}
-		goto retry;
-	}
-	/*
-	 * yeah, original sync_obj_wait gave up after 3 spins when
-	 * have_drawable_releases is not set.
-	 */
+	if (!wait_event_timeout(qdev->release_event,
+				dma_fence_is_signaled(fence),
+				timeout))
+		return 0;
 
 signaled:
 	cur = jiffies;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
