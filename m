Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95625AE159
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8610E5B6;
	Tue,  6 Sep 2022 07:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047C10E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:39:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7693B1F96B;
 Tue,  6 Sep 2022 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662449996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LFTqDuydXWR/bPD9hQViahx4U6njcXCTOhibvk3UoQ=;
 b=T8AyymTIZr/Ebvrc7Qa13DSJSLxyQwNfgwjeOVa/rAUYoQAN0SAl8n6Euyzk4mGnWwBS5D
 qf3NecGK8Qj18E6v/1VCujvQkq1QZqWs2D/T2lI2H4rpa31xdjVmP3qx2jdDp8LVFArmXf
 ZXL1aDFyhIu+LLmDOLMMsyCaS3nukwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662449996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LFTqDuydXWR/bPD9hQViahx4U6njcXCTOhibvk3UoQ=;
 b=o+Trv7a0cP5gDj65ak9jkFbUtmg8KW7jeP5lwna70WKobrIZ7Hhee/kIJ5J2+nHBmBMT/U
 RbtD/4yJA6JlDSDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EA3B13A7A;
 Tue,  6 Sep 2022 07:39:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8FYyCUz5FmPeOgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 07:39:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/11] drm/udl: Sync pending URBs at the end of suspend
Date: Tue,  6 Sep 2022 09:39:51 +0200
Message-Id: <20220906073951.2085-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220906073951.2085-1-tiwai@suse.de>
References: <20220906073951.2085-1-tiwai@suse.de>
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
index 808a5ab5e14e..442080fa1061 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -290,10 +290,9 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 }
 
 /* wait until all pending URBs have been processed */
-int udl_sync_pending_urbs(struct drm_device *dev)
+void udl_sync_pending_urbs(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
-	int ret = 0;
 
 	spin_lock_irq(&udl->urbs.lock);
 	/* 2 seconds as a sane timeout */
@@ -301,9 +300,8 @@ int udl_sync_pending_urbs(struct drm_device *dev)
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
index 9896c16c74f5..c506fff8f0c4 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -383,8 +383,6 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
-
-	udl_sync_pending_urbs(dev);
 }
 
 static void
-- 
2.35.3

