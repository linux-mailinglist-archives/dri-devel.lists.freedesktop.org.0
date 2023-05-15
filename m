Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EA704653
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E49E10E30A;
	Tue, 16 May 2023 07:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438FC10E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:49:47 +0000 (UTC)
X-UUID: d0487d68f30511edb20a276fd37b9834-20230515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0zEXmrRuKPf/RKWfDTxwswrFb7hYbD0jf1l01tZS28c=; 
 b=Rvp6Ew29zYwpy1b+liJSetjUNau5JHOYoB+iReLzCdFXGb2fNItA5wG0KuUNRx9bvMELp9sqr4KapU/1G6O/j93FijDV80LRrhCGYq8LHofhdQO5ELQDGmqHWSo63CnwpxiiRBIahHHjcVaOJFGNTMAE1roXAr+NEOQwP2qwxq0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:fd26aa17-b58a-45c6-a50d-46f552e07dc1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:178d4d4, CLOUDID:0f0be1c0-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d0487d68f30511edb20a276fd37b9834-20230515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 374639291; Mon, 15 May 2023 17:49:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 17:49:40 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 17:49:39 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Date: Mon, 15 May 2023 17:49:53 +0800
Message-ID: <20230515094955.15982-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel spec stipulates that after lcm_reset is pulled high, cmd
should be sent to initialize the panel. Within the allowable range of
the DSI spec, this time needs to be reduced to avoid panel exceptions.

Base on the branch of linus/master v6.3.

Change since v3:
1. Rebase.

Change since v2:
1. Remove the applied patch.
2. Change the commit title and the description.

Change since v1:
1. Added fine-tuning panel power sequence modification.

Shuijing Li (2):
  drm/panel: boe-tv101wum-nl6: Remove extra delay
  drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.40.1

