Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD12ECBED
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE026E40F;
	Thu,  7 Jan 2021 08:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id C92F189A72
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 03:11:30 +0000 (UTC)
X-UUID: 771d5a973aaf4a4096b8b39418b25130-20210107
X-UUID: 771d5a973aaf4a4096b8b39418b25130-20210107
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 799338514; Thu, 07 Jan 2021 11:11:25 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 11:11:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 11:11:24 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v9, 00/11] drm/mediatek: add support for mediatek SOC MT8183
Date: Thu, 7 Jan 2021 11:11:10 +0800
Message-ID: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series are based on 5.11-rc1 and provide 11 patch
to support mediatek SOC MT8183

Change since v8
- fix some review comment in v8
- separate gamma module for mt8183 has no dither function in gamma
- enable dither function for 5 or 6 bpc panel display
- separate ddp mutex patch from the whole Soc patch

Change since v7
- add dt-binding for mt8183 display
- base mmsys patch
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base dts patch
https://patchwork.kernel.org/project/linux-mediatek/cover/20201127104930.1981497-1-enric.balletbo@collabora.com/
- add mt8183 function call for setting the routing registers
- add RDMA fifo size error handle

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (11):
  dt-bindings: mediatek: add rdma-fifo-size description for mt8183
    display
  dt-bindings: mediatek: add description for mt8183 display
  arm64: dts: mt8183: rename rdma fifo size
  arm64: dts: mt8183: refine gamma compatible name
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add RDMA fifo size error handle
  drm/mediatek: separate gamma module
  drm/mediatek: add has_dither private data for gamma
  drm/mediatek: enable dither function
  drm/mediatek: add DDP support for MT8183
  This patch add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  11 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   7 +-
 drivers/gpu/drm/mediatek/Makefile                  |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 192 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  29 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  48 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  96 ++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  49 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   1 +
 11 files changed, 388 insertions(+), 65 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
