Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F656297DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721710E3B5;
	Tue, 15 Nov 2022 11:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9010E135
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CA40336D2;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFC7T79c7B2xCYtT3hOIxcecyQt/f7k3uL+zqRcAwig=;
 b=DM54R38NXoH0AQs+48RW7TuK7fMRzwGpgqmshapbdRe/4Ibc5oFcu7LfTPimSOpBY7V0et
 oouJ8tqpXwpo5H97nWNgRJQqDaT1aJdRFyJtmyxM4iT6sD3WLdbSHN89q51Kq227/m4kDY
 57BIIZsuGSpPpXT0sE+J5dkITjNa48Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFC7T79c7B2xCYtT3hOIxcecyQt/f7k3uL+zqRcAwig=;
 b=DIJrG3WeM5wNImDaMbxT8xwvBEKK60GPtUmYIZgGwtFHs+5a4UjxL4axEy8L8Jcqfak0+J
 BFxuU6c7UBu6m8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E68D13A9C;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UClJBt9+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 4/6] drm/fb-helper: Perform damage handling in deferred-I/O
 helper
Date: Tue, 15 Nov 2022 12:58:17 +0100
Message-Id: <20221115115819.23088-5-tzimmermann@suse.de>
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

Call fb_dirty directly from drm_fb_helper_deferred_io() to avoid the
latency of running the damage worker.

The deferred-I/O helper drm_fb_helper_deferred_io() runs in a worker
thread at regular intervals as part of writing to mmaped framebuffer
memory. It used to schedule the fbdev damage worker to flush the
framebuffer. Changing this to flushing the framebuffer directly avoids
the latency introduced by the damage worker.

v2:
	* remove fb_dirty from defio in separate patch (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b3a731b9170a6..cdbf03e941b2b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -666,10 +666,16 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 
 	if (min_off < max_off) {
 		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
+		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
+					      drm_rect_width(&damage_area),
+					      drm_rect_height(&damage_area));
 	}
+
+	/*
+	 * Flushes all dirty pages from mmap's pageref list and the
+	 * areas that have been written by struct fb_ops callbacks.
+	 */
+	drm_fb_helper_fb_dirty(helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-- 
2.38.1

