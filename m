Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B0178BC8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545A6EAC9;
	Wed,  4 Mar 2020 07:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id E31ED6E987
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 11:03:53 +0000 (UTC)
X-UUID: bc28cf9fb76044f1b8655af63dcb9bc2-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6S4cmgY34o+0zFiuRZM1NT2lvbrUAigCkPYuDJM+qhg=; 
 b=O3NTT6X+p8kXyxJf5pOkkyAuMwLeqLk6RdsE5BK/hDCKcFQCFlbpiOCbfuInxqSBgnqUGygKUFrL7eqGDbhzzFeJqlUlw2k/MLYODRVr6KXsW/X2arN3/RuvUDmSlWNq8LKyVFEE4rNuqMVvSpfXEqOYdCVqEUoE9cM2jKS2m1c=;
X-UUID: bc28cf9fb76044f1b8655af63dcb9bc2-20200303
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1088778630; Tue, 03 Mar 2020 18:58:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:57:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:58:10 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 00/13] support gce on mt6779 platform
Date: Tue, 3 Mar 2020 18:58:32 +0800
Message-ID: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch support gce on mt6779 platform.

Change since v3:
- refine code for local variable usage
- use cmdq error code to consistent with current design
- return error directly after send if error code return
- also modify drm driver which uses cmdq_pkt_wfe api
- add finalize in drm driver

Change since v2:
- rebase onto 5.6-rc1
- remove unnecessary definition
- add clear parameter in wfe api
- separate assign and write_s api
- add jump api instead of finalize in loop

[... snip ...]


Dennis YC Hsieh (13):
  dt-binding: gce: add gce header file for mt6779
  mailbox: cmdq: variablize address shift in platform
  mailbox: cmdq: support mt6779 gce platform definition
  mailbox: mediatek: cmdq: clear task in channel before shutdown
  soc: mediatek: cmdq: return send msg error code
  soc: mediatek: cmdq: add assign function
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add write_s value function
  soc: mediatek: cmdq: export finalize function
  soc: mediatek: cmdq: add jump function
  soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
  soc: mediatek: cmdq: add set event function

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   3 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 101 ++++++--
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 143 ++++++++++-
 include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  10 +-
 include/linux/soc/mediatek/mtk-cmdq.h         |  94 +++++++-
 7 files changed, 548 insertions(+), 33 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt6779-gce.h

-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
