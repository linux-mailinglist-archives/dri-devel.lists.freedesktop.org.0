Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0547D296C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 06:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0725510E149;
	Mon, 23 Oct 2023 04:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7274610E135
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 04:46:00 +0000 (UTC)
X-UUID: 0ab0000c715f11ee8051498923ad61e6-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MLtZa0IjzU6Ae4rzeGnDkbO/Z8kVW5GCiHvS2GPUrPM=; 
 b=pnNzc+dOXEsk8RuRvRmK8IeJakuZoFHVFfLyrZvC9U0wFcd/B8xlUVIV4wPMxQZqO5ujMdUQ4HcKy/ZNyym7EHp56p1mpeks/4MRGP6v5bc9tr5R36BvMUHJwNktHFfsngfGLIjo+ReChikD8YzdhmBAVOzL5nyCNcPVoDfYOrE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:c542129e-93a8-4037-a35a-4d82f5fd3a12, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:a171a5fb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0ab0000c715f11ee8051498923ad61e6-20231023
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1968020672; Mon, 23 Oct 2023 12:45:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:45:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:45:49 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Subject: [PATCH v2 00/11] Add mediate-drm secure flow for SVP
Date: Mon, 23 Oct 2023 12:45:37 +0800
Message-ID: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch series provides drm driver support for enabling secure video
path (SVP) playback on MediaiTek hardware in the Linux kernel.

Memory Definitions:
secure memory - Memory allocated in the TEE (Trusted Execution
Environment) which is inaccessible in the REE (Rich Execution
Environment, i.e. linux kernel/userspace).
secure handle - Integer value which acts as reference to 'secure
memory'. Used in communication between TEE and REE to reference
'secure memory'.
secure buffer - 'secure memory' that is used to store decrypted,
compressed video or for other general purposes in the TEE.
secure surface - 'secure memory' that is used to store graphic buffers.

Memory Usage in SVP:
The overall flow of SVP starts with encrypted video coming in from an
outside source into the REE. The REE will then allocate a 'secure
buffer' and send the corresponding 'secure handle' along with the
encrypted, compressed video data to the TEE. The TEE will then decrypt
the video and store the result in the 'secure buffer'. The REE will
then allocate a 'secure surface'. The REE will pass the 'secure
handles' for both the 'secure buffer' and 'secure surface' into the
TEE for video decoding. The video decoder HW will then decode the
contents of the 'secure buffer' and place the result in the 'secure
surface'. The REE will then attach the 'secure surface' to the overlay
plane for rendering of the video.

Everything relating to ensuring security of the actual contents of the
'secure buffer' and 'secure surface' is out of scope for the REE and
is the responsibility of the TEE.

DRM driver handles allocation of gem objects that are backed by a 'secure
surface' and for displaying a 'secure surface' on the overlay plane.
This introduces a new flag for object creation called
DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
surface'. All changes here are in MediaTek specific code.

---
Based on 3 series and 1 patch:
[1] dma-buf: heaps: Add MediaTek secure heap
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=782776

[2] add driver to support secure video decoder
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=782922

[3] soc: mediatek: Add register definitions for GCE
- https://patchwork.kernel.org/project/linux-mediatek/patch/20231017064717.21616-2-shawn.sung@mediatek.com/

[4] Add CMDQ secure driver for SVP
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=795502
---
Change in v2:

1. remove the DRIVER_RDNDER flag for mtk_drm_ioctl
2. move cmdq_insert_backup_cookie into client driver
3. move secure gce node define from mt8195-cherry.dtsi to mt8195.dtsi
---

CK Hu (1):
  drm/mediatek: Add interface to allocate MediaTek GEM buffer.

Jason-JH.Lin (10):
  drm/mediatek/uapi: Add DRM_MTK_GEM_CREATED_ENCRYPTTED flag
  drm/mediatek: Add secure buffer control flow to mtk_drm_gem
  drm/mediatek: Add secure identify flag and funcution to mtk_drm_plane
  drm/mediatek: Add mtk_ddp_sec_write to config secure buffer info
  drm/mediatek: Add get_sec_port interface to mtk_ddp_comp
  drm/mediatek: Add secure layer config support for ovl
  drm/mediatek: Add secure layer config support for ovl_adaptor
  drm/mediatek: Add secure flow support to mediatek-drm
  drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize
  arm64: dts: mt8195: Add secure mbox settings for vdosys

 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  31 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 274 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  14 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  13 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  13 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 121 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   7 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h      |   2 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  11 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |   2 +
 include/uapi/drm/mediatek_drm.h               |  59 ++++
 16 files changed, 570 insertions(+), 18 deletions(-)
 create mode 100644 include/uapi/drm/mediatek_drm.h

-- 
2.18.0

