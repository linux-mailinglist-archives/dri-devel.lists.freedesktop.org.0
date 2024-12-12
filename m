Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D1C9EF4A1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C42C10EE70;
	Thu, 12 Dec 2024 17:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="f8hFLeUW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X5RZZ5g5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f8hFLeUW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X5RZZ5g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B318D10EE5D;
 Thu, 12 Dec 2024 17:09:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EB8621179;
 Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZNOViv3xzSCUkhtMANbxRgPBtdRDn/EJZ/muwZybrQ=;
 b=f8hFLeUWmvkSCdsFhKqahNuz0vfP31SHM5fEQviq/97o1zqq8uBkJnif1nl993Qrn1Oiaw
 4OJ5Nh87derjJsXOWOX70g91LHnyrPWXyjGN7cYXeYOtrHmp6p2Ynbvjy4BflqluhLodRt
 UQnK9ZWxG0hxOBUMpFMdkUBJN7VIxaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZNOViv3xzSCUkhtMANbxRgPBtdRDn/EJZ/muwZybrQ=;
 b=X5RZZ5g5HEQbtv3e+e349VwXB7Iqsp5oNLwa4SC3LFFjQ3wuXAuKQFG16R5biolYgvZLp1
 8e7UcPvglPbC/VCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZNOViv3xzSCUkhtMANbxRgPBtdRDn/EJZ/muwZybrQ=;
 b=f8hFLeUWmvkSCdsFhKqahNuz0vfP31SHM5fEQviq/97o1zqq8uBkJnif1nl993Qrn1Oiaw
 4OJ5Nh87derjJsXOWOX70g91LHnyrPWXyjGN7cYXeYOtrHmp6p2Ynbvjy4BflqluhLodRt
 UQnK9ZWxG0hxOBUMpFMdkUBJN7VIxaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZNOViv3xzSCUkhtMANbxRgPBtdRDn/EJZ/muwZybrQ=;
 b=X5RZZ5g5HEQbtv3e+e349VwXB7Iqsp5oNLwa4SC3LFFjQ3wuXAuKQFG16R5biolYgvZLp1
 8e7UcPvglPbC/VCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C95D13508;
 Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eL65BcUYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/12] drm/fb-helper: Remove struct drm_fb_helper.fb_probe
Date: Thu, 12 Dec 2024 18:08:53 +0100
Message-ID: <20241212170913.185939-13-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

The callback fb_probe in struct drm_fb_helper is unused. Remove it.
New drivers should set struct drm_driver.fbdev_probe instead and call
drm_client_setup() to instantiate in-kernel DRM clients.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c |  8 ++++----
 include/drm/drm_fb_helper.h     | 17 -----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e800b43cfbf1..d3626ac15ddc 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1632,6 +1632,9 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	struct fb_info *info;
 	int ret;
 
+	if (drm_WARN_ON(dev, !dev->driver->fbdev_probe))
+		return -EINVAL;
+
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
 	if (ret) {
 		/* First time: disable all crtc's.. */
@@ -1641,10 +1644,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	}
 
 	/* push down into drivers */
-	if (dev->driver->fbdev_probe)
-		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
-	else if (fb_helper->funcs)
-		ret = fb_helper->funcs->fb_probe(fb_helper, &sizes);
+	ret = dev->driver->fbdev_probe(fb_helper, &sizes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 7de1abd2e0ea..44b1d82b1b5c 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -69,23 +69,6 @@ struct drm_fb_helper_surface_size {
  * Driver callbacks used by the fbdev emulation helper library.
  */
 struct drm_fb_helper_funcs {
-	/**
-	 * @fb_probe:
-	 *
-	 * Driver callback to allocate and initialize the fbdev info structure.
-	 * Furthermore it also needs to allocate the DRM framebuffer used to
-	 * back the fbdev.
-	 *
-	 * This callback is mandatory.
-	 *
-	 * RETURNS:
-	 *
-	 * The driver should return 0 on success and a negative error code on
-	 * failure.
-	 */
-	int (*fb_probe)(struct drm_fb_helper *helper,
-			struct drm_fb_helper_surface_size *sizes);
-
 	/**
 	 * @fb_dirty:
 	 *
-- 
2.47.1

