Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F12B54CB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 00:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2A889EA9;
	Mon, 16 Nov 2020 23:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AE089EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 23:14:28 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1C5F2223D;
 Mon, 16 Nov 2020 23:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605568467;
 bh=5Dwq9VBI7Qs1RjpdmmRJuv1bZLk0Qmz9ychYpZvyTz8=;
 h=From:To:Cc:Subject:Date:From;
 b=ZjkrxrG8i6i+0j7nlXNNPusw9X0ikl4bP8wr87301wagkaDHaitCXfJmZEGtUDDFB
 D7ydI/NfwuqWlzDJjmolw8+ff+hE3P2qPxPZ2QKrOm3en0xIHvkatGfaZP3E9u0Bhh
 pHvbJprD06r37dVpkZ8OyGmwBI6LTq/k7QiOH/sw=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RESEND PATCH 0/3] Move Mediatek MIPI DSI PHY driver from DRM folder
 to PHY folder
Date: Tue, 17 Nov 2020 07:14:04 +0800
Message-Id: <20201116231407.94-1-chunkuang.hu@kernel.org>
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

mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_mipi_dsi_phy driver into phy driver folder.

Chun-Kuang Hu (3):
  drm/mediatek: Separate mtk_mipi_tx to an independent module
  phy: mediatek: Move mtk_mipi_dsi_phy driver into drivers/phy/mediatek
    folder
  MAINTAINERS: add files for Mediatek DRM drivers

 MAINTAINERS                                                | 1 +
 drivers/gpu/drm/mediatek/Kconfig                           | 1 +
 drivers/gpu/drm/mediatek/Makefile                          | 3 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                     | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                     | 1 -
 drivers/phy/mediatek/Kconfig                               | 7 +++++++
 drivers/phy/mediatek/Makefile                              | 5 +++++
 .../mediatek/phy-mtk-mipi-dsi-mt8173.c}                    | 2 +-
 .../mediatek/phy-mtk-mipi-dsi-mt8183.c}                    | 2 +-
 .../mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c}      | 5 ++++-
 .../mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h}      | 0
 11 files changed, 20 insertions(+), 8 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (97%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
