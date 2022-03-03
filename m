Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DCD4CC2F1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDFA10E9E1;
	Thu,  3 Mar 2022 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F310E9E1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:37:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso4870655pjq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLbgWPGTvslOBS5UpaKI0SJIKPvPO+ELrEhMx1Q0zDM=;
 b=gVrdwHfK8hS94wnYjan9hGxzyWaQI2gDtUUbElO/bT9QrRf7DCGhEaNKE6CqsOaGOn
 orNt/VjAl0eCQNtlQALz7iyHTsfx+u/6GyLFBRWQ+r96vpjkG9oofPhmN+y+AiF1+26c
 /NB1e2+OOxAeVDdNYyg1nku+WgpaDn8Vbo0s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLbgWPGTvslOBS5UpaKI0SJIKPvPO+ELrEhMx1Q0zDM=;
 b=3wtww2BNTUsYfGYpeiGzobffJTWvBZF3XJGgSz72dCC/0ZhnO3rIL9dozxHBn0Fm1W
 td/iAfmdNOs7ZU+uzAchctYWVjI07s0ajp80aGFkC57NWr5oqObmW5Cc+u0048QYp+P2
 ynon405u50Vv50Y2SQqb5HhaH6l5VInCz4a5cw+vQ+FDNh3MXZMQCjwuLJ1E7lh/sX2m
 nrZuATdW95kKcpe5xolffx+nv/KmlB+gzjnViQjPLz146gTEQ1C5LZVpQc5GQAUJ6p55
 0FC4CXj4mBkPNLgyeh5JIx3nsJAaRWttM20Zs5whwq5qCuaipQp3vm87mhz3sRQ+9xzH
 HBzw==
X-Gm-Message-State: AOAM531i4Ehkvc53NClUzASqnKyfL6aMeXd7YMlAi8qeykZmGi7HejPE
 kl7Q2j4E/Zx01vF5F2Yc2TagGg==
X-Google-Smtp-Source: ABdhPJzQGuqa2S6u9A6+9EDe0KyWpp40bNrsu0T7FdmJ1HT+x6UXcCtAHXAiyRQoXaJ4IokcQWGj+A==
X-Received: by 2002:a17:902:7041:b0:14f:c724:42c7 with SMTP id
 h1-20020a170902704100b0014fc72442c7mr36866699plt.11.1646325465047; 
 Thu, 03 Mar 2022 08:37:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:37:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 2/6] drm: bridge: panel: Reset the connector state pointer
Date: Thu,  3 Mar 2022 22:06:50 +0530
Message-Id: <20220303163654.3381470-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
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
Changes for v6, v5:
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

