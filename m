Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3523197E02
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 16:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080D6E2A3;
	Mon, 30 Mar 2020 14:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3178E6E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 14:12:29 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2239720780;
 Mon, 30 Mar 2020 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585577549;
 bh=4+AsxZwGtPuM+wfiKD/APDWAloLEuBb/oDkpjcsb5lM=;
 h=From:To:Cc:Subject:Date:From;
 b=P6HjW0ku4SSWqpKyNOmwBJr/ftDeWRrPVwhsOEMjwuhuSsb0qzSaKXW29AiJiNGJK
 iOTAh2gRqGZQOP1LL5bAyraSzhSAcgQ5ygUL/Hiijn4y9rCUEtE6ZDVOve9WaZBcw7
 xRpHjv9bCGLSLDeE1/8JQV1ue48ff97qdBf/Rf3o=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v2 0/4] Move Mediatek HDMI PHY driver from DRM folder to PHY
 folder
Date: Mon, 30 Mar 2020 22:12:18 +0800
Message-Id: <20200330141222.17529-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_hdmi_phy driver into phy driver folder.

Changes in v2:
- include module.h in mtk_hdmi.c

CK Hu (3):
  drm/mediatek: Move tz_disabled from mtk_hdmi_phy to mtk_hdmi driver
  drm/mediatek: Separate mtk_hdmi_phy to an independent module
  drm/mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek
    folder

Chun-Kuang Hu (1):
  MAINTAINERS: add files for Mediatek DRM drivers

 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/mediatek/Kconfig              |  2 +-
 drivers/gpu/drm/mediatek/Makefile             |  5 +---
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 24 +++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.h           |  1 -
 drivers/phy/mediatek/Kconfig                  |  7 ++++++
 drivers/phy/mediatek/Makefile                 |  7 ++++++
 .../mediatek/phy-mtk-hdmi-mt2701.c}           |  3 +--
 .../mediatek/phy-mtk-hdmi-mt8173.c}           |  2 +-
 .../mediatek/phy-mtk-hdmi.c}                  |  3 ++-
 .../mediatek/phy-mtk-hdmi.h}                  |  2 --
 11 files changed, 41 insertions(+), 16 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (98%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (95%)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
