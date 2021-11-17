Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43545410C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BD389EAE;
	Wed, 17 Nov 2021 06:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04389EAC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:42:06 +0000 (UTC)
X-UUID: c6ead053af32427fa624fbeb8ec6c4fe-20211117
X-UUID: c6ead053af32427fa624fbeb8ec6c4fe-20211117
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1315790216; Wed, 17 Nov 2021 14:42:00 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 17 Nov 2021 14:41:59 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 14:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 14:41:59 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>
Subject: Fix drm suspend and resume issue
Date: Wed, 17 Nov 2021 14:41:55 +0800
Message-ID: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzungbi@google.com, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject: [PATCH 0/3] Fix drm suspend and resume issue

1. When the hardwire components on crtc is using GCE to configure their
   register, cmdq_suspend may be called.
   So add cmdq_mbox_flush to clear all tasks and release GCE clocks
   before cmdq_suspend.

2. The suspend and resume order of components on crtc can be guaranteed
   by the same power-domain, but cmdq can not.
   So add devlink to cmdq dev make sure the order of suspend and resume:
   cmdq_suspend is latter than drm_suspend and
   cmdq_resume is earlier than drm_resume.

jason-jh.lin (3):
  mialbox: move cmdq suspend,resume and remove after cmdq_mbox_flush
  mailbox: add cmdq_mbox_flush to clear all task before suspend
  drm/mediatek: add devlink to cmdq dev

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 ++++
 drivers/mailbox/mtk-cmdq-mailbox.c      | 81 ++++++++++++-------------
 2 files changed, 52 insertions(+), 42 deletions(-)

-- 
2.18.0

