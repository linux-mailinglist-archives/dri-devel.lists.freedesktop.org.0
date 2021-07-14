Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA773C827C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 12:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705BB6E1F9;
	Wed, 14 Jul 2021 10:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B926E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 10:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 33E0F1F42DEF
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
Date: Wed, 14 Jul 2021 12:11:41 +0200
Message-Id: <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714101141.2089082-1-enric.balletbo@collabora.com>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org, jitao.shi@mediatek.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reset dsi0 HW to default when power on. This prevents to have different
settingbetween the bootloader and the kernel.

As not all Mediatek boards have the reset consumer configured in their
board description, also is not needed on all of them, the reset is optional,
so the change is compatible with all boards.

Cc: Jitao Shi <jitao.shi@mediatek.com>
Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..d8b81e2ab841 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -980,8 +981,10 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
+	if (ret)
+		return ret;
 
-	return ret;
+	return device_reset_optional(dev);
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.30.2

