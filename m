Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85BFB21F54
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 09:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1378D10E0E0;
	Tue, 12 Aug 2025 07:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72DF10E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 07:19:53 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [211.71.28.34])
 by APP-03 (Coremail) with SMTP id rQCowADXZngG65poj7gmCw--.9934S2;
 Tue, 12 Aug 2025 15:19:45 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: ck.hu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 akpm@linux-foundation.org, Ma Ke <make24@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: Fix device/node reference count leaks in
 mtk_drm_get_all_drm_priv
Date: Tue, 12 Aug 2025 15:19:32 +0800
Message-Id: <20250812071932.471730-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADXZngG65poj7gmCw--.9934S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4UCr48XrWDJw1xXw43ZFb_yoW5GryrpF
 WUGFWFvrW8tr4UKrsYyFW8CF1YkF1xta1fWF1Igw13Cw1rZryay345t34avryDArWkAF1r
 JwnxtFy8CFyjkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwV
 W8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUpa0PUUUUU
 =
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
Changes in v2:
- added goto labels as suggestions.
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..f8a817689e16 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -387,19 +387,19 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
 		if (!of_id)
-			continue;
+			goto next_put_node;
 
 		pdev = of_find_device_by_node(node);
 		if (!pdev)
-			continue;
+			goto next_put_node;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
 		if (!drm_dev)
-			continue;
+			goto next_put_device_pdev_dev;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
 		if (!temp_drm_priv)
-			continue;
+			goto next_put_device_drm_dev;
 
 		if (temp_drm_priv->data->main_len)
 			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
@@ -411,10 +411,17 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC) {
-			of_node_put(node);
+next_put_device_drm_dev:
+		put_device(drm_dev);
+
+next_put_device_pdev_dev:
+		put_device(&pdev->dev);
+
+next_put_node:
+		of_node_put(node);
+
+		if (cnt == MAX_CRTC)
 			break;
-		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.25.1

