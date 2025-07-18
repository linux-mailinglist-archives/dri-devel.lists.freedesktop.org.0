Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF5B09A38
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 05:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A25810E0BD;
	Fri, 18 Jul 2025 03:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Fri, 18 Jul 2025 03:39:58 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028E10E0BD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 03:39:58 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [211.71.28.34])
 by APP-01 (Coremail) with SMTP id qwCowACnl6tLwHloCD0OBQ--.25172S2;
 Fri, 18 Jul 2025 11:32:36 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com
Cc: akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ma Ke <make24@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Fix device/node reference count leaks in
 mtk_drm_get_all_drm_priv
Date: Fri, 18 Jul 2025 11:32:26 +0800
Message-Id: <20250718033226.3390054-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnl6tLwHloCD0OBQ--.25172S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1rZFykAFyruw4fGFyDZFb_yoW5JFW7pF
 4UGFWFvrW8KF4UKwn5tFW8AF15CF1Iya1fWFyIq343Cw1rZryYk34rt34avrykArWkAF1f
 JwnxtFy8ur4jkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
 AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjg4S5UU
 UUU==
X-Originating-IP: [211.71.28.34]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

Using device_find_child() and of_find_device_by_node() to locate
devices could cause an imbalance in the device's reference count.
device_find_child() and of_find_device_by_node() both call
get_device() to increment the reference count of the found device
before returning the pointer. In mtk_drm_get_all_drm_priv(), these
references are never released through put_device(), resulting in
permanent reference count increments. Additionally, the
for_each_child_of_node() iterator fails to release node references in
all code paths. This leaks device node references when loop
termination occurs before reaching MAX_CRTC. These reference count
leaks may prevent device/node resources from being properly released
during driver unbind operations.

As comment of device_find_child() says, 'NOTE: you will need to drop
the reference with put_device() after use'.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 27 +++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7c0c12dde488..c78186debd3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -388,19 +388,24 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
 		if (!of_id)
-			continue;
+			goto next;
 
 		pdev = of_find_device_by_node(node);
 		if (!pdev)
-			continue;
+			goto next;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
-		if (!drm_dev)
-			continue;
+		if (!drm_dev) {
+			put_device(&pdev->dev);
+			goto next;
+		}
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
-		if (!temp_drm_priv)
-			continue;
+		if (!temp_drm_priv) {
+			put_device(drm_dev);
+			put_device(&pdev->dev);
+			goto next;
+		}
 
 		if (temp_drm_priv->data->main_len)
 			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
@@ -412,10 +417,14 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC) {
-			of_node_put(node);
+		put_device(drm_dev);
+		put_device(&pdev->dev);
+
+next:
+		of_node_put(node);
+
+		if (cnt == MAX_CRTC)
 			break;
-		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.25.1

