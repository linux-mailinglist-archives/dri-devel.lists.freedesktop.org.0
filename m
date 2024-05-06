Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3683B8BCF0A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EF910E4D7;
	Mon,  6 May 2024 13:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kD47ngL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39610E4D7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77586612B3;
 Mon,  6 May 2024 13:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DC2C116B1;
 Mon,  6 May 2024 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002513;
 bh=pK9ICrlhU4yI7C8UmfAMhDpOxq05RC8K7IM/L/yquWw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kD47ngL8uom7ANO5DcjrAAVmsG/a74GHNet69KvrccOpmOl+iw4znkaN5ZTvBBOtn
 KEH5rlnCJbms83AhqwyyASbLLAekbP61TQQsLpg/hpD69G2D/8T7Q3/yZCZcFl2u4p
 37nfSL+WDB9rMSWujjU2hcXW+NTJg6iCGrCfJgpD9IhRCwOGBs3scufG5lSUnzc0d7
 UHyOzgfIBNcGd9vWR4YkB9oygn2/2iHBfxxD8jxluCoVhezMvA40NmN2UXBv2AHJy+
 ZcrDgHDdbvzWruLtC2LRRrq3NZv/Alc3WV4Ypbjt2ACSPWr1CdSKLaBNlnLqi1F0Ke
 eEKv2/eLNYJZA==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:31 +0200
Subject: [PATCH 02/20] drm/mediatek: dsi: provide LP-11 mode during .pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-2-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

As per specification in drivers/gpu/drm/drm_bridge.c the data lanes
should be in LP-11 mode after .pre_enable() has been run. HS mode of the
data lanes are enabled with mtk_dsi_start(). Therefore, move that call
to the .enable() callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index c255559cc56e..ed45c9cc3137 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -711,8 +711,6 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
-	mtk_dsi_start(dsi);
-
 	dsi->enabled = true;
 }
 
@@ -759,7 +757,7 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (dsi->refcount == 0)
 		return;
 
-	mtk_output_dsi_enable(dsi);
+	mtk_dsi_start(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -771,6 +769,9 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	ret = mtk_dsi_poweron(dsi);
 	if (ret < 0)
 		DRM_ERROR("failed to power on dsi\n");
+
+	/* Enter LP-11 state */
+	mtk_output_dsi_enable(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,

-- 
2.39.2

