Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEC43DC4B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904F16E071;
	Thu, 28 Oct 2021 07:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC276E071
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 07:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E8C8F1F44C4E
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dafna.hirschfeld@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: hdmi: Perform NULL pointer check for
 mtk_hdmi_conf
Date: Thu, 28 Oct 2021 09:43:11 +0200
Message-Id: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
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

In commit 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
a check for CEA modes was added to function mtk_hdmi_bridge_mode_valid()
in order to address possible issues on MT8167; moreover, with commit
c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
another similar check was introduced.

Unfortunately though, at the time of writing, MT8173 does not provide
any mtk_hdmi_conf structure and this is crashing the kernel with NULL
pointer upon entering mtk_hdmi_bridge_mode_valid(), which happens as
soon as a HDMI cable gets plugged in.

To fix this regression, add a NULL pointer check for hdmi->conf in the
said function, restoring HDMI functionality and avoiding NULL pointer
kernel panics.

Fixes: 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
Fixes: c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5838c44cbf6f..3196189429bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1224,12 +1224,14 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
-	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
-		return MODE_BAD;
+	if (hdmi->conf) {
+		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+			return MODE_BAD;
 
-	if (hdmi->conf->max_mode_clock &&
-	    mode->clock > hdmi->conf->max_mode_clock)
-		return MODE_CLOCK_HIGH;
+		if (hdmi->conf->max_mode_clock &&
+		    mode->clock > hdmi->conf->max_mode_clock)
+			return MODE_CLOCK_HIGH;
+	}
 
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
-- 
2.33.0

