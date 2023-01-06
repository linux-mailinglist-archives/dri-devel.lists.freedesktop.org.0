Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A365F9E9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 04:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAF810E828;
	Fri,  6 Jan 2023 03:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31B10E82D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 03:05:32 +0000 (UTC)
X-UUID: 01fe23f234b343c89de10cf5bb5e09b1-20230106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LrM1TjJhEDXqK3mki6dkj5bVxRVhHMMcBw0cAXwlPN8=; 
 b=P3Q4t1n67uRShDLGPO1gJ0AbG2sh0gVIHs+xG+XIZrKAkFa650hFPpUa5GOjbgdVd7txnEmPvFc0DNYQIndflxgGYJtU+KYOt6WverLL8iKw+kYYfCKl3zPELiQ7VP/cCwHH5G+XTKYbl87Z2ccOS2RJ7dFmohvHRHxTn099Z5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:8f3c1a90-cee9-42f1-829d-102e035a7112, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:ca47f8f4-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 01fe23f234b343c89de10cf5bb5e09b1-20230106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 209800967; Fri, 06 Jan 2023 11:05:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 6 Jan 2023 11:05:24 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 11:05:23 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: [PATCH 0/2]Reduce lcm_reset to DSI LP11 send cmd time 
Date: Fri, 6 Jan 2023 11:05:19 +0800
Message-ID: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
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

Xinlei Lee (2):
  drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 2 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.18.0

