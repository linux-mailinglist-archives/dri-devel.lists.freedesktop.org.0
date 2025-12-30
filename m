Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C333CE9D9C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6F710E8ED;
	Tue, 30 Dec 2025 14:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jIsErsen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8138910E8EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103415;
 bh=+9dZdnFTOLQEU43l4IQfP9P4NbPSetsJuzCQ32SzXns=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jIsErsenY6TL6SJSyJkoGGLS1NOKlhLcd6p7YPvROtay4CGMpi7TbCqFFTLQE7hOE
 3QroSgNQieFaOh8EAMdh3NmrpZS8liS2pVoE0Ba5FMuVEpisJJeG2NByc4CBYfrCGZ
 I2RQInSZ+2x83QKzlxa7i/4Pc4QjAF6xpL3E7q8k0LPC6OxQy8Zr0qPF+VwJ7DTYah
 KI0LqFjVUHgwjNDQufzRBzyPRzERTmtH+T+iClywQ+y1BiyttuVq1lPNyH2CYQ6apV
 aNN/CMIPDoP6lEir/rogTD3zZ8pvA4V9NTRo2H3A7rayEdiJiYSSCdKUS+XhTkhzE6
 zL0PfNET9SaLw==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CEE917E127C;
 Tue, 30 Dec 2025 15:03:30 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:01 -0300
Subject: [PATCH RFC 1/6] drm/mediatek: plane: Remove extra block from AFBC
 data payload offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-1-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

The AFBC data payload is in fact not offset by 1 additional block as the
code and comment suggest, and this causes the buffer to be rendered
offset by one block. Remove this extraneous offset to get the buffer
correctly displayed.

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 5043e0377270..1214f623859e 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -164,10 +164,9 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 		 */
 		hdr_addr = addr + hdr_offset;
 
-		/* The data plane is offset by 1 additional block. */
 		offset = pitch * y_offset_in_blocks +
 			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
-			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
+			 fb->format->cpp[0] * x_offset_in_blocks;
 
 		/*
 		 * Using dma_addr_t variable to calculate with multiplier of different types,

-- 
2.51.0

