Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4185B4FB5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 17:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3F10E4DF;
	Sun, 11 Sep 2022 15:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EA410E4C5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 15:37:51 +0000 (UTC)
X-UUID: ac337c456af84c9d814d49ad6ec32a5e-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zhROwD3MVTnqx6OPlzfDHhCtDdWIlCJRV3//JwkNpy0=; 
 b=EUR9V227PrWfLEVUCisuaQ8hF9NdShdR5AYz21DtrK+A0cGzVKHDsRgNybkWOoRR6Mldg7iM8JPM8+wWB5yVQXhOV/GzUsxGwLGoIzfRldp26zycO5XuGAQ8Zov/DdOoD03VDJanzzZ74fqeAIkGb/GVnZOK0NubNaxhwWxaWXE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6712954f-4434-4fb2-a93f-d39d6f6180e8, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:45503e5d-5ed4-4e28-8b00-66ed9f042fbd,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ac337c456af84c9d814d49ad6ec32a5e-20220911
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1294488711; Sun, 11 Sep 2022 23:37:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sun, 11 Sep 2022 23:37:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 11 Sep 2022 23:37:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/9] Add gamma lut support for mt8195
Date: Sun, 11 Sep 2022 23:37:25 +0800
Message-ID: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
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
Change in v3:
1. separate 1 dt-binding patch to 2 patches, 1 is for modifying
   multiple items list to one and 1 is for moving mt8195 compatible.
2. redefine variables to reduce memory usage.
3. delete unused symbols.
4. separate 1 drm/mediatek patch to 6 patches.
5. rebase on tag 'next-20220909'
---
Jason-JH.Lin (5):
  drm/mediatek: Adjust mtk_drm_gamma_set_common parameters
  drm/mediatek: Add gamma support different lut_size for other SoC
  drm/mediatek: Add gamma support different lut_bits for other SoC
  drm/mediatek: Add gamma support different bank_size for other SoC
  drm/mediatek: Add clear RELAY_MODE bit to set gamma

zheng-yan.chen (4):
  dt-bindings: mediatek: modify item formatting for gamma
  dt-bindings: mediatek: Add gamma compatible for mt8195
  drm/mediatek: Add gamma lut support for mt8195
  arm64: dts: Modify gamma compatible for mt8195

 .../display/mediatek/mediatek,gamma.yaml      |   8 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 115 ++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   9 ++
 8 files changed, 109 insertions(+), 35 deletions(-)

-- 
2.18.0

