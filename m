Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CB3BAC5D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7989DB2;
	Sun,  4 Jul 2021 09:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89AE89DB2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:36 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id z13so1045084plg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A427+AfnA1Ioz/bXS+gNjyx5ot8Nzh0o3fQKGaVpLAE=;
 b=KaxmMRYPEmdg54XavvkHjZ8mq4QksxD0N/CQJqpLUYFA+3J4uv90DR4ptLg++WDirj
 L51kBA2kO+b20UX1/tQZGklUb5FbtcJOmoNn52QBOJ+phq9sKEhp2AoZexc116ZUJlFO
 5bEUXUhGnvVypx5REzbRYtOaMT2a/sTa7L7Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A427+AfnA1Ioz/bXS+gNjyx5ot8Nzh0o3fQKGaVpLAE=;
 b=d66Z+60++PXuUyJD2G4Wff3d7lgpJPen7JsvuRWAw7jbsoGJOsXiocP5dBGx/S0QIt
 ityTaLtr1Tm3TByAoF4waxJvTruNL1JNoXTO31F0ETI8ShS8VzPnZRACWBW8yWvpDLrG
 huPwzc1+/qn4syW0jLGJVrToP9+k7sD7kBVaaq27V28RQ9bvFmrVSe+tZ8R+ygu9ymsP
 OjKtXhmTZyzWF4MKr6q3wn2QYaDrXej7pSp9YXLTwqxVL4VADHHOAmOlTfSStygoraJk
 682kCd/sv6cctZ0mE7pIDmQf4Q6xGdifgtQJtnkL+Vr9EdglatT8wv61rZccKeowksyz
 gs9w==
X-Gm-Message-State: AOAM531FiL28kqIB78YN5T/qflvgzZ8/QBN/F7OqOscnr8TYELt2g1CN
 CfzdLj5G4RTZMvvZDTuzKlfxCw==
X-Google-Smtp-Source: ABdhPJzF0gwFjaSFBGpjxUR1GLBewbvTOx45N662kaGKe4lbYN/xyidAjUEaurcx8R0MQht34Y4E7Q==
X-Received: by 2002:a17:90a:ae0c:: with SMTP id
 t12mr8483517pjq.149.1625389536434; 
 Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 14/17] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Sun,  4 Jul 2021 14:32:27 +0530
Message-Id: <20210704090230.26489-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eLCDIF is expecting to have input_bus_flags as DE_LOW
in order to set active low during valid data transfer
on each horizontal line.

Add DE_LOW flag via drm bridge timings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ea379cb0cc32..bc845ae100d4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1723,6 +1723,10 @@ static const struct component_ops samsung_dsim_component_ops = {
 	.unbind	= samsung_dsim_unbind,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1819,6 +1823,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	drm_bridge_add(&dsi->bridge);
-- 
2.25.1

