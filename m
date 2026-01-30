Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPZdBdWWfGl1NwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:32:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97430BA1A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D77D10E179;
	Fri, 30 Jan 2026 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="SBx8gzWL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="amHq7Vb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380DB10E179;
 Fri, 30 Jan 2026 11:32:33 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769772751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y/X4T+gcALGbtYm3GL9og2QAkAj/d8qaAdcQ1KRZKqM=;
 b=SBx8gzWLJua8ca3lu90UyRq5vh+7jeD8E6IPZJVb/9NtBoP3KphV0tWdZav5wcI7RMUUsU
 Ol1uGLzoKiOn7xorYXJm1VX9Xx58E3tZxF4t1SDzSBX7OgXiWteMRs5nNXGoQNE5QnzNVd
 zKeQduTrAzIHEva4gQJoimKheg+k5AbRHELyro4z20zxuALNg2djbRAoIQI4HD2j+IxC2L
 EY5oRyWBIwDtNCq/tA/hnHhpYI1ep7K2OhEnYf0K0BKcN+bIOhDwU01wn4kYtDOgd3Pua1
 rLrfddE3uYToR/87LKhNVmH+lM6McV3PbCZh/yTQ/TQDWk+hTbb21uQvsMXEyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769772751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y/X4T+gcALGbtYm3GL9og2QAkAj/d8qaAdcQ1KRZKqM=;
 b=amHq7Vb81t23HVNxsqAe91ZH1/B2OldqENhCGBLwEFxCp1X2Ub5JhLWOTRKcyU3Zr7o6FG
 OOTyhqPfpuVxQPDg==
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
Date: Fri, 30 Jan 2026 12:38:08 +0106
Message-ID: <20260130113230.2311221-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,vger.kernel.org,redhat.com,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 97430BA1A3
X-Rspamd-Action: no action

This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.

Apparently there is more to supporting atomic modesetting than
providing atomic_(check|commit) callbacks. Before this revert:

WARNING: [] drivers/gpu/drm/drm_plane.c:389 at .__drm_universal_plane_init+0x13c/0x794 [drm], CPU#1: modprobe/1790
BUG: Kernel NULL pointer dereference on read at 0x00000000
.drm_atomic_get_plane_state+0xd4/0x210 [drm] (unreliable)
.drm_client_modeset_commit_atomic+0xf8/0x338 [drm]
.drm_client_modeset_commit_locked+0x80/0x260 [drm]
.drm_client_modeset_commit+0x40/0x7c [drm]
.__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0xfc/0x108 [drm_kms_helper]
.drm_fb_helper_set_par+0x8c/0xb8 [drm_kms_helper]
.fbcon_init+0x31c/0x618
[...]
.__drm_fb_helper_initial_config_and_unlock+0x474/0x7f4 [drm_kms_helper]
.drm_fbdev_client_hotplug+0xb0/0x120 [drm_client_lib]
.drm_client_register+0x88/0xe4 [drm]
.drm_fbdev_client_setup+0x12c/0x19b4 [drm_client_lib]
.drm_client_setup+0x15c/0x18c [drm_client_lib]
.nouveau_drm_probe+0x19c/0x268 [nouveau]

Fixes: 604826acb3f5 ("drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)")
Reported-by: John Ogness <john.ogness@linutronix.de>
Closes: https://lore.kernel.org/lkml/87ldhf1prw.fsf@jogness.linutronix.de
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 829c2b573971c..00515623a2cc7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -352,8 +352,6 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 
 static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
 	.fb_create = nouveau_user_framebuffer_create,
-	.atomic_commit = drm_atomic_helper_commit,
-	.atomic_check = drm_atomic_helper_check,
 };
 
 

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.47.3

