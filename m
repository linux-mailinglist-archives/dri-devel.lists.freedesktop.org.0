Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851A445748
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E9972DE5;
	Thu,  4 Nov 2021 16:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E1472DE5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636043605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JgIlKKcyv1xuKr8/KIoOJvgCadSxABBEMfgI/LaHrJw=;
 b=VDzWzydLlMhrfPNUjITRV4wYI9QhXKJRSO+Fo2Cks5/L/7cGfBa77nSUaVID60GkLz7eLz
 YZK55JtPCXKXyUyG8nTFTIXIc5dT/uIQVht982MNyhmy7FE6WRqWNVKBsqTycNd8DiVKpl
 XVKAVVUZhlCVSjnBqTF952dqu41rM08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-QRIk1CzFOx6ouBsqBfZ6UQ-1; Thu, 04 Nov 2021 12:33:24 -0400
X-MC-Unique: QRIk1CzFOx6ouBsqBfZ6UQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20BD19611C5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:33:23 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17CF1100763D;
 Thu,  4 Nov 2021 16:33:22 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fb-helper: Fix restore_fbdev when there are pending
 delayed hotplug
Date: Thu,  4 Nov 2021 17:32:45 +0100
Message-Id: <20211104163245.11070-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using Xorg/Logind and an external monitor connected with an MST dock.
After disconnecting the external monitor, switching to VT may not work,
the (internal) monitor sill display Xorg, and you can't see what you are
typing in the VT.

This is related to commit e2809c7db818df6bbd0edf843e1beb2fbc9d8541 which
introduced delayed hotplug for MST, and commit
dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320 which introduced a workaround for
Xorg and logind, and add a force parameter to
__drm_fb_helper_restore_fbdev_mode_unlocked() in this case.

When switching to VT, with Xorg and logind, if there
are pending hotplug event (like MST unplugged), the hotplug path
may not be fulfilled, because logind may drop the master a bit later.
It leads to the console not showing up on the monitor.

So in this case, forward the "force" parameter to the hotplug event,
and ignore if there is a drm master in this case.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 66 ++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8e7a124d6c5a..c07080f661b1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -82,6 +82,8 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
 static LIST_HEAD(kernel_fb_helper_list);
 static DEFINE_MUTEX(kernel_fb_helper_lock);
 
+static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force);
+
 /**
  * DOC: fbdev helpers
  *
@@ -258,7 +260,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 	mutex_unlock(&fb_helper->lock);
 
 	if (do_delayed)
-		drm_fb_helper_hotplug_event(fb_helper);
+		__drm_fb_helper_hotplug_event(fb_helper, force);
 
 	return ret;
 }
@@ -1930,6 +1932,38 @@ int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
 }
 EXPORT_SYMBOL(drm_fb_helper_initial_config);
 
+static int __drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper, bool force)
+{
+	int err = 0;
+
+	if (!drm_fbdev_emulation || !fb_helper)
+		return 0;
+
+	mutex_lock(&fb_helper->lock);
+	if (fb_helper->deferred_setup) {
+		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
+				fb_helper->preferred_bpp);
+		return err;
+	}
+	if (!force) {
+		if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
+			fb_helper->delayed_hotplug = true;
+			mutex_unlock(&fb_helper->lock);
+			return err;
+		}
+		drm_master_internal_release(fb_helper->dev);
+	}
+	drm_dbg_kms(fb_helper->dev, "\n");
+
+	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
+	drm_setup_crtcs_fb(fb_helper);
+	mutex_unlock(&fb_helper->lock);
+
+	drm_fb_helper_set_par(fb_helper->fbdev);
+
+	return 0;
+}
+
 /**
  * drm_fb_helper_hotplug_event - respond to a hotplug notification by
  *                               probing all the outputs attached to the fb
@@ -1953,35 +1987,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
  */
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 {
-	int err = 0;
-
-	if (!drm_fbdev_emulation || !fb_helper)
-		return 0;
-
-	mutex_lock(&fb_helper->lock);
-	if (fb_helper->deferred_setup) {
-		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
-				fb_helper->preferred_bpp);
-		return err;
-	}
-
-	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
-		fb_helper->delayed_hotplug = true;
-		mutex_unlock(&fb_helper->lock);
-		return err;
-	}
-
-	drm_master_internal_release(fb_helper->dev);
-
-	drm_dbg_kms(fb_helper->dev, "\n");
-
-	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->width, fb_helper->fb->height);
-	drm_setup_crtcs_fb(fb_helper);
-	mutex_unlock(&fb_helper->lock);
-
-	drm_fb_helper_set_par(fb_helper->fbdev);
-
-	return 0;
+	return __drm_fb_helper_hotplug_event(fb_helper, false);
 }
 EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
 
-- 
2.33.1

