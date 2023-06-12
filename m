Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4DB72C2C3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BF810E210;
	Mon, 12 Jun 2023 11:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6587610E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CBE66003AF;
 Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686569040;
 bh=1yMYjJpUmHOhxy9R4rRNyrik2fSSdpVqcKiFzvtx4yk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZY+cawUmLKjtJrnrlP4lrAs0A9eXlotbQBkBnrc5TuTaNc9ywRIDI8ujyxjQZEBZj
 BEzJX+d/bFlExAP4lUAsP3XQ6sI88Y4FsatNgJbn5WOSO4QZnzKMSB9JR5jfOD9dFn
 7oJxCGKrCYZ7RCuyIKbmEQn4fTiF+Eb5bnsnq5/lcZRszQZK9a0ci4D7qvbaP6EXHi
 /Xk4k3cuMdTIm3aDuem3bXbiq/JDDPZ7K155BKbwLFVylFWuCBM4N75UByyipJl6wK
 ZaiG3e1uLXY7c+sAGMraRFdnf1gl88aXSMNUI/jjwGQB4VZ7Mh0ElP/hAmoL2QZ6H0
 7twRHJftb2W5w==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Subject: [PATCH v2 1/3] drm/meson: dw-hdmi: change YUV420 selection logic at
 clock setup
Date: Mon, 12 Jun 2023 12:23:52 +0100
Message-Id: <20230612112354.4034489-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now clocking value selection code is prioritising RGB, YUV444 modes
over YUV420 for HDMI2 sinks. However, because of the bus format selection
procedure in dw-hdmi, for HDMI2 sinks YUV420 is the format that will always
be picked during the drm bridge chain check stage.

Later on dw_hdmi_setup will configure a colour space based on the bus
format that doesn't match the pixel value we had calculated as described
above.

Fix it by bringing back dw-hdmi bus format check when picking the right
pixel clock.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 4 ++--
 include/drm/bridge/dw_hdmi.h              | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3b40e0fdca5c..e6a456b72610 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3346,6 +3346,12 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 	return 0;
 }
 
+bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi)
+{
+	return hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_bus_fmt_is_420);
+
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			      const struct dw_hdmi_plat_data *plat_data)
 {
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 3d046878ce6c..b49bb0d86efe 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -379,8 +379,8 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 			 mode->clock > 340000 ? 40 : 10);
 
 	if (drm_mode_is_420_only(display, mode) ||
-	    (!is_hdmi2_sink &&
-	     drm_mode_is_420_also(display, mode)))
+	    (!is_hdmi2_sink && drm_mode_is_420_also(display, mode)) ||
+	    dw_hdmi_bus_fmt_is_420(hdmi))
 		mode_is_420 = true;
 
 	/* Enable clocks */
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index f668e75fbabe..6a46baa0737c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -206,4 +206,6 @@ void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
 			    bool force, bool disabled, bool rxsense);
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
+bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
+
 #endif /* __IMX_HDMI_H__ */
-- 
2.40.0

