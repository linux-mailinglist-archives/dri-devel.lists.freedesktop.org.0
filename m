Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C1970843
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1810E290;
	Sun,  8 Sep 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="m5w1Uc0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C514210E290
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725807352; bh=Fen8SXObvKui+EcVpqkgeahn1KAOdYtBUTto1YpsJkY=;
 b=m5w1Uc0EeJDeC8pY9mEZGT+8uLPtvOHjxBvWrFo7oXfen30wNWXyRXtKQ2KTcWdmeFsmPsjbY
 iyKSEUAZkXkU+YOFZkTZzjyJ85ybHQi+pls3GRgyRaEm7S4+TzaPvxIqNG8SzNo9OAd3s4Hd/ql
 v2GXx+LxPcBrdcfOI6Ln1klzhkOGb7LJi1SlQFUv0Ucsgh0YpyhYoZvrcdi06I+FlkAX1qXceKe
 Yz5omvgvyPkBsiFTWP57yurqi3nfRr6j5ERcqpKI2/5rQWMNeEXnqvW1GZDjgAjRF5fnf3RmLNH
 C59wRK93UqFi8h5SnYBvvOuXAPw6ssz3VW3XfyA7pd0g==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 7/7] drm/rockchip: Load crtc devices in preferred order
Date: Sun,  8 Sep 2024 14:55:04 +0000
Message-ID: <20240908145511.3331451-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908145511.3331451-1-jonas@kwiboo.se>
References: <20240908145511.3331451-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ddbaf53c9877b459588f11
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

On RK3399 the VOPL is loaded before VOPB and get registered as crtc-0.
However, on RK3288 and PX30 VOPB is gets registered as crtc-0 instead of
VOPL.

With VOPL registered as crtc-0 the kernel kms client is not able to
enable 4K display modes for console use on RK3399.

Load VOPB before VOPL to help kernel kms client make use of 4K display
modes for console use on RK3399.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 44d769d9234d..b84451d59187 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -354,11 +354,34 @@ static void rockchip_drm_match_remove(struct device *dev)
 		device_link_del(link);
 }
 
+/* list of preferred vop devices */
+static const char *const rockchip_drm_match_preferred[] = {
+	"rockchip,rk3399-vop-big",
+	NULL,
+};
+
 static struct component_match *rockchip_drm_match_add(struct device *dev)
 {
 	struct component_match *match = NULL;
+	struct device_node *port;
 	int i;
 
+	/* add preferred vop device match before adding driver device matches */
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		if (of_device_is_available(port->parent) &&
+		    of_device_compatible_match(port->parent,
+					       rockchip_drm_match_preferred))
+			drm_of_component_match_add(dev, &match,
+						   component_compare_of,
+						   port->parent);
+
+		of_node_put(port);
+	}
+
 	for (i = 0; i < num_rockchip_sub_drivers; i++) {
 		struct platform_driver *drv = rockchip_sub_drivers[i];
 		struct device *p = NULL, *d;
-- 
2.46.0

