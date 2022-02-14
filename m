Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA084B41BF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD6010E4C1;
	Mon, 14 Feb 2022 06:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0A10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:11:30 +0000 (UTC)
X-UUID: 2a46d0b4bb524588a229cb1befa6a6a1-20220214
X-UUID: 2a46d0b4bb524588a229cb1befa6a6a1-20220214
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 729865382; Mon, 14 Feb 2022 14:11:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 14:11:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:11:23 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/23] drm/omap: dss: Make use of the helper
 component_compare_dev
Date: Mon, 14 Feb 2022 14:08:12 +0800
Message-ID: <20220214060819.7334-17-yong.wu@mediatek.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 James Wang <james.qian.wang@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomi
 Valkeinen <tomba@kernel.org>, srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Cai Huoqing <caihuoqing@baidu.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common compare helper from component.

Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Cai Huoqing <caihuoqing@baidu.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 69b3e15b9356..0399f3390a0a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1344,12 +1344,6 @@ static const struct component_master_ops dss_component_ops = {
 	.unbind = dss_unbind,
 };
 
-static int dss_component_compare(struct device *dev, void *data)
-{
-	struct device *child = data;
-	return dev == child;
-}
-
 struct dss_component_match_data {
 	struct device *dev;
 	struct component_match **match;
@@ -1379,7 +1373,7 @@ static int dss_add_child_component(struct device *dev, void *data)
 		return device_for_each_child(dev, cmatch,
 					     dss_add_child_component);
 
-	component_match_add(cmatch->dev, match, dss_component_compare, dev);
+	component_match_add(cmatch->dev, match, component_compare_dev, dev);
 
 	return 0;
 }
-- 
2.18.0

