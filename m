Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503465B194F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1E710EA05;
	Thu,  8 Sep 2022 09:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92410EA06
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94A971FA58;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=of6WZ3V2D41bq9eAXWrAwqo/XVQEcBT0lKqRfLWBsw8=;
 b=dA3/sUENNr+QbPevES849UoiZPjKzzBQcjqUkYr2gaYjptvGtfIGSZCFW+qOB9CGDhc1+L
 YZoL7dc3fBB+JdApWU+Pzh5j7DGbffr0Z480KOD4ETH7By4+NIA9vtqHyfWzKkeoDZli3T
 DFIbH/fqj10/8xftylS/AG/xER774Wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=of6WZ3V2D41bq9eAXWrAwqo/XVQEcBT0lKqRfLWBsw8=;
 b=c/8hsXgyiN1mQ/mBEemNqVIUKZPwSsJxLqLz7GWx5HmgvTOdhfCYvrqyfib+T3ruU021aV
 RxdmU+486HjTLEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7332B13A6D;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EDd/Gxi7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 11/12] drm/udl: Don't re-initialize stuff at retrying the
 URB list allocation
Date: Thu,  8 Sep 2022 11:51:14 +0200
Message-Id: <20220908095115.23396-12-tiwai@suse.de>
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

udl_alloc_urb_list() retires the allocation if there is no enough room
left, and it reinitializes the stuff unnecessarily such as the linked
list head and the waitqueue, which could be harmful.  Those should be
outside the retry loop.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 16aa4a655e7f..829edb60a987 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -182,15 +182,14 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 	struct usb_device *udev = udl_to_usb_device(udl);
 
 	spin_lock_init(&udl->urbs.lock);
-
-retry:
-	udl->urbs.size = size;
 	INIT_LIST_HEAD(&udl->urbs.list);
-
 	init_waitqueue_head(&udl->urbs.sleep);
 	udl->urbs.count = 0;
 	udl->urbs.available = 0;
 
+retry:
+	udl->urbs.size = size;
+
 	while (udl->urbs.count * size < wanted_size) {
 		unode = kzalloc(sizeof(struct urb_node), GFP_KERNEL);
 		if (!unode)
-- 
2.35.3

