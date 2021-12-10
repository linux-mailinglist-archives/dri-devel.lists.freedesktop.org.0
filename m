Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93713470A3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB5C10EC8B;
	Fri, 10 Dec 2021 19:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531810EC8B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:20:03 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id m24so6879995pls.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZ823IYdWVSXlqlfCjZXc9dDMONl8prYaLH+tdv9C84=;
 b=cqSBRtkotKu54uCZJ51b6tmkcxwzEvZY6QT4noWN9hpvuhKrps163Bop4BwxEn5Nwb
 bVysIpFMaqOj6PgDpnffKz1s7ONqW/aHoorJLhEw8V5ofD3BkjfNaQbLKQUXbZ/KZtEu
 02rUK+plGf+pFkU8qvVfGubsQXUq2y0f8eC1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZ823IYdWVSXlqlfCjZXc9dDMONl8prYaLH+tdv9C84=;
 b=MNxMXXYMO3iwnARrLLEVhdGaYeLz1wGmYhX2It8Q+hqGmrZM5S4N4cgPlBdFIrPqLO
 JxmBbFeKysiUtTaV37Dxlfrvv0ZtOXPu+AXJZwSXlbrEKiYzMQWBTig+Pwthf7k2GGGG
 2RFYEVwDRADM86+zuzHETNFvRO96jD6YCDR52DHEFlWkif78u3EkstE8oxukfGVgdyqO
 bTfcN+Ox16eCubRJdEOy+oIsQnl7BWHdbyQ+Y2D8yk1Tjk5XMndibJYaF4fhxgDsNh5q
 UQCSFWrxKB/qHd2ZzdG+aZ8WBdyTKQ/bhmh8WVgvvAtyvf50SYdntq8MseeCyzq4AadG
 bhxw==
X-Gm-Message-State: AOAM533XiZkyioKj8drzTw7XF3sT41DrpvdxNKUH5WVuRcKzhm9R/9pC
 i0+L+UKS7UPJP2aW2Wk15oRfbw==
X-Google-Smtp-Source: ABdhPJwWrs+dnAWj8L79l+mNp5vavQ/dUdNVp6ikZ+3J9RUpr8EioShq8n2TQ2KiZkwpbtPfVU1KGA==
X-Received: by 2002:a17:90b:1947:: with SMTP id
 nk7mr26414009pjb.227.1639164002862; 
 Fri, 10 Dec 2021 11:20:02 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id o62sm3493022pfb.211.2021.12.10.11.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 11:20:02 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 1/4] drm: exynos: dsi: Check panel for panel helpers
Date: Sat, 11 Dec 2021 00:49:19 +0530
Message-Id: <20211210191922.2367979-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210191922.2367979-1-jagan@amarulasolutions.com>
References: <20211210191922.2367979-1-jagan@amarulasolutions.com>
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

Trigger the panel operation helpers only if host found the panel.

Add check.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch 

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8d137857818c..0bb44e476633 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1439,7 +1439,8 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	drm_panel_disable(dsi->panel);
+	if (dsi->panel)
+		drm_panel_disable(dsi->panel);
 
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->disable)
@@ -1447,7 +1448,8 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 	}
 
 	exynos_dsi_set_display_enable(dsi, false);
-	drm_panel_unprepare(dsi->panel);
+	if (dsi->panel)
+		drm_panel_unprepare(dsi->panel);
 
 	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->post_disable)
-- 
2.25.1

