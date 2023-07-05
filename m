Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E43748137
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACC710E344;
	Wed,  5 Jul 2023 09:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03110E362
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:42:41 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C3D660087A;
 Wed,  5 Jul 2023 10:42:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688550159;
 bh=zINDDL4xiGK/8luSkmKXT+SCyjHKCbbr1Sc9XWyTjCM=;
 h=From:To:Cc:Subject:Date:From;
 b=GuCdJlW0aAu+LpdTEmm5X87DRUudiBJENtp6Ld0vjQY7EaPja74qJ2fQ7MK4Wewo1
 ksoE7FJQ5+LMx2McHb8JCxk8hPnYTHI5JrRp6GwWwNSV4HReFc3RLG3noT3uV4rn58
 8Asj6s/x/gIUZudjq1oEBO2BCh9xClWkYOtDdB+t7PAAvnZDPy+/HCNeDaqO7XAfn5
 M0+1z3NaUV63Tu3J/aV+5JXOwLNI6QKQAe2zDCWiYxKx8kV+TF43iMt6TgtScMgZeL
 1mlDAL0SYMMGKK7VbUcZ/8T1Mnzgb3sKs3o+TnEG1kSXO8BdA8V40LnJdQQm8PmQLG
 KxZoYMbGr4wZA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 0/3] drm/mediatek: General cleanups
Date: Wed,  5 Jul 2023 11:42:29 +0200
Message-Id: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series performs some cleanups in drm/mediatek; specifically, changes
it to use devm_platform_ioremap_resource(), dev_err_probe() and
devm_pm_runtime_enable, hence harmonizing log formats and removing some
unneeded lines of code.

Changes in v2:
 - Switched from devm_platform_get_and_ioremap_resource() to dropping
   struct resource pointer with using devm_platform_ioremap_resource()

AngeloGioacchino Del Regno (3):
  drm/mediatek: Use devm_platform_ioremap_resource()
  drm/mediatek: Use dev_err_probe() in probe functions
  drm/mediatek: Use devm variant for pm_runtime_enable() when possible

 drivers/gpu/drm/mediatek/mtk_cec.c            | 29 ++++--------
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 20 +++------
 drivers/gpu/drm/mediatek/mtk_disp_color.c     | 23 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 20 +++------
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 29 +++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 27 +++++-------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 13 +++---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      | 44 +++++++------------
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 18 ++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       | 18 +++-----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 30 +++++--------
 15 files changed, 122 insertions(+), 214 deletions(-)

-- 
2.40.1

