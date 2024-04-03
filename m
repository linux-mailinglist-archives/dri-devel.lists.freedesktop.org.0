Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55C896C4A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F95411299F;
	Wed,  3 Apr 2024 10:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DAXNwhgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4166C1129A3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:27:11 +0000 (UTC)
X-UUID: b6cbb5b4f1a411eeb8927bc1f75efef4-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kCRz0oPMocRZGjqww5JBr1zErPCbQO81YR95YuYxRFM=; 
 b=DAXNwhgAaEEunBek296qLYVs/Eo1Z0A0jJvWqy4iZjY/wwozm2IQ2in1i+pWTYzpTHkLgWq7Qp/kZ5QPtWpamug7cbzsngKWjgWqEdoUIVaNKXxJtO3KK7jH7F3OMGi2DTcEMA5zRZWwUHNAPw784q5bVHLkI/V+3zzfC44xE7I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:93fe3104-5ffc-4c72-83c0-0914402275ce, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:5671aa00-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b6cbb5b4f1a411eeb8927bc1f75efef4-20240403
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1948557643; Wed, 03 Apr 2024 18:27:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:01 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v5 0/9] Add mediate-drm secure flow for SVP
Date: Wed, 3 Apr 2024 18:26:52 +0800
Message-ID: <20240403102701.369-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.362100-8.000000
X-TMASE-MatchedRID: VXWhY3LS2Pv8rQJMqxBG8AI0yP/uoH+DviRliDV2nyxGL0g1nVmkYQnr
 j+RY/ULmQSEG2fuaX6s4yjl5TF4FjOVPKBunz2ETsJN7JpKehD8k80hXoYXya+GkTiRMqa/cupN
 sDJhuPOu+EfvYffI99GAuB1lK/wNflyrPeDQDh/L0hv/rD7WVZCG4xLksx3hx+8eaGHk0rep576
 my5IxjunSpyLqZd1VUoCw9zUya6F2VhIWL9FEuN1z+axQLnAVB+KgiyLtJrSABR3WmPjzYK/qAD
 eqinEVfUxPAM3J2QaoE/BRbzLrnDE2VnXMRzIBjV6iWWmDPLEBYN1akkye0qObjzgiSjlMe8oLz
 UWewXkiVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUxhSy4aMccSSKVVk
 8SuJDE52vnieMRVnKY75ilN9FFaMejuF0DkcIeIBFrTYMKPW64IkYNprTxLs/zMaoLP2Pk5vjvl
 dIa3VgSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.362100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4A2A33B54F857CDB4A0BE30622D4EAD3ECDBDBF6F73FE993392554B5F03370562000:8
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

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
TODO:
1) Remove get sec larb port interface in ddp_comp, ovl and ovl_adaptor.
2) Verify instruction for enabling/disabling dapc and larb port in TEE
   drop the sec_engine flags in normal world and.
3) Move DISP_REG_OVL_SECURE setting to secure world for mtk_disp_ovl.c.
4) Change the parameter register address in mtk_ddp_sec_write()
   from "u32 addr" to "struct cmdq_client_reg *cmdq_reg".
5) Implement setting mmsys routing table in the secure world series.
---
Based on 5 series and 1 patch:
[1] v3 dma-buf: heaps: Add MediaTek secure heap
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=809023
[2] v3 add driver to support secure video decoder
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=807308
[3] v4 soc: mediatek: Add register definitions for GCE
- https://patchwork.kernel.org/project/linux-mediatek/patch/20231212121957.19231-2-shawn.sung@mediatek.com/
[4] v2 Add CMDQ driver support for mt8188
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=810302
[5] Add mediatek,gce-events definition to mediatek,gce-mailbox bindings
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=810938
[6] v3 Add CMDQ secure driver for SVP
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=812379
---
Changes in v5:
1. Sync the local changes

Changes in v4:
1. Rebase on mediatek-drm-next(278640d4d74cd) and fix the conflicts
2. This series is based on 20240129063025.29251-1-yunfei.dong@mediatek.com
3. This series is based on 20240322052829.9893-1-shawn.sung@mediatek.com
4. This series is based on 20240403065603.21920-1-shawn.sung@mediatek.com

Changes in v3:
1. fix kerneldoc problems
2. fix typo in title and commit message
3. adjust naming for secure variable
4. add the missing part for is_suecure plane implementation
5. use BIT_ULL macro to replace bit shifting
6. move modification of ovl_adaptor part to the correct patch
7. add TODO list in commit message
8. add commit message for using share memory to store execute count

Changes in v2:

1. remove the DRIVER_RDNDER flag for mtk_drm_ioctl
2. move cmdq_insert_backup_cookie into client driver
3. move secure gce node define from mt8195-cherry.dtsi to mt8195.dtsi
---
CK Hu (1):
  drm/mediatek: Add interface to allocate MediaTek GEM buffer.

Jason-JH.Lin (9):
  drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_ENCRYPTED flag
  drm/mediatek: Add secure buffer control flow to mtk_drm_gem
  drm/mediatek: Add secure identify flag and funcution to mtk_drm_plane
  drm/mediatek: Add mtk_ddp_sec_write to config secure buffer info
  drm/mediatek: Add get_sec_port interface to mtk_ddp_comp
  drm/mediatek: Add secure layer config support for ovl
  drm/mediatek: Add secure layer config support for ovl_adaptor
  drm/mediatek: Add secure flow support to mediatek-drm
  drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 275 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  16 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  13 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  30 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_gem.c            |  85 +++++-
 drivers/gpu/drm/mediatek/mtk_gem.h            |   4 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  11 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |   2 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  25 ++
 drivers/gpu/drm/mediatek/mtk_plane.h          |   2 +
 include/uapi/drm/mediatek_drm.h               |   1 +
 14 files changed, 467 insertions(+), 16 deletions(-)

--
2.18.0

