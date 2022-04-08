Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165914F9A82
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF43D10E4FF;
	Fri,  8 Apr 2022 16:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3895610E4FF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:23:22 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 2so9097084pjw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lhe1gjfVmNBzu+OAJh4OI2ThwckJvfBSRTmYzb4Lz0s=;
 b=GEYKFzIcWeEp6hEGddeuWkDudWkl/gOlJK6Hh6JGbmHTlbqv6CNW/ZkiFclphnFgLi
 htBq+ZuDGcwVO4UyzklcSh0/YAFKedzvFS8L8pp0xp+g8CUAnWS0o1YytTthNovINEfI
 51kMWQzuAgs94d9kB0pFq4vNMcdLe1X4tlFIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhe1gjfVmNBzu+OAJh4OI2ThwckJvfBSRTmYzb4Lz0s=;
 b=WrMhXrZJdHY4zsqbf9IVLIHyZE6U1g/CYO2sJXW8U4YPI7sqRGQxv2ARpSCyrpBdRV
 rVim6vHSUrzel8IrnJjcNXP5vViSf5eWkyUKqTyVgjyznTWIOBpcDkcfSdQX+tKWm+NT
 oEgfTHM3J6AcETpBCC6ShkGjFynzvuBbY8ERHexu3UsWtNrh/INdFubRIZnfVUb7rc70
 Wl/cgP0JXvvVoeuJg/8s5VmNuiwwzbR6apTAZOZAH/JCeE4zP3ffr0Lv+9Pezz04jLgU
 /AoNRtz2uohAPPv3vVbiILghDfKoZ29lbmlrUzyARhcursHixxrBEbOBSbMpQzkO9nSm
 z7xg==
X-Gm-Message-State: AOAM5329foELGXbHt6DvxYxtC05LRWjh/K4Kda59vdSTSEcDzLnvzSc7
 lV28aBc7PvAJ3srrHjq/qWJvLA==
X-Google-Smtp-Source: ABdhPJzjdH/kgRX17oIXGBe/rX2xmyR6sfgMFtUQQX/U7WzDzL3u6ctkQvEnSDFpMOlRzZI8k5IFCw==
X-Received: by 2002:a17:90a:c302:b0:1bd:14ff:15 with SMTP id
 g2-20020a17090ac30200b001bd14ff0015mr22844531pjt.19.1649435001831; 
 Fri, 08 Apr 2022 09:23:21 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:23:21 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 09/11] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Fri,  8 Apr 2022 21:51:06 +0530
Message-Id: <20220408162108.184583-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 02802526f82f..71bbaf19f530 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1543,6 +1543,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1622,6 +1626,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->platform_init) {
-- 
2.25.1

