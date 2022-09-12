Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497645B5279
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1409710E110;
	Mon, 12 Sep 2022 01:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5210E110
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 01:30:14 +0000 (UTC)
X-UUID: 10d42db9859f4e4ab2bcd92eea47371f-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NrwrPJesfMxF24UrBwPkkWx5Tt9KMma6+F9KyakqTOg=; 
 b=VKEMEYM/Rl6hhzh1ROXJZWvU1h+Jci/eGFZKNVVfYuh/z+zvUhwKF7L9YSubSerNRj3VfSRDVW9OsgFHYgWUr4oTYy1QF/I7E+kFaBUGxwa4NwFj3TvW+OpCn5TpN81j9aOAlVqABmfvyliY3EI0ClaTZNeJnxU4HfBxaDoNIjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:63b5bb53-0e4f-4789-baeb-713aa0ecaffc, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:2ce305f6-6e85-48d9-afd8-0504bbfe04cb,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 10d42db9859f4e4ab2bcd92eea47371f-20220912
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2108086103; Mon, 12 Sep 2022 09:30:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 09:30:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Date: Mon, 12 Sep 2022 09:29:57 +0800
Message-ID: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
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
Change in RESEND v3:
Fix build warning
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:59:14: warning: no previous prototype for 'mtk_gamma_get_size' [-Wmissing-prototypes]

Change in v3:
1. separate 1 dt-binding patch to 2 patches, 1 is for modifying
   multiple items list to one and 1 is for moving mt8195 compatible.
2. redefine variables to reduce memory usage.
3. delete unused symbols.
4. separate 1 drm/mediatek patch to 6 patches.
5. rebase on tag 'next-20220909'

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

