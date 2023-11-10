Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA77E7A5F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC3110E951;
	Fri, 10 Nov 2023 09:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDCE10E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:29:33 +0000 (UTC)
X-UUID: 957cf0ca7f6811ee8051498923ad61e6-20231110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ae3NgNwi5jbYlghW361nXVBAg4ZT3Zsh9YIiZ0bSJr8=; 
 b=JB0W8ZVoFu1JlA1tLm4Ep5Yc233T3vuCHAKJoLkNg+yuxvhlwHS0sVhE6O4bk1D+Vr+MwpawPWo1eh11kdBA6o1NAbA+gEDY2UDxXvybBXws2cDYSAVm/hxXzLEVRS5UILQnhfZhUSpkR1McNzEPfFuGhC0NeVYxd4aKfYp0kxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:97b6f439-8915-4597-969b-1d32e5be9704, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:a6dbe35f-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 957cf0ca7f6811ee8051498923ad61e6-20231110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <stuart.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 466670699; Fri, 10 Nov 2023 09:29:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Nov 2023 09:29:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Nov 2023 09:29:24 +0800
From: Stuart Lee <stuart.lee@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/1] Fix access violation in mtk_drm_crtc_dma_dev_get
Date: Fri, 10 Nov 2023 09:29:13 +0800
Message-ID: <20231110012914.14884-1-stuart.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 10 Nov 2023 09:03:43 +0000
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
 Stuart Lee <stuart.lee@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lancelot Wu <lancelot.wu@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add error handling to check NULL input in
mtk_drm_crtc_dma_dev_get function.

While display path is not configured correctly, none of crtc is
established. So the caller of mtk_drm_crtc_dma_dev_get may pass
input parameter *crtc as NULL, Which may cause coredump when
we try to get the container of NULL pointer.

Stuart Lee (1):
  drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.18.0

