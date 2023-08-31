Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6C78E7A2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185110E5A4;
	Thu, 31 Aug 2023 08:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44BB910E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:10:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,216,1688396400"; d="scan'208";a="174580102"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2023 17:10:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F5E24010DFF;
 Thu, 31 Aug 2023 17:10:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 4/4] drm/bridge: panel: Drop CONFIG_OF conditional around
 *_of_get_bridge()
Date: Thu, 31 Aug 2023 09:09:38 +0100
Message-Id: <20230831080938.47454-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop unnecessary CONFIG_OF conditional around devm_drm_of_get_bridge() and
drmm_of_get_bridge() as it is guarded with #if..#else blocks in
drm_bridge.h.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch.
---
 drivers/gpu/drm/bridge/panel.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 7f41525f7a6e..9220a1c23697 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -482,7 +482,6 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_connector);
 
-#ifdef CONFIG_OF
 /**
  * devm_drm_of_get_bridge - Return next bridge in the chain
  * @dev: device to tie the bridge lifetime to
@@ -550,5 +549,3 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 	return bridge;
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);
-
-#endif
-- 
2.25.1

