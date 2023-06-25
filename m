Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA673D15E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 16:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9451310E177;
	Sun, 25 Jun 2023 14:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877E910E16E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 14:17:45 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 05121660712A;
 Sun, 25 Jun 2023 15:17:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687702662;
 bh=c6A/z4v0Vb7BYDRLc/MAHkq406/oHg3kcxtWC9wdQ3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LA7zpzp7vJYS0LTXXxzIiZ56k4vnlFfWuoYSJ2RPVZaY6exE91MztSG+76C9URTA2
 Gj/jLwEuyt948mFnJ8ifaAvTJMgEvJthuD+PWQxeyf2ehEp0G2v2MC2AzaiKisYbG2
 txDIi8Qt4Bg904IDo6AUL09+o7QcmpdHxZv48alBIsaB+5OVoVB8/zzULofDo1q4Ps
 z7fnDACgjbyhzWWih4gBFldy+JTK+pAue4LqqHWAxqOHJXXLDsroDtY21Oli/qYIMo
 5AxYLE/Pf4JN5X8SzlsRJ9E3Pjl8hkeuEb3tJfuYKomBeKr4aa421Dcb8rDqCex2nR
 bj4X41V0IDhwQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/3] drm/bridge: dw-hdmi: change YUV420 selection logic at
 clock setup
Date: Sun, 25 Jun 2023 15:17:15 +0100
Message-Id: <6230bfae2cd97cf6527fc62ba5c850464919ccf8.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
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

