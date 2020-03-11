Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EAC1811D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 08:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0FB6E41A;
	Wed, 11 Mar 2020 07:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9014F6E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:23:47 +0000 (UTC)
X-UUID: e6aee5488f88488db736545ec069e8b3-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8nLyZVk/PhYmrdzTV342CZJrfyCY+3YyqtqMqJ7V3+0=; 
 b=R/C//83yzgMDVRQmfq9ukHdSmyOj2yrBax+4BZswesSaaPy/qByw0sqGgDtQWI0zYzo/fikoHmH0+1PvAtkHsQCMJFANx2TgzzVvK5vEz7LsnoULqfhNO7c4wEj5Y9sD/WmsAT/0Av7od87xK8BOR5xxu7hYLYF+4Ozixz/8h8k=;
X-UUID: e6aee5488f88488db736545ec069e8b3-20200311
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1430431296; Wed, 11 Mar 2020 15:18:41 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 11 Mar 2020 15:19:01 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 11 Mar 2020 15:18:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v13 0/6] mt8183 dpi supports dual edge and pin mode swap
Date: Wed, 11 Mar 2020 15:18:17 +0800
Message-ID: <20200311071823.117899-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C7E631F0024CEF11B8147BAD69898DD502D82A9C849D73040D0A592C700B9AD2000:8
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

Changes since v12:
 - fix mediatek,dpi.yaml make_dt_binding_check errors.

Change since v11:
 - fine tune mediatek,dpi.yaml.
 - add Acked-by: Rob Herring <robh@kernel.org>.

Change since v10:
 - convert the Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
   to yaml format.
 - read the pclk-sample in endpoint.

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

Jitao Shi (6):
  dt-bindings: media: add pclk-sample dual edge property
  dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
  dt-bindings: display: mediatek: dpi sample data in dual edge support
  dt-bindings: display: mediatek: convert the document format from txt
    to yaml
  drm/mediatek: dpi sample mode support
  drm/mediatek: set dpi pin mode to gpio low to avoid leakage current

 .../display/mediatek/mediatek,dpi.txt         |  36 ------
 .../display/mediatek/mediatek,dpi.yaml        | 103 ++++++++++++++++++
 .../bindings/media/video-interfaces.txt       |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  58 +++++++++-
 4 files changed, 161 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
