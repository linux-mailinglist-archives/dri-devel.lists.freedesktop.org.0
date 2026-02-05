Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOvJCSqlhGmI3wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:11:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D5F3D25
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4110E8DC;
	Thu,  5 Feb 2026 14:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kd8j5Shx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MYV2H2s5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kd8j5Shx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MYV2H2s5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9CD10E8DC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 14:11:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CED15BDB4;
 Thu,  5 Feb 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770300708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmvmWt8kD25kFc/B0NuPP2bjPTEJZBScS20i/iiv4zM=;
 b=kd8j5ShxsY5ILe37hrENHxaMvPJh56vLBjo57ut0T6Yi63ln1vRQOcy3TvdOWDH+II8T6u
 SRPIpok0MG9mty/E9a69W4Hv454UDvpWocXKQwETppGZ5kdDYNt/8WsXy6BxsxwVHG0jLi
 IRcQZAfEPu0b91ow28zW2MQIZWFvH9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770300708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmvmWt8kD25kFc/B0NuPP2bjPTEJZBScS20i/iiv4zM=;
 b=MYV2H2s55GHrjTjwobB/cx3oNaOGl7qNZK4S1X/AXkSo/kncPV099UlPjrXSPPK6C4AkQG
 COhGP0TK65RPT4DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770300708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmvmWt8kD25kFc/B0NuPP2bjPTEJZBScS20i/iiv4zM=;
 b=kd8j5ShxsY5ILe37hrENHxaMvPJh56vLBjo57ut0T6Yi63ln1vRQOcy3TvdOWDH+II8T6u
 SRPIpok0MG9mty/E9a69W4Hv454UDvpWocXKQwETppGZ5kdDYNt/8WsXy6BxsxwVHG0jLi
 IRcQZAfEPu0b91ow28zW2MQIZWFvH9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770300708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmvmWt8kD25kFc/B0NuPP2bjPTEJZBScS20i/iiv4zM=;
 b=MYV2H2s55GHrjTjwobB/cx3oNaOGl7qNZK4S1X/AXkSo/kncPV099UlPjrXSPPK6C4AkQG
 COhGP0TK65RPT4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEA3D3EA63;
 Thu,  5 Feb 2026 14:11:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DLyhOCOlhGkSFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Feb 2026 14:11:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/fbdev-emulation: Remove empty placeholders
Date: Thu,  5 Feb 2026 15:10:44 +0100
Message-ID: <20260205141142.412048-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6F1D5F3D25
X-Rspamd-Action: no action

Only DRM clients for fbdev emulation invoke fbdev helpers. Hence remove
the empty placeholders for non-fbdev builds, as they are unused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_fb_helper.h | 105 ------------------------------------
 1 file changed, 105 deletions(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 05cca77b7249..15274b8a1d97 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -271,111 +271,6 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
-#else
-static inline void drm_fb_helper_prepare(struct drm_device *dev,
-					 struct drm_fb_helper *helper,
-					 unsigned int preferred_bpp,
-					 const struct drm_fb_helper_funcs *funcs)
-{
-}
-
-static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
-{
-}
-
-static inline int drm_fb_helper_init(struct drm_device *dev,
-		       struct drm_fb_helper *helper)
-{
-	/* So drivers can use it to free the struct */
-	helper->dev = dev;
-	dev->fb_helper = helper;
-
-	return 0;
-}
-
-static inline void drm_fb_helper_fini(struct drm_fb_helper *helper)
-{
-	if (helper && helper->dev)
-		helper->dev->fb_helper = NULL;
-}
-
-static inline int drm_fb_helper_blank(int blank, struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
-					    struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_set_par(struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
-					  struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int
-drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
-{
-	return 0;
-}
-
-static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
-{
-}
-
-static inline void
-drm_fb_helper_fill_info(struct fb_info *info,
-			struct drm_fb_helper *fb_helper,
-			struct drm_fb_helper_surface_size *sizes)
-{
-}
-
-static inline int drm_fb_helper_setcmap(struct fb_cmap *cmap,
-					struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
-				      unsigned long arg)
-{
-	return 0;
-}
-
-#ifdef CONFIG_FB_DEFERRED_IO
-static inline void drm_fb_helper_deferred_io(struct fb_info *info,
-					     struct list_head *pagelist)
-{
-}
-#endif
-
-static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
-					     bool suspend)
-{
-}
-
-static inline void
-drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, bool suspend)
-{
-}
-
-static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
-{
-	return 0;
-}
 #endif
 
 #endif
-- 
2.52.0

