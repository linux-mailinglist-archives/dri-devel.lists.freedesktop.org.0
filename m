Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6279881215
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 14:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8110FA32;
	Wed, 20 Mar 2024 13:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDD610FA40
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 13:12:55 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rmvkA-0001W6-Ny; Wed, 20 Mar 2024 14:12:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	sam@ravnborg.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 quentin.schulz@theobroma-systems.com, klaus.goger@theobroma-systems.com,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/2] drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to
 LTK050H3148W flags
Date: Wed, 20 Mar 2024 14:12:31 +0100
Message-Id: <20240320131232.327196-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Similar to other variants, the LTK050H3148W wants to run in video mode
when displaying data. So far only the Synopsis DSI driver was using this
panel and it is always switching to video mode, independent of this flag
being set.

Other DSI drivers might handle this differently, so add the flag.

Fixes: e5f9d543419c ("drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 30919c872ac8..a50f5330a661 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -326,7 +326,8 @@ static const struct drm_display_mode ltk050h3148w_mode = {
 static const struct ltk050h3146w_desc ltk050h3148w_data = {
 	.mode = &ltk050h3148w_mode,
 	.init = ltk050h3148w_init_sequence,
-	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO_BURST,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_VIDEO_BURST,
 };
 
 static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
-- 
2.39.2

