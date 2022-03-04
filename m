Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512824CD786
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95CA10FF0D;
	Fri,  4 Mar 2022 15:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12210FF0C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:18:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i8so13148492wrr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=Oi/LHO8R88coh5oofTByzBlQgewaBXVn5ghgyo5mAuc=;
 b=XkOb0p3aN2aKjdAFuyZ/GCfeH9aPhQ3GIbTsSnNo3vq8AvEI+NNWjW425LW84jQ6xG
 n/FYts0y44jh6T6VBHiQJjrACxa13vAmPtJ2PeMeicMR+v744GZeq+KtsjvG0/7vbXMf
 tGJFfuFFObcBLSQl8kFbQMvKU/im9ZNW5UJOx1XfT24SNl5FqdIB7fxC77dsiBgFb3q3
 rhthKViK2zq/YCto2GtWVLQaYeb4It5tMGnTzRNzsiNqcV+A7F5UeC6nqGLjqb5WOWTc
 aFVjDlerqkUsPRPHAP6apzawU6S2cp2NHGEA58CxUXgijP5r7Z1KVrUVlg27ZfKsyg9I
 VDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=Oi/LHO8R88coh5oofTByzBlQgewaBXVn5ghgyo5mAuc=;
 b=cmaYrW8B1Qrt4LXv1+nJLHmxA6RukSeKjdBd2uPBggOnB6FPGKCGkJPs05pD1eLkhV
 G160/IdKMGMJzSPKwBKIdDNVShnQDhCDNHcVl8t6KOM/YkfFmsnhChwzzs+UrKZVjtyq
 Aw0VgdWsyFNwqqaWhVSIZbet1OF0Lsnw2JdBNGtvITeJWyN0wb4EC7I61p7iLZdkaXYM
 k8OPKvX8aSmAM1HnuwF+jVF1jePckGIQwPlGceOINAX3uHuio5z+FoM+eBs4WAPdxC1+
 Ji0LVkhmMbaKrqOMQhn2HT4DgCow3EWai9O61+ubB3GBdwIvtbgmIE3vdcVqwSG8OQt7
 h5pQ==
X-Gm-Message-State: AOAM531pQkrz+HOvvDmxB5OThWsz9KLuK9rMtmwNYQldQ4cxJx37IIr6
 cA69aTzwms24JGd+CEVN7cptfg==
X-Google-Smtp-Source: ABdhPJxhXtJMGNHrWXXAdGFF0BsEwrV0IdqoU3ohtNpCs8sMchpPktwGbE/O+LWquGbLejhaHu/qIw==
X-Received: by 2002:adf:aac6:0:b0:1f0:6848:54a3 with SMTP id
 i6-20020adfaac6000000b001f0684854a3mr3512725wrc.611.1646407124171; 
 Fri, 04 Mar 2022 07:18:44 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4409711wrq.3.2022.03.04.07.18.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Mar 2022 07:18:42 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH V2 3/4] drm/panel: Add prepare_upstream_first flag to drm_panel
Date: Fri,  4 Mar 2022 15:17:58 +0000
Message-Id: <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mapping to the drm_bridge flag pre_enable_upstream_first,
add a new flag prepare_upstream_first to drm_panel to allow
the panel driver to request that the upstream bridge should
be pre_enabled before the panel prepare.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/bridge/panel.c |  3 +++
 include/drm/drm_panel.h        | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 5be057575183..2ea08b3ba326 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
+	panel_bridge->bridge.pre_enable_upstream_first =
+						panel->prepare_upstream_first;
+
 	drm_bridge_add(&panel_bridge->bridge);
 
 	return &panel_bridge->bridge;
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 1ba2d424a53f..c0f39dfbd071 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -179,6 +179,16 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @prepare_upstream_first:
+	 *
+	 * The upstream controller should be prepared first, before the prepare
+	 * for the panel is called. This is largely required for DSI panels
+	 * where the DSI host controller should be initialised to LP-11 before
+	 * the panel is powered up.
+	 */
+	bool prepare_upstream_first;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.7.4

