Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418A45558F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964436E9C9;
	Thu, 18 Nov 2021 07:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD1C6E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0e-0005te-FA; Wed, 17 Nov 2021 15:34:00 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0b-001P6K-2l; Wed, 17 Nov 2021 15:33:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] of: graph: Allow disabled endpoints
Date: Wed, 17 Nov 2021 15:33:40 +0100
Message-Id: <20211117143347.314294-6-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are cases in which a SoC allows many different routes between
components, but not all of them make sense for a board. With this patch
we allow standard status = "disabled" properties for ports. With this
a SoC level dtsi file can describe all possible ports and only the ones
that make sense for the given hardware are enabled at board level.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/drm_of.c | 6 ++----
 drivers/of/property.c    | 3 +++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 37c34146eea83..c2fd9fe505767 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -67,10 +67,8 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 
 	for_each_endpoint_of_node(port, ep) {
 		remote_port = of_graph_get_remote_port(ep);
-		if (!remote_port) {
-			of_node_put(ep);
-			return 0;
-		}
+		if (!remote_port)
+			continue;
 
 		possible_crtcs |= drm_of_crtc_port_mask(dev, remote_port);
 
diff --git a/drivers/of/property.c b/drivers/of/property.c
index a3483484a5a2a..40f8da7baa0a9 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -730,6 +730,9 @@ EXPORT_SYMBOL(of_graph_get_endpoint_by_regs);
  */
 struct device_node *of_graph_get_remote_endpoint(const struct device_node *node)
 {
+	if (!of_device_is_available(node))
+		return NULL;
+
 	/* Get remote endpoint node. */
 	return of_parse_phandle(node, "remote-endpoint", 0);
 }
-- 
2.30.2

