Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F3B2326F6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 23:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39AA6E7E2;
	Wed, 29 Jul 2020 21:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151376E425
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ni+bhhrvnhO+vPSmEBRMLPrBAn7VL14+CgNJhQOWM7U=;
 b=Fi8MvpqP9OQ/mWyFb2oYoBDPe1Hq4EtZQLNtzn3S7KBNTBLfaPPu/k6SQNcsStSUMd5YbB
 CVBj9jzq3VHBPQYsyT56e0KvdDn9njMAz8ypRZdh29C3DdCYdWuhweEhRtZVPdD8sqqzuM
 6KfH2H1HEUrxZI32RFghiW/De3r8a1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-W7gAal89OdORW5FgRep-Dg-1; Wed, 29 Jul 2020 17:37:19 -0400
X-MC-Unique: W7gAal89OdORW5FgRep-Dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47FC391270;
 Wed, 29 Jul 2020 21:37:18 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA6D619B5;
 Wed, 29 Jul 2020 21:37:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 7/9] drm/nouveau/kms: Invert conditionals in
 nouveau_display_acpi_ntfy()
Date: Wed, 29 Jul 2020 17:37:01 -0400
Message-Id: <20200729213703.119137-8-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes here, just a drive-by cleanup.

Signed-off-by: Lyude Paul <lyude@redhat.com>
[cc'd to stable since the next fix needs this patch to apply]
Fixes: 79e765ad665d ("drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 50 +++++++++++------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index cdc5a2200f95e..96c9e7f550537 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -457,34 +457,32 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 	struct acpi_bus_event *info = data;
 	int ret;
 
-	if (!strcmp(info->device_class, ACPI_VIDEO_CLASS)) {
-		if (info->type == ACPI_VIDEO_NOTIFY_PROBE) {
-			ret = pm_runtime_get(drm->dev->dev);
-			if (ret == 1 || ret == -EACCES) {
-				/* If the GPU is already awake, or in a state
-				 * where we can't wake it up, it can handle
-				 * it's own hotplug events.
-				 */
-				pm_runtime_put_autosuspend(drm->dev->dev);
-			} else if (ret == 0) {
-				/* This may be the only indication we receive
-				 * of a connector hotplug on a runtime
-				 * suspended GPU, schedule hpd_work to check.
-				 */
-				NV_DEBUG(drm, "ACPI requested connector reprobe\n");
-				schedule_work(&drm->hpd_work);
-				pm_runtime_put_noidle(drm->dev->dev);
-			} else {
-				NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
-					ret);
-			}
-
-			/* acpi-video should not generate keypresses for this */
-			return NOTIFY_BAD;
-		}
+	if (strcmp(info->device_class, ACPI_VIDEO_CLASS) ||
+	    info->type != ACPI_VIDEO_NOTIFY_PROBE)
+		return NOTIFY_DONE;
+
+	ret = pm_runtime_get(drm->dev->dev);
+	if (ret == 1 || ret == -EACCES) {
+		/* If the GPU is already awake, or in a state
+		 * where we can't wake it up, it can handle
+		 * it's own hotplug events.
+		 */
+		pm_runtime_put_autosuspend(drm->dev->dev);
+	} else if (ret == 0) {
+		/* This may be the only indication we receive
+		 * of a connector hotplug on a runtime
+		 * suspended GPU, schedule hpd_work to check.
+		 */
+		NV_DEBUG(drm, "ACPI requested connector reprobe\n");
+		schedule_work(&drm->hpd_work);
+		pm_runtime_put_noidle(drm->dev->dev);
+	} else {
+		NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
+			ret);
 	}
 
-	return NOTIFY_DONE;
+	/* acpi-video should not generate keypresses for this */
+	return NOTIFY_BAD;
 }
 #endif
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
