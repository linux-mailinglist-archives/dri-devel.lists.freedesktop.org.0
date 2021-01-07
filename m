Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26092ED2E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 15:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87756E48C;
	Thu,  7 Jan 2021 14:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26B316E48C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 14:39:13 +0000 (UTC)
X-UUID: a23034cb734a4bfdb76265a66aa04d02-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3yme2n6hj99TgRI5yAnQj8gNXTYS1bdd9oJBVcgH2/E=; 
 b=fjIQfgMu01NdzkfT99zAdbrEbwGBBSDGhiN5HMadNQOZsJmG08JL9KlQUbj6JQqtMFvuTMvkpUdg8D6obZfzRCVC9yBaemCixqn3jP2APusUFSFUB3MMFCrTWIBNL2HVmSbTW3Hkt/PJeKVdIqhtRE8a7uNedIs+nNqS8SqssaE=;
X-UUID: a23034cb734a4bfdb76265a66aa04d02-20210107
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1817510195; Thu, 07 Jan 2021 22:33:59 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 7 Jan 2021 22:33:56 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 7 Jan 2021 22:33:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/mediatek: dsi: Fix EoTp flag
Date: Thu, 7 Jan 2021 22:33:52 +0800
Message-ID: <20210107143352.50090-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: A377759D8A87949403261110186934E8B2642D92B1452A4748E1BCD43F073B582000:8
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
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SoC will transmit the EoTp (End of Transmission packet) when
MIPI_DSI_MODE_EOT_PACKET flag is set.

Enabling EoTp will make the line time larger, so the hfp and
hbp should be reduced to keep line time.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 65fd99c528af..8c70ec39bfe1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -401,8 +401,11 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 		break;
 	}
 
-	tmp_reg |= (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) << 6;
-	tmp_reg |= (dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET) >> 3;
+	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		tmp_reg |= HSTX_CKLP_EN;
+
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
 }
@@ -478,6 +481,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
+	delta += dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET ? 2 : 0;
 
 	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
 	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
