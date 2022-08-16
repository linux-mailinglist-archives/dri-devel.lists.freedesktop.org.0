Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70443595F61
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD45A9991;
	Tue, 16 Aug 2022 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E566970F9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEEF334896;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHL34d884vEyAX73WPysjsG0C4Eu/0Wh82cK/d9bHgs=;
 b=LpvOMMdFeC27DfdeWCKELrZn1K42rC2N4C+VuTs9FRM3phQASUxvLIkKarLf6FrdHwSAxw
 pZWYI0r8AzyuNyUq8o6ZaBKrmBsLT1UlN4hD5Df2wUz5Co/KVDq/RAoOF5NUQ5g7hIb7Vo
 Z49QLU/ryCAh8UEDxg/zDwAgtJtIP88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHL34d884vEyAX73WPysjsG0C4Eu/0Wh82cK/d9bHgs=;
 b=8tuNAyBSWlX2/W9ZcItds2vi7blLcybomfvi3tUIw2JegsW3vTyUi3+wTPeMoCcmdw0NIU
 cg+h9kn4gfDuALCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D01EB13B1A;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SH1JMp+5+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/12] drm/udl: Sync pending URBs at the end of suspend
Date: Tue, 16 Aug 2022 17:36:55 +0200
Message-Id: <20220816153655.27526-13-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816153655.27526-1-tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's better to perform the sync at the very last of the suspend
instead of the pipe-disable function, so that we can catch all pending
URBs (if any).

While we're at it, drop the error code from udl_sync_pending_urb()
since we basically ignore it; instead, give a clear error message
indicating a problem.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.c     | 8 +++++++-
 drivers/gpu/drm/udl/udl_drv.h     | 2 +-
 drivers/gpu/drm/udl/udl_main.c    | 6 ++----
 drivers/gpu/drm/udl/udl_modeset.c | 2 --
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 0ba88e5472a9..91effdcefb6d 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -21,8 +21,14 @@ static int udl_usb_suspend(struct usb_interface *interface,
 			   pm_message_t message)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
+	int ret;
 
-	return drm_mode_config_helper_suspend(dev);
+	ret = drm_mode_config_helper_suspend(dev);
+	if (ret)
+		return ret;
+
+	udl_sync_pending_urbs(dev);
+	return 0;
 }
 
 static int udl_usb_resume(struct usb_interface *interface)
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index d943684b5bbb..b4cc7cc568c7 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -77,7 +77,7 @@ struct drm_connector *udl_connector_init(struct drm_device *dev);
 struct urb *udl_get_urb(struct drm_device *dev);
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
-int udl_sync_pending_urbs(struct drm_device *dev);
+void udl_sync_pending_urbs(struct drm_device *dev);
 void udl_urb_completion(struct urb *urb);
 
 int udl_init(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index c1f4b6199949..df92f6518e1c 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -294,10 +294,9 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 }
 
 /* wait until all pending URBs have been processed */
-int udl_sync_pending_urbs(struct drm_device *dev)
+void udl_sync_pending_urbs(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
-	int ret = 0;
 
 	spin_lock_irq(&udl->urbs.lock);
 	/* 2 seconds as a sane timeout */
@@ -305,9 +304,8 @@ int udl_sync_pending_urbs(struct drm_device *dev)
 					 udl->urbs.available == udl->urbs.count,
 					 udl->urbs.lock,
 					 msecs_to_jiffies(2000)))
-		ret = -ETIMEDOUT;
+		drm_err(dev, "Timeout for syncing pending URBs\n");
 	spin_unlock_irq(&udl->urbs.lock);
-	return ret;
 }
 
 int udl_init(struct udl_device *udl)
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index bca31c890108..9d72288d9967 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -391,8 +391,6 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
-
-	udl_sync_pending_urbs(dev);
 }
 
 static void
-- 
2.35.3

