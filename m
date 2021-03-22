Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70D34466E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191FF89D84;
	Mon, 22 Mar 2021 14:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8189D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:02:20 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so10587060pjq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yFiw4jYyVPgKKK9i77Vkg4hTSWnNarff0aeFjf5I2bg=;
 b=FQnXW17jLClsIa0WCco6PtxWqpR+hJ1FFaXzWbR1wwd4gF7f3cF/WbmZhsxFSrKU1+
 7QBqOl6PswpPSu8qPTP5iZoTftcoScwprRC3ZdX1tbFgEC2FBx/lsPVpaEBs2egfV7Zp
 ZHj/sXaZVDEdjK8MZ6AjnDI9lsrKqWaEVZfXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFiw4jYyVPgKKK9i77Vkg4hTSWnNarff0aeFjf5I2bg=;
 b=DO2stjToUxZWQ4Qi8T3cK3/fAF9z+q5f9USqh6slU0XPRmOUICMgl8/9ZXBVCNBXZ0
 rrRMcCwOL25h8EFxuaBCwao2NPS2KNnPwbUBGF5hrx5laNN4SpmPfhFSMCT0+KEmoFnp
 d3kwcDi7dMT4J5WVLVZjTIJjETs27D5J/yHHAVLJGrkwktM0wJGwlS2pHldn1lFguS1F
 J753aThmb2P24Hjc5FRbPzcjUWKRtB14sP2N5EZwAe2CrpOL2fd62Mtu/qQI7rQNHJ8f
 V+jlQ1K9aeDVbXb57//pnnIBPoEM0OEKsgFy4I204upCigUkosFJQI56MF8Tg5ioSuNC
 iBwg==
X-Gm-Message-State: AOAM531HfEHztyUjCLPcMwkw7y47MhzIpDwmrmEAf7GDSiomjPVnciCl
 69EAiradLMxyVf+H2pd896j6HHsQ7dJ0v99C
X-Google-Smtp-Source: ABdhPJzE58DFBYBPm4FTbLkJ3y9/1Rr71/9oMKSOYfRiW0F09qVn4uXTqXnLF4g7p2OToVoay3/tiA==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr13550185pjb.133.1616421740641; 
 Mon, 22 Mar 2021 07:02:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:15c1:9a30:414f:d84b])
 by smtp.gmail.com with ESMTPSA id gg22sm14112997pjb.20.2021.03.22.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:02:20 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 1/4] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
Date: Mon, 22 Mar 2021 19:31:49 +0530
Message-Id: <20210322140152.101709-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322140152.101709-1-jagan@amarulasolutions.com>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace of_drm_find_panel with drm_of_find_panel_or_bridge
for finding panel, this indeed help to find the bridge if
bridge support added.

Added NULL in bridge argument, same will replace with bridge
parameter once bridge supported.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 4f5efcace68e..2e9e7b2d4145 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
 			    struct mipi_dsi_device *device)
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
-	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
+					  &panel, NULL);
+	if (ret)
+		return ret;
 
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
 	if (!dsi->drm || !dsi->drm->registered)
 		return -EPROBE_DEFER;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
