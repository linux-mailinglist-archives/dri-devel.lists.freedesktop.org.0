Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BAA2486F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 12:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21810E214;
	Sat,  1 Feb 2025 11:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sat, 01 Feb 2025 11:02:23 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C97310E08F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 11:02:22 +0000 (UTC)
X-CSE-ConnectionGUID: 0IPnWRwWSWmmJOQyAE+X1w==
X-CSE-MsgGUID: y9uTlkrySuuy7uEnJ3u8lA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2025 19:57:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id C42884009A0D;
 Sat,  1 Feb 2025 19:57:01 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Date: Sat,  1 Feb 2025 10:56:56 +0000
Message-ID: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/tegra/rgb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 1e8ec50b759e..6e540291a960 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
-	struct device_node *np;
+	struct device_node *np _free(device_node) =
+		of_get_available_child_by_name(dc->dev->of_node, "rgb");
 	struct tegra_rgb *rgb;
 	int err;
 
-	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
+	if (!np)
 		return -ENODEV;
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-- 
2.43.0

