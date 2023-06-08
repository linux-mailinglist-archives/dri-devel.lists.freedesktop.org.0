Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFE727C67
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 12:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C0810E5A7;
	Thu,  8 Jun 2023 10:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685B10E5A7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 10:12:16 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 01C966606F10;
 Thu,  8 Jun 2023 11:12:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686219133;
 bh=htK85a15rgB70pAiwirg1NuBxZSlaNpIlLEQliB0CKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=KXRtkM4CXJf+IOobM2UO7YbpAL05O78sIPHxI2S5I6kSf1wCmo94OLUl7IAgrUiOt
 nKWRrOftMrcsEBZGfpLdcHvnbsm8QiBUZXhF2+SOXAU3LtPJ/GZUVKziaX/kdmZFfe
 rtb0TEPQK3exBin/8T6WjwAj+Y2BlE9JODWUBLk0AQN4AbQE0uqptb+/tORNIMcRem
 kOReUlz1/AwZ5zidDHcbWWd+mSgMTVfRe07k+bdVrS1W5xRwSC25rkuo2WyLxLWurj
 PeIj9NwRH8r909MctKH5r+1s7A/Wr1sHMewI40u6pcss2gyAnlS8kq1eogOS+gTbPp
 LQBpdN8pBqjFQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 0/3] drm/mediatek: General cleanups
Date: Thu,  8 Jun 2023 12:12:06 +0200
Message-Id: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
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
it to use devm_platform_get_and_ioremap_resource(), dev_err_probe() and
devm_pm_runtime_enable, hence harmonizing log formats and removing some
unneeded lines of code.

AngeloGioacchino Del Regno (3):
  drm/mediatek: Use devm_platform_get_and_ioremap_resource()
  drm/mediatek: Use dev_err_probe() in probe functions
  drm/mediatek: Use devm variant for pm_runtime_enable() when possible

 drivers/gpu/drm/mediatek/mtk_cec.c            | 29 ++++---------
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       | 21 ++++-----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     | 19 +++-----
 drivers/gpu/drm/mediatek/mtk_disp_color.c     | 22 ++++------
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     | 19 +++-----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 28 +++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 26 +++++------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 13 +++---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      | 43 +++++++------------
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 21 ++++-----
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 18 ++++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 17 +++-----
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       | 15 +++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 29 ++++++-------
 14 files changed, 121 insertions(+), 199 deletions(-)

-- 
2.40.1

