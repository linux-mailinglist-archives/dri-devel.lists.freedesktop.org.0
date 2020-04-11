Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEC1A4E9F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 09:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E546E2A9;
	Sat, 11 Apr 2020 07:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E95F6E2A9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 07:44:34 +0000 (UTC)
X-UUID: ac2d969db3de4dee952271d4b6244625-20200411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VL/uIEJeOh4V+RzzjIL7SOp5c2Ln6Wq9deMdt7EQdfo=; 
 b=sB43eeK+G0tuhcF5a8a8QM2WBi7iA64YFUJIh4BzIoMkbbmUOFQjSZGk1D+L9+nzcpb+ZJsxGQ/xn5eT1lZFR1l7CBt9m8aH+JWKiUKJrJGwxES+AsV4Sn1YM5T+KNienUyLoerC2V9Ra8a94rqQU+3ZsHN0n4jzMtmkA2ZT9s0=;
X-UUID: ac2d969db3de4dee952271d4b6244625-20200411
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1165974946; Sat, 11 Apr 2020 15:44:28 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Apr 2020 15:44:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 11 Apr 2020 15:44:22 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/4] Config mipi tx current and impedance
Date: Sat, 11 Apr 2020 15:44:04 +0800
Message-ID: <20200411074408.38090-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F06F78ACE077B8F53AD26555B0EACD516F8A1379DB458BC6BF1268D245B0AFD52000:8
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

Changes since v5:
 - remove memset()
 - add return to remove "else"

Changes since v4:
 - add Reviewed-by:
 - move the get the calibration data code to probe.

Changes since v3:
 - refine drive-strength-microamp as from 3000 to 6000.

Changes since v2:
 - fix the title of commit message.
 - rename mipitx-current-drive to drive-strength-microamp

Changes since v1:
 - fix coding style.
 - change mtk_mipi_tx_config_calibration_data() to void

Jitao Shi (4):
  dt-bindings: display: mediatek: add property to control mipi tx drive
    current
  dt-bindings: display: mediatek: get mipitx calibration data from nvmem
  drm/mediatek: add the mipitx driving control
  drm/mediatek: config mipitx impedance with calibration data

 .../display/mediatek/mediatek,dsi.txt         | 10 ++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        | 54 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  4 ++
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 28 ++++++++++
 4 files changed, 96 insertions(+)

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
