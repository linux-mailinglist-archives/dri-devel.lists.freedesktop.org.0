Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43AB43FD5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7510EA7F;
	Thu,  4 Sep 2025 15:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XXVL22nZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W6Rj4ot0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RkqIUYuw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9JT50yR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3418D10EA80
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:01:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BA8F3742E;
 Thu,  4 Sep 2025 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756998059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tGLwM7MCNpxU9fEOmfo6YSHlTd3zTsYI1iLjEUNh6o=;
 b=XXVL22nZaVFJ2p19bMWTLqXP4c+wGtPyv5EPg2iNiEc3Lxq7Xr3rQvKdqGipq2lyeDS9H4
 iKY3S9sVOzKubmWM7kE5l3A80jsFINls52j2zgETASVYKfOIyDK7MrZftS9B2vgjTMJg2R
 5HVgMa3ADv3eOVoMOc75ixdbthINeI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756998059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tGLwM7MCNpxU9fEOmfo6YSHlTd3zTsYI1iLjEUNh6o=;
 b=W6Rj4ot03YC6A3ukFJ8bv5zI90fq7breGyNpD5sfNPjHnR6E7/+xDDUa/fNhk4P4zn52S/
 nKQA6XHj/a1qwPCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756998054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tGLwM7MCNpxU9fEOmfo6YSHlTd3zTsYI1iLjEUNh6o=;
 b=RkqIUYuwl4LXTsHo11QTSD9T5TRYXpI8UUoxCypWOLNhxqft3TmSZQeAFcOfMKl2M2Wa8m
 Jo+F/qaj1AHWcA8ybHN5yqdatz62B/B5RonjeYZzx9/Z/VdvkSe81IFwo3L/uGcBkEW8uQ
 FUd4huy47L9Aw8+cw+QCd6cllIrpYVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756998054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tGLwM7MCNpxU9fEOmfo6YSHlTd3zTsYI1iLjEUNh6o=;
 b=O9JT50yRTxwi/Cofu0YUB6bf3e5T0OQDynIzvbVMFlgpe08nJlrzL0k/0Wgq3ljoigI3bn
 zj9862dEcOjRUfCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A70EC13ACB;
 Thu,  4 Sep 2025 15:00:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +LtgJ6WpuWgcBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Sep 2025 15:00:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: louis.chauvet@bootlin.com, drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, lyude@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 3/4] drm/vkms: Convert to DRM's vblank timer
Date: Thu,  4 Sep 2025 16:56:24 +0200
Message-ID: <20250904145806.430568-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904145806.430568-1-tzimmermann@suse.de>
References: <20250904145806.430568-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWELVE(0.00)[14];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com,redhat.com];
 RSPAMD_URIBL_FAIL(0.00)[bootlin.com:query timed out];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 RSPAMD_EMAILBL_FAIL(0.00)[tzimmermann.suse.de:query timed
 out,louis.chauvet.bootlin.com:query timed out]; 
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:email, suse.de:mid]
X-Spam-Flag: NO
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

Replace vkms' vblank timer with the DRM implementation. The DRM
code is identical in concept, but differs in implementation.

Vblank timers are covered in vblank helpers and initializer macros,
so remove the corresponding hrtimer in struct vkms_output. The
vblank timer calls vkms' custom timeout code via handle_vblank_timeout
in struct drm_crtc_helper_funcs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 83 +++-----------------------------
 drivers/gpu/drm/vkms/vkms_drv.h  |  2 -
 2 files changed, 7 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9..bd79f24686dc 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -7,25 +7,18 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #include "vkms_drv.h"
 
-static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
+static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
-						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
 	struct vkms_crtc_state *state;
-	u64 ret_overrun;
 	bool ret, fence_cookie;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
-	if (ret_overrun != 1)
-		pr_warn("%s: vblank timer overrun\n", __func__);
-
 	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
@@ -57,55 +50,6 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 	dma_fence_end_signalling(fence_cookie);
 
-	return HRTIMER_RESTART;
-}
-
-static int vkms_enable_vblank(struct drm_crtc *crtc)
-{
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-
-	hrtimer_setup(&out->vblank_hrtimer, &vkms_vblank_simulate, CLOCK_MONOTONIC,
-		      HRTIMER_MODE_REL);
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
-
-	return 0;
-}
-
-static void vkms_disable_vblank(struct drm_crtc *crtc)
-{
-	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-
-	hrtimer_cancel(&out->vblank_hrtimer);
-}
-
-static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
-				      int *max_error, ktime_t *vblank_time,
-				      bool in_vblank_irq)
-{
-	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-
-	if (!READ_ONCE(vblank->enabled)) {
-		*vblank_time = ktime_get();
-		return true;
-	}
-
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
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
-	*vblank_time -= output->period_ns;
-
 	return true;
 }
 
@@ -159,9 +103,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.reset                  = vkms_atomic_crtc_reset,
 	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
 	.atomic_destroy_state   = vkms_atomic_crtc_destroy_state,
-	.enable_vblank		= vkms_enable_vblank,
-	.disable_vblank		= vkms_disable_vblank,
-	.get_vblank_timestamp	= vkms_get_vblank_timestamp,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 	.get_crc_sources	= vkms_get_crc_sources,
 	.set_crc_source		= vkms_set_crc_source,
 	.verify_crc_source	= vkms_verify_crc_source,
@@ -213,18 +155,6 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
-				    struct drm_atomic_state *state)
-{
-	drm_crtc_vblank_on(crtc);
-}
-
-static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
-				     struct drm_atomic_state *state)
-{
-	drm_crtc_vblank_off(crtc);
-}
-
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 	__acquires(&vkms_output->lock)
@@ -265,8 +195,9 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_check	= vkms_crtc_atomic_check,
 	.atomic_begin	= vkms_crtc_atomic_begin,
 	.atomic_flush	= vkms_crtc_atomic_flush,
-	.atomic_enable	= vkms_crtc_atomic_enable,
-	.atomic_disable	= vkms_crtc_atomic_disable,
+	.atomic_enable	= drm_crtc_vblank_atomic_enable,
+	.atomic_disable	= drm_crtc_vblank_atomic_disable,
+	.handle_vblank_timeout = vkms_crtc_handle_vblank_timeout,
 };
 
 struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8013c31efe3b..fb9711e1c6fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -215,8 +215,6 @@ struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_writeback_connector wb_connector;
 	struct drm_encoder wb_encoder;
-	struct hrtimer vblank_hrtimer;
-	ktime_t period_ns;
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-- 
2.50.1

