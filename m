Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA8909942
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5D10E26A;
	Sat, 15 Jun 2024 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="Uro6NLx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7110E21E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471748; bh=FiHAdD/4nULeLzfayWHOZuJzCk9s4sL6Pdbfulf5fI0=;
 b=Uro6NLx+a26KgajfdaG5FnHs6p2y0VmWfPK6poujG3U+g3fZaGCgIj0x9tLT7qYh+WSE3BsDE
 RKPAFo2wlZKkx/gpf/HFMY1VHcmo2DtzrMOaEa1xHEod4R0tMFOgg27O6Q9bYjdPoe0GaI5xh3U
 AM9hA9pkCLXQbrr0xa3qt+dqDtY7u491X0BvatxOddQDe3spk7qFGR6LbQtfgXeazWIwUC8kZQ+
 Lv/Yn8ZONpyja4DDkA9YZvGvI+J6JMCEYdr5kxGYjtO3SsRnbgYLGd7rSo17djR3fyVjgE5+OmV
 +9TRCFpdvyT/MwcmdAZa3IL3SIbM6kXdyWzI8YA2h+qg==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>
Subject: [PATCH 13/13] drm/rockchip: Load crtc devices in preferred order
Date: Sat, 15 Jun 2024 17:04:04 +0000
Message-ID: <20240615170417.3134517-14-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 666dc9d424e0254b398040bd
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

On RK3399 the VOPL loaded before VOPB and gets registered as crtc-0.
However, on RK3288 and PX30 VOPB is gets registered as crtc-0 instead of
VOPL.

With VOPL registered as crtc-0 the kernel kms client is not able to
enable 4K display modes for console use on RK3399.

Load VOPB before VOPL to help kernel kms client make use of 4K display
modes for console use on RK3399.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index ab55d7132550..6492f3caf017 100644
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
2.45.2

