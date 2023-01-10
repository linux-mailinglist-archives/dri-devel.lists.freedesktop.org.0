Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAE6638E1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0853C10E0DD;
	Tue, 10 Jan 2023 05:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A53B10E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:55:02 +0000 (UTC)
X-UUID: af7087f2cce4445aa73e60a22b2f0922-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RSk7SNfalHVSEupWJvDsfOvqV9D94msX9RLPBIHSp2s=; 
 b=VH4dflNyG/d3GN69VjvSO02bMH+VopTTlwcY/+2meMmZSJMqC919+DoTuYmqq+OU7/6FJh9YkfRJ100dTW+jwNZ3Vsmbs5M5dknfAiKrtFxvBY6CKy80Gp3xoNY20qUDCoBrDOE4qePzyerFyWx2EEweCjXJGfx8+U0auf4o3Nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:eb8cf06a-7227-4673-a51e-476b37fe0e8b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.17, REQID:eb8cf06a-7227-4673-a51e-476b37fe0e8b, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:543e81c, CLOUDID:8f33cc8b-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:230110135459DRAZD5U7,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0
X-CID-BVR: 0
X-UUID: af7087f2cce4445aa73e60a22b2f0922-20230110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 151214828; Tue, 10 Jan 2023 13:54:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 10 Jan 2023 13:54:55 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 13:54:55 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: [PATCH v2 0/3] Reduce lcm_reset to DSI LP11 send cmd time
Date: Tue, 10 Jan 2023 13:54:50 +0800
Message-ID: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: Xinlei Lee <xinlei.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

The panel spec stipulates that after lcm_reset is pulled high, cmd
should be sent to initialize the panel. Within the allowable range of
the DSI spec, this time needs to be reduced to avoid panel exceptions.

Base on the branch of linus/master v6.2.

Change since v1:
1. Added fine-tuning panel power sequence modification.

Xinlei Lee (3):
  drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time
  drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.18.0

