Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40838BCF09
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61310F035;
	Mon,  6 May 2024 13:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GVbJ0rfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25E010F035
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9975F612AF;
 Mon,  6 May 2024 13:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B95C3277B;
 Mon,  6 May 2024 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002508;
 bh=2gxAViJr9NJSI0wyF8/7Q/WmZNqJmwnGrC0yrjFayzk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GVbJ0rfY3xs6Ux0UxSoIfjcF29PmoHxtN3SrZJzOiF4gjY6sEQ5ignodSdmCheGi1
 CXDdWHGpV7NtdHJeEuDVvMHAFb8xiVlY30Y7lruDFe37+n9bE4e+JYRLJ9xz88nIsR
 DfumMVuId5PtRdGCcKxv+PGuiZ5jtcqEPjiVb+GeyoIDjefa43RHYbpMHWOHi8kb6s
 jDu75XS7G6pLuFk+SwyxyqJCxneAM/tiialtVN+aX1fFhLp6Wm4qL+A33iJjFMeyGA
 VH685LOmQKsjuF3229lcd00iPmIurLhYWyMnC54vhk5wlRCgM8SXUijj5zb1BXX7sg
 5DE/nd2ifTc/Q==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:30 +0200
Subject: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some bridges have very strict power-up reqirements. In this case, the
Toshiba TC358775. The reset has to be deasserted while *both* the DSI
clock and DSI data lanes are in LP-11 mode. After the reset is relased,
the bridge needs the DSI clock to actually be able to process I2C
access. This access will configure the DSI side of the bridge during
which the DSI data lanes have to be in LP-11 mode. After everything is
configured the video stream can finally be enabled.

This means:
 (1) The bridge has to be configured completely in .pre_enable() op
     (with the clock turned on and data lanes in LP-11 mode, thus
     .pre_enable_prev_first has to be set).
 (2) The bridge will enable its output in the .enable() op
 (3) There must be some mechanism before (1) where the bridge can
     release its reset while the clock lane is still in LP-11 mode.

Unfortunately, (3) is crucial for a correct operation of the bridge.
To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
which will be called by the DSI host driver.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
 include/drm/drm_bridge.h     | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 28abe9aa99ca..98cd6558aecb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+/**
+ * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
+ * @bridge: bridge control structure
+ *
+ * DSI host drivers shall call this function while the clock and data lanes
+ * are still in LP-11 mode.
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
+{
+	if (bridge->funcs->dsi_lp11_notify)
+		bridge->funcs->dsi_lp11_notify(bridge);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..4ef61274e0a8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -630,6 +630,17 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * dsi_lp11_notify:
+	 *
+	 * Will be called by the DSI host driver while both the DSI clock
+	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
+	 * need this state while releasing the reset, for example.
+	 * Not all DSI host drivers will support this. Therefore, the DSI
+	 * bridge driver must not rely on this op to be called.
+	 */
+	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
+void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.39.2

