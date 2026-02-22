Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5FkrGTGYmml5dQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 06:46:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5C16E856
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 06:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D7F10E0D8;
	Sun, 22 Feb 2026 05:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="LX9Wy7s4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136B10E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 05:46:18 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c6e7e3f92adso557882a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 21:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1771739178; x=1772343978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JhKzjTP9AJUfYj/qxi/+hBVU7eETqHo7vcCCz4bDmZU=;
 b=LX9Wy7s4+jZ2Bk2jvQL1kScnmE5/TMP1eX8MrHuDJWd0/CQsZYoRN7GdSBOQLebt5h
 BJBoGQkBoAb+NEeTaj65oSZ3DZgVn9iID+HFpdtEv4wBT2CUJSvfHO0gg+eSeIIM5cH0
 Vhaox4p+MOjROZ6UABJawYXmAgw4VC0cor1G/KXMLOgLz+Os3w3PClb0N1Cu0S/gYhRV
 Cuid08/oDj2k6BQHHjrisOY+TjSq3ohOv2Gl4PdUuffr8KBQHhprU7PnOcZbRJfEkgfl
 p6hzQe9JA0MQNjzZlZNw4XjYH29BhhaoinUiK8vk1vLkeN8stM1+vGn+6WYxatrKlyR1
 GDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771739178; x=1772343978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhKzjTP9AJUfYj/qxi/+hBVU7eETqHo7vcCCz4bDmZU=;
 b=YJsGrzK3lDv6p9VFMr/RXXXrLiwXoQj4SWC525gYMBDNsJdgdpk/pjdJZ+F3jCbXc0
 /UOKXvdcK3MlN/v325dn3W/82MaIJ1FnwAD0K23t2xKG/xc/eUschBAsq2KPUdaKdSI4
 APa0HC2Ca6OofftzTv8+kvMujLJ35FD3ljsp4HTURUGmgKLGW+6GwQDoUM2kwkXz3UvG
 BQHSO20SsGTSCmlO03VGMOoOeM9szv2ndO5DRNY5xaT4zTPpFY3HX3y1qKhlNZHVuUnN
 6ceh9xqFPSAGN0HI6kVRzqYT8WXFB8wdu01Zs37LfHuivm3LB7hjWmafq/9SVoNJh3WB
 ofSg==
X-Gm-Message-State: AOJu0YwNG7IudR1AIBMsQqqN6RUlr1tKoc5gtg2yx3FyhRYfu8aInOY4
 2KWbiezx2BDcxfl9WtNGkGniANvFMmlfp7A+H1nEifxgOdaui+i3zoXEmC/bAsV84QI=
X-Gm-Gg: AZuq6aJU/u9uI2UsvFeJaaI+KiKXdy3L0mwthbUKM04178CbUkB/ZfWYO594gZGfdyi
 A3iCrc7Nsz+aalNZTHCy/K3AjAY2mHix5Tm+uKeRCLjdZaHzokM8e/all/5NokIR1GaLOLL60SK
 0maSwWuiAdSp68yyrcTpMJN+FNb+BK2tMlg5scBx+3zMXYEaPgU1hJjCI59VpYrWmA2qn/72+Mj
 is0EIRxXU7KJAVhXlnBzmCzw7dS+5EKch/cgN+Vc/+iDBZ+mZdfGoHd4vl7/fbOYqf2XtLAcCh5
 yzHjRx6Ku7MmNTbTK/Q/BLqg3Yd7voyLOjBrq9yJPte/Jokf7pAotQQtdOG1sKR8HUz6C1H2zHf
 jyyE4/Oys73d5iPv48wZyuE2BZIrjoGBoxl4phHr/Io7PErDgCH2rUeP6+Q83GKAUx8H/cG9jkW
 k4ocAtfOqSgQOGhk6hyOtX
X-Received: by 2002:a17:90b:5624:b0:340:bca2:cf82 with SMTP id
 98e67ed59e1d1-358ae8a8df2mr3004305a91.4.1771739177810; 
 Sat, 21 Feb 2026 21:46:17 -0800 (PST)
Received: from localhost ([132.147.84.99]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-358af71f9a3sm3433129a91.6.2026.02.21.21.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Feb 2026 21:46:17 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shenghao Yang <me@shenghaoyang.info>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v5] drm/gud: fix NULL crtc dereference on display disable
Date: Sun, 22 Feb 2026 13:45:51 +0800
Message-ID: <20260222054551.80864-1-me@shenghaoyang.info>
X-Mailer: git-send-email 2.53.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[shenghaoyang.info,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[shenghaoyang.info:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:me@shenghaoyang.info,m:lkp@intel.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 90F5C16E856
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

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
v5: Send SET_CONTROLLER_ENABLE and SET_STATE_COMMIT unconditionally on
    crtc enable
v4: Send SET_DISPLAY_ENABLE=1 unconditionally on crtc enable
v3: Dropped stable AUTOSEL opt out
v2: Moved controller and display control commands to crtc
    enable / disable functions.

[v4]: https://lore.kernel.org/lkml/20260218054711.63982-1-me@shenghaoyang.info/
[v3]: https://lore.kernel.org/lkml/20260203172630.10077-1-me@shenghaoyang.info/
[v2]: https://lore.kernel.org/lkml/20260201095956.21042-1-me@shenghaoyang.info/
[v1]: https://lore.kernel.org/lkml/20260118125044.54467-1-me@shenghaoyang.info/

 drivers/gpu/drm/gud/gud_drv.c      |  9 ++++-
 drivers/gpu/drm/gud/gud_internal.h |  4 +++
 drivers/gpu/drm/gud/gud_pipe.c     | 54 ++++++++++++++++++++----------
 3 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index d0122d477610..17c2dead2c13 100644
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
index 4b77be94348d..587d6dd2b32e 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -580,6 +580,39 @@ int gud_plane_atomic_check(struct drm_plane *plane,
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
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
+	gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, 1);
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
+	gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
+
+	drm_dev_exit(idx);
+}
+
 void gud_plane_atomic_update(struct drm_plane *plane,
 			     struct drm_atomic_state *atomic_state)
 {
@@ -607,24 +640,12 @@ void gud_plane_atomic_update(struct drm_plane *plane,
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
@@ -632,9 +653,6 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-ctrl_disable:
-	if (!crtc->state->enable)
-		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
-
+out:
 	drm_dev_exit(idx);
 }
-- 
2.53.0

