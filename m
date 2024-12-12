Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6509EF48E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F272210EE4B;
	Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u1lwC3Si";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K49WCYBl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u1lwC3Si";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K49WCYBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B431E10E63E;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B91521183;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuXv/83i033RKgCPRPzceE07PG9QuouitneyvIHNV5U=;
 b=u1lwC3Sin7AoYc6SSBn3rYT0liGo1KySKg5Q+s3YuBPwwwi/Hy1FazNK5FtvT0LHR5rxkP
 lBgZM/vPOLCR34kBIwWTvlgoRuuhhqLrlVl87LotMzyA2O8NkJsE7yCLk5iPdlNgfg06Yn
 rgQVwKfsSmfCbtPNwLYR1FLC3pQCM24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuXv/83i033RKgCPRPzceE07PG9QuouitneyvIHNV5U=;
 b=K49WCYBlRqEWKdxLBC3Qgx/WlkkuC8s0uhLQZgxXLZAUyaVNJpFk4FcSGkcVjY5kyW5/KG
 3URoyNqxigUq+gDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuXv/83i033RKgCPRPzceE07PG9QuouitneyvIHNV5U=;
 b=u1lwC3Sin7AoYc6SSBn3rYT0liGo1KySKg5Q+s3YuBPwwwi/Hy1FazNK5FtvT0LHR5rxkP
 lBgZM/vPOLCR34kBIwWTvlgoRuuhhqLrlVl87LotMzyA2O8NkJsE7yCLk5iPdlNgfg06Yn
 rgQVwKfsSmfCbtPNwLYR1FLC3pQCM24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuXv/83i033RKgCPRPzceE07PG9QuouitneyvIHNV5U=;
 b=K49WCYBlRqEWKdxLBC3Qgx/WlkkuC8s0uhLQZgxXLZAUyaVNJpFk4FcSGkcVjY5kyW5/KG
 3URoyNqxigUq+gDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B64713A3D;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KOFpBcIYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/12] drm/i915/display: fbdev: Move custom restore code to
 new callback
Date: Thu, 12 Dec 2024 18:08:46 +0100
Message-ID: <20241212170913.185939-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

i915's fbdev contains code for restoring the client's framebuffer. It
is specific to i195 and cannot be ported to the common fbdev client.

Introduce the callback struct drm_fb_helper.fb_restore and implement
it for i915. The fbdev helpers invoke the callback after restoring the
fbdev client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c            |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c | 10 ++++++++--
 include/drm/drm_fb_helper.h                | 13 +++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c9008113111b..05da8c398513 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -245,6 +245,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 	if (do_delayed)
 		drm_fb_helper_hotplug_event(fb_helper);
 
+	if (fb_helper->funcs->fb_restore)
+		fb_helper->funcs->fb_restore(fb_helper);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index cd111d8dcab0..34133d01fc6f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -277,9 +277,17 @@ static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *cli
 	return 0;
 }
 
+static void intelfb_restore(struct drm_fb_helper *fb_helper)
+{
+	struct intel_fbdev *ifbdev = to_intel_fbdev(fb_helper);
+
+	intel_fbdev_invalidate(ifbdev);
+}
+
 static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
 	.fb_probe = intelfb_create,
 	.fb_dirty = intelfb_dirty,
+	.fb_restore = intelfb_restore,
 };
 
 /*
@@ -517,8 +525,6 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (ret)
 		return ret;
 
-	intel_fbdev_invalidate(ifbdev);
-
 	return 0;
 }
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 8426b9921a03..a7d7a3b945ea 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -99,6 +99,19 @@ struct drm_fb_helper_funcs {
 	 * 0 on success, or an error code otherwise.
 	 */
 	int (*fb_dirty)(struct drm_fb_helper *helper, struct drm_clip_rect *clip);
+
+	/**
+	 * @fb_restore:
+	 *
+	 * Driver callback to restore internal fbdev state. If set, fbdev
+	 * emulation will invoke this callback after restoring the display
+	 * mode.
+	 *
+	 * Only for i915. Do not use in new code.
+	 *
+	 * TODO: Fix i915 to not require this callback.
+	 */
+	void (*fb_restore)(struct drm_fb_helper *helper);
 };
 
 /**
-- 
2.47.1

