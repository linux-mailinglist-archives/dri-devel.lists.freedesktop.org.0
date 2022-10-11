Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041715FB04D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C4010E2E1;
	Tue, 11 Oct 2022 10:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD2F10E7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 10:19:24 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id i6so7721036pli.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yq/9loxiQhBqkMGuBqVSVER97PU6eqNrwXcwJJSQ4o8=;
 b=YQMKAEJu2Lqp0lr6XC66P8V857rodeAZ2poxsUDkoWg3pWPdvuULNzsOWa02Zg/92T
 lxqyY11dROObYQy7jaqYxhREieGrky1SSz0bgsk/fWFgWgEUq5QP5+M51hpDBdXo5izF
 GnXG6kwB2iRS53lBKhVLXKuhjjLlcNr/EMfqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yq/9loxiQhBqkMGuBqVSVER97PU6eqNrwXcwJJSQ4o8=;
 b=i6Jend4QwIDV/2yK0GAHoYUN0AMYhTvR54iKoSGjFDIwgCgEzLQTmDTR/p3C8kEs0R
 c7Ju4Tuf/30/m6UqmrZ2t2KbqCG0VGwZR6STCEu0S0luKj/ryRBKug6RfEjjJMV0+ge3
 MPlj8b0RlHC3zi+AGPxhweJp0vThPX58C031hzBiTBk+lzlr6s0UV3KZVLXkgnr0sGio
 Bjrb55nT8lUY/M/M3kR7kEIoi7ZqJqzxnrtZw4i0I9ytveUSqM/lGagk4CTuxH9xXCNV
 Lr+iQ6w6fv7DRKTUQ7EAPJq4f72DppGHh1gvZRnda6Av/oQ6uYNDkOUC1Lx/dypPmeoZ
 QINQ==
X-Gm-Message-State: ACrzQf2QKpY+0J0oNWczVT8TEGSdH41wMERSI1HVO4y+ykc09Df3I149
 mjR1SYGPzULHEnJtqv8gVdff4Q==
X-Google-Smtp-Source: AMsMyM4LINEjb4g0hFCLAALDCXfaB3pcV4PVIko37wfdn2j6GQwmNRf85N9NgRqisdThg1hBRZsIyA==
X-Received: by 2002:a17:902:6a87:b0:181:c6c6:1d38 with SMTP id
 n7-20020a1709026a8700b00181c6c61d38mr12889488plk.74.1665483564107; 
 Tue, 11 Oct 2022 03:19:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:31e6:a0c9:ff22:7e86])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a1f4c00b0020d75e90d32sm488402pjy.17.2022.10.11.03.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:19:23 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm_bridge: register content protect property
Date: Tue, 11 Oct 2022 18:18:51 +0800
Message-Id: <20221011101850.200455-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some bridges are able to update HDCP status from userspace requests if
they support HDCP.

HDCP property is the same as other connector properties that need to be
created after the connecter is initialized and before the connector is
registered.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df5..a3b9ef8dc3f0b 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -398,6 +399,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	drm_connector_attach_content_protection_property(connector, true);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
-- 
2.38.0.rc1.362.ged0d419d3c-goog

