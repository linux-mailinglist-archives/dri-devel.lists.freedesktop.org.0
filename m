Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537CCCE9DA2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF46B10E8EC;
	Tue, 30 Dec 2025 14:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PDhygWG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FA610E8EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103422;
 bh=rJV17EF05/w3f78uj2ASdMF8eiM0a/h7oQKf1vfMmHo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PDhygWG0x/U4wclIg9h8oZo+gQ//UlYeRFApaehOF9ikP+860UiSJUFwFG/D6F0gt
 sfg23E/sYyslf10PCqtHV15hGDCse7vVpKRbzpxXbTiNQ4PQ7eg3eJymG26ph25CRt
 Pf9Praf4I6S6MqQkHBZGXoiCJgcKwacssm5lRzXp4O58EoM4rUd7JMbAsvTS3n8tlt
 05uoGNPKSurr+uCbeWxq5LCAsgbokXhLtQVXed9YSuQ/Ai5u7QcFlT4ZREf5A8/5Au
 AYzpzqWOAdtPzVq8lPXj2Pje18qV3X3Ip6u/gLG0pCO7w13lRZsXkpOqwiaIR4gynH
 zxTzx1VXuIR4g==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7776817E1408;
 Tue, 30 Dec 2025 15:03:36 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:02 -0300
Subject: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
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

The minimum alignment for both the header and data buffers in the AFBC
format for Mali GPUs with archicture version 6 and higher (which
includes MT8195's G57 (v9)) is 128, not 1024 as the MediaTek DRM driver
currently defines.

Since Mesa defines it as the correct value of 128 [1], when displaying
AFBC buffers, some resolutions will cause the OVL component to be
configured by the driver with a data address that is different from the
address that actually contains the data as set by Mesa, resulting in
corrupted output on display.

Fix the AFBC alignment definition for the MediaTek DRM driver.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/3848a080534a17ca075e9e95dd3a14abb80139aa/src/panfrost/lib/pan_afbc.h#L364

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 95c5fa5295d8..46be4454bc92 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -13,7 +13,7 @@
 #define AFBC_DATA_BLOCK_WIDTH 32
 #define AFBC_DATA_BLOCK_HEIGHT 8
 #define AFBC_HEADER_BLOCK_SIZE 16
-#define AFBC_HEADER_ALIGNMENT 1024
+#define AFBC_HEADER_ALIGNMENT 128
 
 struct mtk_plane_pending_state {
 	bool				config;

-- 
2.51.0

