Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B35BB1FB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 20:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423C810ED85;
	Fri, 16 Sep 2022 18:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E235210ED7E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 18:19:26 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b21so22182310plz.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+fFzpIi3PzPgMcGro61CvH6vcLPJxCss6KFI8NyEpQE=;
 b=ngIiJzuCuLYLdItpwqV2305DppqZ6E6z9DuFmuoBn/RSIdhQOi3oq+9r0lecEFatGq
 b6gDqEhlU4aEEcpVvkS79JQcYwXbhKF6XApC2LYn/zmeLXOH9eCJIX5LLjpiqPv3WOu+
 fM7eTEjmOIxk94LhcpC07DguyLrT1QgKWmrbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+fFzpIi3PzPgMcGro61CvH6vcLPJxCss6KFI8NyEpQE=;
 b=Pg115Vjs0qwVvAwhrpe5aavehXfWCm93t7mju75SzkH+INPSOWc4TCSXzAOKgmRQGP
 4KzZGvI1vcTVyHfFnotkGr8VoozAdZG4ANQhaMXqHmS4+xxwR3+My09d9BNpneTxtcxz
 W42Z7uMYJ+uBRKkc7jTIENnMlq1Yok2CTpktBpQyhwfQgqwppNWKOl/TMK0ExvN70ptw
 YrYgOHwUwLuxd55ADdg2fhei8eTAq2NnG2poVFj4UD3g8k6XQO6JvoFLlDBDN0mgdB6v
 pXNK1H161P0aB/f/k2i20Rb74QQCN5cQ22Izwo4UDJJ6CcO+4QbHFydwyrKRZcvCOqO+
 sshw==
X-Gm-Message-State: ACrzQf3urdphGaPAtiKHTxUgD6tNq0rrXfH/rRszGLcyFFKism4oyTc1
 YZjz2tgeT1HpbP7UqNv0xHroVsVkdSZuRS9x
X-Google-Smtp-Source: AMsMyM7KxRQAJzRdRzZLXmFeDc1z8XC7h+VUNBDrhnPxAoqNUvwMRkHcL8Dq1Z2JIeNNQATZWNhb+w==
X-Received: by 2002:a17:902:e549:b0:178:6d7c:abf6 with SMTP id
 n9-20020a170902e54900b001786d7cabf6mr1092457plf.131.1663352366475; 
 Fri, 16 Sep 2022 11:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:19:25 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v5 09/11] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Fri, 16 Sep 2022 23:47:29 +0530
Message-Id: <20220916181731.89764-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 527fef6f1ff6..a0f5438b7921 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1585,6 +1585,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1665,6 +1669,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
-- 
2.25.1

