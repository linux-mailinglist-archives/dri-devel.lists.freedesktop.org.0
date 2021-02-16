Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E831C9C3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA1389C46;
	Tue, 16 Feb 2021 11:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C1389C46
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FGcyZ1YMxCtgiuoN0O369he0ANjC3No6/UooUw2uNk=;
 b=D6IhX2D7Qz56jd5Sv0IEDNPzp+2oIrg27/c4/8gL64S3ASgVIDfs9h9IQlUmwsENxS9ZPF
 7bp+4qKvfamWZG7Qwhym4rwPXGntI1ay38+4t4xxwwgTX+k1PzrQyy5TZvZoq5YPmD4z/i
 cZac0kxEQ5KDMWzUT6bhZXCtNmY88C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Ydzhd4QxOySSOZx60YUisA-1; Tue, 16 Feb 2021 06:37:24 -0500
X-MC-Unique: Ydzhd4QxOySSOZx60YUisA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33EE4835E22;
 Tue, 16 Feb 2021 11:37:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49DF45B698;
 Tue, 16 Feb 2021 11:37:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 420EB1800386; Tue, 16 Feb 2021 12:37:17 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/qxl: more fence wait rework
Date: Tue, 16 Feb 2021 12:37:08 +0100
Message-Id: <20210216113716.716996-3-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-1-kraxel@redhat.com>
References: <20210216113716.716996-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move qxl_io_notify_oom() call into wait condition.
That way the driver will call it again if one call
wasn't enough.

Also allows to remove the extra dma_fence_is_signaled()
check and the goto.

Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 6ed673d75f9f..63818b56218c 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -62,16 +62,13 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
 
-	if (dma_fence_is_signaled(fence))
-		goto signaled;
-
-	qxl_io_notify_oom(qdev);
 	if (!wait_event_timeout(qdev->release_event,
-				dma_fence_is_signaled(fence),
+				(dma_fence_is_signaled(fence) || (
+					qxl_io_notify_oom(qdev),
+					0)),
 				timeout))
 		return 0;
 
-signaled:
 	cur = jiffies;
 	if (time_after(cur, end))
 		return 0;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
