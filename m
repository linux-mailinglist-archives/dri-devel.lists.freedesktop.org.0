Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53372A805AF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECC810E676;
	Tue,  8 Apr 2025 12:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5T+jd0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523410E66B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 13C82A41154;
 Tue,  8 Apr 2025 12:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18990C4CEE5;
 Tue,  8 Apr 2025 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744114814;
 bh=kqkt8qXryF46fUmoX2kFa5N2VTNORH4GhigQnSUUqkk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W5T+jd0ahO0oPZy9OYzgiIP4slbtVevPEZlixBUYwYm9BEO+7tLeYw6r/5TSCB2d7
 4Cbwt7m9XBNGlG/8eaLybq0LhqqXTsGYx/kzm5p7fgYRfTrhyluiWF6BTNaV+2nNwY
 0NmetrLbiszuRAdtBYdPrB+ISAsRJ8RhRHs41AnV4/rocLGw8+kyfkuvaC63xISSte
 hblhmYzLSf0b0nvCTXJW6y87LYy6Lci0zdFKP+dFdjBayR0YJXs6k3zNREmI0kz9NS
 WI+MfBqVGeQH/K/nKODCHMSIDt9RPNe+fghyD21GMm8wEk81NCX2ZFs8X4R2Xaa7bi
 d8/qjg4AKyT3Q==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 2/3] drm/panel: boe-th101mb31ig002-28a: Fix compilation build
Date: Tue,  8 Apr 2025 14:20:07 +0200
Message-ID: <20250408122008.1676235-2-mripard@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408122008.1676235-1-mripard@kernel.org>
References: <20250408122008.1676235-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 77dcbce63779 ("panel/th101mb31ig002-28a: Use refcounted
allocation in place of devm_kzalloc()") switched from a kmalloc +
drm_panel_init call to a devm_drm_panel_alloc one.

However, the variable it was storing the allocated pointer in doesn't
exist, resulting in a compilation breakage.

Fixes: 77dcbce63779 ("panel/th101mb31ig002-28a: Use refcounted allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 7ae196424b6d..f33d4f855929 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -347,15 +347,15 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct boe_th101mb31ig002 *ctx;
 	const struct panel_desc *desc;
 	int ret;
 
-	panel = devm_drm_panel_alloc(dev, struct panel_desc, panel,
-				     &boe_th101mb31ig002_funcs,
-				     DRM_MODE_CONNECTOR_DSI);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct boe_th101mb31ig002, panel,
+				   &boe_th101mb31ig002_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
 
 	desc = of_device_get_match_data(&dsi->dev);
-- 
2.49.0

