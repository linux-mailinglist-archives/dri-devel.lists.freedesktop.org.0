Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E662F64B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0610E747;
	Fri, 18 Nov 2022 13:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CAA10E739
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:35:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E69D22817;
 Fri, 18 Nov 2022 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668778538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVqnAvDJsOtcJ9IjSMpPmYIJ7RsyEloR3SKCkxpbufQ=;
 b=R0cX9VCUw7o71yvQTER6IC4bJeq+Pnh1zIIuCsECeSZ0ynYy59NAC4P8uM2k/GrZz2KTR0
 0Sy21ZSB44zTQU4Nix5M3i1MRJ7dE+6Jx7tTSwbeRACU0+WStJN5Cd4XkQODdOkrRTKABE
 X6bEUamFT5fwvbI/zFfQCiQUM6E14iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668778538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVqnAvDJsOtcJ9IjSMpPmYIJ7RsyEloR3SKCkxpbufQ=;
 b=IaQtE08oftrp3z+/ho9prJAXW3qy201dsW25F3FtFHjuLagK/ZURDB3aquu6BPQ48wMzTW
 G8VudmOsJ9KsAuDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C95913A66;
 Fri, 18 Nov 2022 13:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ICHaESqKd2PHLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:35:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 3/3] Revert "drm/fb-helper: Perform damage handling in
 deferred-I/O helper"
Date: Fri, 18 Nov 2022 14:35:35 +0100
Message-Id: <20221118133535.9739-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118133535.9739-1-tzimmermann@suse.de>
References: <20221118133535.9739-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 5fc586a058babc71c82a038477581b7bfe1c6e2a.

Needed to restore the fbdev damage worker. There have been bug reports
about locking order [1] and incorrectly takens branches. [2] Restore
the damage worker until these problems have been resovled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://intel-gfx-ci.01.org/tree/drm-tip/fi-kbl-8809g.html # 1
Link: https://lore.kernel.org/dri-devel/20221115115819.23088-6-tzimmermann@suse.de/T/#m06eedc0a468940e4cbbd14ca026733b639bc445a # 2
---
 drivers/gpu/drm/drm_fb_helper.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index cdbf03e941b2b..b3a731b9170a6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -666,16 +666,10 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 
 	if (min_off < max_off) {
 		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
-		drm_fb_helper_add_damage_clip(helper, damage_area.x1, damage_area.y1,
-					      drm_rect_width(&damage_area),
-					      drm_rect_height(&damage_area));
+		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
+				     drm_rect_width(&damage_area),
+				     drm_rect_height(&damage_area));
 	}
-
-	/*
-	 * Flushes all dirty pages from mmap's pageref list and the
-	 * areas that have been written by struct fb_ops callbacks.
-	 */
-	drm_fb_helper_fb_dirty(helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-- 
2.38.1

