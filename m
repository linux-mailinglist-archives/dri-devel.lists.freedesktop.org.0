Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D343443DEAE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 12:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1736E947;
	Thu, 28 Oct 2021 10:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD356E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:19:18 +0000 (UTC)
X-UUID: a713e4527da549c6a15cf0bcd4acd68e-20211028
X-UUID: a713e4527da549c6a15cf0bcd4acd68e-20211028
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003576310; Thu, 28 Oct 2021 18:19:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 18:19:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 28 Oct 2021 18:19:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jassi
 Brar <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [PATCH v6 0/5] CMDQ refinement of Mediatek DRM driver
Date: Thu, 28 Oct 2021 18:19:06 +0800
Message-ID: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change in v6:
1. Drop the redundant checking of cmdq_vblank_cnt .
2. fix the indent.

Change in v5:
1. Move mbox_free_channel to a independent patch.

Change in v4:
1. Add cmdq_vblank_cnt initial value to 3.
2. Move mtk_drm_cmdq_pkt_create to the same define scope with
   mtk_drm_cmdq_pkt_destroy.

Change in v3:
1. Revert "drm/mediatek: clear pending flag when cmdq packet is done"
   and add it after the CMDQ refinement patches.
2. Change the remove of struct cmdq_client to remove the pointer of
   struct cmdq_client.
3. Fix pkt buf alloc once but free many times.

Changes in v2:
1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
   when CONFIG_MTK_CMDQ is reachable.

Chun-Kuang Hu (4):
  drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
  drm/mediatek: Remove the pointer of struct cmdq_client
  drm/mediatek: Detect CMDQ execution timeout
  drm/mediatek: Add cmdq_handle in mtk_crtc

Yongqiang Niu (1):
  drm/mediatek: Clear pending flag when cmdq packet is done

jason-jh.lin (1):
  drm/mediatek: Add mbox_free_channel in mtk_drm_crtc_destroy

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 175 ++++++++++++++++++++----
 1 file changed, 151 insertions(+), 24 deletions(-)

-- 
2.18.0

