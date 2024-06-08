Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65E901164
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 14:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6210E129;
	Sat,  8 Jun 2024 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kvo7Am+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201710E0AC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 12:02:31 +0000 (UTC)
X-UUID: f7c264e6258e11efa54bbfbb386b949c-20240608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4TsRg2oPuLZTyrFAWx6iQegBDteJk0cn8a+inIOYQzg=; 
 b=kvo7Am+A19V7WJ9l1lO3hJiZ/0b6n/DYpx8KZuFKXyHfsQT1repz7pOG8jprZjGRUh/Gpd6cuRg4mCBnjvmHJ+uy3EkpPYvfXf03APXkPy7sYm4rllwcGtCE/150Q6S5/N6ymUeRjuPu8b2RjXI4YD8i4MGDrHcgfUs1o+vu+O0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:a25be9df-8bda-4832-810e-c18c002187c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:db24dd84-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7c264e6258e11efa54bbfbb386b949c-20240608
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 242097160; Sat, 08 Jun 2024 20:02:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Jun 2024 05:02:23 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Jun 2024 20:02:22 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] Add HDCP feature for DisplayPort
Date: Sat, 8 Jun 2024 20:01:03 +0800
Message-ID: <20240608120219.21817-1-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tee client application, HDCP 1.x and 2.x authentication for DisplayPort
to support the HDCP feature.

mac.shen (3):
  Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP
    feature
  Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature for DisplayPort
  Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x feature for DisplayPort

 drivers/gpu/drm/mediatek/Makefile        |   7 +-
 drivers/gpu/drm/mediatek/mtk_dp.c        | 332 ++++++--
 drivers/gpu/drm/mediatek/mtk_dp.h        | 103 +++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c | 577 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h |  17 +
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c  | 944 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h  |  25 +
 drivers/gpu/drm/mediatek/mtk_dp_reg.h    |  11 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c       |   3 +
 drivers/gpu/drm/mediatek/tci.h           | 143 ++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c   | 595 ++++++++++++++
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h   | 133 ++++
 12 files changed, 2805 insertions(+), 85 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
 create mode 100644 drivers/gpu/drm/mediatek/tci.h
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
 create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h

-- 
2.43.0

