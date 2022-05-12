Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06D5245C8
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 08:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F1910E2C9;
	Thu, 12 May 2022 06:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F11B10E2C9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:30:22 +0000 (UTC)
X-UUID: ee4f2fa5314b411282be0abc99e593ee-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b1ed0121-9c5d-4b1a-8dc4-6f5c7077d332, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:b1ed0121-9c5d-4b1a-8dc4-6f5c7077d332, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:b0e704a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:71b33d7cde3a,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: ee4f2fa5314b411282be0abc99e593ee-20220512
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1910285259; Thu, 12 May 2022 14:30:16 +0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 14:30:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 14:30:14 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 12 May 2022 14:30:13 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v6,
 0/4] Cooperate with DSI RX devices to modify dsi funcs and delay mipi
 high to cooperate with panel sequence
Date: Thu, 12 May 2022 14:30:08 +0800
Message-ID: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
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
Cc: jitao.shi@mediatek.com, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

In upstream-v5.8, dsi_enable will operate panel_enable, but this
modification has been moved in v5.9. In order to ensure the timing of
dsi_power_on/off and the timing of pulling up/down the MIPI signal,
the modification of v5.9 is synchronized in this series of patches.

Change since v5:
1. Merged [v5,1/5] drm/mediatek: Adjust the timing of mipi signal from
LP00 to LP11 to [v5,4/5] drm/mediatek: keep dsi as LP00 before dcs cmds
transfer, because in (v5,1/5) to adjust the dsi func sequence in order
to move to lane_ready func together in (v5, 4/5).

Changes since v4:
1. Dsi func modified to atomic operation.
2. Added fix tag.
3. Removed lane_ready print statement.

Changes since v3:
1. Rebase kernel-5.18-rc1.
2. Added dsi_enable protection.
3. Encapsulates the dsi_lane_ready function.

Changes since v2:
1. Rebase linux-next.

Changes since v1:
1. Dsi sequence marked with patch adjustment.
2. Fixes: mtk_dsi: Use the drm_panel_bridge.

Jitao Shi (2):
  drm/mediatek: Separate poweron/poweroff from enable/disable and define
    new funcs
  drm/mediatek: keep dsi as LP00 before dcs cmds transfer

Xinlei Lee (2):
  drm/mediatek: Modify dsi funcs to atomic operations
  drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
    function

 drivers/gpu/drm/mediatek/mtk_dsi.c | 93 ++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 30 deletions(-)

-- 
2.18.0

