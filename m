Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A219AFC90
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D7010EA23;
	Fri, 25 Oct 2024 08:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="d7+KrT+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485C910EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:31:53 +0000 (UTC)
X-UUID: 9225885492ab11efb88477ffae1fc7a5-20241025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BT/Ng943C81aesy7n0Su3FETLClPbDgwCaBp/DvtzrA=; 
 b=d7+KrT+YQLkZHKtWDIIjKRc/Wl3dZ6/Q8HhhYnmaDvKuKuAoFvopb0i6UPLdjVJDIIcQ7cFXiCfoAJvqfh2Kk/E3eADWzCTS6FeZdRL3+cnVRLR0kN3EumINBstlFGXBvtEkHIOw/ASrvakkRpiTDzvaV3RRHMQZAgtiwYUKsHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:791cb5ab-5518-4750-af5f-445bb12aedbd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:d4d7d241-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9225885492ab11efb88477ffae1fc7a5-20241025
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 730057307; Fri, 25 Oct 2024 16:31:46 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 16:31:44 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 16:31:43 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
 <dmitry.osipenko@collabora.com>, <msp@baylibre.com>,
 <rex-bc.chen@mediatek.com>, <granquet@baylibre.com>, <peng.liu@mediatek.com>, 
 <jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
 <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] Adjust YCbCr422/bandwidth/training for DP
Date: Fri, 25 Oct 2024 16:28:26 +0800
Message-ID: <20241025083036.8829-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.394300-8.000000
X-TMASE-MatchedRID: gUuz9Ogq75WqO+wHLkIcO7E3FpMbg63SWDdWpJMntKiPaLJ/Ca3STzku
 TGiiLo1Yx91bb4/YjfE5bsAcOzEG6DK42JVSvu3ARAvohSJUpI++1Vx7rDn4r7v408/GP5HqqcN
 xd5hReGHi8zVgXoAltoAy6p60ZV62JW+71yEen6Zq8/xv2Um1avoLR4+zsDTtgUicvJ4MChkqZu
 nyleO9cPKITgppfSr0LQnK66f9ldiohItm7Yy7y/cqHKzCJIUv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.394300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F32734434536A121CD0B2F2009F6141F52AC7822B31BBEF4922DAF5077C969E42000:8
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

The change in mode filtering bandwidth calculation method must rely on
DP training at the beginning, and get the current train info to calculate
the bandwidth.

Color format support capability must also rely on DP training time to
get the most reliable link capability and choose which color format to use.

Fixed YCbCr422 problem and bandwidth calculation from color format are
both in the color format category, so they are bound.

In summary, YCbCr 422 and mode valid must rely on DP training timing,
so they are strongly bound.

Liankun Yang (3):
  drm/mediatek: Fix YCbCr422 color format issue for DP
  drm/mediatek: Fix mode valid issue for dp
  drm/mediatek: Adjust bandwidth limit for DP

 drivers/gpu/drm/mediatek/mtk_dp.c | 78 ++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 33 deletions(-)

-- 
2.45.2

