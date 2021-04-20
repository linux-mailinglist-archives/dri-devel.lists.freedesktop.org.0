Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A0365A08
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FB56E82B;
	Tue, 20 Apr 2021 13:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB5086E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:26:49 +0000 (UTC)
X-UUID: 959f53c016c34ab6838cafa57f8b35a2-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x4PC10VWjynceWQKGlyruq1xHVfMHe0q+ks95eUDcMM=; 
 b=h4Amvf4zV4EtMkX2uOL4XqdQaDatxwvRwb5ngk9VPSOOCnHO5ReevrLdvhAn5RpAgTGbB5wpolNxmbFt+WEr/9H2fsGIk2bu9IoBdpwuMGd208bbXNW7Etcr83p6wkRXEVwqERMWhDQH5gSKCjU6igqkGVGEemsietuXaU9M0dQ=;
X-UUID: 959f53c016c34ab6838cafa57f8b35a2-20210420
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1691856229; Tue, 20 Apr 2021 21:26:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:20 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:18 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
Date: Tue, 20 Apr 2021 21:26:12 +0800
Message-ID: <20210420132614.150242-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420132614.150242-1-jitao.shi@mediatek.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DE26EABE28240C1980E352A0A7E176B5B54C70B4B01E7B5C108E2A0C6A821C082000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the drm_panel_prepare_power and drm_panel_unprepare_power control.
Turn on panel power(drm_panel_prepare_power) and control before dsi
enable. And then dsi enable, send dcs cmd in drm_panel_prepare, last
turn on backlight.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a1ff152ef468..455fe582c6b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -615,10 +615,13 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
+	if (panel_bridge_prepare_power(dsi->next_bridge))
+		DRM_INFO("can't prepare power the panel\n");
+
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set data rate: %d\n", ret);
-		goto err_refcount;
+		goto err_prepare_power;
 	}
 
 	phy_power_on(dsi->phy);
@@ -661,7 +664,9 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
 	phy_power_off(dsi->phy);
-err_refcount:
+err_prepare_power:
+	if (panel_bridge_unprepare_power(dsi->next_bridge))
+		DRM_INFO("Can't unprepare power the panel\n");
 	dsi->refcount--;
 	return ret;
 }
@@ -694,6 +699,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	if (panel_bridge_unprepare_power(dsi->next_bridge))
+		DRM_INFO("Can't unprepare power the panel\n");
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
