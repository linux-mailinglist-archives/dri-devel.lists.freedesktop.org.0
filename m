Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BD25E4B1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC476ED11;
	Sat,  5 Sep 2020 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55186EB40
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:11:04 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 27D642C448
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:00:33 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 1407E4026B;
 Fri,  4 Sep 2020 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DXWunT6/1oNeLvT/FMsXBR2HIErDGDCvRZEkb2LPbhU=;
 b=mbfzMJdQ5aIC4rkeOeCzXpVZ4rxaoYZIYGpWAvoU0cVbfERXsjipPqZWVy1yY9CjS3k5yN
 0JVVKhL9gdwN9bTa5lcZK4bDOjUTUFonAdLrjEWoN8gRVSqnRNzUCJmfTHh3gpoEvxitb1
 imA54I3xXc9FhWom/zIHN2K2gttkXYI=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2B322360469;
 Fri,  4 Sep 2020 11:00:28 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/4] make hdmi work on bananapi-r2
Date: Fri,  4 Sep 2020 12:59:58 +0200
Message-Id: <20200904110002.88966-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frank Wunderlich <frank-w@public-files.de>

This Patch-Series adds missing Patches/Bugfixes to get hdmi working
on BPI-R2

v5->v6:
 - drop parts already merged to mediatek-drm-next
 - include lima-regulator-patch
 - rebase on changes in mediatek-drm-next tree (hdmi/hdmi-phy patches)
 - fix compatible of hdmi0 because of changes in hdmi-driver
v4->v5:
 - rebased on 5.9-rc1
 - move existing display-related dts nodes to new mt7623n.dtsi
   because mt7623a does not have gpu
 - add new display nodes to this new dtsi
v3->v4:
 - fix removed const in "add ddp routing for mt7623"
 - change subjects to "drm/mediatek:..."
 - add documentation for mt7623-* compatibles
 - dropped redundant display_components node (mmsys compatible)
 - add reviewd-by collected in v3
v2->v3:
 - use own mmsys-routing for mt7623 instead of code getting different
   routing from dts
 - remove ddp routing bls -> dpi from bpir2/rfb dts
 - updated some commit-Messages as suggested by CK Hu
v1->v2:
 - using get_possible_crtc API instead of hardcoded
 - drop unused dts-nodes
 - refine commit-messages as far as i can :)
   "config component output by device node port" is needed to fix a WARN_ON()
   "fix boot up for 720 and 480 but 1080" fixes flickering, 
     which may cause also some resolutions not working on some TFT

Alex Ryabchenko (1):
  arm: dts: mt7623: add lima related regulator

Frank Wunderlich (1):
  arm: dts: mt7623: move display nodes to separate mt7623n.dtsi

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

chunhui dai (1):
  drm/mediatek: disable tmds on mt2701

 arch/arm/boot/dts/mt7623.dtsi                 | 123 -------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  87 ++++-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  74 ++++-
 arch/arm/boot/dts/mt7623n.dtsi                | 306 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c    |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi.c           |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   1 +
 7 files changed, 469 insertions(+), 126 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt7623n.dtsi

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
