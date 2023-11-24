Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0937F70AF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8361010E7CB;
	Fri, 24 Nov 2023 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D82F10E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:00:59 +0000 (UTC)
X-UUID: 5b514d6c8ab011eea33bb35ae8d461a2-20231124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YdRXmOt9Y5eMiagSvm9fvGMfzv8pEl9C4bUpAbreCaE=; 
 b=WzO/y1u9OqScBIk46Bhab9OSByKbdOQBgvth8Eie6vZhwP041fD6mYUSUNvnarC/kOH73ELNc579eXmJmqlJ9FkKff2Fp0bUnyLOcPQPGPooR03XfFvjnaTk2ocEB13OndW2yDaXPnYGyVyF52RpaCvvMZqDg+Fx5c1ZtnUfilo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:54b5e2a1-747a-4b8c-8f6a-6cb1be461a8a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:20be0773-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5b514d6c8ab011eea33bb35ae8d461a2-20231124
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1513326457; Fri, 24 Nov 2023 18:00:54 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 Nov 2023 18:00:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 Nov 2023 18:00:53 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 0/1] Fix errors when reporting rotation capability
Date: Fri, 24 Nov 2023 18:00:51 +0800
Message-ID: <20231124100052.18599-1-shawn.sung@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit is based on 20231024130048.14749-1-shawn.sung@mediatek.com.

This bug was found when running IGT tests.
For CRTCs that doesn't support rotation should still return
DRM_MODE_ROTATE_0, otherwise the test will fail to restart.
Returns the hardware capabilities accordingly.

Changes in v4:
- Remove rotation property from the driver data since
  OVL rotation property for all chips are the same

Changes in v3:
- Return 0 (not support) if rotation capabilities is not defined
  in the driver data.

Changes in v2:
- Restore DRM_MODE_ROTATE_180 (reflect x + reflect y = rotate 180)
- Define supported rotations in the driver data

Hsiao Chien Sung (1):
  drm/mediatek: Fix errors when reporting rotation capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c        | 18 ++++++------------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c    |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c       |  2 +-
 5 files changed, 18 insertions(+), 13 deletions(-)

--
2.39.2

