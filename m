Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA602EC6AC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 00:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2916E311;
	Wed,  6 Jan 2021 23:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B589D6E311
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 23:17:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC14023332;
 Wed,  6 Jan 2021 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975058;
 bh=vKhyMmIuw4dVwfOPSyfNwOpSYaEo7Zn9XZymkFCSHQU=;
 h=From:To:Cc:Subject:Date:From;
 b=h41X+2ABQGKohRVdjEt2dYr3etneeWKi9iNfXaPDBQFjBuflnIYSmANx9OQf+8t87
 RbI1Jr+VAtYTytEu92EVPbgRebX5SuoygMEHw8sZGDMpYWA6ICzTE7PK7vYEr9c6bP
 zj00b4vPMiJ2ovmsYqYgoE1Yl8b90qULYrS8P+7LyBb2ll1d+SKBprgDTL0NfYx5jO
 tPGb5MLJV7kxIVinQ4gCfB8RJAPcMmSTpVLsaqXWDj6K+28me7F+qVnlOqO+mEqhGo
 Xg86qtucp1LJ0lxKC+rgcI+j3a03+tWjU+4zh6/lTJrZRpPfBM+UyFx6RKftdgkZ6V
 FcfTAfLpHzxIg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/5] Share mtk mutex driver for both DRM and MDP
Date: Thu,  7 Jan 2021 07:17:24 +0800
Message-Id: <20210106231729.17173-1-chunkuang.hu@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk mutex is a driver used by DRM and MDP [1], so this series move
mtk mutex driver from DRM folder to soc folder, so it could be used
by DRM and MDP.

Changes in v2:
1. Rebase onto mediatek-drm-next [2].
2. Export symbol for mtk-mutex API.

[1] https://patchwork.kernel.org/patch/11140751/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

CK Hu (5):
  drm/mediatek: Remove redundant file including
  drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
  drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
  drm/mediatek: Automatically search unclaimed mtk mutex in
    mtk_mutex_get()
  soc / drm: mediatek: Move mtk mutex driver to soc folder

 drivers/gpu/drm/mediatek/Makefile             |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  32 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  28 --
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   3 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 -
 drivers/soc/mediatek/Makefile                 |   1 +
 .../mediatek/mtk-mutex.c}                     | 328 +++++++++---------
 include/linux/soc/mediatek/mtk-mutex.h        |  26 ++
 8 files changed, 212 insertions(+), 208 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
 rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
 create mode 100644 include/linux/soc/mediatek/mtk-mutex.h

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
