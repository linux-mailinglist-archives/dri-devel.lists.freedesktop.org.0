Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON8dORCIqWki+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC26212AFA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F4D10E2A5;
	Thu,  5 Mar 2026 13:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Eiyrn7pF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TxEBO0Q+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eiyrn7pF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TxEBO0Q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82210EAFE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B2B23E84E;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msg9b/lXpO0bvzBCXpb2Wxx0JNmH7tSU8w7YVMxMiZ4=;
 b=Eiyrn7pFcB4RB1Y+nl2LQ7imUpErbEYQmxrHF8+VCrB9ldmvx6bVLXOE2jhg12YfanI9Vf
 t7504reLHr9N9M/I2E1D5Ql09tMnnsPokzTmV8hGhQn4EcbcTbF6q2cYlDTOMWZNTHL/Na
 WDm7VRUzBl8GqZaOTV2Mw8Eqa1L30UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msg9b/lXpO0bvzBCXpb2Wxx0JNmH7tSU8w7YVMxMiZ4=;
 b=TxEBO0Q+W+f0sAq00VtnhqF8uRMlYr28lfD7a1oRo2/fAbomXLgh0p4VywcOScSMit+98P
 CDYpvDkLOqepksAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Eiyrn7pF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TxEBO0Q+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msg9b/lXpO0bvzBCXpb2Wxx0JNmH7tSU8w7YVMxMiZ4=;
 b=Eiyrn7pFcB4RB1Y+nl2LQ7imUpErbEYQmxrHF8+VCrB9ldmvx6bVLXOE2jhg12YfanI9Vf
 t7504reLHr9N9M/I2E1D5Ql09tMnnsPokzTmV8hGhQn4EcbcTbF6q2cYlDTOMWZNTHL/Na
 WDm7VRUzBl8GqZaOTV2Mw8Eqa1L30UY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msg9b/lXpO0bvzBCXpb2Wxx0JNmH7tSU8w7YVMxMiZ4=;
 b=TxEBO0Q+W+f0sAq00VtnhqF8uRMlYr28lfD7a1oRo2/fAbomXLgh0p4VywcOScSMit+98P
 CDYpvDkLOqepksAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B0453EA68;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KPMGFQuIqWnFQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 13:41:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/vmwgfx: Move vblank handling into separate helper
Date: Thu,  5 Mar 2026 14:39:59 +0100
Message-ID: <20260305134122.246884-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305134122.246884-1-tzimmermann@suse.de>
References: <20260305134122.246884-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: 4FC26212AFA
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

Decouple vblank handling from the underlying hrtimer. This will be
helpful for replacing vmwgfx's vblank timer with DRM's common
implementation.

The new helper vmw_vkms_handle_vblank_timeout() can later be used as
callback for DRM's handle_vblank call as-is. The remaining code in
vmw_vkms_vblank_simulate() will be replaced by the DRM implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 37 +++++++++++++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h |  1 +
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 7862f6972512..15439ddd4f22 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -157,27 +157,19 @@ crc_generate_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
-static enum hrtimer_restart
-vmw_vkms_vblank_simulate(struct hrtimer *timer)
+bool
+vmw_vkms_handle_vblank_timeout(struct drm_crtc *crtc)
 {
-	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
-	struct drm_crtc *crtc = &du->crtc;
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 	struct vmw_private *vmw = vmw_priv(crtc->dev);
 	bool has_surface = false;
-	u64 ret_overrun;
 	bool locked, ret;
 
-	ret_overrun = hrtimer_forward_now(&du->vkms.timer,
-					  du->vkms.period_ns);
-	if (ret_overrun != 1)
-		drm_dbg_driver(crtc->dev, "vblank timer missed %lld frames.\n",
-			       ret_overrun - 1);
-
 	locked = vmw_vkms_vblank_trylock(crtc);
 	ret = drm_crtc_handle_vblank(crtc);
 	WARN_ON(!ret);
 	if (!locked)
-		return HRTIMER_RESTART;
+		return true;
 	has_surface = du->vkms.surface != NULL;
 	vmw_vkms_unlock(crtc);
 
@@ -200,6 +192,27 @@ vmw_vkms_vblank_simulate(struct hrtimer *timer)
 			drm_dbg_driver(crtc->dev, "Composer worker already queued\n");
 	}
 
+	return true;
+}
+
+static enum hrtimer_restart
+vmw_vkms_vblank_simulate(struct hrtimer *timer)
+{
+	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
+	struct drm_crtc *crtc = &du->crtc;
+	u64 ret_overrun;
+	bool success;
+
+	ret_overrun = hrtimer_forward_now(&du->vkms.timer,
+					  du->vkms.period_ns);
+	if (ret_overrun != 1)
+		drm_dbg_driver(crtc->dev, "vblank timer missed %lld frames.\n",
+			       ret_overrun - 1);
+
+	success = vmw_vkms_handle_vblank_timeout(crtc);
+	if (!success)
+		return HRTIMER_NORESTART;
+
 	return HRTIMER_RESTART;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
index 69ddd33a8444..0b6bbf7c4487 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
@@ -45,6 +45,7 @@ bool vmw_vkms_modeset_lock_relaxed(struct drm_crtc *crtc);
 bool vmw_vkms_vblank_trylock(struct drm_crtc *crtc);
 void vmw_vkms_unlock(struct drm_crtc *crtc);
 
+bool vmw_vkms_handle_vblank_timeout(struct drm_crtc *crtc);
 bool vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				   int *max_error,
 				   ktime_t *vblank_time,
-- 
2.53.0

