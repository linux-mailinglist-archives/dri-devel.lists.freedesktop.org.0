Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E906821B3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 02:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C4610E08D;
	Tue, 31 Jan 2023 01:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1B10E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 01:59:27 +0000 (UTC)
X-UUID: e1e4847ea10a11ed945fc101203acc17-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WJYXLBX/n/oH+RscWZpywMvfmWqQoxEHuehKlop3feY=; 
 b=QZhxSHGyJX4kFS6bhvcMoqITURSAxh7H3nFwucSWt8tggqmXTl4ZWYJpmpAFZiVHgYh8gCRYcmoNkCCzIz4XMHO1nTq6QjxvoOW3W2HF65aQ6Opid87WL+137DT+GIJ/QfZ3qLPlgjfFFEHAcbh0q/xl0Zd5bIjRqe3WKAMHYMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18, REQID:01f3b4b0-ab2b-460d-9b86-ce47af99efae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.18, REQID:01f3b4b0-ab2b-460d-9b86-ce47af99efae, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b, CLOUDID:529ccc55-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:230131095924V3P8PX7O,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: e1e4847ea10a11ed945fc101203acc17-20230131
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 85077795; Tue, 31 Jan 2023 09:59:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 09:59:21 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 09:59:21 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: [PATCH v3 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Date: Tue, 31 Jan 2023 09:59:17 +0800
Message-ID: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
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

Change since v2:
1. Remove the applied patch.
2. Change the commit title and the description.

Change since v1:
1. Added fine-tuning panel power sequence modification.

Xinlei Lee (2):
  drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send initial code
    time
  drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.18.0

