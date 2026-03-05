Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP1DARiIqWki+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63DC212B1E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00CB10EB92;
	Thu,  5 Mar 2026 13:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i7lFto2i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KC02ceOs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i7lFto2i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KC02ceOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BFA10EB92
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2F7D5BD05;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=januSTY+myGLexLJNjz09w75BejoOrErP9PViFy6Mns=;
 b=i7lFto2iHcZ/N/dBMUQ0TX8/yR7Lxxtck97sq3ugxh7IGrzqLod9MWoPKbV0yAj5oHENck
 hiyhH0ftqlkQulHZJiShqyfN7Iqx9cRK9alEI826+shwIMZJbhd7PA2Wg6vG+8lqZPzg0h
 DZtGFIyfP+ZqrZkhq8UK8bgPJ1Jl6Bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=januSTY+myGLexLJNjz09w75BejoOrErP9PViFy6Mns=;
 b=KC02ceOsO2GFOSCv3M/p67jyzw8rXw5xKFqfeoHxSp0YSKlTTfzrSvk5uiIoIwxuwaiOwH
 mNImbD42gXo7EBDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=januSTY+myGLexLJNjz09w75BejoOrErP9PViFy6Mns=;
 b=i7lFto2iHcZ/N/dBMUQ0TX8/yR7Lxxtck97sq3ugxh7IGrzqLod9MWoPKbV0yAj5oHENck
 hiyhH0ftqlkQulHZJiShqyfN7Iqx9cRK9alEI826+shwIMZJbhd7PA2Wg6vG+8lqZPzg0h
 DZtGFIyfP+ZqrZkhq8UK8bgPJ1Jl6Bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=januSTY+myGLexLJNjz09w75BejoOrErP9PViFy6Mns=;
 b=KC02ceOsO2GFOSCv3M/p67jyzw8rXw5xKFqfeoHxSp0YSKlTTfzrSvk5uiIoIwxuwaiOwH
 mNImbD42gXo7EBDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91B803EA76;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MLRiIguIqWnFQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 13:41:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/vmwgfx: Convert to DRM vblank timers
Date: Thu,  5 Mar 2026 14:40:00 +0100
Message-ID: <20260305134122.246884-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305134122.246884-1-tzimmermann@suse.de>
References: <20260305134122.246884-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
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
X-Rspamd-Queue-Id: A63DC212B1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Action: no action

Replace vmwgfx's vblank timer with DRM's common implementation. The
timer handling is almost identical with a few additional bug fixes in
the common code.

Replace most of vmwgfx's vmw_vkms_get_vblank_timestamp() with the
shared helper drm_crtc_vblank_get_vblank_timeout(). The common helper
also works in the presence of delayed vblank timeouts that modify the
vblank counter concurrently.

Set the timeout handler to vmw_vkms_handle_vblank_timeout(). In addition
to handling vblank events, this function also controls CRC generation.

Remove all the hrtimer-related code from vmwgfx. DRM vblank timers
provides this.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 63 ++++------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h |  1 -
 6 files changed, 10 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 445471fe9be6..b5670ece90a9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -322,8 +322,6 @@ struct vmw_display_unit {
 
 	struct {
 		struct work_struct crc_generator_work;
-		struct hrtimer timer;
-		ktime_t period_ns;
 
 		/* protects concurrent access to the vblank handler */
 		atomic_t atomic_lock;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index f07669b27fba..6f22d5f5c379 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -402,6 +402,7 @@ static const struct drm_crtc_helper_funcs vmw_ldu_crtc_helper_funcs = {
 	.atomic_flush = vmw_vkms_crtc_atomic_flush,
 	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_vkms_crtc_atomic_disable,
+	.handle_vblank_timeout  = vmw_vkms_handle_vblank_timeout,
 };
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 605d037d18c6..cfb8ad3ebe43 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -797,6 +797,7 @@ static const struct drm_crtc_helper_funcs vmw_sou_crtc_helper_funcs = {
 	.atomic_flush = vmw_vkms_crtc_atomic_flush,
 	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_sou_crtc_atomic_disable,
+	.handle_vblank_timeout  = vmw_vkms_handle_vblank_timeout,
 };
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index dcbacee97f61..1f5497e2638a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1515,6 +1515,7 @@ static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
 	.atomic_flush = vmw_stdu_crtc_atomic_flush,
 	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_stdu_crtc_atomic_disable,
+	.handle_vblank_timeout  = vmw_vkms_handle_vblank_timeout,
 };
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 15439ddd4f22..20b6dfd3d3c2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -195,27 +195,6 @@ vmw_vkms_handle_vblank_timeout(struct drm_crtc *crtc)
 	return true;
 }
 
-static enum hrtimer_restart
-vmw_vkms_vblank_simulate(struct hrtimer *timer)
-{
-	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
-	struct drm_crtc *crtc = &du->crtc;
-	u64 ret_overrun;
-	bool success;
-
-	ret_overrun = hrtimer_forward_now(&du->vkms.timer,
-					  du->vkms.period_ns);
-	if (ret_overrun != 1)
-		drm_dbg_driver(crtc->dev, "vblank timer missed %lld frames.\n",
-			       ret_overrun - 1);
-
-	success = vmw_vkms_handle_vblank_timeout(crtc);
-	if (!success)
-		return HRTIMER_NORESTART;
-
-	return HRTIMER_RESTART;
-}
-
 void
 vmw_vkms_init(struct vmw_private *vmw)
 {
@@ -258,32 +237,12 @@ vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 			      ktime_t *vblank_time,
 			      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vmw_private *vmw = vmw_priv(dev);
-	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
 
 	if (!vmw->vkms_enabled)
 		return false;
 
-	if (!READ_ONCE(vblank->enabled)) {
-		*vblank_time = ktime_get();
-		return true;
-	}
-
-	*vblank_time = READ_ONCE(du->vkms.timer.node.expires);
-
-	if (WARN_ON(*vblank_time == vblank->time))
-		return true;
-
-	/*
-	 * To prevent races we roll the hrtimer forward before we do any
-	 * interrupt processing - this is how real hw works (the interrupt is
-	 * only generated after all the vblank registers are updated) and what
-	 * the vblank core expects. Therefore we need to always correct the
-	 * timestampe by one frame.
-	 */
-	*vblank_time -= du->vkms.period_ns;
+	drm_crtc_vblank_get_vblank_timeout(crtc, vblank_time);
 
 	return true;
 }
@@ -293,20 +252,11 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vmw_private *vmw = vmw_priv(dev);
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
 	if (!vmw->vkms_enabled)
 		return -EINVAL;
 
-	drm_calc_timestamping_constants(crtc, &crtc->mode);
-
-	hrtimer_setup(&du->vkms.timer, &vmw_vkms_vblank_simulate, CLOCK_MONOTONIC,
-		      HRTIMER_MODE_REL);
-	du->vkms.period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&du->vkms.timer, du->vkms.period_ns, HRTIMER_MODE_REL);
-
-	return 0;
+	return drm_crtc_vblank_start_timer(crtc);
 }
 
 void
@@ -318,9 +268,9 @@ vmw_vkms_disable_vblank(struct drm_crtc *crtc)
 	if (!vmw->vkms_enabled)
 		return;
 
-	hrtimer_cancel(&du->vkms.timer);
+	drm_crtc_vblank_cancel_timer(crtc);
+
 	du->vkms.surface = NULL;
-	du->vkms.period_ns = ktime_set(0, 0);
 }
 
 enum vmw_vkms_lock_state {
@@ -346,10 +296,11 @@ vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
 {
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
+	drm_crtc_vblank_cancel_timer(crtc);
+
 	if (du->vkms.surface)
 		vmw_surface_unreference(&du->vkms.surface);
 	WARN_ON(work_pending(&du->vkms.crc_generator_work));
-	hrtimer_cancel(&du->vkms.timer);
 }
 
 void
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
index 0b6bbf7c4487..40c679f59db2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
@@ -29,7 +29,6 @@
 #ifndef VMWGFX_VKMS_H_
 #define VMWGFX_VKMS_H_
 
-#include <linux/hrtimer_types.h>
 #include <linux/types.h>
 
 struct drm_atomic_state;
-- 
2.53.0

