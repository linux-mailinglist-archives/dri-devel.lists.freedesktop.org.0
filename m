Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D02F0DBF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFB7899F0;
	Mon, 11 Jan 2021 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 421A889C61
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:44:01 +0000 (UTC)
X-UUID: 3dc67136ad5d4e48b333a4ec52266c16-20210111
X-UUID: 3dc67136ad5d4e48b333a4ec52266c16-20210111
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1224801398; Mon, 11 Jan 2021 15:43:57 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:43:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:43:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 00/15] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon, 11 Jan 2021 15:43:36 +0800
Message-ID: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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

This series are based on 5.11-rc1 and SoC MT8183,
and provide 15 patch to support mediatek SOC MT8192

Changes since v2:
- fix review comment in v2
- add pm runtime for gamma and color 
- move ddp path select patch to mmsys series
- remove some useless patch

Yongqiang Niu (15):
  dt-bindings: mediatek: add description for postmask
  dt-bindings: mediatek: add description for mt8192 display
  arm64: dts: mt8192: add display node
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: Add pm runtime support for gamma
  drm/mediatek: Add pm runtime support for color
  drm/mediatek: fix aal size config
  drm/mediatek: separate ccorr module
  drm/mediatek: add matrix bits private data for ccorr
  drm/mediatek: add DDP support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 .../bindings/display/mediatek/mediatek,disp.txt    |   3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 134 +++++++++++
 drivers/gpu/drm/mediatek/Makefile                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 245 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  34 ++-
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c       | 161 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  35 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  98 +--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  52 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +
 14 files changed, 687 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
