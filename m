Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ACF59FA5E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFFD14A070;
	Wed, 24 Aug 2022 12:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3B9112E0D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:47:39 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FD89592;
 Wed, 24 Aug 2022 14:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661345258;
 bh=NeDjKSj7CgAFaLVdNG/L7G3drRUEDiz6lACW+xO4fl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bTG9eMGk14L75cDEgm7I4CTrNLFnuiCART0ukN+RlKJqz3QZK7KTQxwafdZBYAR2I
 j+L2IRWqLc1eztDZMdAodnY97gfNRuDkY+KdoPhJVbiIew01TrTZh1xsVl2VpM04zc
 JXRGptCFi3a22V2N0owwBqoT8m2nze2SLzpMPMMo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/5] drm: rcar-du: dsi: Properly stop video mode TX
Date: Wed, 24 Aug 2022 15:47:23 +0300
Message-Id: <20220824124726.187224-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
References: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The driver does not explicitly stop the video mode transmission when
disabling the output. While this doesn't seem to be causing any issues,
lets follow the steps described in the documentation and add a
rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
function will also be used in later patches to stop the video
transmission even if the DSI IP is not shut down.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 62f7eb84ab01..7f2be490fcf8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 	return 0;
 }
 
+static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
+{
+	u32 status;
+	int ret;
+
+	/* Disable transmission in video mode. */
+	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_ACT),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to disable video transmission\n");
+		return;
+	}
+
+	/* Assert video FIFO clear. */
+	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_VFRDY),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
+		return;
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -601,6 +629,7 @@ static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
+	rcar_mipi_dsi_stop_video(dsi);
 	rcar_mipi_dsi_shutdown(dsi);
 	rcar_mipi_dsi_clk_disable(dsi);
 }
-- 
2.34.1

