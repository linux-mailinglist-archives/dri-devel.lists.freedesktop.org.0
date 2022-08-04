Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115D5898E4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A2018B340;
	Thu,  4 Aug 2022 07:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B908EB58
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 07:58:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BEB51FCFA;
 Thu,  4 Aug 2022 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659599914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/LXukVZ61iVlbxlQiMpnCnkpvVuvD+qGNcnXEBndSM=;
 b=ScJMMxRaDp9a8LU1VzDX3A3KxX5l0TRMBCc9/ExZoj4OMLqcRwVnPdNCyiRuT7uWCYapD8
 Ao/fKeRh9NyFEvFvlaxsihLd3BvsktwJax/Yyc6y+BF0rJXV2e2VYId1RacfNdzDyoutq2
 ShoyfqKZzEv2TU5e1oQ1JFOgKVaiCTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659599914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/LXukVZ61iVlbxlQiMpnCnkpvVuvD+qGNcnXEBndSM=;
 b=LXZypyuEbfOjY+6djAZlmgLNxtfzd7Og21FakneLho2fCp3PmpOi2b5I2MXnLl+Z0vuqAJ
 YbKKmPK+Qzp16jDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1664C13AF2;
 Thu,  4 Aug 2022 07:58:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kBNJBCp862IlJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 04 Aug 2022 07:58:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
Date: Thu,  4 Aug 2022 09:58:25 +0200
Message-Id: <20220804075826.27036-4-tiwai@suse.de>
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

At both suspend and disconnect, we should rather cancel the pending
URBs immediately.  For the suspend case, the display will be turned
off, so it makes no sense to process the rendering.  And for the
disconnect case, the device may be no longer accessible, hence we
shouldn't do any submission.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h     |  2 ++
 drivers/gpu/drm/udl/udl_main.c    | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/udl/udl_modeset.c |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index f01e50c5b7b7..28aaf75d71cf 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -39,6 +39,7 @@ struct urb_node {
 
 struct urb_list {
 	struct list_head list;
+	struct list_head in_flight;
 	spinlock_t lock;
 	wait_queue_head_t sleep;
 	int available;
@@ -84,6 +85,7 @@ static inline struct urb *udl_get_urb(struct drm_device *dev)
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
 int udl_sync_pending_urbs(struct drm_device *dev);
+void udl_kill_pending_urbs(struct drm_device *dev);
 void udl_urb_completion(struct urb *urb);
 
 int udl_init(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 93615648414b..47204b7eb10e 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -135,7 +135,7 @@ void udl_urb_completion(struct urb *urb)
 	urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
 
 	spin_lock_irqsave(&udl->urbs.lock, flags);
-	list_add_tail(&unode->entry, &udl->urbs.list);
+	list_move(&unode->entry, &udl->urbs.list);
 	udl->urbs.available++;
 	spin_unlock_irqrestore(&udl->urbs.lock, flags);
 
@@ -180,6 +180,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 retry:
 	udl->urbs.size = size;
 	INIT_LIST_HEAD(&udl->urbs.list);
+	INIT_LIST_HEAD(&udl->urbs.in_flight);
 
 	init_waitqueue_head(&udl->urbs.sleep);
 	udl->urbs.count = 0;
@@ -246,7 +247,7 @@ struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout)
 	}
 
 	unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
-	list_del_init(&unode->entry);
+	list_move(&unode->entry, &udl->urbs.in_flight);
 	udl->urbs.available--;
 
 unlock:
@@ -279,7 +280,7 @@ int udl_sync_pending_urbs(struct drm_device *dev)
 	spin_lock_irq(&udl->urbs.lock);
 	/* 2 seconds as a sane timeout */
 	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
-					 udl->urbs.available == udl->urbs.count,
+					 list_empty(&udl->urbs.in_flight),
 					 udl->urbs.lock,
 					 msecs_to_jiffies(2000)))
 		ret = -ETIMEDOUT;
@@ -287,6 +288,23 @@ int udl_sync_pending_urbs(struct drm_device *dev)
 	return ret;
 }
 
+/* kill pending URBs */
+void udl_kill_pending_urbs(struct drm_device *dev)
+{
+	struct udl_device *udl = to_udl(dev);
+	struct urb_node *unode;
+
+	spin_lock_irq(&udl->urbs.lock);
+	while (!list_empty(&udl->urbs.in_flight)) {
+		unode = list_first_entry(&udl->urbs.in_flight,
+					 struct urb_node, entry);
+		spin_unlock_irq(&udl->urbs.lock);
+		usb_kill_urb(unode->urb);
+		spin_lock_irq(&udl->urbs.lock);
+	}
+	spin_unlock_irq(&udl->urbs.lock);
+}
+
 int udl_init(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
@@ -335,6 +353,7 @@ int udl_drop_usb(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
 
+	udl_kill_pending_urbs(dev);
 	udl_free_urb_list(dev);
 	put_device(udl->dmadev);
 	udl->dmadev = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 50025606b6ad..169110d8fc2e 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -397,6 +397,8 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	struct urb *urb;
 	char *buf;
 
+	udl_kill_pending_urbs(dev);
+
 	urb = udl_get_urb(dev);
 	if (!urb)
 		return;
-- 
2.35.3

