Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB545B194E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67B510EA08;
	Thu,  8 Sep 2022 09:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745610EA05
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6ED0333C1E;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bQmlmjCrn4YhGnRqtiDDpH2w3JVupr54Crv1J9lwTM=;
 b=pLQQfJMDTd21UUwvA/wn7i2qwzoOcENYo9NGEFUYMl5jM/DHwdmRfLEl7MY8g7EbfgAYUS
 ArRUvDHnnjtN2s05bZNKtnxYXVGJ290RQrpwsyt4x/I82NGp+8ImcAYTO0Nuy+zdHgETsG
 TyPUV1dy9cVEr9jSmNrGKz+VKpoqjiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bQmlmjCrn4YhGnRqtiDDpH2w3JVupr54Crv1J9lwTM=;
 b=NMKMPqUlX8b1JKiMeJPw9SvbPuekuSB1kowwezSKatgliwKx5xBHGuNG+KY7MSoocJlrS/
 0thuObuLFfik7CAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5291F13A72;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iD5sExi7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 10/12] drm/udl: Fix inconsistent urbs.count value during
 udl_free_urb_list()
Date: Thu,  8 Sep 2022 11:51:13 +0200
Message-Id: <20220908095115.23396-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the current design, udl_get_urb() may be called asynchronously
during the driver freeing its URL list via udl_free_urb_list().
The problem is that the sync is determined by comparing the urbs.count
and urbs.available fields, while we clear urbs.count field only once
after udl_free_urb_list() finishes, i.e. during udl_free_urb_list(),
the state becomes inconsistent.

For fixing this inconsistency and also for hardening the locking
scheme, this patch does a slight refactoring of the code around
udl_get_urb() and udl_free_urb_list().  Now urbs.count is updated in
the same spinlock at extracting a URB from the list in
udl_free_url_list().

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h  |  8 +------
 drivers/gpu/drm/udl/udl_main.c | 42 +++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 5923d2e02bc8..d943684b5bbb 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -74,13 +74,7 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 int udl_modeset_init(struct drm_device *dev);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
-struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout);
-
-#define GET_URB_TIMEOUT	HZ
-static inline struct urb *udl_get_urb(struct drm_device *dev)
-{
-	return udl_get_urb_timeout(dev, GET_URB_TIMEOUT);
-}
+struct urb *udl_get_urb(struct drm_device *dev);
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
 int udl_sync_pending_urbs(struct drm_device *dev);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index de28eeff3155..16aa4a655e7f 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -23,6 +23,8 @@
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
 
+static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout);
+
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct usb_device *udev = udl_to_usb_device(udl);
@@ -146,15 +148,17 @@ void udl_urb_completion(struct urb *urb)
 static void udl_free_urb_list(struct drm_device *dev)
 {
 	struct udl_device *udl = to_udl(dev);
-	int count = udl->urbs.count;
 	struct urb_node *unode;
 	struct urb *urb;
 
 	DRM_DEBUG("Waiting for completes and freeing all render urbs\n");
 
 	/* keep waiting and freeing, until we've got 'em all */
-	while (count--) {
-		urb = udl_get_urb_timeout(dev, MAX_SCHEDULE_TIMEOUT);
+	while (udl->urbs.count) {
+		spin_lock_irq(&udl->urbs.lock);
+		urb = udl_get_urb_locked(udl, MAX_SCHEDULE_TIMEOUT);
+		udl->urbs.count--;
+		spin_unlock_irq(&udl->urbs.lock);
 		if (WARN_ON(!urb))
 			break;
 		unode = urb->context;
@@ -164,7 +168,8 @@ static void udl_free_urb_list(struct drm_device *dev)
 		usb_free_urb(urb);
 		kfree(unode);
 	}
-	udl->urbs.count = 0;
+
+	wake_up_all(&udl->urbs.sleep);
 }
 
 static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
@@ -228,33 +233,44 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 	return udl->urbs.count;
 }
 
-struct urb *udl_get_urb_timeout(struct drm_device *dev, long timeout)
+static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 {
-	struct udl_device *udl = to_udl(dev);
-	struct urb_node *unode = NULL;
+	struct urb_node *unode;
 
-	if (!udl->urbs.count)
-		return NULL;
+	assert_spin_locked(&udl->urbs.lock);
 
 	/* Wait for an in-flight buffer to complete and get re-queued */
-	spin_lock_irq(&udl->urbs.lock);
 	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
+					 !udl->urbs.count ||
 					 !list_empty(&udl->urbs.list),
 					 udl->urbs.lock, timeout)) {
 		DRM_INFO("wait for urb interrupted: available: %d\n",
 			 udl->urbs.available);
-		goto unlock;
+		return NULL;
 	}
 
+	if (!udl->urbs.count)
+		return NULL;
+
 	unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
 	list_del_init(&unode->entry);
 	udl->urbs.available--;
 
-unlock:
-	spin_unlock_irq(&udl->urbs.lock);
 	return unode ? unode->urb : NULL;
 }
 
+#define GET_URB_TIMEOUT	HZ
+struct urb *udl_get_urb(struct drm_device *dev)
+{
+	struct udl_device *udl = to_udl(dev);
+	struct urb *urb;
+
+	spin_lock_irq(&udl->urbs.lock);
+	urb = udl_get_urb_locked(udl, GET_URB_TIMEOUT);
+	spin_unlock_irq(&udl->urbs.lock);
+	return urb;
+}
+
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 {
 	struct udl_device *udl = to_udl(dev);
-- 
2.35.3

