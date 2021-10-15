Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06A42F4DE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2013D6EDB3;
	Fri, 15 Oct 2021 14:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B056EDAE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:11:13 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i12so26729712wrb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNc+IrE+4SO33Ds9wqRQl0pqGwosqKnED8f9gFIZ4qQ=;
 b=ii/N0EDnzOkrKs/pLaT5341E1ELOW/NSh/QLgMhAmB4oAdayiABBYcg/zMf484t5Em
 CCyU8tyYUxOWe/Nx3rzS0CEjYKqpxsaVI8ezwhIvrxGhrUTTynoqKNqygoEmOsP2C1N7
 R+7lnWs+W9/HRPJmkPZH28m0InwWttOQZ8Tv2tazXdPXCqGkqoBzbyucxyqTJWAQ/baz
 al4yE6z3fBLX7tLghBtRchtRtexvr1/iGbuDSCq5a02ZFNFTeAPdo8EfPt5beKS4R+uJ
 p0OaifHx9nEOXKsvm8B9PJlPBmWpJDI84mtZ2YIE9oPeyB3YkQ/XdRmIf10BYDGG31A1
 ROgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNc+IrE+4SO33Ds9wqRQl0pqGwosqKnED8f9gFIZ4qQ=;
 b=T9Xow3eO6c+a4HUOo9jZsaKCDGBAmHFfubVkZ0F/QYovjjI6DZ120UNW4uTU/Ej8al
 W48D2I5A7Stntak5sKYWFa16zZuz/DWhleVI9Uhaay/ZZ94PPM0FYSUxoyFGwH2k1896
 IzRrT2VWEtcZYFbFixEDED6/S7788g2w4i7oF265GlUJWZwh4BBke+sTo5VSBPLJY661
 N5ru+1TECPudd4D2++5MnFw4KQ4n9aksPY2nxxMdTcxbCeT9x1v0I/TA0kiLaaGw3TMf
 d7Y2sC7gTB1ubaKhpNqmUxmrya8wtqyYVPszTDNuIOJKGEQYyz2zJuoduTOtweZ0EW9b
 x6lg==
X-Gm-Message-State: AOAM53138Ux/Ob88+FcaXNEjUhOhIcXo/o7gLWlhNFtPTvhuv5IyrSSV
 BVucSjtOG7+b5fK8hsNu26h0/Q==
X-Google-Smtp-Source: ABdhPJxxLntoM5mppkbn8Jg8G07g1qxSaGe585F+ydD0mZuRtwtrrTdYYzVVlh7PG/KhUsTOsD8KCg==
X-Received: by 2002:adf:b350:: with SMTP id k16mr14528710wrd.368.1634307071646; 
 Fri, 15 Oct 2021 07:11:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/6] drm/bridge: display-connector: implement bus fmts
 callbacks
Date: Fri, 15 Oct 2021 16:11:02 +0200
Message-Id: <20211015141107.2430800-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015141107.2430800-1-narmstrong@baylibre.com>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053; h=from:subject;
 bh=ZaTrpeiEqqaaclH17vTiRNAhyUGCyF81N0KiKn9lflo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYokCdfjx5c+XeC3VOSgmFhN4Wi6IIA5tNLXd6l9
 J94s5laJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKJAAKCRB33NvayMhJ0Wb3D/
 9QqtnEs4K3DxlXI82aHS/Wcdk0FZGrIgKjax6aA2rlAuiHxOeEdFkBVqGwHnvIvkC2FBPLUbrPedsj
 SavjcpqOBPP9aA55gfvZER4qwQl8dEW5tHIvBSIf86aIPc7XJM6KI6gjcm7arJyVANOlMOrz/LTN9/
 O2S4r7Hp/suzwI8ZLHSlhkLmKU6EFWfZuKW8S35YkQaF1GpiOfCCknP1j2EmZqGxRZv4qW+K1jI7Iw
 Founu+kSvljNV5FgcUfsL39fIblg8dThlumFZcLv3rdWre006ClHIHE3lFMkxAqodKV9eHqIBwaOAR
 d7ZUpwGAyaHrYNvcRrgwAGvTS3mQyfA7YQC0VDeooL48Y0zyJMQgnuQCFZoFRFbgfpxGD+EAczOTvU
 3oGCVozd8+rtdRantHPwMp3+uocEeIcZZ+/7Bow6vuhO7TNcCruyoqGblx985lRqvNtAxo/0Is/+pd
 sV3fnagxwHAjumfFDIOn8cELSfzr9yh882m+2sbtpHDpjgzvwytN4sE0veth+btnKeLCDdHxie6aMH
 of1srAeHX3E4N+c+DcAiiHj6In3SyssZg+/LjWf871cDGBZiBmkS/rn4Hvg+2gMI025YRsL8Rw/4PJ
 wL9WBl0/IQgFgBt0PT1xE9wp5DWS4QpW3Ogghzurut6Ud5b291yfsiceHm1w==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Since this bridge is tied to the connector, it acts like a passthrough,
so concerning the output & input bus formats, either pass the bus formats from the
previous bridge or return fallback data like done in the bridge function:
drm_atomic_bridge_chain_select_bus_fmts() & select_bus_fmt_recursive.

This permits avoiding skipping the negociation if the remaining bridge chain has
all the bits in place.

Without this bus fmt negociation breaks on drm/meson HDMI pipeline when attaching
dw-hdmi with DRM_BRIDGE_ATTACH_NO_CONNECTOR, because the last bridge of the
display-connector doesn't implement buf fmt callbacks and MEDIA_BUS_FMT_FIXED
is used leading to select an unsupported default bus format from dw-hdmi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 847a0dce7f1d..d24f5b90feab 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 
@@ -87,10 +88,95 @@ static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
 	return drm_get_edid(connector, conn->bridge.ddc);
 }
 
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the output bus formats, either pass the bus formats from the
+ * previous bridge or return fallback data like done in the bridge function:
+ * drm_atomic_bridge_chain_select_bus_fmts().
+ * This supports negotiation if the bridge chain has all bits in place.
+ */
+static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_output_bus_fmts) {
+		struct drm_connector *conn = conn_state->connector;
+		u32 *out_bus_fmts;
+
+		*num_output_fmts = 1;
+		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
+		if (!out_bus_fmts)
+			return NULL;
+
+		if (conn->display_info.num_bus_formats &&
+		    conn->display_info.bus_formats)
+			out_bus_fmts[0] = conn->display_info.bus_formats[0];
+		else
+			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return out_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_output_bus_fmts(prev_bridge, prev_bridge_state,
+							      crtc_state, conn_state,
+							      num_output_fmts);
+}
+
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the input bus formats, either pass the bus formats from the
+ * previous bridge or MEDIA_BUS_FMT_FIXED (like select_bus_fmt_recursive())
+ * when atomic_get_input_bus_fmts is not supported.
+ * This supports negotiation if the bridge chain has all bits in place.
+ */
+static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
+		u32 *in_bus_fmts;
+
+		*num_input_fmts = 1;
+		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
+		if (!in_bus_fmts)
+			return NULL;
+
+		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return in_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
+							     crtc_state, conn_state, output_fmt,
+							     num_input_fmts);
+}
+
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
 	.detect = display_connector_detect,
 	.get_edid = display_connector_get_edid,
+	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
-- 
2.25.1

