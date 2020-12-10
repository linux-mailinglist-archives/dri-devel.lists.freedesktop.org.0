Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F82D6141
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316CD6E430;
	Thu, 10 Dec 2020 16:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A826E430
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:10:58 +0000 (UTC)
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 00/12] Decouple Mediatek DRM sub driver
Date: Fri, 11 Dec 2020 00:10:38 +0800
Message-Id: <20201210161050.8460-1-chunkuang.hu@kernel.org>
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

Changes in v2:
1. Fix iommu larb problem.
2. Based on mediatek-drm-next-5.11-2 [2].

[1] https://patchwork.kernel.org/patch/11140751/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.11-2

CK Hu (10):
  drm/mediatek: Separate getting larb device to a function
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  89 ++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  69 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 217 +++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 169 ++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  44 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  75 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 429 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 100 +++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  47 +--
 12 files changed, 676 insertions(+), 596 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
