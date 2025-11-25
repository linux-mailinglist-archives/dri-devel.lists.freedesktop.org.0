Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28AC85192
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EAD10E3EC;
	Tue, 25 Nov 2025 13:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qNzN4Noz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B9H8Zq0m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qNzN4Noz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B9H8Zq0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FF910E3EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBBEB5BD82;
 Tue, 25 Nov 2025 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgLD8DsaagC7UeXGC8JVSdO0+73pCjrNj616EWect5k=;
 b=qNzN4NozQ48J/X/RGWafXBsH3FZCXYhtd9Wcqzt1u5FWKN52GDI1EoR3pxSuCW094TeXtY
 g99guH1xVpriDikcpR+TBOe2s9JXIhLAh6le/NpF8dRx2LYrogZ7eNNkZOWaxKUw/vguOY
 mNXcfN7S7In/Ucj5mu8A1xUMiwN6aNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgLD8DsaagC7UeXGC8JVSdO0+73pCjrNj616EWect5k=;
 b=B9H8Zq0miuo0RFANZ6NN+/eePEWVWH7dy+haPXL3Aaic+KZMpzf9JXje/yjo52BuoMWXs/
 S2jFzif/dstS69DA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qNzN4Noz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B9H8Zq0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgLD8DsaagC7UeXGC8JVSdO0+73pCjrNj616EWect5k=;
 b=qNzN4NozQ48J/X/RGWafXBsH3FZCXYhtd9Wcqzt1u5FWKN52GDI1EoR3pxSuCW094TeXtY
 g99guH1xVpriDikcpR+TBOe2s9JXIhLAh6le/NpF8dRx2LYrogZ7eNNkZOWaxKUw/vguOY
 mNXcfN7S7In/Ucj5mu8A1xUMiwN6aNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgLD8DsaagC7UeXGC8JVSdO0+73pCjrNj616EWect5k=;
 b=B9H8Zq0miuo0RFANZ6NN+/eePEWVWH7dy+haPXL3Aaic+KZMpzf9JXje/yjo52BuoMWXs/
 S2jFzif/dstS69DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3044F3EA65;
 Tue, 25 Nov 2025 13:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MOiWCuOpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] fbcon: Remove fb_debug_enter/_leave from struct fb_ops
Date: Tue, 25 Nov 2025 13:52:17 +0100
Message-ID: <20251125130634.1080966-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BBBEB5BD82
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[19];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no implementations of fb_debug_enter and fb_debug_leave.
Remove the callbacks from struct fb_ops and clean up the caller.

The field save_graphics in fbcon_par is also no longer required.
Remove it as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/process/debugging/kgdb.rst | 28 ------------------------
 drivers/video/fbdev/core/fbcon.c         | 24 --------------------
 drivers/video/fbdev/core/fbcon.h         |  1 -
 include/linux/fb.h                       |  4 ----
 4 files changed, 57 deletions(-)

diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
index b29b0aac2717..773b19aa1382 100644
--- a/Documentation/process/debugging/kgdb.rst
+++ b/Documentation/process/debugging/kgdb.rst
@@ -889,34 +889,6 @@ in the virtual console layer. On resuming kernel execution, the kernel
 debugger calls kgdboc_post_exp_handler() which in turn calls
 con_debug_leave().
 
-Any video driver that wants to be compatible with the kernel debugger
-and the atomic kms callbacks must implement the ``mode_set_base_atomic``,
-``fb_debug_enter`` and ``fb_debug_leave operations``. For the
-``fb_debug_enter`` and ``fb_debug_leave`` the option exists to use the
-generic drm fb helper functions or implement something custom for the
-hardware. The following example shows the initialization of the
-.mode_set_base_atomic operation in
-drivers/gpu/drm/i915/intel_display.c::
-
-
-    static const struct drm_crtc_helper_funcs intel_helper_funcs = {
-    [...]
-            .mode_set_base_atomic = intel_pipe_set_base_atomic,
-    [...]
-    };
-
-
-Here is an example of how the i915 driver initializes the
-fb_debug_enter and fb_debug_leave functions to use the generic drm
-helpers in ``drivers/gpu/drm/i915/intel_fb.c``::
-
-
-    static struct fb_ops intelfb_ops = {
-    [...]
-           .fb_debug_enter = drm_fb_helper_debug_enter,
-           .fb_debug_leave = drm_fb_helper_debug_leave,
-    [...]
-    };
 
 
 Credits
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 7be9e865325d..34ea14412ace 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2289,28 +2289,6 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 	return false;
 }
 
-static void fbcon_debug_enter(struct vc_data *vc)
-{
-	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_par *par = info->fbcon_par;
-
-	par->save_graphics = par->graphics;
-	par->graphics = 0;
-	if (info->fbops->fb_debug_enter)
-		info->fbops->fb_debug_enter(info);
-	fbcon_set_palette(vc, color_table);
-}
-
-static void fbcon_debug_leave(struct vc_data *vc)
-{
-	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
-	struct fbcon_par *par = info->fbcon_par;
-
-	par->graphics = par->save_graphics;
-	if (info->fbops->fb_debug_leave)
-		info->fbops->fb_debug_leave(info);
-}
-
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
 {
 	u8 *fontdata = vc->vc_font.data;
@@ -3214,8 +3192,6 @@ static const struct consw fb_con = {
 	.con_set_palette 	= fbcon_set_palette,
 	.con_invert_region 	= fbcon_invert_region,
 	.con_resize             = fbcon_resize,
-	.con_debug_enter	= fbcon_debug_enter,
-	.con_debug_leave	= fbcon_debug_leave,
 };
 
 static ssize_t rotate_store(struct device *device,
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 44ea4ae4bba0..1cd10a7faab0 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -79,7 +79,6 @@ struct fbcon_par {
 	int    cursor_reset;
 	int    blank_state;
 	int    graphics;
-	int    save_graphics; /* for debug enter/leave */
 	bool   initialized;
 	int    rotate;
 	int    cur_rotate;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..65fb70382675 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -304,10 +304,6 @@ struct fb_ops {
 
 	/* teardown any resources to do with this framebuffer */
 	void (*fb_destroy)(struct fb_info *info);
-
-	/* called at KDB enter and leave time to prepare the console */
-	int (*fb_debug_enter)(struct fb_info *info);
-	int (*fb_debug_leave)(struct fb_info *info);
 };
 
 #ifdef CONFIG_FB_TILEBLITTING
-- 
2.51.1

