Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B086C471C11
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705A310ED62;
	Sun, 12 Dec 2021 18:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF0610ED62
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:14:42 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f125so12677384pgc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rs7mrpbyprSOj5xGG1AZsz4IjzgBk2UIZRJDxcV2DW8=;
 b=d91d7+MZZmmccCblCkpxX+YEe2uTc28uo2mQRrSHdD3XL3mPGzDiJkpFK5UGa7m7LW
 CXPtM1Yf35hlTn56EbGB6AxzWlbfby2xnTYb9+quL9hGHfNwQiNiJchPjC9O/9PeNQbn
 cuAiQnZVr7XIXriXJjmTjEbwPou+J09esI1y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rs7mrpbyprSOj5xGG1AZsz4IjzgBk2UIZRJDxcV2DW8=;
 b=g7XBQbuQ5t0vRligAL/fir1ol9EOhCggsgGeL9alkE3+BHW80PljLtqL9UejENY6qK
 DVH7dS5SWSgXzT3PkUx+2B62tmBX4gbwe7Miyoejr4+LDgNmc3dDnO0VjzxjQSaHpbia
 QuKlsbWMJ817eY0n1Zntv8ZOUCBXBcATDikRdk/HJcWPF+fSGhF9gJHDW2sBpztSyyxS
 IuyVjmdbTGjgLfeyk/QTVmecJZL5nncbgP/kcyBlKoP5Clg2aPnYrC+GGhnbmwTTy5fs
 Ryv03piDMKhWBYcg9GTOK6sHfbdfx4mhArilkSgGIBxvMp3L9vhjlKmiqhBY7lu4aylu
 9DOw==
X-Gm-Message-State: AOAM532bqYvjN+yi+LDcDf7OG5FYg6sLJPk4Z9lmKmRiKvaSUrqbu5iQ
 SaXfy2UzZJ95dF9ITSyCEXHVIA==
X-Google-Smtp-Source: ABdhPJyRvny8hmn/in0NGZUDhAWSK4Jf9hFHPAlz6Kop2mwUX29d2vFRvdexA3Qav3WKF8akawEVCA==
X-Received: by 2002:a63:6b81:: with SMTP id
 g123mr49803210pgc.140.1639332882514; 
 Sun, 12 Dec 2021 10:14:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:14:42 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 1/7] drm: exynos: dsi: Check panel for panel helpers
Date: Sun, 12 Dec 2021 23:44:10 +0530
Message-Id: <20211212181416.3312656-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212181416.3312656-1-jagan@amarulasolutions.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
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
Changes for v3:
- none
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

