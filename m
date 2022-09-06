Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B7E5AE151
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EE710E5B0;
	Tue,  6 Sep 2022 07:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4110E5AF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:39:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22CA91F941;
 Tue,  6 Sep 2022 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662449995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doKGh/TBwsDELvF4izBmlwG0dvlWUboBG3IAyWJBI6E=;
 b=oa03xhkJcepVz50gg3HJzUqrwvTG5TPZq742ObnLbKQ6GLoXOm1WIMAkJp7QgYPerkN83x
 at8Ahc8E1qHP2tyiJOih9mZiIG2tDlF5gJ2maTZb3VuaYzBoQZ/I+S9skhX1SMdK1zaikS
 6O16SIYU6mBZswDUFPGDwhrv2Mz0A8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662449995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doKGh/TBwsDELvF4izBmlwG0dvlWUboBG3IAyWJBI6E=;
 b=1sBlz1UsbeafgEqzIMwhMso7MUqeJHLrNHjzBr3LmGvAbHetaaLELIbLOp4wXgM4UThpD7
 gTlWpquxBOXIKtBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0635213A93;
 Tue,  6 Sep 2022 07:39:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJLhAEv5FmPeOgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 07:39:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/11] Revert "drm/udl: Kill pending URBs at suspend and
 disconnect"
Date: Tue,  6 Sep 2022 09:39:44 +0200
Message-Id: <20220906073951.2085-5-tiwai@suse.de>
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

This reverts the recent fix commit
  e25d5954264d ("drm/udl: Kill pending URBs at suspend and disconnect")
as it turned out to lead to potential hangup at a disconnection, and
it doesn't help much for suspend/resume problem, either.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h     |  2 --
 drivers/gpu/drm/udl/udl_main.c    | 25 +++----------------------
 drivers/gpu/drm/udl/udl_modeset.c |  2 --
 3 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 37c14b0ff1fc..5923d2e02bc8 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -39,7 +39,6 @@ struct urb_node {
 
 struct urb_list {
 	struct list_head list;
-	struct list_head in_flight;
 	spinlock_t lock;
 	wait_queue_head_t sleep;
 	int available;
@@ -85,7 +84,6 @@ static inline struct urb *udl_get_urb(struct drm_device *dev)
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
 int udl_sync_pending_urbs(struct drm_device *dev);
-void udl_kill_pending_urbs(struct drm_device *dev);
 void udl_urb_completion(struct urb *urb);
 
 int udl_init(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 7d1e6bbc165c..a9f6b710b254 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -135,7 +135,7 @@ void udl_urb_completion(struct urb *urb)
 	urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
 
 	spin_lock_irqsave(&udl->urbs.lock, flags);
-	list_move(&unode->entry, &udl->urbs.list);
+	list_add_tail(&unode->entry, &udl->urbs.list);
 	udl->urbs.available++;
 	spin_unlock_irqrestore(&udl->urbs.lock, flags);
 
@@ -180,7 +180,6 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 retry:
 	udl->urbs.size = size;
 	INIT_LIST_HEAD(&udl->urbs.list);
-	INIT_LIST_HEAD(&udl->urbs.in_flight);
 
 	init_waitqueue_head(&udl->urbs.sleep);
 	udl->urbs.count = 0;
@@ -247,7 +246,7 @@ struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout)
 	}
 
 	unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
-	list_move(&unode->entry, &udl->urbs.in_flight);
+	list_del_init(&unode->entry);
 	udl->urbs.available--;
 
 unlock:
@@ -281,7 +280,7 @@ int udl_sync_pending_urbs(struct drm_device *dev)
 	spin_lock_irq(&udl->urbs.lock);
 	/* 2 seconds as a sane timeout */
 	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
-					 list_empty(&udl->urbs.in_flight),
+					 udl->urbs.available == udl->urbs.count,
 					 udl->urbs.lock,
 					 msecs_to_jiffies(2000)))
 		ret = -ETIMEDOUT;
@@ -289,23 +288,6 @@ int udl_sync_pending_urbs(struct drm_device *dev)
 	return ret;
 }
 
-/* kill pending URBs */
-void udl_kill_pending_urbs(struct drm_device *dev)
-{
-	struct udl_device *udl = to_udl(dev);
-	struct urb_node *unode;
-
-	spin_lock_irq(&udl->urbs.lock);
-	while (!list_empty(&udl->urbs.in_flight)) {
-		unode = list_first_entry(&udl->urbs.in_flight,
-					 struct urb_node, entry);
-		spin_unlock_irq(&udl->urbs.lock);
-		usb_kill_urb(unode->urb);
-		spin_lock_irq(&udl->urbs.lock);
-	}
-	spin_unlock_irq(&udl->urbs.lock);
-}
-
 int udl_init(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
@@ -354,7 +336,6 @@ int udl_drop_usb(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
 
-	udl_kill_pending_urbs(dev);
 	udl_free_urb_list(dev);
 	put_device(udl->dmadev);
 	udl->dmadev = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 187aba2d7825..c34d564773a3 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -398,8 +398,6 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	struct urb *urb;
 	char *buf;
 
-	udl_kill_pending_urbs(dev);
-
 	urb = udl_get_urb(dev);
 	if (!urb)
 		return;
-- 
2.35.3

