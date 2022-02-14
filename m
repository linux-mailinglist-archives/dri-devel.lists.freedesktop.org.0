Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C24B41C7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F7710E4EC;
	Mon, 14 Feb 2022 06:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A84810E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:12:04 +0000 (UTC)
X-UUID: 804206638c494790b379c756bf117352-20220214
X-UUID: 804206638c494790b379c756bf117352-20220214
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051305853; Mon, 14 Feb 2022 14:12:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 14:12:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:11:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/23] ASoC: codecs: wcd938x: Make use of the helper
 component_compare/release_of
Date: Mon, 14 Feb 2022 14:08:16 +0800
Message-ID: <20220214060819.7334-21-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 iommu@lists.linux-foundation.org, James Wang <james.qian.wang@arm.com>,
 Yong Wu <yong.wu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common compare/release helpers from component.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 sound/soc/codecs/wcd938x.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index eff200a07d9f..54f4a41ceca2 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4417,16 +4417,6 @@ static const struct component_master_ops wcd938x_comp_ops = {
 	.unbind = wcd938x_unbind,
 };
 
-static int wcd938x_compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-static void wcd938x_release_of(struct device *dev, void *data)
-{
-	of_node_put(data);
-}
-
 static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 					struct device *dev,
 					struct component_match **matchptr)
@@ -4442,8 +4432,8 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 	}
 
 	of_node_get(wcd938x->rxnode);
-	component_match_add_release(dev, matchptr, wcd938x_release_of,
-				    wcd938x_compare_of,	wcd938x->rxnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd938x->rxnode);
 
 	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
 	if (!wcd938x->txnode) {
@@ -4451,8 +4441,8 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 		return -ENODEV;
 	}
 	of_node_get(wcd938x->txnode);
-	component_match_add_release(dev, matchptr, wcd938x_release_of,
-				    wcd938x_compare_of,	wcd938x->txnode);
+	component_match_add_release(dev, matchptr, component_release_of,
+				    component_compare_of, wcd938x->txnode);
 	return 0;
 }
 
-- 
2.18.0

