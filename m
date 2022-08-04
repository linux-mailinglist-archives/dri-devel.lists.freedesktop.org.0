Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97E5898E8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7312AF8B;
	Thu,  4 Aug 2022 07:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074E6903A6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 07:58:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1168D20C1D;
 Thu,  4 Aug 2022 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659599914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49kxYTbGrjOgOVb5REr+889AVTZUvS522O21Up1xYtA=;
 b=c+UAGiIB3aCXunSF7Nt8pWeM+qG+If9rT0dkxaI4R6tFDXc0h6rVOUeuRMIJjGxfG/WY2Y
 MyO25GdAzugPZB2cjvkvpP9+3lAsPUovmKCTZmuOxFRkEKE8kfUOlNz78EMXyzu70puKxw
 y4Ylg/CtZVLjeCf0/ICdbFSHz4sd3vM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659599914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49kxYTbGrjOgOVb5REr+889AVTZUvS522O21Up1xYtA=;
 b=lqUsrCubml93K3Us5q8XscJFujSz/3tJ6sNbz3sqEblyTc1+9KZN5gNqcZvPrObOKZlKHJ
 GXzuOeWU/r2DWqDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC82A13AE1;
 Thu,  4 Aug 2022 07:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +NIdNSl862IlJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 04 Aug 2022 07:58:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/udl: Sync pending URBs at suspend / disconnect
Date: Thu,  4 Aug 2022 09:58:24 +0200
Message-Id: <20220804075826.27036-3-tiwai@suse.de>
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

We need to wait for finishing to process the all URBs after disabling
the pipe; otherwise pending URBs may stray at suspend/resume, leading
to a possible memory corruption in a worst case.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h     |  1 +
 drivers/gpu/drm/udl/udl_main.c    | 17 +++++++++++++++++
 drivers/gpu/drm/udl/udl_modeset.c |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index e008686ec738..f01e50c5b7b7 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -83,6 +83,7 @@ static inline struct urb *udl_get_urb(struct drm_device *dev)
 }
 
 int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
+int udl_sync_pending_urbs(struct drm_device *dev);
 void udl_urb_completion(struct urb *urb);
 
 int udl_init(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 67fd41e59b80..93615648414b 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -270,6 +270,23 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 	return ret;
 }
 
+/* wait until all pending URBs have been processed */
+int udl_sync_pending_urbs(struct drm_device *dev)
+{
+	struct udl_device *udl = to_udl(dev);
+	int ret = 0;
+
+	spin_lock_irq(&udl->urbs.lock);
+	/* 2 seconds as a sane timeout */
+	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
+					 udl->urbs.available == udl->urbs.count,
+					 udl->urbs.lock,
+					 msecs_to_jiffies(2000)))
+		ret = -ETIMEDOUT;
+	spin_unlock_irq(&udl->urbs.lock);
+	return ret;
+}
+
 int udl_init(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index e67c40a48fb4..50025606b6ad 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -408,6 +408,8 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+
+	udl_sync_pending_urbs(dev);
 }
 
 static void
-- 
2.35.3

