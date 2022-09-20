Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C405BE115
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E5410E45B;
	Tue, 20 Sep 2022 09:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC47710E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:00:51 +0000 (UTC)
X-UUID: a969d42e5bd643a89975026f374740a3-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xz74ODjKzLI1kd5AQq6NQuh8A0wWpa/ATv1pXW7SzHE=; 
 b=Gt2+gBF4epAPeHAoaGbP+IrpEeIcSy4WiAc3SRxP+srcYXIGvednipnlT0VWj/hXHUU4jqVcuBh8s7qBUD4IsBS9L3a09tY3qHS5zTGZr0o8yjtomGpfN33UxKSZVHdr7MijZxWpeVv1GRmDU0VevH39Ch1dGGdsMAVswF5fV+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:6fb545d5-9429-4d58-9445-66d009f0eac1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:6ce1435e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a969d42e5bd643a89975026f374740a3-20220920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2061648772; Tue, 20 Sep 2022 17:00:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/18] unify register access and macros
Date: Tue, 20 Sep 2022 17:00:20 +0800
Message-ID: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to define new macros to generate bits, mask and bitfield, use
common ones instead, e.g. BIT, GENMASK and FIELD_PREP etc.
Due to common register access helpers are defined for MediaTek's phy
drivers, the similar helpers defined by ufs, hdmi and mipi phy drivers
can be removed.

Chunfeng Yun (18):
  phy: mediatek: add a new helper to update bitfield
  phy: mediatek: tphy: remove macros to prepare bitfield value
  phy: mediatek: xsphy: remove macros used to prepare bitfield value
  phy: mediatek: ufs: use common register access helpers
  phy: mediatek: pcie: use new helper to update register bits
  phy: mediatek: hdmi: mt2701: use GENMASK and BIT to generate mask and
    bits
  phy: mediatek: hdmi: mt2701: use FIELD_PREP to prepare bits field
  phy: mediatek: hdmi: mt2701: use common helper to access registers
  phy: mediatek: hdmi: mt8173: use GENMASK to generate bits mask
  phy: mediatek: hdmi: mt8173: use FIELD_PREP to prepare bits field
  phy: mediatek: hdmi: mt8173: use common helper to access registers
  phy: mediatek: hdmi: remove register access helpers
  phy: mediatek: mipi: mt8173: use GENMASK to generate bits mask
  phy: mediatek: mipi: mt8173: use FIELD_PREP to prepare bits field
  phy: mediatek: mipi: mt8173: use common helper to access registers
  phy: mediatek: mipi: mt8183: use GENMASK to generate bits mask
  phy: mediatek: mipi: mt8183: use common helper to access registers
  phy: mediatek: mipi: remove register access helpers

 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c    | 238 ++++++++---------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c    | 246 ++++++++----------
 drivers/phy/mediatek/phy-mtk-hdmi.c           |  33 ---
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   7 -
 drivers/phy/mediatek/phy-mtk-io.h             |   7 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 164 ++++++------
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    |  74 +++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |  24 --
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   5 -
 drivers/phy/mediatek/phy-mtk-pcie.c           |  17 +-
 drivers/phy/mediatek/phy-mtk-tphy.c           | 193 +++++---------
 drivers/phy/mediatek/phy-mtk-ufs.c            |  78 ++----
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  46 ++--
 13 files changed, 465 insertions(+), 667 deletions(-)

-- 
2.18.0

