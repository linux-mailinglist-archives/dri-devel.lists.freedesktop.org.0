Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D0B01860
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBB610E9FC;
	Fri, 11 Jul 2025 09:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cpcZxOxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fk6Et7fQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cpcZxOxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fk6Et7fQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DA910E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:41:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 949551F7EF;
 Fri, 11 Jul 2025 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST8u8KPQnXtP/Yc8LIXXXDy1snhqPzR63shknjYxoWM=;
 b=cpcZxOxEG5riJ5HiSIZaGkyvZW3wYP91kO6rAKy23o0/ppLNA+x1MLR6G8muVY8GxJkNew
 0v6DDdEdw8EaRgTBs4avl/uBl2P48vK0ljksbAmSWkRrCYy2XAoDRxanGA4RRl+b3+a0Nv
 +z77dbrCaUdZLHgTkmnRcGyK9vc5clM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST8u8KPQnXtP/Yc8LIXXXDy1snhqPzR63shknjYxoWM=;
 b=Fk6Et7fQvIks3wYp463vwLAp6HutLOeErIwXkpm/DRyRNkIVFHQkS1tylKRtnYj0UC/r2F
 t73ymLmYBAkByKDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST8u8KPQnXtP/Yc8LIXXXDy1snhqPzR63shknjYxoWM=;
 b=cpcZxOxEG5riJ5HiSIZaGkyvZW3wYP91kO6rAKy23o0/ppLNA+x1MLR6G8muVY8GxJkNew
 0v6DDdEdw8EaRgTBs4avl/uBl2P48vK0ljksbAmSWkRrCYy2XAoDRxanGA4RRl+b3+a0Nv
 +z77dbrCaUdZLHgTkmnRcGyK9vc5clM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST8u8KPQnXtP/Yc8LIXXXDy1snhqPzR63shknjYxoWM=;
 b=Fk6Et7fQvIks3wYp463vwLAp6HutLOeErIwXkpm/DRyRNkIVFHQkS1tylKRtnYj0UC/r2F
 t73ymLmYBAkByKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18AD713918;
 Fri, 11 Jul 2025 09:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yIOWBCvccGjbcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jul 2025 09:40:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/9] Revert "drm/gem-framebuffer: Use dma_buf from GEM object
 instance"
Date: Fri, 11 Jul 2025 11:35:22 +0200
Message-ID: <20250711093744.120962-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[20];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[etnaviv];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -5.30
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

This reverts commit cce16fcd7446dcff7480cd9d2b6417075ed81065.

Reverting because the fix-up commits are suspected to cause regressions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 618ce725cd75..fefb2a0f6b40 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -420,6 +420,7 @@ EXPORT_SYMBOL(drm_gem_fb_vunmap);
 static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir,
 					unsigned int num_planes)
 {
+	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	int ret;
 
@@ -428,9 +429,10 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
 		obj = drm_gem_fb_get_obj(fb, num_planes);
 		if (!obj)
 			continue;
+		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_end_cpu_access(obj->dma_buf, dir);
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
 			drm_err(fb->dev, "dma_buf_end_cpu_access(%u, %d) failed: %d\n",
 				ret, num_planes, dir);
@@ -453,6 +455,7 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
  */
 int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
 {
+	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	unsigned int i;
 	int ret;
@@ -463,9 +466,10 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 			ret = -EINVAL;
 			goto err___drm_gem_fb_end_cpu_access;
 		}
+		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_begin_cpu_access(obj->dma_buf, dir);
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
 			goto err___drm_gem_fb_end_cpu_access;
 	}
-- 
2.50.0

