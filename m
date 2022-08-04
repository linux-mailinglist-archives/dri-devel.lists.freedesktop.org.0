Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF935898E7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B33612A5D8;
	Thu,  4 Aug 2022 07:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527C9031E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 07:58:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8FEC3745B;
 Thu,  4 Aug 2022 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659599913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TZHQcktm3QvM1NCb7e4x/dR11ax1XCqjFqzL2pGsCE=;
 b=Ke+V8ZjusffCbYuzxT0hFh1CxZ8n4Fers3FYUpY/zF2BtOrs20DwUvzJ1OnyqACokHaxm2
 OfIauyXEPzXVAiAzs6/jBNmpXKT50HpTxFmCM2rjN3DQsleDu5h+OUYuo/NoPmpLPZWi9f
 we8R/TmVsZhpDmPgnlHRWFM/hs0ncJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659599913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TZHQcktm3QvM1NCb7e4x/dR11ax1XCqjFqzL2pGsCE=;
 b=pK2uoHfpvUX9m1tdfrTXouSuUoHtao5xaWO17wFI4XVojlN13DRH+HK97nLLmEG4c7/aJE
 tOPqdrbmDcjGqhCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B478913AF2;
 Thu,  4 Aug 2022 07:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UPtCKyl862IlJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 04 Aug 2022 07:58:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/udl: Replace semaphore with a simple wait queue
Date: Thu,  4 Aug 2022 09:58:23 +0200
Message-Id: <20220804075826.27036-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220804075826.27036-1-tiwai@suse.de>
References: <20220804075826.27036-1-tiwai@suse.de>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UDL driver uses a semaphore for controlling the emptiness of FIFO in a
slightly funky way.  This patch replaces it with a wait queue and
controls the emptiness with the standard wait_event*() macro instead,
which is a more straightforward implementation.

While we are at it, drop the dead code for delayed semaphore down,
too.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h  | 11 +++--
 drivers/gpu/drm/udl/udl_main.c | 84 ++++++++++------------------------
 2 files changed, 31 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index cc16a13316e4..e008686ec738 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -34,14 +34,13 @@ struct udl_device;
 struct urb_node {
 	struct list_head entry;
 	struct udl_device *dev;
-	struct delayed_work release_urb_work;
 	struct urb *urb;
 };
 
 struct urb_list {
 	struct list_head list;
 	spinlock_t lock;
-	struct semaphore limit_sem;
+	wait_queue_head_t sleep;
 	int available;
 	int count;
 	size_t size;
@@ -75,7 +74,13 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 int udl_modeset_init(struct drm_device *dev);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
-struct urb *udl_get_urb(struct drm_device *dev);
+struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout);
+
+#define GET_URB_TIMEOUT	HZ
+static inline struct urb *udl_get_urb(struct drm_device *dev)
+{
+	return udl_get_urb_timeout(dev, GET_URB_TIMEOUT);
+}
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
 void udl_urb_completion(struct urb *urb);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 853f147036f6..67fd41e59b80 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -23,9 +23,6 @@
 #define WRITES_IN_FLIGHT (4)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
 
-#define GET_URB_TIMEOUT	HZ
-#define FREE_URB_TIMEOUT (HZ*2)
-
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct usb_device *udev = udl_to_usb_device(udl);
@@ -119,14 +116,6 @@ static int udl_select_std_channel(struct udl_device *udl)
 	return ret < 0 ? ret : 0;
 }
 
-static void udl_release_urb_work(struct work_struct *work)
-{
-	struct urb_node *unode = container_of(work, struct urb_node,
-					      release_urb_work.work);
-
-	up(&unode->dev->urbs.limit_sem);
-}
-
 void udl_urb_completion(struct urb *urb)
 {
 	struct urb_node *unode = urb->context;
@@ -150,23 +139,13 @@ void udl_urb_completion(struct urb *urb)
 	udl->urbs.available++;
 	spin_unlock_irqrestore(&udl->urbs.lock, flags);
 
-#if 0
-	/*
-	 * When using fb_defio, we deadlock if up() is called
-	 * while another is waiting. So queue to another process.
-	 */
-	if (fb_defio)
-		schedule_delayed_work(&unode->release_urb_work, 0);
-	else
-#endif
-		up(&udl->urbs.limit_sem);
+	wake_up(&udl->urbs.sleep);
 }
 
 static void udl_free_urb_list(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
 	int count = udl->urbs.count;
-	struct list_head *node;
 	struct urb_node *unode;
 	struct urb *urb;
 
@@ -174,23 +153,15 @@ static void udl_free_urb_list(struct drm_device *dev)
 
 	/* keep waiting and freeing, until we've got 'em all */
 	while (count--) {
-		down(&udl->urbs.limit_sem);
-
-		spin_lock_irq(&udl->urbs.lock);
-
-		node = udl->urbs.list.next; /* have reserved one with sem */
-		list_del_init(node);
-
-		spin_unlock_irq(&udl->urbs.lock);
-
-		unode = list_entry(node, struct urb_node, entry);
-		urb = unode->urb;
-
+		urb = udl_get_urb_timeout(dev, MAX_SCHEDULE_TIMEOUT);
+		if (WARN_ON(!urb))
+			break;
+		unode = urb->context;
 		/* Free each separately allocated piece */
 		usb_free_coherent(urb->dev, udl->urbs.size,
 				  urb->transfer_buffer, urb->transfer_dma);
 		usb_free_urb(urb);
-		kfree(node);
+		kfree(unode);
 	}
 	udl->urbs.count = 0;
 }
@@ -210,7 +181,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 	udl->urbs.size = size;
 	INIT_LIST_HEAD(&udl->urbs.list);
 
-	sema_init(&udl->urbs.limit_sem, 0);
+	init_waitqueue_head(&udl->urbs.sleep);
 	udl->urbs.count = 0;
 	udl->urbs.available = 0;
 
@@ -220,9 +191,6 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 			break;
 		unode->dev = udl;
 
-		INIT_DELAYED_WORK(&unode->release_urb_work,
-			  udl_release_urb_work);
-
 		urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!urb) {
 			kfree(unode);
@@ -250,7 +218,6 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 
 		list_add_tail(&unode->entry, &udl->urbs.list);
 
-		up(&udl->urbs.limit_sem);
 		udl->urbs.count++;
 		udl->urbs.available++;
 	}
@@ -260,36 +227,31 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 	return udl->urbs.count;
 }
 
-struct urb *udl_get_urb(struct drm_device *dev)
+struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout)
 {
 	struct udl_device *udl = to_udl(dev);
-	int ret = 0;
-	struct list_head *entry;
-	struct urb_node *unode;
-	struct urb *urb = NULL;
+	struct urb_node *unode = NULL;
 
-	/* Wait for an in-flight buffer to complete and get re-queued */
-	ret = down_timeout(&udl->urbs.limit_sem, GET_URB_TIMEOUT);
-	if (ret) {
-		DRM_INFO("wait for urb interrupted: %x available: %d\n",
-		       ret, udl->urbs.available);
-		goto error;
-	}
+	if (!udl->urbs.count)
+		return NULL;
 
+	/* Wait for an in-flight buffer to complete and get re-queued */
 	spin_lock_irq(&udl->urbs.lock);
+	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
+					 !list_empty(&udl->urbs.list),
+					 udl->urbs.lock, timeout)) {
+		DRM_INFO("wait for urb interrupted: available: %d\n",
+			 udl->urbs.available);
+		goto unlock;
+	}
 
-	BUG_ON(list_empty(&udl->urbs.list)); /* reserved one with limit_sem */
-	entry = udl->urbs.list.next;
-	list_del_init(entry);
+	unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
+	list_del_init(&unode->entry);
 	udl->urbs.available--;
 
+unlock:
 	spin_unlock_irq(&udl->urbs.lock);
-
-	unode = list_entry(entry, struct urb_node, entry);
-	urb = unode->urb;
-
-error:
-	return urb;
+	return unode ? unode->urb : NULL;
 }
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
-- 
2.35.3

