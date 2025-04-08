Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB3A805AD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE510E66B;
	Tue,  8 Apr 2025 12:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvIKf1Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109510E675
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E234C5C31EC;
 Tue,  8 Apr 2025 12:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD80C4CEE5;
 Tue,  8 Apr 2025 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744114811;
 bh=6icKMsDBoOHHmeuCBbjENJki1Ht5D54b8YbBDwOQNhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=nvIKf1Moh00WbEKwkVMV+qt24YtH+SA7Z4FClIyB2FzX336QK739vtJgjbdRqYV4t
 k5sXNkekEEG0uDF7dkKTO0xxziidwQpmeCKeDxpsAk2jbZkHfMMX8BcbxrzqSGo/pG
 AK6CTWpW8UnjCy3rfcZgZWiZbxqQgFjyIpMMC1toJHKKCEwW45F8z0zQWui4sKeEy/
 LqvAwCATTIcYpGo0fE8u32igKiQ68XUQbRihHVsR14uazo19AOo00q56uRlxvuMkyD
 IEMo50jtbgN/pUPyn/2BvMC0oPRiapnXJbGRXdND5NsUFL7Mz1eLs5a94CdFlpd8/w
 8Ap881ntFZUjw==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
Date: Tue,  8 Apr 2025 14:20:06 +0200
Message-ID: <20250408122008.1676235-1-mripard@kernel.org>
X-Mailer: git-send-email 2.49.0
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

Commit 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in
place of devm_kzalloc()") switched from a kmalloc + drm_panel_init call
to a devm_drm_panel_alloc one.

However, the variable it was storing the allocated pointer in doesn't
exist, resulting in a compilation breakage.

Fixes: 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
index 83529b1c2bac..6e52bf6830e1 100644
--- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
+++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
@@ -198,14 +198,14 @@ static int a030jtn01_probe(struct spi_device *spi)
 	struct a030jtn01 *priv;
 	int err;
 
 	spi->mode |= SPI_MODE_3 | SPI_3WIRE;
 
-	panel = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
-				     &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+	priv = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
+				    &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->spi = spi;
 	spi_set_drvdata(spi, priv);
 
 	priv->map = devm_regmap_init_spi(spi, &a030jtn01_regmap_config);
-- 
2.49.0

