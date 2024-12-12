Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED409EF4A6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033FC10EE6E;
	Thu, 12 Dec 2024 17:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AHiBep8A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zcq+nz1q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AHiBep8A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zcq+nz1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622C10E63E;
 Thu, 12 Dec 2024 17:09:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5815721186;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me8nEeUL5hkARbCMF0UlrOdDPSNSZWMtbSdaNC4l5S8=;
 b=AHiBep8AqM5DBBxx+ZRBNUNRcZHR8sWq2Mz29c7pasDQjz0oEo6b/YA4n2VYcVW3ETasVn
 Hzf3i4t9gIs0c4bUDUS6Bq7lExKCV+gWahdQrOimW2yrv9XTjB2xQn/16llVFMCr3c/p+r
 xCq7LrjBS4OXVPDMGIjRmmvRc61SLjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me8nEeUL5hkARbCMF0UlrOdDPSNSZWMtbSdaNC4l5S8=;
 b=zcq+nz1q6gHQXl3cvz2ghp9x6kVErVmMwb119MwsCK91w8vX9+YwLJl2JydX7ZNqrGAyhY
 66WwpFEOWyuuPHCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AHiBep8A;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zcq+nz1q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me8nEeUL5hkARbCMF0UlrOdDPSNSZWMtbSdaNC4l5S8=;
 b=AHiBep8AqM5DBBxx+ZRBNUNRcZHR8sWq2Mz29c7pasDQjz0oEo6b/YA4n2VYcVW3ETasVn
 Hzf3i4t9gIs0c4bUDUS6Bq7lExKCV+gWahdQrOimW2yrv9XTjB2xQn/16llVFMCr3c/p+r
 xCq7LrjBS4OXVPDMGIjRmmvRc61SLjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me8nEeUL5hkARbCMF0UlrOdDPSNSZWMtbSdaNC4l5S8=;
 b=zcq+nz1q6gHQXl3cvz2ghp9x6kVErVmMwb119MwsCK91w8vX9+YwLJl2JydX7ZNqrGAyhY
 66WwpFEOWyuuPHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA4A413A3D;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wHH6N8IYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/12] drm/i915/display: Remove preferred_bpp from struct
 intel_fbdev
Date: Thu, 12 Dec 2024 18:08:48 +0100
Message-ID: <20241212170913.185939-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5815721186
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

The value preferred_bpp in struct intel_fbdev duplicates preferred_bpp
in struct drm_fb_helper. Remove the former.

Instead let intel_fbdev_init_bios() read the framebuffer from the
hardware. Then derive preferred_bpp from its format and initialize
struct drm_fb_helper with the value. The default is 32 (i.e., XRGB8888).

Also removes one of those deprecated references to the cpp field of
struct drm_format_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 29 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 49338a547d37..7e935121c445 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -58,7 +58,6 @@ struct intel_fbdev {
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
 	unsigned long vma_flags;
-	int preferred_bpp;
 };
 
 static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
@@ -429,7 +428,6 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 		goto out;
 	}
 
-	ifbdev->preferred_bpp = fb->base.format->cpp[0] * 8;
 	ifbdev->fb = fb;
 
 	drm_framebuffer_get(&ifbdev->fb->base);
@@ -460,6 +458,23 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 	return false;
 }
 
+static unsigned int intel_fbdev_color_mode(const struct drm_format_info *info)
+{
+	unsigned int bpp;
+
+	if (!info->depth || info->num_planes != 1 || info->has_alpha || info->is_yuv)
+		return 0;
+
+	bpp = drm_format_info_bpp(info, 0);
+
+	switch (bpp) {
+	case 16:
+		return info->depth; // 15 or 16
+	default:
+		return bpp;
+	}
+}
+
 static void intel_fbdev_suspend_worker(struct work_struct *work)
 {
 	intel_fbdev_set_suspend(&container_of(work,
@@ -624,6 +639,7 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
+	unsigned int preferred_bpp = 0;
 	int ret;
 
 	if (!HAS_DISPLAY(i915))
@@ -632,14 +648,15 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
 	if (!ifbdev)
 		return;
-	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
 
 	i915->display.fbdev.fbdev = ifbdev;
 	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
 	if (intel_fbdev_init_bios(dev, ifbdev))
-		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
-	else
-		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
+		preferred_bpp = intel_fbdev_color_mode(ifbdev->fb->base.format);
+	if (!preferred_bpp)
+		preferred_bpp = 32;
+
+	drm_fb_helper_prepare(dev, &ifbdev->helper, preferred_bpp, &intel_fb_helper_funcs);
 
 	ret = drm_client_init(dev, &ifbdev->helper.client, "intel-fbdev",
 			      &intel_fbdev_client_funcs);
-- 
2.47.1

