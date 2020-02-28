Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D8173075
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 06:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7E56EDE0;
	Fri, 28 Feb 2020 05:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 611BD6EDE0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 05:26:45 +0000 (UTC)
X-UUID: b2212b16be1444048ae1fc61997b4f42-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hx1vyqreUaDlEd+O0J9QdTAoM6IYl0gynpL7Q9O9Mlg=; 
 b=MJOYlIcbx/ux/oed26fnrJM2ODTP3daokZbLpSFi7RhBsb7fGj4/fzuIjqLcmm6lD5Eb4424BjzBahwCZEfpZcO6zkVTiTkjMKnb9iJchR5mTDIqaM0qDB98wPqRxDmDVvSMt97WXXe3E8iuaxZDKuDFDcqcOyQAHr9idV6FM8Y=;
X-UUID: b2212b16be1444048ae1fc61997b4f42-20200228
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1498666084; Fri, 28 Feb 2020 13:21:38 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 28 Feb 2020 13:20:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 28 Feb 2020 13:22:01 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/5] mt8183 dpi supports dual edge and pin mode swap
Date: Fri, 28 Feb 2020 13:21:23 +0800
Message-ID: <20200228052128.82136-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6739D98E80EC8480B023BD5CC93BFF3800F14F27309F76845A651EE097CB8D112000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v9:
 - rename pinctrl-names = "gpiomode", "dpimode" to "active", "idle".
 - fix some typo.

Changes since v8:
 - drop pclk-sample redefine in mediatek,dpi.txt
 - only get the gpiomode and dpimode when dpi->pinctrl is successful.

Changes since v7:
 - separate dt-bindings to independent patches.
 - move dpi dual edge to one patch.

Changes since v6:
 - change dual_edge to pclk-sample
 - remove dpi_pin_mode_swap and

Changes since v5:
 - fine tune the dt-bindings commit message.

Changes since v4:
 - move pin mode control and dual edge control to deveice tree.
 - update dt-bindings document for pin mode swap and dual edge control.

Changes since v3:
 - add dpi pin mode control when dpi on or off.
 - update dpi dual edge comment.

Changes since v2:
 - update dt-bindings document for mt8183 dpi.
 - separate dual edge modfication as independent patch.

Jitao Shi (5):
  dt-bindings: media: add pclk-sample dual edge property
  dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
  dt-bindings: display: mediatek: dpi sample data in dual edge support
  drm/mediatek: dpi sample mode support
  drm/mediatek: set dpi pin mode to gpio low to avoid leakage current

 .../display/mediatek/mediatek,dpi.txt         |  9 ++++
 .../bindings/media/video-interfaces.txt       |  4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 49 ++++++++++++++++++-
 3 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
