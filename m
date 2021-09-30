Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4441D19B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 04:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802C66EB37;
	Thu, 30 Sep 2021 02:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8846F6E2D7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:47:11 +0000 (UTC)
X-UUID: 35cd5127613d42c08c25bfdd9d48f863-20210930
X-UUID: 35cd5127613d42c08c25bfdd9d48f863-20210930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1515925022; Thu, 30 Sep 2021 10:47:07 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Sep 2021 10:47:06 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [v2 PATCH 3/3] drm/mediatek: Fix cursor plane is not config when
 primary is updating
Date: Thu, 30 Sep 2021 10:47:04 +0800
Message-ID: <20210930024704.6966-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If cursor plane has updated but primary plane config task is not
finished, mtk_drm_crtc_update_config will call mbox_flush() to clear
all task in current GCE thread and let cursor plane re-send a new
GCE task with cursor + primary plane config to replace the unfinished
GCE task.

So the plane config flag should not be cleared when mailbox callback
with a error status.

Fixes: 9efb16c2fdd6 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 274e5c67507d..b96dbc867890 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -281,6 +281,9 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_crtc_state *state;
 	unsigned int i;
 
+	if (data->sta < 0)
+		return;
+
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	state->pending_config = false;
-- 
2.18.0

