Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHIjLvTuoWm5xQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:22:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB21BCAC3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8D110EC10;
	Fri, 27 Feb 2026 19:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XX0dXOB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EFE10EC0A;
 Fri, 27 Feb 2026 19:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772220135; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZIUg+weCXCAscP9WCV8HepPF0KiXQgyiJ1Zla1g5iKv8+vYfwjlPyqDN3B+EanSH64lx+ZYEtfsi8dgn/iccZCuOufnG7pYzR9mMYGmoWZbGx2Kk8sRdVLvOrNhgcISdrqycX98ezjpxOXRtQWPgTIoNweVBOzLbD7wKi9+WoOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772220135;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aAKo1twm4zvOU57OmqnMmeCHmOgUWQwHKdY/derPNZ0=; 
 b=OBAq2jze4z2WoiOacfWhIFL1eDHgTyyRtmoRYmMlorZ4ewOFetSyWw7UJ46a75yyz2/lqaupApBBIkonP1XUPWxrzZ71PD3cf4J71GUNVtMs1JGm0b8d9L3549+iikdHpnwTJXVILZNEM1oQFp3lrPX7iwyR5+o/7HLFx4ccacw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220135; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=aAKo1twm4zvOU57OmqnMmeCHmOgUWQwHKdY/derPNZ0=;
 b=XX0dXOB2d5m8mnM4KRsdjdgfN6BRmSJ0lwyrc1pbi6K8NueBsXtmMBtuLIQ5wfJH
 sT6FopKtjTow9lm9vPo66jbeL3XzsjkYjNAs17YDI/VHRAStYJzrBTG6ryGFgFw/lBL
 1TVHMCP8D49HxEPnDU5fT4MXaCHsp3ugno6Vhwrw=
Received: by mx.zohomail.com with SMTPS id 177222013309246.87188588056961;
 Fri, 27 Feb 2026 11:22:13 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:18 +0100
Subject: [PATCH v9 13/19] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-13-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5DBB21BCAC3
X-Rspamd-Action: no action

Switch between requested color formats by setting the right bus formats,
configuring the VO GRF registers, and setting the right output mode.

To do this, the encoder's atomic_check queries the bus format of the
first bridge, which was determined by the bridge chain recursive format
selection. Pick the input format if it's !FIXED, otherwise, pick the
output format.

The previously unused GRF register color format defines are redone as
well. Both RK3588 and RK3576 use the same defines; it didn't look like
this as there was a typo in the previously (unused) definition.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 107 ++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 1a09bcc96c3e..e2fa1aa53394 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -43,10 +44,6 @@
 #define RK3576_8BPC			0x0
 #define RK3576_10BPC			0x6
 #define RK3576_COLOR_FORMAT_MASK	GENMASK(7, 4)
-#define RK3576_RGB			0x9
-#define RK3576_YUV422			0x1
-#define RK3576_YUV444			0x2
-#define RK3576_YUV420			0x3
 #define RK3576_CECIN_MASK		BIT(3)
 
 #define RK3576_VO0_GRF_SOC_CON14	0x0038
@@ -74,8 +71,6 @@
 #define RK3588_8BPC			0x0
 #define RK3588_10BPC			0x6
 #define RK3588_COLOR_FORMAT_MASK	GENMASK(3, 0)
-#define RK3588_RGB			0x0
-#define RK3588_YUV420			0x3
 #define RK3588_SCLIN_MASK		BIT(9)
 #define RK3588_SDAIN_MASK		BIT(10)
 #define RK3588_MODE_MASK		BIT(11)
@@ -87,6 +82,11 @@
 #define HOTPLUG_DEBOUNCE_MS		150
 #define MAX_HDMI_PORT_NUM		2
 
+#define RK_COLOR_FMT_RGB		0x0
+#define RK_COLOR_FMT_YUV422		0x1
+#define RK_COLOR_FMT_YUV444		0x2
+#define RK_COLOR_FMT_YUV420		0x3
+
 struct rockchip_hdmi_qp {
 	struct device *dev;
 	struct regmap *regmap;
@@ -115,6 +115,33 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 	return container_of(rkencoder, struct rockchip_hdmi_qp, encoder);
 }
 
+/**
+ * dw_hdmi_qp_rockchip_bus_fmt_to_reg - converts a bus format to a GRF reg value
+ * @bus_fmt: One of the MEDIA_BUS_FMT_s allowed by this driver's atomic_check
+ *
+ * Returns: an unshifted value to be written to the COLOR_FORMAT GRF register
+ * on success, or %-EINVAL if the bus format is not supported.
+ */
+static int __pure dw_hdmi_qp_rockchip_bus_fmt_to_reg(u32 bus_fmt)
+{
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		return RK_COLOR_FMT_RGB;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		return RK_COLOR_FMT_YUV422;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		return RK_COLOR_FMT_YUV444;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return RK_COLOR_FMT_YUV420;
+	}
+
+	return -EINVAL;
+}
+
 static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
@@ -130,29 +157,83 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 		hdmi->ctrl_ops->enc_init(hdmi, to_rockchip_crtc_state(crtc->state));
 }
 
+/**
+ * dw_hdmi_qp_rockchip_get_vop_format - get the bus format VOP should output
+ * @encoder: pointer to a &struct drm_encoder
+ * @conn_state: pointer to the current atomic &struct drm_connector_state
+ *
+ * Determines which bus format the Rockchip video processor should output as
+ * to feed into the bridge chain.
+ *
+ * Returns a MEDIA_BUS_FMT_* on success, or %0 on error.
+ */
+static u32 dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
+					      struct drm_connector_state *conn_state)
+{
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
+	struct drm_bridge_state *bstate;
+
+	bridge = drm_bridge_chain_get_first_bridge(encoder);
+	if (!bridge)
+		return 0;
+
+	bstate = drm_atomic_get_bridge_state(conn_state->state, bridge);
+	if (!bstate)
+		return 0;
+
+	if (bstate->input_bus_cfg.format != MEDIA_BUS_FMT_FIXED)
+		return bstate->input_bus_cfg.format;
+
+	return bstate->output_bus_cfg.format;
+}
+
 static int
 dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
-	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	union phy_configure_opts phy_cfg = {};
+	u32 ingest_fmt;
 	int ret;
 
+	ingest_fmt = dw_hdmi_qp_rockchip_get_vop_format(encoder, conn_state);
+	if (!ingest_fmt)
+		return -EINVAL;
+
 	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate &&
-	    s->output_bpc == conn_state->hdmi.output_bpc)
+	    s->output_bpc == conn_state->hdmi.output_bpc &&
+	    s->bus_format == ingest_fmt)
 		return 0;
 
+	switch (ingest_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
+		break;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV420;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
 		s->output_bpc = conn_state->hdmi.output_bpc;
+		s->bus_format = ingest_fmt;
 	} else {
 		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
 	}
@@ -382,6 +463,7 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
 				       struct rockchip_crtc_state *state)
 {
+	int color = dw_hdmi_qp_rockchip_bus_fmt_to_reg(state->bus_format);
 	u32 val;
 
 	if (state->output_bpc == 10)
@@ -389,12 +471,16 @@ static void dw_hdmi_qp_rk3576_enc_init(struct rockchip_hdmi_qp *hdmi,
 	else
 		val = FIELD_PREP_WM16(RK3576_COLOR_DEPTH_MASK, RK3576_8BPC);
 
+	if (likely(color >= 0))
+		val |= FIELD_PREP_WM16(RK3576_COLOR_FORMAT_MASK, color);
+
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON8, val);
 }
 
 static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
 				       struct rockchip_crtc_state *state)
 {
+	int color = dw_hdmi_qp_rockchip_bus_fmt_to_reg(state->bus_format);
 	u32 val;
 
 	if (state->output_bpc == 10)
@@ -402,6 +488,9 @@ static void dw_hdmi_qp_rk3588_enc_init(struct rockchip_hdmi_qp *hdmi,
 	else
 		val = FIELD_PREP_WM16(RK3588_COLOR_DEPTH_MASK, RK3588_8BPC);
 
+	if (likely(color >= 0))
+		val |= FIELD_PREP_WM16(RK3588_COLOR_FORMAT_MASK, color);
+
 	regmap_write(hdmi->vo_regmap,
 		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
 		     val);

-- 
2.53.0

