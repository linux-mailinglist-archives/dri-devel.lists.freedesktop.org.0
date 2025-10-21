Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADFBF5BE4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26910E2EF;
	Tue, 21 Oct 2025 10:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I/vScD0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4C910E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761041970;
 bh=2cSPcRcetu19nIiABMe7i4sAQC6sGYCknXIE9y1yPg4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I/vScD0RgKo6qV+1u18CpreOi5kY6DYeVZmAm5GSw7erjg8HIAw27q8SScgniCurG
 Eb2LIyztM/Sum8WHvABFjs90vI2qFlVW+K3+sef2yCYxkm4+bu6yR3YHmZ5TOh3ZJp
 he8N1EK3q+mt6j0vZCR/rb2eAF1hkG87JjYVDyeEjDkxBc8ZTEXzSm0IjzgqhfjTZI
 pW8tQXPYkAwi5RQ2iRcmgs+4wn9L55Apai/F9IoMb8wAOoZiEHo0DBaqQ2mt2sruf5
 r4OEMlF2D007Kfa2ANTUYDChuUCcQcZWLzIl7nnq0LvTVhIGFMFB1GL+cc7jS2GAfu
 WsSF/97ewgWWQ==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id DC98117E13A5;
 Tue, 21 Oct 2025 12:19:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:15 +0300
Subject: [PATCH v3 2/5] drm/bridge: dw-hdmi-qp: Handle platform supported
 formats and color depth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-2-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
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

Extend struct dw_hdmi_qp_plat_data to include the supported display
output formats and maximum bits per color channel.  When provided by the
platform driver, use them to setup the HDMI bridge accordingly.

Additionally, improve debug logging in dw_hdmi_qp_bridge_atomic_enable()
to also show the current HDMI output format and bpc.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 11 +++++++++--
 include/drm/bridge/dw_hdmi_qp.h              |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 4ba7b339eff6..fe4c026280f0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -868,8 +868,9 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI rate=%llu\n",
-			__func__, conn_state->hdmi.tmds_char_rate);
+		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
+			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	} else {
@@ -1287,6 +1288,12 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
 
+	if (plat_data->supported_formats)
+		hdmi->bridge.supported_formats = plat_data->supported_formats;
+
+	if (plat_data->max_bpc)
+		hdmi->bridge.max_bpc = plat_data->max_bpc;
+
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))
 		return ERR_CAST(hdmi->bridge.ddc);
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index 76ecf3130199..3f461f6b9bbf 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -25,6 +25,10 @@ struct dw_hdmi_qp_plat_data {
 	int main_irq;
 	int cec_irq;
 	unsigned long ref_clk_rate;
+	/* Supported output formats: bitmask of @hdmi_colorspace */
+	unsigned int supported_formats;
+	/* Maximum bits per color channel: 8, 10 or 12 */
+	unsigned int max_bpc;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.51.0

