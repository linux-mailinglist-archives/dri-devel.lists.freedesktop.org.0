Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C1ACF314
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D7710E995;
	Thu,  5 Jun 2025 15:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EgLzXo0B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YDUa6UlP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EgLzXo0B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YDUa6UlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCCF10E980
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 843F733757;
 Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aui/Pqqqwzsq0sYniA2Zk5/xKPB5gd5V5Ac7NebTvmk=;
 b=EgLzXo0BwgYRtFQUkQuL0eqrUrtzEBzQHWbRcGJ6as23j2K39mhP0JiS+LF4cumHVyZar1
 iC5syaxvgfhxo1oKsWZkpAae2QBzf1Lq4gQNWnEscp7MVNe+FeTPuc4j6nL67CRTm36WjQ
 1V5hZzqsnVQwS0uU2dv7phcAOsSmvI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aui/Pqqqwzsq0sYniA2Zk5/xKPB5gd5V5Ac7NebTvmk=;
 b=YDUa6UlP42UzsMm5F1EMHmviQreWXaofqV3ajG4HdbrOlNoFq71rT9HWcgU1Q5wuy5Dev3
 4Hm3bLvPSEIPcKAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aui/Pqqqwzsq0sYniA2Zk5/xKPB5gd5V5Ac7NebTvmk=;
 b=EgLzXo0BwgYRtFQUkQuL0eqrUrtzEBzQHWbRcGJ6as23j2K39mhP0JiS+LF4cumHVyZar1
 iC5syaxvgfhxo1oKsWZkpAae2QBzf1Lq4gQNWnEscp7MVNe+FeTPuc4j6nL67CRTm36WjQ
 1V5hZzqsnVQwS0uU2dv7phcAOsSmvI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aui/Pqqqwzsq0sYniA2Zk5/xKPB5gd5V5Ac7NebTvmk=;
 b=YDUa6UlP42UzsMm5F1EMHmviQreWXaofqV3ajG4HdbrOlNoFq71rT9HWcgU1Q5wuy5Dev3
 4Hm3bLvPSEIPcKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AEAD13A1D;
 Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mMRIBQu4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] drm/hypervdrm: Use vblank timer
Date: Thu,  5 Jun 2025 17:24:43 +0200
Message-ID: <20250605152637.98493-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605152637.98493-1-tzimmermann@suse.de>
References: <20250605152637.98493-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
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

HyperV's virtual hardware does not provide vblank interrupts. Use a
vblank timer to simulate the interrupt in software. Rate-limits the
display's update frequency to the display-mode settings. Avoids
excessive CPU overhead with compositors that do not rate-limit their
output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hyperv/hyperv_drm.h         |  4 ++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 70 +++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
index 9e776112c03e..730e4a37545d 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm.h
+++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
@@ -6,12 +6,16 @@
 #ifndef _HYPERV_DRM_H_
 #define _HYPERV_DRM_H_
 
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_timer.h>
+
 #define VMBUS_MAX_PACKET_SIZE 0x4000
 
 struct hyperv_drm_device {
 	/* drm */
 	struct drm_device dev;
 	struct drm_plane plane;
+	struct drm_vblank_timer vtimer;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index f7d2e973f79e..ed19e471b96f 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -97,6 +97,28 @@ static const uint64_t hyperv_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static void hyperv_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_pending_vblank_event *event;
+
+	spin_lock_irq(&dev->event_lock);
+
+	event = crtc_state->event;
+	crtc_state->event = NULL;
+
+	if (event) {
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+	}
+
+	spin_unlock_irq(&dev->event_lock);
+}
+
 static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					     struct drm_atomic_state *state)
 {
@@ -110,13 +132,49 @@ static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 				crtc_state->mode.hdisplay,
 				crtc_state->mode.vdisplay,
 				plane_state->fb->pitches[0]);
+
+	drm_crtc_vblank_on(crtc);
+}
+
+static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_state *crtc_state)
+{
+	drm_crtc_vblank_off(crtc);
 }
 
 static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
 	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_flush = hyperv_crtc_helper_atomic_flush,
 	.atomic_enable = hyperv_crtc_helper_atomic_enable,
+	.atomic_disable = hyperv_crtc_helper_atomic_disable,
 };
 
+static int hyperv_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct hyperv_drm_device *hv = to_hv(crtc->dev);
+
+	drm_vblank_timer_start(&hv->vtimer);
+
+	return 0;
+}
+
+static void hyperv_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct hyperv_drm_device *hv = to_hv(crtc->dev);
+
+	drm_vblank_timer_cancel(&hv->vtimer);
+}
+
+static bool hyperv_crtc_get_vblank_timestamp(struct drm_crtc *crtc,
+					     int *max_error, ktime_t *vblank_time,
+					     bool in_vblank_irq)
+{
+	struct hyperv_drm_device *hv = to_hv(crtc->dev);
+
+	return drm_vblank_timer_get_vblank_timestamp(&hv->vtimer, max_error,
+						     vblank_time, in_vblank_irq);
+}
+
 static const struct drm_crtc_funcs hyperv_crtc_funcs = {
 	.reset = drm_atomic_helper_crtc_reset,
 	.destroy = drm_crtc_cleanup,
@@ -124,6 +182,9 @@ static const struct drm_crtc_funcs hyperv_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank = hyperv_crtc_enable_vblank,
+	.disable_vblank = hyperv_crtc_disable_vblank,
+	.get_vblank_timestamp = hyperv_crtc_get_vblank_timestamp,
 };
 
 static int hyperv_plane_atomic_check(struct drm_plane *plane,
@@ -285,6 +346,15 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv)
 		return ret;
 	}
 
+	/* Vertical blanking */
+
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ret;
+	ret = drmm_vblank_timer_init(&hv->vtimer, &hv->crtc, NULL);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.49.0

