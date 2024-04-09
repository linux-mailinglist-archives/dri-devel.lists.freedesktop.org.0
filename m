Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C808989D3CC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3F4112B72;
	Tue,  9 Apr 2024 08:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u6mlLWW9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWDYVWxc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KA4x9kVW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YRyknQz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAE3112B67;
 Tue,  9 Apr 2024 08:10:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 036F53389F;
 Tue,  9 Apr 2024 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/0lrTrJR6gkulOclT16jOHMfzQCHj1OGtW2ump6xYI=;
 b=u6mlLWW9m4Mm3jR5lMqP6KiU4zD6C1IrOoz8IjE6f57pHnxOp0/jIovM/N0VH6ZbM5jEUb
 vj3gj0sj5F3zvzSgvRVIUkMZuZwTj+mdLSaxTOng0k4FzjTLmbJb9FP3vXXlWLDzKyharf
 /Av8PfWZpOhWbdQgv/eX9E/CgyLj2dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/0lrTrJR6gkulOclT16jOHMfzQCHj1OGtW2ump6xYI=;
 b=wWDYVWxcMkqga8RS6wzTPasVbkkA4TeMfr2qyJsCbrD/m9oFrm2Hiz6H6m9GA9MNfgLIjK
 02nDF4YX2GEEJAAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/0lrTrJR6gkulOclT16jOHMfzQCHj1OGtW2ump6xYI=;
 b=KA4x9kVWXeD3Hfgc9wQQd+jZbpIG8Eqc5JCZ6bJ7jnvjiwDvs+/BHKcEBrIBKMckrzY+5/
 V3VCu4QKbxAAl78pG8dxxR22ESGPhtjGv4cqDvuZ5qzMkKcls5UgATRh7zq8YLDH5QGqpj
 KKVUllYUIRQq7DZUClRTEG8VKtjqOBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650233;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/0lrTrJR6gkulOclT16jOHMfzQCHj1OGtW2ump6xYI=;
 b=YRyknQz0kYHyqbnsG2HehAKaKa5uP0ujpe/Uw/sRlqimwr4aQGefHxsb73y3lsa3sK6U+Y
 VURSW91JnlHNtZDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C9E013253;
 Tue,  9 Apr 2024 08:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SDcUIfj3FGbWNAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:10:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v8 2/6] drm/i915: Move fbdev functions
Date: Tue,  9 Apr 2024 10:04:24 +0200
Message-ID: <20240409081029.17843-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
References: <20240409081029.17843-1-tzimmermann@suse.de>
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
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[17];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns, suse.de:email]
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

Move functions within intel_fbdev.c to simplify later updates. Minor
style fixes to make checkpatch happy, but no functional changes.

v5:
- style fixes (checkpatch)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 154 ++++++++++-----------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 43855c6c35099..2714e12a6c44c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -458,58 +458,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
 				true);
 }
 
-int intel_fbdev_init(struct drm_device *dev)
-{
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_fbdev *ifbdev;
-	int ret;
-
-	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
-		return -ENODEV;
-
-	ifbdev = kzalloc(sizeof(struct intel_fbdev), GFP_KERNEL);
-	if (ifbdev == NULL)
-		return -ENOMEM;
-
-	mutex_init(&ifbdev->hpd_lock);
-	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
-
-	if (intel_fbdev_init_bios(dev, ifbdev))
-		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
-	else
-		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
-
-	ret = drm_fb_helper_init(dev, &ifbdev->helper);
-	if (ret) {
-		kfree(ifbdev);
-		return ret;
-	}
-
-	dev_priv->display.fbdev.fbdev = ifbdev;
-	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
-
-	return 0;
-}
-
-static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
-{
-	struct intel_fbdev *ifbdev = data;
-
-	/* Due to peculiar init order wrt to hpd handling this is separate. */
-	if (drm_fb_helper_initial_config(&ifbdev->helper))
-		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
-}
-
-void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	if (!ifbdev)
-		return;
-
-	ifbdev->cookie = async_schedule(intel_fbdev_initial_config, ifbdev);
-}
-
 static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
 {
 	if (!ifbdev->cookie)
@@ -520,31 +468,6 @@ static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
 	ifbdev->cookie = 0;
 }
 
-void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	if (!ifbdev)
-		return;
-
-	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
-
-	if (!current_is_async())
-		intel_fbdev_sync(ifbdev);
-
-	drm_fb_helper_unregister_info(&ifbdev->helper);
-}
-
-void intel_fbdev_fini(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
-
-	if (!ifbdev)
-		return;
-
-	intel_fbdev_destroy(ifbdev);
-}
-
 /* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
  * processing, fbdev will perform a full connector reprobe if a hotplug event
  * was received while HPD was suspended.
@@ -661,6 +584,83 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 		intel_fbdev_invalidate(ifbdev);
 }
 
+int intel_fbdev_init(struct drm_device *dev)
+{
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev;
+	int ret;
+
+	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
+		return -ENODEV;
+
+	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
+	if (!ifbdev)
+		return -ENOMEM;
+
+	mutex_init(&ifbdev->hpd_lock);
+	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
+
+	if (intel_fbdev_init_bios(dev, ifbdev))
+		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
+	else
+		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
+
+	ret = drm_fb_helper_init(dev, &ifbdev->helper);
+	if (ret) {
+		kfree(ifbdev);
+		return ret;
+	}
+
+	dev_priv->display.fbdev.fbdev = ifbdev;
+	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+
+	return 0;
+}
+
+static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
+{
+	struct intel_fbdev *ifbdev = data;
+
+	/* Due to peculiar init order wrt to hpd handling this is separate. */
+	if (drm_fb_helper_initial_config(&ifbdev->helper))
+		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
+}
+
+void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+
+	if (!ifbdev)
+		return;
+
+	ifbdev->cookie = async_schedule(intel_fbdev_initial_config, ifbdev);
+}
+
+void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+
+	if (!ifbdev)
+		return;
+
+	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
+
+	if (!current_is_async())
+		intel_fbdev_sync(ifbdev);
+
+	drm_fb_helper_unregister_info(&ifbdev->helper);
+}
+
+void intel_fbdev_fini(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
+
+	if (!ifbdev)
+		return;
+
+	intel_fbdev_destroy(ifbdev);
+}
+
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 {
 	if (!fbdev || !fbdev->helper.fb)
-- 
2.44.0

