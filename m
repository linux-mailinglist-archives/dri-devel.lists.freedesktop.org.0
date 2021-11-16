Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D7452E57
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D66E93F;
	Tue, 16 Nov 2021 09:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0CA6E93F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:49:42 +0000 (UTC)
X-UUID: cd9c244e7e0f4913898cfe75c63eaddc-20211116
X-UUID: cd9c244e7e0f4913898cfe75c63eaddc-20211116
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2124132109; Tue, 16 Nov 2021 17:49:36 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 17:49:35 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:49:34 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 16 Nov 2021 17:49:33 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] seperate panel power control from panel
 prepare/unprepare
Date: Tue, 16 Nov 2021 17:49:28 +0800
Message-ID: <20211116094930.11470-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, xinlei.li@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, liangxu.xu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2:
 - Panel driver panel-boe-tv101wum-nl6.c provides the power sequence apis.
 - The apis are called before dsi poweron and after dsi poweroff.

Changes since v1:
 - Fix null point when dsi next bridge isn't a panel.
 - "dsi mmsys reset" is implement by
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=515355

Jitao Shi (2):
  drm/panel: panel-boe-tv101wum-nl6: tune the power sequence to avoid
    leakage
  drm/mediatek: control panel's power before MIPI LP11

 drivers/gpu/drm/mediatek/mtk_dsi.c             | 28 ++++++--
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 88 +++++++++++++++++++-------
 include/drm/panel_boe_tv101wum_nl6.h           | 28 ++++++++
 3 files changed, 116 insertions(+), 28 deletions(-)
 create mode 100644 include/drm/panel_boe_tv101wum_nl6.h

-- 
2.12.5

