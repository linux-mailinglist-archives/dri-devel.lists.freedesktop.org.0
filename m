Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20844988B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051189CD8;
	Mon,  8 Nov 2021 15:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0A89CD8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636385791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BtomrFXRT3aGZfpJSLcXA4p3yYuAdwhDE0G7Hs3pkdI=;
 b=C5nejvP9x++HXCY6gOVJX/pkgkP/2J/HG0f4xjVCs7gRu4Gk1lnKlFacdQgyi3rBxhMP6A
 1u2BFjFQHqnvvLmc1J+ZTSbDPB03LRBiH0Pfhv03PnSbbdx1HVXwDuhm4+5z8+E7KyLXOt
 MlhyecU3ROnIdeqJsflfuoSAP4m1anc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-MdE84nPcO4eGSI_SzI78rw-1; Mon, 08 Nov 2021 10:36:27 -0500
X-MC-Unique: MdE84nPcO4eGSI_SzI78rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EEA19200D0;
 Mon,  8 Nov 2021 15:36:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3BEC78B2A;
 Mon,  8 Nov 2021 15:36:17 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event() when
 releasing drm master
Date: Mon,  8 Nov 2021 16:34:53 +0100
Message-Id: <20211108153453.51240-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: michel@daenzer.net, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using Xorg/Logind and an external monitor connected with an MST dock.
After disconnecting the external monitor, switching to VT may not work,
the (internal) monitor sill display Xorg, and you can't see what you are
typing in the VT.

This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
checking into restore mode (v2)")

When switching to VT, with Xorg and logind, if there
are pending hotplug event (like MST unplugged), the hotplug path
may not be fulfilled, because logind may drop the master a bit later.
It leads to the console not showing up on the monitor.

So when dropping the drm master, call the delayed hotplug function if
needed.

v2: rewrote the patch by calling the hotplug function after dropping master

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_auth.c      | 7 +++++++
 drivers/gpu/drm/drm_fb_helper.c | 6 +++---
 include/drm/drm_fb_helper.h     | 4 +++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 60a6b21474b1..73acf1994d49 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -35,6 +35,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_lease.h>
 #include <drm/drm_print.h>
+#include <drm/drm_fb_helper.h>
 
 #include "drm_internal.h"
 #include "drm_legacy.h"
@@ -321,6 +322,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	}
 
 	drm_drop_master(dev, file_priv);
+
+	mutex_unlock(&dev->master_mutex);
+	if (dev->fb_helper && dev->fb_helper->delayed_hotplug)
+		dev->fb_helper->delayed_hotplug(dev->fb_helper);
+	return ret;
+
 out_unlock:
 	mutex_unlock(&dev->master_mutex);
 	return ret;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8e7a124d6c5a..e8d8cc3f47c3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -252,9 +252,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 		ret = drm_client_modeset_commit(&fb_helper->client);
 	}
 
-	do_delayed = fb_helper->delayed_hotplug;
+	do_delayed = (fb_helper->delayed_hotplug != NULL);
 	if (do_delayed)
-		fb_helper->delayed_hotplug = false;
+		fb_helper->delayed_hotplug = NULL;
 	mutex_unlock(&fb_helper->lock);
 
 	if (do_delayed)
@@ -1966,7 +1966,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	}
 
 	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
-		fb_helper->delayed_hotplug = true;
+		fb_helper->delayed_hotplug = drm_fb_helper_hotplug_event;
 		mutex_unlock(&fb_helper->lock);
 		return err;
 	}
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3af4624368d8..c2131d1a0e23 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -160,8 +160,10 @@ struct drm_fb_helper {
 	 * A hotplug was received while fbdev wasn't in control of the DRM
 	 * device, i.e. another KMS master was active. The output configuration
 	 * needs to be reprobe when fbdev is in control again.
+	 * NULL, or a pointer to the hotplug function, so it can be called
+	 * by the drm drop function directly.
 	 */
-	bool delayed_hotplug;
+	int (*delayed_hotplug)(struct drm_fb_helper *helper);
 
 	/**
 	 * @deferred_setup:
-- 
2.33.1

