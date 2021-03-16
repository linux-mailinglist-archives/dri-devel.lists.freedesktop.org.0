Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1733EA98
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 08:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E909189A5D;
	Wed, 17 Mar 2021 07:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2092 seconds by postgrey-1.36 at gabe;
 Tue, 16 Mar 2021 19:02:52 UTC
Received: from the.earth.li (the.earth.li
 [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F2D89DD3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5abAEvlb6RQ//aPbXWSlsFscXPRdObN6cMphxdvzJjg=; b=xg1tvYgAsbdUB+jLBkj30dqmd1
 xXNF3flKWiQA6A5RpDXb/gRLMMkpDcBWQseNapujwWNGcgD/j3rKawPNtDnKinp5myE2eGIDhpNiJ
 tV8aMStaMoMtIOdZQCTU0RsyFJXKGzrN5IbYHzp3jfg4jwZbLETRAGvGDfHiSLqqguD+IhFHafnI2
 FS59nvVC+IU4NxVJRk3jIk3op3MgO0BeWRQeowZoko5Sr7Xo6PPhDw4SvBQrgKLMoXB5N5QflXNNp
 nBIwWPF8Cac4CimaOARg41uFTWwYtlrFqu0WbEvgclG/qWnBRTLkunR5o/UbGO+Lb/Xk1WPKpuFzH
 WTJa8e8g==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1lMEQ5-0006i4-VW; Tue, 16 Mar 2021 18:27:54 +0000
Date: Tue, 16 Mar 2021 18:27:53 +0000
From: Jonathan McDowell <noodles@earth.li>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: Cope with endpoints that haven't been
 registered yet
Message-ID: <20210316182753.GA25685@earth.li>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:32:24 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip RGB CRTC output driver attempts to avoid probing Rockchip
subdrivers to see if they're a connected panel or bridge. However part
of its checks assumes that if no OF platform device is found then it
can't be a valid bridge or panel. This causes issues with I2C controlled
bridges that have not yet been registered to the point they can be
found.

Change this to return EPROBE_DEFER instead of ENODEV and don't ignore
such devices. The subsequent call to drm_of_find_panel_or_bridge() will
return EPROBE_DEFER as well if there's actually a valid device we should
wait for.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 8 ++++++--
 drivers/gpu/drm/rockchip/rockchip_rgb.c     | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 212bd87c0c4a..b0d63a566501 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -270,11 +270,15 @@ int rockchip_drm_endpoint_is_subdriver(struct device_node *ep)
 	if (!node)
 		return -ENODEV;
 
-	/* status disabled will prevent creation of platform-devices */
+	/*
+	 * status disabled will prevent creation of platform-devices,
+	 * but equally we can't rely on the driver having been registered
+	 * yet (e.g. I2C bridges).
+	 */
 	pdev = of_find_device_by_node(node);
 	of_node_put(node);
 	if (!pdev)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	/*
 	 * All rockchip subdrivers have probed at this point, so
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index c079714477d8..989595087397 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -77,7 +77,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	struct drm_encoder *encoder;
 	struct device_node *port, *endpoint;
 	u32 endpoint_id;
-	int ret = 0, child_count = 0;
+	int subret, ret = 0, child_count = 0;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 
@@ -96,8 +96,9 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		if (of_property_read_u32(endpoint, "reg", &endpoint_id))
 			endpoint_id = 0;
 
-		/* if subdriver (> 0) or error case (< 0), ignore entry */
-		if (rockchip_drm_endpoint_is_subdriver(endpoint) != 0)
+		/* if subdriver (> 0) or non-defer error case (< 0), ignore entry */
+		subret = rockchip_drm_endpoint_is_subdriver(endpoint);
+		if (subret != 0 && subret != -EPROBE_DEFER)
 			continue;
 
 		child_count++;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
