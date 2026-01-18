Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFCD3950D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 13:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62FD10E126;
	Sun, 18 Jan 2026 12:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="XQXLV2eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1810E126
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 12:51:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-81f42cd476eso60740b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1768740663; x=1769345463;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yf6MwQDQwh28ZBZ3XFwBnvm7ZJiNkyLpf2ZCMRITZCA=;
 b=XQXLV2eFqerd5Ud+IiURdb1Y6BFpYetXDuOcBuxB1o19cm03g3uDivKclm62jSHOkk
 PoTClGreN9HxrzsRHY67WwIcZG05Q9HUPTn7wvZFXDYBiVwruF22zUIV71+KAuoFc06B
 y7vnLJy302pW4EFSHCn2yy3QXzHDf0KSsoVTZpYU62tfcNJSY2Dh7PErLmuKH39aQYJ1
 tmSHlsmcHa14U1meuHbDyhjLc7bHbZNt9m8XB0jXuiaD8ZZfCs5uGQ/Cd9Vi4F1M9Feu
 x6q3omYRayqeFzec7e+GP3ptgn07tWU1kBXv54mchPn9/ma+LW14m5LsYOQ8SMKnGNy8
 yCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768740663; x=1769345463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yf6MwQDQwh28ZBZ3XFwBnvm7ZJiNkyLpf2ZCMRITZCA=;
 b=WuQYxMp+ij1fnRmbNvF6k3sJpxGZw1ArPWW97EXAkRejR/Jt3lxDtgmzQaYS5vG6og
 Y897+wzG2JqzCdNA8XMApDMCW3abGuHZbqhDSEF32pJdbw1E1VWax6M1Quf4XWQOzBu+
 /WsXwqZdbmGfN7oPYH21lVE0gmXD8regkrVl3QnMZ4mG55djLzLALEcEOoB8HfgTtvkN
 aR6v7P9dZVqEyHSKpuRrGiip6oco/6YnGuakmJy0WUr81Hoc0pD6yJzQNFgeGl7+ENmK
 Z/T5LsSmJ7rhsBgMZHDHCLYaoxEkMmxSIaQ9cyMsd/CRu4FpsccEifwRxwYx4WLiUiZF
 FxcQ==
X-Gm-Message-State: AOJu0Yxojz+8iF1BbClc8lQbnEa6g+CY64E170W9+UxaxEHIWAtlSayD
 IsS6Tb2TV+GvWOeNV2UfqO5fIAnMydtWpZfQzGBhgu4CbAZ6T8eIunAVNI1sIBAxs8I=
X-Gm-Gg: AY/fxX7F2rZCDJ+Mxo4Vs03Ia36ClKOiqvTdP/a+wIpIB0pr66QnqZ3a3BIKJdPuL+4
 iEob65iFaGft/WuUgRadZSYnQmtSItn5RcigjATCYpJXuPhevx8DrdAobURJv0pFXOft3g6lo9m
 0N7S0vklx2FZxurqz9hFwJWsNV4w6TlHZySX6lD5uxEemPgFhTHloigXI7OX8VdZiS6U9kH7x7A
 1SrDLlNzR3+d54u6riLOHqlhMKYGYBbKeOQH6QXGE7CderdEcLF+lZVgyjIKWbwi0Y+Q8zYb22a
 9EzlE4Q88lq21FyCwdceNjT/ylE8NBr43DFefeUYdA7uTlhJk85RWRQVhgaLMp4HP2634sD82+s
 2qPPHSabLQK9WFUYbA4Ow2WWUu4wF0ggczxsOn+ebK3XmVs4gsg6qgIdWet8XKs3j0H/6k2YH5u
 ByaVsUC//dVERnGHCH3yQ=
X-Received: by 2002:a05:6a00:26e8:b0:81f:4960:f2f3 with SMTP id
 d2e1a72fcca58-81fa03964d1mr4275410b3a.6.1768740663367; 
 Sun, 18 Jan 2026 04:51:03 -0800 (PST)
Received: from localhost ([132.147.84.99]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-81fa1278056sm6646026b3a.34.2026.01.18.04.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 04:51:02 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shenghao Yang <me@shenghaoyang.info>, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/gud: fix NULL crtc dereference on display disable
Date: Sun, 18 Jan 2026 20:50:44 +0800
Message-ID: <20260118125044.54467-1-me@shenghaoyang.info>
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

Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
on USB disconnect") [1] only fixed the initial NULL crtc dereference
in gud_plane_atomic_update().

However, planes can also be disabled in non-hotplug paths (e.g.
display disables via the DE). The drm_dev_enter() call would not
cause an early return in those and we'll subsequently oops on
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

Add an early exit and disable the display controller if crtc is NULL.

[1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/

Cc: <stable@vger.kernel.org> # 6.18.x
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601142159.0v8ilfVs-lkp@intel.com/
Fixes: 73cfd166e045 ("drm/gud: Replace simple display pipe with DRM atomic helpers")
Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
 drivers/gpu/drm/gud/gud_pipe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 4b77be94348d..a69dee71490f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -610,6 +610,9 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (!crtc)
+		goto ctrl_disable;
+
 	if (!old_state->fb)
 		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
 
@@ -633,7 +636,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 ctrl_disable:
-	if (!crtc->state->enable)
+	if (!crtc || !crtc->state->enable)
 		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
 
 	drm_dev_exit(idx);
-- 
2.52.0

