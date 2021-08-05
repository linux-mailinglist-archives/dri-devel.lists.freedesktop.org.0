Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE913E1C8B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B536EB30;
	Thu,  5 Aug 2021 19:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761506EB30
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:21:29 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: list@opendingux.net, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Date: Thu,  5 Aug 2021 21:21:09 +0200
Message-Id: <20210805192110.90302-3-paul@crapouillou.net>
In-Reply-To: <20210805192110.90302-1-paul@crapouillou.net>
References: <20210805192110.90302-1-paul@crapouillou.net>
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

When the drivers of remote devices (e.g. HDMI chip) are disabled in the
config, we want the ingenic-drm driver to be able to probe nonetheless
with the other devices (e.g. internal LCD panel) that are enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d261f7a03b18..5e1fdbb0ba6b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	for (i = 0; ; i++) {
 		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, &bridge);
 		if (ret) {
+			/*
+			 * Workaround for the case where the drivers for the
+			 * remote devices are not enabled. When that happens,
+			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
+			 * endlessly, which prevents the ingenic-drm driver from
+			 * working at all.
+			 */
+			if (ret == -EPROBE_DEFER) {
+				ret = driver_deferred_probe_check_state(dev);
+				if (ret == -ENODEV || ret == -ETIMEDOUT)
+					continue;
+			}
 			if (ret == -ENODEV)
 				break; /* we're done */
 			if (ret != -EPROBE_DEFER)
-- 
2.30.2

