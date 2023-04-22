Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D56EBB4D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D810E20A;
	Sat, 22 Apr 2023 20:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4192A10E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 198F761476;
 Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B5BC433AA;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=WgattwYxV8wos1xLo0sZNXqqbXSW7bNExVNy4EwvZ+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n2OqDKLpTNcdniuIt+/N4U3htRrNisGdIHm5JIiz1TJ6n46Amrm2Cdiz3EPkT+4Zx
 ZzSqoOCmfm9JEmwwR9JZ+rIV2P4ZC2X4dPT7TruGSXTBjaSIIfWX3fkax4ADm+KMyJ
 RfICR8cGE7SE+FKvJODvoODp7OVoZ1T3QvMmsQifirIEoTk8nBvWtD1DTVVLagETQo
 fzgiiDBGh3v6FLn0ueSfpV4NajCCrIJucOgc1HXZH8ooEVD4kcDn5gW2U4u6vkXu8b
 7q6Gd9elq12dL83q06OzmKWijJsQdUEH24o8AmhcHMz0rsQlibQdqmgR4aBCKupAxP
 eYmMEfiRAAKeQ==
Received: by mercury (Postfix, from userid 1000)
 id 1BA381066CCC; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 09/13] drm/panel: sitronix-st7789v: avoid hardcoding panel
 size
Date: Sat, 22 Apr 2023 22:50:08 +0200
Message-Id: <20230422205012.2464933-10-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the panel size information to the mode struct, so
that different panel sizes can be specified depending
on the panel type.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 29c2a91f8299..0e1839e6da73 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -163,6 +163,8 @@ static const struct drm_display_mode default_mode = {
 	.vsync_start = 320 + 8,
 	.vsync_end = 320 + 8 + 4,
 	.vtotal = 320 + 8 + 4 + 4,
+	.width_mm = 61,
+	.height_mm = 103,
 };
 
 struct st7789_panel_info default_panel = {
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
2.39.2

