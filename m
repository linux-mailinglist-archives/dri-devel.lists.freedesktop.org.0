Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3D954A89
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1298410E7B7;
	Fri, 16 Aug 2024 12:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mVhzsyAL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="77oAwNpQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mVhzsyAL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="77oAwNpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026D10E71D;
 Fri, 16 Aug 2024 12:54:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 936CA222A9;
 Fri, 16 Aug 2024 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCo5GVjGsUtG0O0bB/qmfKHBM+zaYeeKjwz3wgMawB0=;
 b=mVhzsyALqB4X3/qoUbl7LWxXuXjLpmdfkC/m8QO7Qv1LaU9H39w00R3wQzJimjEnyoju60
 cF5/shpuWQWPeVH8gx73Hjqje7+3Niq3kCWOEQrJrHC8dQnnTjxfwDbTD1axRUezeD4Lgy
 6fIlGRsiKsUVnMZLTtPor2bIL+FTh5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCo5GVjGsUtG0O0bB/qmfKHBM+zaYeeKjwz3wgMawB0=;
 b=77oAwNpQq0ceBf3cmLJL6BN9ih92GsRIu4or1laf82ZjEOD4Tckktzdd8028QqGxxbDTj1
 KHhzgSe2bNQr4VBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723812879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCo5GVjGsUtG0O0bB/qmfKHBM+zaYeeKjwz3wgMawB0=;
 b=mVhzsyALqB4X3/qoUbl7LWxXuXjLpmdfkC/m8QO7Qv1LaU9H39w00R3wQzJimjEnyoju60
 cF5/shpuWQWPeVH8gx73Hjqje7+3Niq3kCWOEQrJrHC8dQnnTjxfwDbTD1axRUezeD4Lgy
 6fIlGRsiKsUVnMZLTtPor2bIL+FTh5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723812879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCo5GVjGsUtG0O0bB/qmfKHBM+zaYeeKjwz3wgMawB0=;
 b=77oAwNpQq0ceBf3cmLJL6BN9ih92GsRIu4or1laf82ZjEOD4Tckktzdd8028QqGxxbDTj1
 KHhzgSe2bNQr4VBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BD4313A2F;
 Fri, 16 Aug 2024 12:54:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4FBrCQ9Mv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 81/86] drm/i915: Move custom restore code into separate
 callback
Date: Fri, 16 Aug 2024 14:23:47 +0200
Message-ID: <20240816125408.310253-82-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -7.30
X-Spam-Level: 
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email,suse.de:mid]
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

i915's fbdev contains additional code for restoring the client that
cannot be ported to the common fbdev client. Introduce the callback
struct drm_fb_helper.fb_restore and implement it for i915. The fbdev
helpers invoke the callback after restoring the fbdev client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c            |  3 +++
 drivers/gpu/drm/i915/display/intel_fbdev.c | 12 ++++++++++--
 include/drm/drm_fb_helper.h                | 13 +++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 31e255c2b04a..d9e539b0fd1a 100644
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
index 9ece62783ce1..c03fb00002a4 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -296,9 +296,19 @@ static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *cli
 	return 0;
 }
 
+static void intelfb_restore(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->client.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
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
@@ -582,8 +592,6 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (ret)
 		return ret;
 
-	intel_fbdev_invalidate(ifbdev);
-
 	return 0;
 }
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 699f2790b9ac..34eb77c18a13 100644
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
2.46.0

