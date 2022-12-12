Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9064A71B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167CF10E27F;
	Mon, 12 Dec 2022 18:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86810E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 18:29:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id jn7so12931403plb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3thu+TFV75UQnUKi5H5iMkprh+mVb/ueAKw6cINH6Y=;
 b=Gh4sGxHl66CkePx1uPOJ9+QfVzVDgI4LtnOjg6S3enaAA8amtaSKxIc/AxDLV1zq9A
 G1R37KCSbqBH6KzjCaqAdxMJVO/MzdncBEqy4ILe3rt5FJizcEaXuswSKND97NTFSUCa
 oonxwo7+nQS6+1kiVnJHvW6chzKruYpkqdr7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3thu+TFV75UQnUKi5H5iMkprh+mVb/ueAKw6cINH6Y=;
 b=to3a01uC8T6eGEfA2tNESTZqVbMDO53VRsfamvFa/ntls7bxMV/PG3AMAg19jYToMJ
 TYagMUhFXBGbEY13VNIFp5Xk3DFDtGLCl2aTxpXuJ+UxnnDHS2gfZzezP3D/9BiQg2UL
 ODxYkVGM8E3WZahy29ThexVhn50Xbc5qyT9UvJlWkNcCEy4B0Jr6CD2IRiM28HyxUA+K
 xvQT5CNLYQWWuVQtW2KZ9fwNAukm7pdCUeLtx1ewzifn4n1ZycMDkvSQuUpmgFT80lRr
 3inhlK0D225i7BZolyX0PV1wrXNuYE9CkNsZNBS/mBwZ4uTM0O9VpvygbqzNhP9SRjwD
 UKGA==
X-Gm-Message-State: ANoB5pmyRcS1B3tns/jQgwnJE/9bJKSzRwhaN/2R1eg2iABZNVcwTSM0
 Bx+xztt/XuC+ZwKF75UiuQHcqA==
X-Google-Smtp-Source: AA0mqf59dINh/5fm38yRqrF5Y6rB+ErCZKmj7qHXjh5d283hE7csggHWbwm7onwdkzkqk9T/WefmpA==
X-Received: by 2002:a05:6a21:3996:b0:a7:345a:1024 with SMTP id
 ad22-20020a056a21399600b000a7345a1024mr22612382pzc.50.1670869787169; 
 Mon, 12 Dec 2022 10:29:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 10:29:46 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain order
Date: Mon, 12 Dec 2022 23:59:23 +0530
Message-Id: <20221212182923.29155-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- add bridge.pre_enable_prev_first
Changes for v10:
- collect Marek review tag

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..9d10a89d28f1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.pre_enable_prev_first = true;
 
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
-- 
2.25.1

