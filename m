Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB8A805B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD90C10E675;
	Tue,  8 Apr 2025 12:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8PXd2tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B8810E675
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:20:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0256FA4114F;
 Tue,  8 Apr 2025 12:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A675C4CEE5;
 Tue,  8 Apr 2025 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744114817;
 bh=jDhGaBKh6x+hZW0ir+Xu+AQjo8ZqV9ykBikBeKcwHps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i8PXd2tPuSPryL6zFFGl32+MYazfDjXh7uEcnOTS6uu7DCmZOgofxzhRV9htn6RQJ
 3LaH06sbtnqlKJZaTAWWZ7aqsWhFlsA4rVCAQPPoZj8/rtNQcLYyHzrLXPyRjS6gr9
 jkgh5QKQZpcX6j4Q8zUEVMl2m3v28NYpHtGTEtFzQGOEHrWnFBAVOOaynLfdEFSn7w
 ChAwv2pmmQLIiLqEt5mUcqGmL7dG2ExS7covS3MK2daFFDEEJSzC2uZ8m9hznQxOrR
 ZmbnrAntXX0ewPwSnRcXMw67b4c/zKQ/a5+YHeCce7z7j9hfAiKfr/pyLiXDUqUAgF
 cCQtyMfdTAbeQ==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 3/3] drm/panel: boe-tv101wum-ll2: Fix compilation build
Date: Tue,  8 Apr 2025 14:20:08 +0200
Message-ID: <20250408122008.1676235-3-mripard@kernel.org>
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

Commit 5d2b55e55e61 ("panel/boe-tv101wum-ll2: Use refcounted allocation
in place of devm_kzalloc()") switched from a kmalloc + drm_panel_init
call to a devm_drm_panel_alloc one.

However, the variable it was storing the allocated pointer in doesn't
exist, resulting in a compilation breakage.

Fixes: 5d2b55e55e61 ("panel/boe-tv101wum-ll2: Use refcounted allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
index 04c7890cc51d..20b6e11a7d84 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
@@ -166,13 +166,13 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
 	struct boe_tv101wum_ll2 *ctx;
 	int ret;
 
 	ctx = devm_drm_panel_alloc(dev, struct boe_tv101wum_ll2, panel,
 				   &boe_tv101wum_ll2_panel_funcs,
-				   DRM_MODE_CONNECTOR_DSI
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(&dsi->dev,
 					ARRAY_SIZE(boe_tv101wum_ll2_supplies),
 					boe_tv101wum_ll2_supplies,
 					&ctx->supplies);
-- 
2.49.0

