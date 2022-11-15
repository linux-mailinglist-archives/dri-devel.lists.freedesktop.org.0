Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A96297D7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9499F10E3B0;
	Tue, 15 Nov 2022 11:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EADD10E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A0C7336CD;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEUEpzs1w0uyHLA2DCBERkPR23KcQSr1oetD0I8tb7g=;
 b=kwt7eme1roUqUqD2e4u8LV1dkLb2Wux/yoeobjy9mpS+EMbUjlFTiYOU4MbEPXkhTFhzZ4
 v4EsCSidyVRIqXsALmeA8EuljaKMsQ3iilMF5spWC8rlFOsM/eGQNnfQxnObVqd9kLJQH3
 XhfmzJXO4MI203O8Qb4rB3RxOSTRU6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEUEpzs1w0uyHLA2DCBERkPR23KcQSr1oetD0I8tb7g=;
 b=W3N+7KhH0egbSnjWNzw1HtLNlqEHdrqOPWHOWLdJBGNofYQE8cJjUuuXwCpVf89RVQxpEm
 3UUzlQzQet4sCMBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D619513273;
 Tue, 15 Nov 2022 11:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4GYSM95+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 3/6] drm/fb-helper: Remove test for fb_dirty callback from
 deferred-I/O helper
Date: Tue, 15 Nov 2022 12:58:16 +0100
Message-Id: <20221115115819.23088-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115115819.23088-1-tzimmermann@suse.de>
References: <20221115115819.23088-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The helper for processing deferred I/O on pages has no dependency on
the fb_dirty damge-handling callback; so remove the test. In practice,
deferred I/O is only used with damage handling and the damage worker
already guarantees the presence of the fb_dirty callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index be8ecb5e50b56..b3a731b9170a6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -656,17 +656,15 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 		min_off = min(min_off, start);
 		max_off = max(max_off, end);
 	}
-	if (min_off >= max_off)
-		return;
 
-	if (helper->funcs->fb_dirty) {
-		/*
-		 * As we can only track pages, we might reach beyond the end
-		 * of the screen and account for non-existing scanlines. Hence,
-		 * keep the covered memory area within the screen buffer.
-		 */
-		max_off = min(max_off, info->screen_size);
+	/*
+	 * As we can only track pages, we might reach beyond the end
+	 * of the screen and account for non-existing scanlines. Hence,
+	 * keep the covered memory area within the screen buffer.
+	 */
+	max_off = min(max_off, info->screen_size);
 
+	if (min_off < max_off) {
 		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
 		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
 				     drm_rect_width(&damage_area),
-- 
2.38.1

