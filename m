Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1vlbLzAkf2nHkgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:00:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07369C55FE
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033DC10E00B;
	Sun,  1 Feb 2026 10:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="i6gtyRMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122610E00B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 10:00:11 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c1e0e7f21dfso180489a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 02:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1769940011; x=1770544811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P872sUlKZ2T5URTLsIxuXJw0ayydfJZJO9WCYt/vZ+I=;
 b=i6gtyRMPbPPJ4lGnMgZC3S3h+PkjkMGRKujXXdKLJQP93/P1WpMntrc4cFAA5rfVAh
 74zSgslztUw/MxHQE3qepPmyRW4ELS696GjNM9yxW5s8Tq/9pssiSxnAs4hnUvwCPjSB
 uLIgUKb+Nr+KkAVsMmVLJeU621AojqdbrGbOIOlmaxf4Px+psn9GzXziv9jbv2QeODr3
 QxFmkmJdYQsET1qKTZ11GkTaRvzvKkpT522gAtnFoQ0kcdrM1iqEK++8dAhJr5vwE3un
 rpMQ7G7RI8Tg+9Le8feY5iI1SpY/e2KLQyEZBeadYnvuD5ny5j3OrvGz9oc1fkBc9C4U
 hZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769940011; x=1770544811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P872sUlKZ2T5URTLsIxuXJw0ayydfJZJO9WCYt/vZ+I=;
 b=VCAhV3RoiEiV+gm9sp7fYICJp4ihAcOX1C21GYszumlqc4kuQ4kPRGqIs2i5N2XoxG
 RDpL6FbUwxmPjZtj4EFVtL8/lEo9Q86qmlX/BwmTnrimKRQ6mgXdX5EgIBI/gVGtxUXy
 RgRG6FAdsHR7rR41yFuZGCEuXWmKThIGVSuGZCQ77uBLR0zeJJzEGs+FszHHLaWc0W9A
 pPOZeSyG3J03+rxB9hyFoB+zBTVjRTYl/EC4CXEgLmpxBzyU+963ns+D1iqHeDgZQnVe
 YazrhhtbGriv6/FKC4RBXJXvy1XXrbMT8GUpZ0ZxCok/Hiw6Mdsz8pYFwMBkOBVAFlE4
 OThQ==
X-Gm-Message-State: AOJu0Yxn/8aS9KJQPoD2991pLDRdCJG+BG40QQunXUlTHVRfNp9mCgYJ
 ymHxCSEjj9gL3W28yQg2f9Y4nAxvBoMiNScxJFYD614m2L+imGOGfHQ02o0N9K8jYM4=
X-Gm-Gg: AZuq6aJkPgikVoKtTsiAzxTxz0LdxYMzfnRQ8jWzc/79Ae1oIp3r82q4VjAHnZBOEeR
 z8YEMrSsSHse2b/aBSgfeg6u7Uf9XesJp37dMe2j4WpQ/RyFRRoATh6YvL3u9UmZ5QYOZ2Z5s45
 C7OKCgM4a4sp5A/sUowbwB3UAWgf6GiRDMqwqST+FbH9sIM4Bn/9+lLWqc+hI6vgYy4MRTiqtj2
 iOBhvRQwSBPn9cQRomnAcfd/7XD7hMnZvkfEFXR+PorWGNiPXVmItpjRF8g+SULzz0g7FvabOBN
 NzIdEV+kVp+erM29wdAfHq0QBb0Hrt7C6mDj9dOjioBq0E87vGA3v7uM1ci8vfMTmzJfVJQwBf+
 r9rBwihi43s45PGIrgUDuX8xDTdz5MNuU/P0EmKaX9fSh7nJVABQiio3PIQl5txAabBpwFk1LPb
 kS7IBit0/R
X-Received: by 2002:a17:902:cec3:b0:2a1:3cd9:a742 with SMTP id
 d9443c01a7336-2a8d82338a0mr64789685ad.9.1769940010577; 
 Sun, 01 Feb 2026 02:00:10 -0800 (PST)
Received: from localhost ([132.147.84.99]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2a88b41474csm121738415ad.31.2026.02.01.02.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 02:00:10 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shenghao Yang <me@shenghaoyang.info>, stable+noautosel@kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] drm/gud: fix NULL crtc dereference on display disable
Date: Sun,  1 Feb 2026 17:59:56 +0800
Message-ID: <20260201095956.21042-1-me@shenghaoyang.info>
X-Mailer: git-send-email 2.52.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[shenghaoyang.info,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[shenghaoyang.info:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:me@shenghaoyang.info,m:stable+noautosel@kernel.org,m:lkp@intel.com,m:dan.carpenter@linaro.org,m:stable@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,noautosel];
	NEURAL_HAM(-0.00)[-0.988];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 07369C55FE
X-Rspamd-Action: no action

gud_plane_atomic_update() currently handles both crtc state and
framebuffer updates - the complexity has led to a few accidental
NULL pointer dereferences.

Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
on USB disconnect") [1] fixed an earlier dereference but planes
can also be disabled in non-hotplug paths (e.g. display disables
via the desktop environment). The drm_dev_enter() call would not
cause an early return in those and subsequently oops on
dereferencing crtc:

BUG: kernel NULL pointer dereference, address: 00000000000005c8
CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
 <TASK>
 drm_atomic_helper_commit_planes+0x28e/0x310
 drm_atomic_helper_commit_tail+0x2a/0x70
 commit_tail+0xf1/0x150
 drm_atomic_helper_commit+0x13c/0x180
 drm_atomic_commit+0xb1/0xe0
info ? __pfx___drm_printfn_info+0x10/0x10
 drm_mode_atomic_ioctl+0x70f/0x7c0
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 drm_ioctl_kernel+0xae/0x100
 drm_ioctl+0x2a8/0x550
 ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
 __x64_sys_ioctl+0x97/0xe0
 do_syscall_64+0x7e/0x7f0
 ? __ct_user_enter+0x56/0xd0
 ? do_syscall_64+0x158/0x7f0
 ? __ct_user_enter+0x56/0xd0
 ? do_syscall_64+0x158/0x7f0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Split out crtc handling from gud_plane_atomic_update() into
atomic_enable() and atomic_disable() functions to delegate
crtc state transitioning work to the DRM helpers.

To preserve the gud state commit sequence [2], switch to
the runtime PM version of drm_atomic_helper_commit_tail() which
ensures that crtcs are enabled (hence sending the
GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
requests) before a framebuffer update is sent.

[1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
[2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state

Cc: <stable+noautosel@kernel.org> # won't apply cleanly on 6.18.x
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
 drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
 drivers/gpu/drm/gud/gud_internal.h |  4 ++
 drivers/gpu/drm/gud/gud_pipe.c     | 59 +++++++++++++++++++++---------
 3 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 42135a48d92e..a2000991ecbe 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -339,7 +339,9 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 }
 
 static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
-	.atomic_check = drm_crtc_helper_atomic_check
+	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_enable = gud_crtc_atomic_enable,
+	.atomic_disable = gud_crtc_atomic_disable,
 };
 
 static const struct drm_crtc_funcs gud_crtc_funcs = {
@@ -364,6 +366,10 @@ static const struct drm_plane_funcs gud_plane_funcs = {
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
+static const struct drm_mode_config_helper_funcs gud_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
@@ -499,6 +505,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
 	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
 	drm->mode_config.funcs = &gud_mode_config_funcs;
+	drm->mode_config.helper_private = &gud_mode_config_helpers;
 
 	/* Format init */
 	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index d27c31648341..a5b7e53cf79c 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -62,6 +62,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
 
 void gud_clear_damage(struct gud_device *gdrm);
 void gud_flush_work(struct work_struct *work);
+void gud_crtc_atomic_enable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state);
+void gud_crtc_atomic_disable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state);
 int gud_plane_atomic_check(struct drm_plane *plane,
 			   struct drm_atomic_state *state);
 void gud_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 4b77be94348d..46b47452b315 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -580,6 +580,44 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
+void gud_crtc_atomic_enable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct gud_device *gdrm = to_gud_device(drm);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (crtc->state->mode_changed || crtc->state->connectors_changed) {
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
+		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
+	}
+
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
+
+	drm_dev_exit(idx);
+}
+
+void gud_crtc_atomic_disable(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct gud_device *gdrm = to_gud_device(drm);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 0);
+
+	if (crtc->state->mode_changed || crtc->state->connectors_changed)
+		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
+
+	drm_dev_exit(idx);
+}
+
 void gud_plane_atomic_update(struct drm_plane *plane,
 			     struct drm_atomic_state *atomic_state)
 {
@@ -607,24 +645,12 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 		mutex_unlock(&gdrm->damage_lock);
 	}
 
-	if (!drm_dev_enter(drm, &idx))
+	if (!crtc || !drm_dev_enter(drm, &idx))
 		return;
 
-	if (!old_state->fb)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
-
-	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
-		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
-
-	if (crtc->state->active_changed)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
-
-	if (!fb)
-		goto ctrl_disable;
-
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
-		goto ctrl_disable;
+		goto out;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage)
@@ -632,9 +658,6 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-ctrl_disable:
-	if (!crtc->state->enable)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
-
+out:
 	drm_dev_exit(idx);
 }
-- 
2.52.0

