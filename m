Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0D5A5BF4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 08:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18C210E3DC;
	Tue, 30 Aug 2022 06:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1239810E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 06:39:37 +0000 (UTC)
X-UUID: ec1ab97799734ca5912ccf4ee443ad2b-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fqdqJAHd6E12G7qb0S5KwKQe8DyXVaMfgcLvT0zlqSY=; 
 b=Niloyf/l4YebSOuudvjioZ786U0+15NLGgzSf1uA8N3P4072jxH5L/s9csdoitw0Tt1BhgeWQKRnsRLOmB6wpJQbRalDOteF0m6+D8D0SE9JBMUANAGHkD3QWJ+6VQUsGYzdpqAMnky0XvL/TVX31VMADbtl00W6rtOMkvBCJKE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:9fba6ede-3742-4ad4-9b44-a994ad7ed951, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:94c7fb55-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ec1ab97799734ca5912ccf4ee443ad2b-20220830
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 889232506; Tue, 30 Aug 2022 14:39:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 14:39:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 30 Aug 2022 14:39:32 +0800
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/3] Add gamma lut support for mt8195
Date: Tue, 30 Aug 2022 14:39:26 +0800
Message-ID: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the gamma_set_common() function for previous SoC,
such as  mt8173 and mt8183, is designed for 9bit-to-10bit
conversion.
mt8195 is using 10bit-to-12bit conversion, which is
not compatible with the previous function.

Thus, need to update the function to fit the need of mt8195.

---
Base on series [1]:
[1]: Add driver nodes for MT8195 SoC
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=666741
---

Change in v2:
        1. fix global variable in mtk_disp_gamma.c
        2. update mask calculation and delete not-necessary variables
        3. fix shift-bit problem.
        4. fix commit messages for dt-binding
        5. fix dts gamma label.


zheng-yan.chen (3):
  dt-bindings: mediatek: Add gamma compatible for mt8195
  drm/mediatek: Add gamma lut support for mt8195
  arm64: dts: Modify gamma compatible for mt8195

 .../display/mediatek/mediatek,gamma.yaml      |   3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 102 +++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 10 files changed, 88 insertions(+), 34 deletions(-)

-- 
2.18.0

