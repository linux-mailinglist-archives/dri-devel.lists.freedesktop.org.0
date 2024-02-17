Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673F8591CA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 19:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7910E05B;
	Sat, 17 Feb 2024 18:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="uvw3HgWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5F210E05B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708195188; bh=RGT4BBgnm1LR3lAuyD4pvnFiAKoTJKy/hJEE6iV4fGM=;
 h=From:To:Cc:Subject:Date:From;
 b=uvw3HgWWmY7+Xkbi4vxj22xCzuVWwCZ39hTQkerpKso/6Ibs1WEJS6+0wQH1pQlGF
 OddB8sxShAxmi6ngu4OMAuvttfPFJotsZuSXhLlOm5AD6V+wU+BL3+SyC3eSg5S1JS
 QiStiQtoBi5I88joo1223xC97L8PRTi8hW263ePA=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-kernel@vger.kernel.org
Cc: Ondrej Jirman <megi@xff.cz>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ROCKCHIP),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
 linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH] drm: rockchip: Don't require MIPI DSI device when it's used
 for ISP
Date: Sat, 17 Feb 2024 19:39:40 +0100
Message-ID: <20240217183941.1752463-1-megi@xff.cz>
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

From: Ondrej Jirman <megi@xff.cz>

On RK3399 one MIPI DSI device can be alternatively used with the ISP1,
to provide RX DPHY. When this is the case (ISP1 is enabled in device
tree), probe success of DRM is tied to probe success of ISP1 connected
camera sensor. This can fail if the user is able to killswitch the camera
power, like on Pinephone Pro.

Detect use of MIPI DSI controller by ISP, and don't include it in
component match list in that case.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 47 +++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index ab55d7132550..f47de94ad576 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -354,6 +354,43 @@ static void rockchip_drm_match_remove(struct device *dev)
 		device_link_del(link);
 }
 
+/*
+ * Check if ISP block linked to a mipi-dsi device via phys phandle is
+ * enabled in device tree.
+ */
+static bool rockchip_drm_is_mipi1_and_used_by_isp(struct device *dev)
+{
+	struct device_node *np = NULL, *phy_np;
+
+	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3399-mipi-dsi"))
+		return false;
+
+	while (true) {
+		np = of_find_compatible_node(np, NULL, "rockchip,rk3399-cif-isp");
+		if (!np)
+			break;
+
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			continue;
+		}
+
+		phy_np = of_parse_phandle(np, "phys", 0);
+		if (!phy_np) {
+			of_node_put(np);
+			continue;
+		}
+
+		of_node_put(phy_np);
+		of_node_put(np);
+
+		if (phy_np == dev->of_node)
+			return true;
+	}
+
+	return false;
+}
+
 static struct component_match *rockchip_drm_match_add(struct device *dev)
 {
 	struct component_match *match = NULL;
@@ -371,6 +408,16 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
 			if (!d)
 				break;
 
+			/*
+			 * If mipi1 is connected to ISP, we don't want to wait for mipi1 component,
+			 * because it will not be used by DRM anyway, to not tie success of camera
+			 * driver probe to display pipeline initialization.
+			 */
+			if (rockchip_drm_is_mipi1_and_used_by_isp(d)) {
+				dev_info(d, "used by ISP1, skipping from DRM\n");
+				continue;
+			}
+
 			device_link_add(dev, d, DL_FLAG_STATELESS);
 			component_match_add(dev, &match, component_compare_dev, d);
 		} while (true);
-- 
2.43.0

