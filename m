Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B03475609
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F58C10E46A;
	Wed, 15 Dec 2021 10:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675B10E46A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:16:06 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso18750396pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7mwCQQOx25soOzwU54V6juPjb/T8Ui/I/Y0mS6KWFZw=;
 b=BIUrIsUXKu83RZkYaa2XXoZ1/a9QNG4/TJIDU5W+eAhXygc4AaD3YUyPGyCd3rVOIR
 iyhbk9/IujX4xKTxj/Bp3vPQiA/L6JRnqx5FlmbRN4zJJk/df4JycYZYvqL1F5yXI24w
 obyBRNyorwgTQKNa0HiCnO/Uks+PbuYfgWbqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mwCQQOx25soOzwU54V6juPjb/T8Ui/I/Y0mS6KWFZw=;
 b=jqWlnjVsI8LNrcYQecUkxpYSVCnqQZPu+wu3hAcLzMB6VYzhd8nJHF0u/574kkuJM8
 zx1ViUBlrWznwXcJ7SqA6VumX/4ESyi3jsnIcZP/RQA9iiLzLp3Tm+QtulDwFi1jA48F
 pjTBLce+8z06ppZ6kBDdcDlm24+Bu+XGZIfFAkCgqAxK2zDAy/PiQ7YEIqyRrUxXvRls
 FGdf9lzHQjdzxJ8hlm1fNsQMvjv5yJWOSFfIFWAdokJoCGf6X+smBx6MgeDlcRThnyrZ
 U9P0h2kmnrXxF7MwQ30TSOfw4HfntfhcYk+6++HMOkQufRq7nZRK2Gddvv8ebDwoJlb9
 hzLg==
X-Gm-Message-State: AOAM530I9XDqC9Z/J/4XBDPS9At4iBurkVGUDcVFYxuE/DJX9yq4Q/YC
 3YB8VW9IOZ825lXN7SAg/CLDfg==
X-Google-Smtp-Source: ABdhPJwmSPxReWE8oDQtQI6c+Hjxhd4+ScZpuUzTsBByCi7LJxhaJoQop+igMJxxJryZCFMZ4Ul8ug==
X-Received: by 2002:a17:902:b210:b0:143:789a:7418 with SMTP id
 t16-20020a170902b21000b00143789a7418mr10193966plr.38.1639563366055; 
 Wed, 15 Dec 2021 02:16:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a7:8328:d9c4:5bc9])
 by smtp.gmail.com with ESMTPSA id
 v11sm2408149pfu.184.2021.12.15.02.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:16:05 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable
Date: Wed, 15 Dec 2021 15:45:34 +0530
Message-Id: <20211215101534.45003-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215101534.45003-1-jagan@amarulasolutions.com>
References: <20211215101534.45003-1-jagan@amarulasolutions.com>
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

So, move the DSI initialization from transfer to bridge enable as
the bridge enable API as it is common across all classes of DSI
device drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- none
Changes for v3:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 774ca265ed3b..d853dd8d1271 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1397,6 +1397,14 @@ static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
 				    struct drm_bridge_state *old_bridge_state)
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	int ret;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
 
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
@@ -1539,13 +1547,6 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
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

