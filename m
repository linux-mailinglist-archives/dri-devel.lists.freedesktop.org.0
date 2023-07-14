Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85683752EB0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC710E7B0;
	Fri, 14 Jul 2023 01:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFE510E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2798C61BA9;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E31C433C8;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=9ICj2srZUkHSM8Oenv3/OJ/dpUwH5604BWTzaI6ATYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIch2TxBnNHsz+EJC/0LWNpKTydIiP8kB+DqKl4Jhc0oaYZRA2/2p5hqGrB3Wb/Yw
 rrzK/1MLSqstwk+3l6N3BYx9AgeHDM5vbm+7ktU1Sgz6FbTTcYxGEsydMWKDozWkbr
 lpmafKMRSdARDvcQlVYGPY0pBjHJ0a7xe81Sv2W0bN1ZviC6ZaHzG27YeDN7eDVFQn
 /3f5G8E2XJXYAU9WMylKRqQBekReQM3ot5/x6ZYByhCyG4veVzKZo/ennEDWVvkYAU
 xp2dSWjOcKA9GBfAhRGnd6RGyKc5vxsYJ+/PyWEV7miJhtT5MQtobAqhWJ7wKFukq4
 mR19+FbLKrxoA==
Received: by mercury (Postfix, from userid 1000)
 id DFC3110676F1; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 09/19] drm/panel: sitronix-st7789v: avoid hardcoding panel
 size
Date: Fri, 14 Jul 2023 03:37:46 +0200
Message-Id: <20230714013756.1546769-10-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the panel size information to the mode struct, so
that different panel sizes can be specified depending
on the panel type.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 24c5bec6ce31..aa11a1dc0752 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -163,6 +163,8 @@ static const struct drm_display_mode default_mode = {
 	.vsync_start = 320 + 8,
 	.vsync_end = 320 + 8 + 4,
 	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 61,
+	.height_mm = 103,
 };
 
 static const struct st7789_panel_info default_panel = {
@@ -188,8 +190,8 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-	connector->display_info.width_mm = 61;
-	connector->display_info.height_mm = 103;
+	connector->display_info.width_mm = ctx->info->mode->width_mm;
+	connector->display_info.height_mm = ctx->info->mode->height_mm;
 
 	return 1;
 }
-- 
2.40.1

