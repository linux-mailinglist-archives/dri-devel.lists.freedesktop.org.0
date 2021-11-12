Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEB44E1D2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 07:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5256EA38;
	Fri, 12 Nov 2021 06:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D716E995
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 06:17:55 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id r132so5073895pgr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 22:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wad9gm8CW+7Vaw+M+Mr+ioYMu34NOVqzp5WCaNgwVbY=;
 b=XBsjNUuyVhMdEj6T7LniJnG0Zs5LA+VbgnGBfQb2/yEIovOQ26QS75TvmwcUxYYj8o
 XUZCGeL55EbUVuh9CaFpgRh4eh21p04ASs/2EMfKq1Id1lCT/03sAdEofOeXLGSZNbCK
 T5+569KWt5KyguW/Cg9aGjBEp2scHHKq1mMzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wad9gm8CW+7Vaw+M+Mr+ioYMu34NOVqzp5WCaNgwVbY=;
 b=U2ahbmIEIizOCsrua5tAeGgJkDpgNyLMfKzAKIdz4Sof8iaHQYs7olzpiT/aENGW64
 KVmn1Zi0E2iS7JaMY022mf6VDFlyS+D12T4ukB8BtX8VsJeW4bx2LQHLlfD7TuQCM/vj
 FIFKAhYE5Yre+H+ecbNFV5zkwriNX9BF4G4r3Z1MGQ39P9LjBwjLFqIqBFCOydDMNbxn
 SiFpKkm8ExuM6laevLpZnvfUqqpbCyHobfQJlQL59YP1kLrKx1AAzHFPggIxYggO6UAp
 8XaRZaFccV5xReiPCOO9CVXJO/Ynu1NFtQ5fjwHz16TavOQ380NUPe1mIglcJz8SPbC0
 iydw==
X-Gm-Message-State: AOAM530SXKbUVCmBl9ZdimvDA5egtdw3QrN/gP/irFU+lo7LzD+Ar+dw
 YUvL3zwU1LFRqO9O0oyc3EQxYA==
X-Google-Smtp-Source: ABdhPJzccvCuuKTMzT5Xf+4TNMKBG21tNmi42SFsyLthwZSXilj5YfBBc68olJ3IKJ1pgUcov4iMLA==
X-Received: by 2002:a05:6a00:158a:b0:49f:be86:c78f with SMTP id
 u10-20020a056a00158a00b0049fbe86c78fmr12004616pfk.56.1636697875509; 
 Thu, 11 Nov 2021 22:17:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:de19:8cdf:97cf:a6b1])
 by smtp.gmail.com with ESMTPSA id p3sm4727856pfb.205.2021.11.11.22.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 22:17:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Heiko Stubner <heiko@sntech.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH] drm/bridge: dw-mipi-dsi: Switch to atomic operations
Date: Fri, 12 Nov 2021 11:47:41 +0530
Message-Id: <20211112061741.120898-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace atomic version of the enable/disable operations to
continue the transition to the atomic API.

Also added default drm atomic operations for duplicate, destroy
and reset state API's in order to have smooth transition on
atomic API's.

Tested on Engicam i.Core STM32MP1 SoM.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index e44e18a0112a..ff0db96dfcd5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -871,7 +871,8 @@ static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
 	dsi_write(dsi, DSI_INT_MSK1, 0);
 }
 
-static void dw_mipi_dsi_bridge_post_disable(struct drm_bridge *bridge)
+static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
+						   struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
@@ -978,7 +979,8 @@ static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
 		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
 }
 
-static void dw_mipi_dsi_bridge_enable(struct drm_bridge *bridge)
+static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1032,11 +1034,14 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
-	.mode_set     = dw_mipi_dsi_bridge_mode_set,
-	.enable	      = dw_mipi_dsi_bridge_enable,
-	.post_disable = dw_mipi_dsi_bridge_post_disable,
-	.mode_valid   = dw_mipi_dsi_bridge_mode_valid,
-	.attach	      = dw_mipi_dsi_bridge_attach,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
+	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
+	.mode_set		= dw_mipi_dsi_bridge_mode_set,
+	.mode_valid		= dw_mipi_dsi_bridge_mode_valid,
+	.attach			= dw_mipi_dsi_bridge_attach,
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1

