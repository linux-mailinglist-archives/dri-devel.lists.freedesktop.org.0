Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C03ACF30A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF51D10E8F6;
	Thu,  5 Jun 2025 15:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0P++UBLj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtzAqonv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0P++UBLj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtzAqonv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1692010E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5CD91F78B;
 Thu,  5 Jun 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxp7mTDR5t3sXpbj7Uxo/kpi0WkiXh+O5jsVwFeT1v8=;
 b=0P++UBLjEtXGF4Uy5q9AGYF+BQVcOF27JiaKVIP+o2adxw9ocjLADhbEK5OwSZzjVMmMpj
 6FcrH84qB6LXYR5VE1uk2N9/EAnCTrUWSLK+7R3FOQGgR0gqVsHCcATRTLz53tmytDKoha
 0v/YjHhqBe6tPXVQIEe/GiQk0cLDZvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxp7mTDR5t3sXpbj7Uxo/kpi0WkiXh+O5jsVwFeT1v8=;
 b=dtzAqonvXUU4czTXKFOKBtoRupLBWIpqhwKi+/hWx9Y/VEqEaU+WxGr9BnBVv20bcVdUe8
 GtwDPxUxA0bjWqCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxp7mTDR5t3sXpbj7Uxo/kpi0WkiXh+O5jsVwFeT1v8=;
 b=0P++UBLjEtXGF4Uy5q9AGYF+BQVcOF27JiaKVIP+o2adxw9ocjLADhbEK5OwSZzjVMmMpj
 6FcrH84qB6LXYR5VE1uk2N9/EAnCTrUWSLK+7R3FOQGgR0gqVsHCcATRTLz53tmytDKoha
 0v/YjHhqBe6tPXVQIEe/GiQk0cLDZvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxp7mTDR5t3sXpbj7Uxo/kpi0WkiXh+O5jsVwFeT1v8=;
 b=dtzAqonvXUU4czTXKFOKBtoRupLBWIpqhwKi+/hWx9Y/VEqEaU+WxGr9BnBVv20bcVdUe8
 GtwDPxUxA0bjWqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DE07139CB;
 Thu,  5 Jun 2025 15:30:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QGrGEQm4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/6] drm/vblank: Add vblank timer
Date: Thu,  5 Jun 2025 17:24:39 +0200
Message-ID: <20250605152637.98493-2-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
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

The vblank timer simulates a vblank interrupt for hardware without
support. Rate-limits the display update frequency.

DRM drivers for hardware without vblank support apply display updates
ASAP. A vblank event informs DRM clients of the completed update.

Userspace compositors immediately schedule the next update, which
creates significant load on virtualization outputs. Display updates
are usually fast on virtualization outputs, as their framebuffers are
in regular system memory and there's no hardware vblank interrupt to
throttle the update rate.

The vblank timer is a HR timer that signals the vblank in software.
It limits the update frequency of a DRM driver similar to a hardware
vblank interrupt. The timer is not synchronized to the actual vblank
interval of the display.

The code has been adopted from vkms, which added the funtionality
in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
hrtimers").

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile           |   3 +-
 drivers/gpu/drm/drm_vblank_timer.c | 100 +++++++++++++++++++++++++++++
 include/drm/drm_vblank_timer.h     |  26 ++++++++
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_vblank_timer.c
 create mode 100644 include/drm/drm_vblank_timer.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b5d5561bbe5f..6722e2d1aa7e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -146,7 +146,8 @@ drm_kms_helper-y := \
 	drm_plane_helper.o \
 	drm_probe_helper.o \
 	drm_self_refresh_helper.o \
-	drm_simple_kms_helper.o
+	drm_simple_kms_helper.o \
+	drm_vblank_timer.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
diff --git a/drivers/gpu/drm/drm_vblank_timer.c b/drivers/gpu/drm/drm_vblank_timer.c
new file mode 100644
index 000000000000..be46d3135c8e
--- /dev/null
+++ b/drivers/gpu/drm/drm_vblank_timer.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/hrtimer.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_timer.h>
+
+static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
+{
+	struct drm_vblank_timer *vtimer = container_of(timer, struct drm_vblank_timer, timer);
+	struct drm_crtc *crtc = vtimer->crtc;
+	struct drm_device *dev = crtc->dev;
+	u64 ret_overrun;
+	bool succ;
+
+	ret_overrun = hrtimer_forward_now(&vtimer->timer, vtimer->period_ns);
+	if (ret_overrun != 1)
+		drm_warn(dev, "vblank timer overrun\n");
+
+	if (vtimer->crtc_handle_vblank)
+		succ = vtimer->crtc_handle_vblank(crtc);
+	else
+		succ = drm_crtc_handle_vblank(crtc);
+	if (!succ)
+		return HRTIMER_NORESTART;
+
+	return HRTIMER_RESTART;
+}
+
+static void drmm_vblank_timer_release(struct drm_device *dev, void *res)
+{
+	struct drm_vblank_timer *vtimer = res;
+
+	hrtimer_cancel(&vtimer->timer);
+}
+
+int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct drm_crtc *crtc,
+			   bool (*crtc_handle_vblank)(struct drm_crtc *crtc))
+{
+	struct hrtimer *timer = &vtimer->timer;
+
+	vtimer->crtc = crtc;
+	vtimer->crtc_handle_vblank = crtc_handle_vblank;
+
+	hrtimer_setup(timer, drm_vblank_timer_function, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+
+	return drmm_add_action_or_reset(crtc->dev, drmm_vblank_timer_release, vtimer);
+}
+EXPORT_SYMBOL(drmm_vblank_timer_init);
+
+void drm_vblank_timer_start(struct drm_vblank_timer *vtimer)
+{
+	struct drm_crtc *crtc = vtimer->crtc;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	drm_calc_timestamping_constants(crtc, &crtc->mode);
+
+	vtimer->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&vtimer->timer, vtimer->period_ns, HRTIMER_MODE_REL);
+}
+EXPORT_SYMBOL(drm_vblank_timer_start);
+
+void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer)
+{
+	hrtimer_cancel(&vtimer->timer);
+}
+EXPORT_SYMBOL(drm_vblank_timer_cancel);
+
+bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer *vtimer,
+					   int *max_error, ktime_t *vblank_time,
+					   bool in_vblank_irq)
+{
+	struct drm_crtc *crtc = vtimer->crtc;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
+	*vblank_time = READ_ONCE(vtimer->timer.node.expires);
+
+	if (WARN_ON(*vblank_time == vblank->time))
+		return true;
+
+	/*
+	 * To prevent races we roll the hrtimer forward before we do any
+	 * interrupt processing - this is how real hw works (the interrupt is
+	 * only generated after all the vblank registers are updated) and what
+	 * the vblank core expects. Therefore we need to always correct the
+	 * timestampe by one frame.
+	 */
+	*vblank_time -= vtimer->period_ns;
+
+	return true;
+}
+EXPORT_SYMBOL(drm_vblank_timer_get_vblank_timestamp);
diff --git a/include/drm/drm_vblank_timer.h b/include/drm/drm_vblank_timer.h
new file mode 100644
index 000000000000..0b827ff1f59c
--- /dev/null
+++ b/include/drm/drm_vblank_timer.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _DRM_VBLANK_TIMER_H_
+#define _DRM_VBLANK_TIMER_H_
+
+#include <linux/hrtimer_types.h>
+#include <linux/types.h>
+
+struct drm_crtc;
+
+struct drm_vblank_timer {
+	struct drm_crtc *crtc;
+	bool (*crtc_handle_vblank)(struct drm_crtc *crtc);
+	ktime_t period_ns;
+	struct hrtimer timer;
+};
+
+int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct drm_crtc *crtc,
+			   bool (*handle_vblank)(struct drm_crtc *crtc));
+void drm_vblank_timer_start(struct drm_vblank_timer *vtimer);
+void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer);
+bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer *vtimer,
+					   int *max_error, ktime_t *vblank_time,
+					   bool in_vblank_irq);
+
+#endif
-- 
2.49.0

