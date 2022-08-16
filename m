Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F22595F5F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC47ABACD;
	Tue, 16 Aug 2022 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C938D994
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E52234871;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s6v1CY1qexUT4c1xbug4TQo33VinY3YcP39jbAWYwQ=;
 b=gEzA2P8grsErGJsV4EbD2oDgBDLMYTqr1oZk7gzar/Tf/UISsZ+mQpcnAMPyuhZBuasyaF
 CKepulZlERJ5z6yPZbPKLrf1LJSuqrcdrHx1yFOeLyi0ShuYgYUh1s+w1dXGHlLTqkj1Xa
 uaSnB2hw81Qt/SW9I/TERNYfs0iPRec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s6v1CY1qexUT4c1xbug4TQo33VinY3YcP39jbAWYwQ=;
 b=/Ei/7ZJfi5ovg5Au2jYmMXv8s6mGBKw5wesen5Yxqv6v8oC7tK7cKuiCNa66FNDzONlTkI
 Jc4Ooz14QbnDhpDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 705C8139B7;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qFDJGp+5+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/12] drm/udl: Fix potential URB leaks
Date: Tue, 16 Aug 2022 17:36:52 +0200
Message-Id: <20220816153655.27526-10-tiwai@suse.de>
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

A couple of error handlings forgot to process the URB completion.
Those are both with WARN_ON() so should be visible, but we must fix
them in anyway.

Fixes: 7350b2a3fbc6 ("drm/udl: Replace BUG_ON() with WARN_ON()")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c     | 8 +++++---
 drivers/gpu/drm/udl/udl_transfer.c | 5 ++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3c97f647883f..8bbb4e2861fb 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -265,11 +265,13 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 	struct udl_device *udl = to_udl(dev);
 	int ret;
 
-	if (WARN_ON(len > udl->urbs.size))
-		return -EINVAL;
-
+	if (WARN_ON(len > udl->urbs.size)) {
+		ret = -EINVAL;
+		goto error;
+	}
 	urb->transfer_buffer_length = len; /* set to actual payload len */
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
+ error:
 	if (ret) {
 		udl_urb_completion(urb); /* because no one else will */
 		DRM_ERROR("usb_submit_urb error %x\n", ret);
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index a431208dda85..b57844632dbd 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -180,8 +180,11 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 	u8 *cmd = *urb_buf_ptr;
 	u8 *cmd_end = (u8 *) urb->transfer_buffer + urb->transfer_buffer_length;
 
-	if (WARN_ON(!(log_bpp == 1 || log_bpp == 2)))
+	if (WARN_ON(!(log_bpp == 1 || log_bpp == 2))) {
+		/* need to finish URB at error from this function */
+		udl_urb_completion(urb);
 		return -EINVAL;
+	}
 
 	line_start = (u8 *) (front + byte_offset);
 	next_pixel = line_start;
-- 
2.35.3

