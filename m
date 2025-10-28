Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC66C17366
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2310E6A3;
	Tue, 28 Oct 2025 22:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=dwurp.de header.i=@dwurp.de header.b="E+nUC4EY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 21:46:25 UTC
Received: from mail.dwurp.de (mail.dwurp.de [185.183.156.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA6810E202
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:46:25 +0000 (UTC)
From: Sebastian Fleer <dev@dwurp.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dwurp.de; s=mail;
 t=1761687658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nup17Y1kzFSR3efnVH+GVmUx6KfCqfYTDIb4rIKMcv0=;
 b=E+nUC4EYq3xxVTJtbsuqJUw8PQokQXMEGuZ6+BEv/4KVQ4nmig+EpHI9+acnan2pnZ12DG
 fUwxmQsY12WRw1iD9URhQ1FIkcnP7o8ecd6of8QOYGazyBye8b8Z6sKoYXyjgy0DkVWddR
 +SVDoFnYqbBaotIF2LDA/TfiYVRlk2w=
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Subject: [PATCH] drm/panel: kingdisplay-kd097d04: Disable EoTp
Date: Tue, 28 Oct 2025 22:38:12 +0100
Message-ID: <20251028214045.1944956-1-dev@dwurp.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Oct 2025 22:39:08 +0000
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

Since commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
default") panel output on an Acer Chromebook Tab 10 (google-dru) is corrupted.
The tablet I use is equipped with a kingdisplay-kd097d04 panel, disabling EoTp
restores the correct functionality.

Fixes: d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default")
Signed-off-by: Sebastian Fleer <dev@dwurp.de>
---
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 2fc7b0779b37..893af9b16756 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -359,7 +359,7 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	kingdisplay = devm_drm_panel_alloc(&dsi->dev, __typeof(*kingdisplay), base,
 					   &kingdisplay_panel_funcs,
-- 
2.51.2

