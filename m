Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2D2A37D3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75846E5AB;
	Tue,  3 Nov 2020 00:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66596E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:34:42 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 946442225E;
 Tue,  3 Nov 2020 00:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363681;
 bh=zjbAVeWRYaUwxfwFsQjsM8GEoZULM41QxsHun96CCxU=;
 h=From:To:Cc:Subject:Date:From;
 b=EQIyoffH3k8mQp8PsmXEy/B0YcigmHwvFDNhivxurwIjIUDkJwyRlGn+vBqqFx2rI
 CwQKfp2q7MXU0UplGhYrdRU22YL42lVlsdwE3Xj3kZnTEZU+NMusVHF1jO717G7VPR
 RmRMBewngRmu3L0pD9bUlJ3wlseJpC3h3QKCU0QI=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 00/11] Decouple Mediatek DRM sub driver
Date: Tue,  3 Nov 2020 08:34:11 +0800
Message-Id: <20201103003422.17838-1-chunkuang.hu@kernel.org>
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

mtk ccorr is controlled by DRM and MDP [1]. In order to share
mtk_ccorr driver for DRM and MDP, decouple Mediatek DRM sub driver
which include mtk_ccorr, so MDP could use this decoupled mtk_ccorr.

[1] https://patchwork.kernel.org/patch/11140751/

CK Hu (9):
  drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Remove irq in struct mtk_ddp_comp
  drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
  drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub
    driver private data
  drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
  drm/mediatek: Register vblank callback function
  drm/mediatek: DRM driver directly refer to sub driver's function
  drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver

Chun-Kuang Hu (2):
  drm/mediatek: Get CMDQ client register for all ddp component
  drm/mediatek: Use correct device pointer to get CMDQ client register

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  86 ++---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  69 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 215 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 169 +++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  44 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  75 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 389 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 100 ++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  47 +--
 12 files changed, 658 insertions(+), 569 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
