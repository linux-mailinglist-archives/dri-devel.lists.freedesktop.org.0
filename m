Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0695B194C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C6010EA0D;
	Thu,  8 Sep 2022 09:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305D10E9FD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FD371FA4C;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFrqvGzeWUMBgRnnt6RmzgBnVbJb1zQ0TJYrr0s+8lU=;
 b=vgEDl6jJcnaySeYrOHeQGUSjY/L4zpNu7IoatoSQCW98y7LHzZHUOsy6nrvgtuZIIqIaKi
 IhhovfemfHYoXNoUE1Kkyl821GD9vdsyJw0RABZ8qrOX2XwEVEQpS3UuIqGceuEZfIkhfS
 egj7jYX1OyiqG4aJxpbiLaMgPy7cfZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFrqvGzeWUMBgRnnt6RmzgBnVbJb1zQ0TJYrr0s+8lU=;
 b=ooGGzh4RQfhg65bUd/uswlxHFGkiLnbz2SGgHT+P5KcJEBqfauREOhCMCD3Ly4rPLF7yu9
 m7aGiCE81rgwVkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F3EC13A6D;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGLuChi7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 09/12] drm/udl: Fix potential URB leaks
Date: Thu,  8 Sep 2022 11:51:12 +0200
Message-Id: <20220908095115.23396-10-tiwai@suse.de>
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

A couple of error handlings forgot to process the URB completion.
Those are both with WARN_ON() so should be visible, but we must fix
them in anyway.

Fixes: 7350b2a3fbc6 ("drm/udl: Replace BUG_ON() with WARN_ON()")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c     | 8 +++++---
 drivers/gpu/drm/udl/udl_transfer.c | 5 ++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 2b7eafd48ec2..de28eeff3155 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -260,11 +260,13 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
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

