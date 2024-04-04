Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5D898299
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 09:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E811328F;
	Thu,  4 Apr 2024 07:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NX6sNIxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821511328F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712217477;
 bh=JR03O6DqtWABDbF+UOdTpqbBb6MC16JinmCC+MPaEF8=;
 h=From:To:Cc:Subject:Date:From;
 b=NX6sNIxxfrVG0gUBHik5LbRQh3vPBIVl+iz/L8TLewL2G9Zr5eU+16R/ZPZQ8U1f/
 417XkgyZ9trxK6wGGymLro2RJ8Emegg5FvEDpcwLhl+SNhpChMFIuBrMsvisR5kNJ+
 XOLai6pqtm4XYbxlsnRKoWIR7ITgdE9/aSOjZSvIFCoLO8DSOssa9ppH+LN3+WAUbk
 CYG9rDEk0sEdJdjlAn3cmVMZYyIUM4KcUTGypSaEjo/87DaeWXwxOhSnNcLb01GZAP
 PGRsa7eCaO+TLwsm3YkJFGzmfGDK9ScyLmHZv+HtD1kyQVf7EQKef+a9ptAOZ3PetT
 j4tj8H2HPMrcw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD48D378209A;
 Thu,  4 Apr 2024 07:57:56 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, nancy.lin@mediatek.com, nathan.lu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
Subject: [PATCH v2 0/3] drm/mediatek: Fixes for DDP component search/destroy
Date: Thu,  4 Apr 2024 09:57:51 +0200
Message-ID: <20240404075754.83455-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
 - Fixed patch [2/3]

This series performs some cleanups for DDP component CRTC search and
correctly iounmaps the previously of_iomap() calls from drm_ddp_comp.

Tested on MT8195 Cherry Tomato

AngeloGioacchino Del Regno (3):
  drm/mediatek: drm_ddp_comp: Fix and cleanup DDP component CRTC search
  drm/mediatek: Perform iounmap on simple DDP component destruction
  drm/mediatek: drm_ddp_comp: Add mtk_ddp_is_simple_comp() internal
    helper

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 113 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 3 files changed, 80 insertions(+), 38 deletions(-)

-- 
2.44.0

