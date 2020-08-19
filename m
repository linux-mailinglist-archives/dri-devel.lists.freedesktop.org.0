Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2F24AFAA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391C6E8DC;
	Thu, 20 Aug 2020 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de [95.129.51.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE156E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 08:20:34 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 0F0862C696
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 08:18:03 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout1.routing.net (Postfix) with ESMTP id 2E6FE3FD3D;
 Wed, 19 Aug 2020 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1597825079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FiBKRQX0Yu/oUfxbfaNVaqDxRl64gER3PIg7jU21vW4=;
 b=hZeHVyHF2XrQ/a58hJfkW4rkNI7zUHPiGly8MkwO/TUBgNGu0YQ5rEIrPPwL5MqCYICJIP
 0E0rFzS+RS8MOHHgeSqX66Ocsb8Lq8XDCiT4buZ0mFishA4OHmPDDJhooTQ/x6VgZQ6L8r
 vqdRqbO/TWkphgOvqTCW/Cv/nVKYyT0=
Received: from localhost.localdomain (fttx-pool-185.76.97.101.bambit.de
 [185.76.97.101])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4F837100539;
 Wed, 19 Aug 2020 08:17:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/7] make hdmi work on bananapi-r2
Date: Wed, 19 Aug 2020 10:17:45 +0200
Message-Id: <20200819081752.4805-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frank Wunderlich <frank-w@public-files.de>

This Patch-Series adds missing Patches/Bugfixes to get hdmi working
on BPI-R2

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
     which may cause also some resolutions not working on some TFT (had some pr>

Frank Wunderlich (3):
  dt-bindings: mediatek: add mt7623 display-nodes
  drm/mediatek: add ddp routing for mt7623
  arm: dts: mt7623: move display nodes to separate mt7623n.dtsi

Jitao Shi (1):
  drm/mediatek: dpi/dsi: change the getting possible_crtc way

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

Stu Hsieh (1):
  drm/mediatek: Add get_possible_crtc API for dpi, dsi

chunhui dai (1):
  drm/mediatek: disable tmds on mt2701

 .../display/mediatek/mediatek,disp.txt        |   2 +-
 .../display/mediatek/mediatek,dpi.txt         |   2 +-
 .../display/mediatek/mediatek,dsi.txt         |   4 +-
 .../display/mediatek/mediatek,hdmi.txt        |   4 +
 arch/arm/boot/dts/mt7623.dtsi                 | 123 -------
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  74 ++++-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  74 ++++-
 arch/arm/boot/dts/mt7623n.dtsi                | 305 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  42 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  23 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c       |   3 +
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |   1 +
 .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |   1 +
 16 files changed, 535 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt7623n.dtsi

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
