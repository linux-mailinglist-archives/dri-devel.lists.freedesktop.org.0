Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26C490420
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492D010E3FB;
	Mon, 17 Jan 2022 08:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B9110E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:56 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e19so20497002plc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLlYG57QFItoYuZcxPFo4KFDVccBN9d8QTsSjRhhKIQ=;
 b=o4hBzWZmoF4b05mqomMP2zu6NL71cOziuhUpvRto0vmM+QSMbDu3wE14iv5G0DRDoV
 hD0pk3t8gHw7r2Up3Duqr348JD9wF6hCmEYg05hQDvoCD9WSWlb6inn0nv42h8mGo0ur
 SPtSytkaEOC+0ip7sXw/+GN1/uQZU9PKkw6C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLlYG57QFItoYuZcxPFo4KFDVccBN9d8QTsSjRhhKIQ=;
 b=69GTZ9NO8jYFOObpljlkHi86uU2poAwihqL/9u5FdM0jZjT39Eyq7CSppxn5b4KLA5
 I/NY3R4IXC8EuG/M9vo2pHVzy4q6PWTju2yEOFdtd/jdK8gx2BMCBuuUrUsxzYAAgdEX
 2RgG2KzqmvQB/UMcF3Nhpj/7aOpRO2PQGwGgCHU9az54cRv5E/vhV3e7K6QIntmIn70G
 AHcVxHq/DwJMV+6j++eEjORZgmGB5rzS6wCG1sBPedySWufx5IjyLtUWIcQXbbCpo9g1
 5uGYqxwjdrr7Ko4tA3wqN0vjRITSX3RQMjeV4YlR/71M5zTi1pQdwN0B4X11pzzodaN3
 01vQ==
X-Gm-Message-State: AOAM531KBEViXYTMSUUxkBlJT75HI07ktgQZGEQtj6DKtK9xGFG9q3FM
 FKP7O1tao+1h4cQpgpN4gK+ykw==
X-Google-Smtp-Source: ABdhPJyp0Eqx+JvYwQ4e7odT0FSrCxCjlTBZsNU6Wf2n/HkHQdTjmaDw0faAyy3belRmFA+Kj/PZ+g==
X-Received: by 2002:a17:90b:3ec4:: with SMTP id
 rm4mr4135719pjb.120.1642408976214; 
 Mon, 17 Jan 2022 00:42:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 5/5] drm: exynos: dsi: Move DSI init in bridge pre_enable
Date: Mon, 17 Jan 2022 14:12:25 +0530
Message-Id: <20220117084225.125868-6-jagan@amarulasolutions.com>
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

Host transfer in DSI master will invoke only when the DSI commands
sent from DSI devices like DSI Panel or DSI bridges and this host
transfer wouldn't invoke I2C based DSI bridge drivers.

Handling DSI host initialization in transfer calls might miss the
controller setup for I2C configured DSI bridges.

So, move the DSI initialization from transfer to bridge pre_enable
as the bridge enable API as it is common across all classes of DSI
device drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- init dsi in pre_enable
Changes for v4:
- none
Changes for v3:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 891b5c984f0c..1c3633f9982d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1391,6 +1391,13 @@ static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
 }
 
 static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1539,13 +1546,6 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
-
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

