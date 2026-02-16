Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIgwJ5wVk2nq1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:03:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F276143940
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936C10E393;
	Mon, 16 Feb 2026 13:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QnHSAO8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92410E394;
 Mon, 16 Feb 2026 13:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771246993; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mAWObq6MZgJ36ToIxOtOeHBGuQQEqoD/NhcJjCl+LdP+3iQIhFFi6DlL20ObQZt13rEVtWlpKsnBlLANhf1H7hmp/iVTRYGkfoH2ocQCj7UxVB6HoAObCDbWNljZEVU0MbVf8dkNNwr0XDn0s99R64tnBGUxVHhhp9iPTAW+wcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771246993;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=L4TB1VZvZtMLKUs37afR6aj+cqotV2KSEgyNjdp9AC0=; 
 b=LxwFXJfQGhhTEl8Dc4cCNKnSUb6INmQLT6fxjKpRhOdbegbtvEyL9yKaZKtSnBSIqtBq7XXAsodHllL3RhX/1ktCSfXT5OPC6C3Ij7wx+9pcuqWXsMyzB1eJB+CDLPsAGrqGDgKtCVG5FmPC8xuISw0VoHJneuhxMp6MYwR8ruE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246993; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=L4TB1VZvZtMLKUs37afR6aj+cqotV2KSEgyNjdp9AC0=;
 b=QnHSAO8pYsKzoV16mt7Uwwf3HpGMSnzo2lnx6b9y8KVo/+sXO8AW/9pItxSZjbFs
 QfUTGzJLwZSeahb6h4/eiPD0XaQ/FiSJBUfTvkSOF2YR0Xs648o5jF+m/XB9UvkDyh+
 AHWSP50/BeuQD1OlXwhkTizk4usUX07cu/af1seY=
Received: by mx.zohomail.com with SMTPS id 177124699234966.93187605725814;
 Mon, 16 Feb 2026 05:03:12 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:27 +0100
Subject: [PATCH v8 13/20] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-13-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
In-Reply-To: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 4F276143940
X-Rspamd-Action: no action

The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
to recursively select a suitable output format in a bridge chain.

As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
formats determined by which formats the platform-specific integration of
the hardware supports, and the chosen HDMI output bit depth.

Implement this callback. The returned u32* buffer is supposed to be
freed by the caller of this callback, as specified by the callback's
documentation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 178 +++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index d649a1cf07f5..4c00218e5fd7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -749,6 +750,182 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
 	return adap;
 }
 
+static int dw_hdmi_qp_config_avi_infoframe(struct dw_hdmi_qp *hdmi,
+					   const u8 *buffer, size_t len)
+{
+	u32 val, i, j;
+
+	if (len != HDMI_INFOFRAME_SIZE(AVI)) {
+		dev_err(hdmi->dev, "failed to configure avi infoframe\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * DW HDMI QP IP uses a different byte format from standard AVI info
+	 * frames, though generally the bits are in the correct bytes.
+	 */
+	val = buffer[1] << 8 | buffer[2] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS0);
+
+	for (i = 0; i < 4; i++) {
+		for (j = 0; j < 4; j++) {
+			if (i * 4 + j >= 14)
+				break;
+			if (!j)
+				val = buffer[i * 4 + j + 3];
+			val |= buffer[i * 4 + j + 3] << (8 * j);
+		}
+
+		dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS1 + i * 4);
+	}
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
+
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
+		       PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
+static int dw_hdmi_qp_config_drm_infoframe(struct dw_hdmi_qp *hdmi,
+					   const u8 *buffer, size_t len)
+{
+	u32 val, i;
+
+	if (len != HDMI_INFOFRAME_SIZE(DRM)) {
+		dev_err(hdmi->dev, "failed to configure drm infoframe\n");
+		return -EINVAL;
+	}
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
+
+	val = buffer[1] << 8 | buffer[2] << 16;
+	dw_hdmi_qp_write(hdmi, val, PKT_DRMI_CONTENTS0);
+
+	for (i = 0; i <= buffer[2]; i++) {
+		if (i % 4 == 0)
+			val = buffer[3 + i];
+		val |= buffer[3 + i] << ((i % 4) * 8);
+
+		if ((i % 4 == 3) || i == buffer[2])
+			dw_hdmi_qp_write(hdmi, val,
+					 PKT_DRMI_CONTENTS1 + ((i / 4) * 4));
+	}
+
+	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_DRMI_TX_EN, PKTSCHED_DRMI_TX_EN,
+		       PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
+/*
+ * Static values documented in the TRM
+ * Different values are only used for debug purposes
+ */
+#define DW_HDMI_QP_AUDIO_INFOFRAME_HB1	0x1
+#define DW_HDMI_QP_AUDIO_INFOFRAME_HB2	0xa
+
+static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
+					     const u8 *buffer, size_t len)
+{
+	/*
+	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
+	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
+	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
+	 *
+	 * PB0: CheckSum
+	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
+	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
+	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
+	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
+	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
+	 * PB6~PB10: Reserved
+	 *
+	 * AUDI_CONTENTS0 default value defined by HDMI specification,
+	 * and shall only be changed for debug purposes.
+	 */
+	u32 header_bytes = (DW_HDMI_QP_AUDIO_INFOFRAME_HB1 << 8) |
+			  (DW_HDMI_QP_AUDIO_INFOFRAME_HB2 << 16);
+
+	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
+	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
+	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
+
+	/* Enable ACR, AUDI, AMD */
+	dw_hdmi_qp_mod(hdmi,
+		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
+		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
+		       PKTSCHED_PKT_EN);
+
+	/* Enable AUDS */
+	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
+
+	return 0;
+}
+
+static u32*
+dw_hdmi_qp_bridge_get_output_bus_fmts(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state,
+				      unsigned int *num_output_fmts)
+{
+	unsigned int num_fmts = 0;
+	u32 *out_fmts;
+
+	/*
+	 * bridge->supported_formats is a bit field of the HDMI_COLORSPACE_* enums.
+	 * These enums are defined by the HDMI standard, and currently top out at
+	 * 7. Consequently, BIT(7) is the highest bit that will be set here, unless
+	 * the standard runs out of reserved pixel formats. Therefore, hweight8()
+	 * will give an accurate count of how many bus formats we'll output.
+	 */
+	out_fmts = kmalloc_array(hweight8(bridge->supported_formats), sizeof(u32),
+				 GFP_KERNEL);
+	if (!out_fmts) {
+		*num_output_fmts = 0;
+		return NULL;
+	}
+
+	switch (conn_state->hdmi.output_bpc) {
+	case 12:
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_RGB))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+		break;
+	case 10:
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_RGB))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		break;
+	default:
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_RGB))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		if (bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		break;
+	}
+
+	*num_output_fmts = num_fmts;
+
+	return out_fmts;
+}
+
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_atomic_state *state)
 {
@@ -1192,6 +1369,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_get_output_bus_fmts = dw_hdmi_qp_bridge_get_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.53.0

