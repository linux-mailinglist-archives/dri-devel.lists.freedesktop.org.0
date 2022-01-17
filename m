Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBC49041C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CDF10E3F8;
	Mon, 17 Jan 2022 08:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2E210E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:38 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c3so20549332pls.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cFhuM499uRgAGVXd0+qvMKKdWgmvOXkveHsKZuQuM3I=;
 b=oyY5qDzhiUZolURzxuGw4qksSTKd9fDYqaZ0sLBEzKQ3jiZc63JHqxGuxrTROHVyMJ
 /bFsCW20uSRxdxLlNHIPZ9SwM7EaJLPVxZUdkLQ2M8GLPjGtXNiyYVuJBz+upa/fBJeq
 1C/+12tFJzTGKwWwg7gOPWs10JRCMErrc+MTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFhuM499uRgAGVXd0+qvMKKdWgmvOXkveHsKZuQuM3I=;
 b=43jKYLzCn1TafLu+RIhec6yRrUZePIraswKHXdZJ/HD4ERD3D0BnG/2MIcz9BgBEo4
 h4xu2M0Usux7WqfMrj77GAvQYEd9irrgXAK0AaNHt1O/YdopbmBh0ZAULOGhmQCiVrFf
 ogRmHr9A/UunbMWHJIJgg6ZZTb9Z47mFeqf7tU0baZe+aLix4IJGH/SK3EUkqTu5XBDK
 mAV/nZBQN9EjUF/kYKCMfO3xUw7AMaZ75JOze44ve66UFYSRLLFfO0sSJFtnz8EAivxb
 bx3OeqDqYyUJZUhWS7YLbN96nZkk3/HUp2prOIFonEymsS9K+XWBNafcIC7cMBdN4qes
 SsHQ==
X-Gm-Message-State: AOAM531ySbwmJ/8Tktux1p5aRkBOrWzGj0r8lVY8v+vuHZx2QRTgf6in
 +sh3kz3uKfow7H408mgqU2F6rw==
X-Google-Smtp-Source: ABdhPJyN+plxD3vnSjLuTamdTjVB8Dcfq37U0ta3NBZNXK5mpB4RaCr67R4ptEKa3C6k9GW63/aLVg==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr10971030pjn.137.1642408957905; 
 Mon, 17 Jan 2022 00:42:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:37 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 1/5] drm: bridge: panel: Reset the connector state pointer
Date: Mon, 17 Jan 2022 14:12:21 +0530
Message-Id: <20220117084225.125868-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117084225.125868-1-jagan@amarulasolutions.com>
References: <20220117084225.125868-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trigger hotplug event with drm_kms_helper_hotplug_event might fail if the
connector state pointer is NULL.

BUG observed in exynos dsi driver where drm_bridge_attach is trying to register
a connector in panel_bridge before the hotplug event is triggered,

WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_atomic_state_helper.c:494 drm_atomic_helper_connector_duplicate_state+0x94/0x9c
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G W 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c0110b30>] (unwind_backtrace) from [<c010c618>] (show_stack+0x10/0x14)
[<c010c618>] (show_stack) from [<c0b657d4>] (dump_stack_lvl+0x58/0x70)
[<c0b657d4>] (dump_stack_lvl) from [<c01261dc>] (__warn+0xd0/0x134)
[<c01261dc>] (__warn) from [<c0b5f628>] (warn_slowpath_fmt+0x5c/0xb4)
[<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>] (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
[<c064bce4>] (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>] (drm_atomic_get_connector_state+0xd4/0x190)
[<c0666b64>] (drm_atomic_get_connector_state) from [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
[<c0667928>] (__drm_atomic_helper_set_config) from [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
[<c067e628>] (drm_client_modeset_commit_atomic) from [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
[<c067e800>] (drm_client_modeset_commit_locked) from [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
[<c067e98c>] (drm_client_modeset_commit) from [<c06509c0>] (drm_fb_helper_set_par+0xb8/0xf8)
[<c06509c0>] (drm_fb_helper_set_par) from [<c05b86d0>] (fbcon_init+0x2c0/0x518)
[<c05b86d0>] (fbcon_init) from [<c060636c>] (visual_init+0xc0/0x108)
[<c060636c>] (visual_init) from [<c06085e4>] (do_bind_con_driver+0x1b8/0x3a4)
[<c06085e4>] (do_bind_con_driver) from [<c0608b40>] (do_take_over_console+0x13c/0x1e8)
[<c0608b40>] (do_take_over_console) from [<c05b6854>] (do_fbcon_takeover+0x78/0xd8)
[<c05b6854>] (do_fbcon_takeover) from [<c05b1154>] (register_framebuffer+0x208/0x2e0)
[<c05b1154>] (register_framebuffer) from [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
[<c064ead0>] (__drm_fb_helper_initial_config_and_unlock) from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
[<c063a718>] (drm_kms_helper_hotplug_event) from [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
[<c068f668>] (exynos_dsi_host_attach) from [<c0699354>] (s6e8aa0_probe+0x1b4/0x218)

So reset the atomic state for a given connector by freeing the state pointer
and allocate a new empty state object. This can be done using connector
funcs->reset helper and has to be done before the hotplug even calls.

This patch calls the connector->funcs->reset in panel_bridge_attach.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- none
Changes for v4:
- new patch

 drivers/gpu/drm/bridge/panel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index b32295abd9e7..f6eea194482a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -83,6 +83,9 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&panel_bridge->connector,
 					  bridge->encoder);
 
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
 	return 0;
 }
 
-- 
2.25.1

