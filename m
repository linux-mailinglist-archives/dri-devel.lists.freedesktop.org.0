Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC80C7165D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C310E6A6;
	Wed, 19 Nov 2025 22:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3zBMtiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58F210E26D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 22:57:57 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-3ec5df386acso104578fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763593077; x=1764197877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6LGAGBP9c6FoKoEIEPE5MCGiUaAlb4W0quePS5bYZY=;
 b=f3zBMtiYJiBV2sptEzUmx8nsocpuD20v+tL4JlzHSXZmEXx4HP2VIGYL11XpSbOMfJ
 4+BZMo/u89eusYaSZIWcg+ROKQTGuaAb6ut40GC+NHmrCT3cSnxKoGt4chDCX9GPi2xa
 QHvgeBXgQqfacrIebroma33wiYaBkyExhPsnX2fwZNrL6fU9Z0fTn67aFOa+CJTWGoSS
 UbspJMRz7ziB/p1zFu0A5GkwDERBoz0ukeV+Vmc0v+6Wq7SklE3oYD7iTddJkOe0AKAp
 hr6ZBEYRN+GLUaNx3lGVF7cuoZ3ZApbxS0AKMXES8zfEw4LqkppS8bLwM6CD40JjIqCq
 8vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763593077; x=1764197877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y6LGAGBP9c6FoKoEIEPE5MCGiUaAlb4W0quePS5bYZY=;
 b=B4WnzPJf3C/fsNRdE5U5c9TUYhY4xVt/WKsdAyEoHqnkOHslv7GuWUOjyySN3KMGzN
 IrLhZ3cG2ivFJ4B3/1cLQLqS5bONslcrD+gawH88QX/Yj/3b191l5/7EJRnCItmq98fm
 +mToiFb1UIFO5+qIa9v1weMACItMKNhx4UpswTbFRMw4fnSxY6VC6GbAKUxnDTJDabb7
 KLRXhWIU0X3NfblCQZ+IE8K9zx2DbtHPbGHpjJkFhNRdPun0mL4w1bEehHKaQIAAPKxJ
 3EdzAlLdJxB6NMqynp3fzw2j7U18VMQFGl8bjZ5/c18x8CRVYveiItmmVMSNIxa+ZQTg
 DaLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa/qtNDr11c6TtigfzLzi1Ga5wxRnngJMOrUGb1kCAONXBOkxd2RuK2hSYeL5JPUMCl5qCoEttxLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTco1UcIIemCPPj7nAIpyzBaCXAThq3u7aKPO3sVUBNlzY9R9a
 NMDsQZu0vRx9GGINAoYHvBMMG6gvYWEqAw9PCuiiO6/auejqlHTH2nvR
X-Gm-Gg: ASbGnctStr3TlCJcU5bUHZriOTp/mvu9Z/Np+LlJPDmyxnyWVAaEMOQ0lUp+3CZbAyu
 VfhHxPUHKzENltS8o5OVk1WXdVbwcmDnVl+0fx7U/sdNzRuHiwiuXI8nqfTnmBZnpOkQnSjlKwJ
 zP9sEY9TZ/KxhAdrltnxDQeGkUYnWxA1FVuZkVAJBqdtj/ImPp1EniktAM2oiak6DJw/VvHW/gQ
 dna9mhzUiJ3x2VTcWMFqOrMgZWndLEB6PJH53RQwRGsMwM/mH4nNgEkzhMTargHmyv+PkeZUdAE
 eUTHq4MNbGo+lJh5B/LNyVlIe53CAk/IIim5frjfQIaaQtzlS10PMQ94g0QZG6e1OUJbfWT8ZvF
 /gEatkP2FQsOrnDJaKtVfMGhUP82a6cJvpsYv/hCvf6dFgUInPtgcJXYRs9x2ewpt+LX2QmEe9R
 M7Edow84tg5oaF41tp1rk=
X-Google-Smtp-Source: AGHT+IFytu07GZ0leAT27e/jZkgFSTcxqNaPPUdMxf5ufIH3je+/bC9NW+Gg2lNinpphG6lYgT/JCg==
X-Received: by 2002:a05:6870:80cb:b0:3ec:343c:8db7 with SMTP id
 586e51a60fabf-3ec9a3332f7mr514455fac.5.1763593077107; 
 Wed, 19 Nov 2025 14:57:57 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ec9dcfe28csm346496fac.22.2025.11.19.14.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 14:57:56 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Date: Wed, 19 Nov 2025 16:55:25 -0600
Message-ID: <20251119225526.70588-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119225526.70588-1-macroalpha82@gmail.com>
References: <20251119225526.70588-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the dw-hdmi-qp driver to handle devices with missing
HPD pins.

Since in this situation we are now polling for the EDID data via i2c
change the error message to a rate limited debug message when we are
unable to complete an i2c read, as a disconnected device would
otherwise fill dmesg with i2c read errors.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 34 +++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c5..929b2e95a5c5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -145,6 +145,7 @@ struct dw_hdmi_qp {
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
+	bool no_hpd;
 };
 
 static void dw_hdmi_qp_write(struct dw_hdmi_qp *hdmi, unsigned int val,
@@ -535,14 +536,22 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 
 		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
 		if (!stat) {
-			dev_err(hdmi->dev, "i2c read timed out\n");
+			if (hdmi->no_hpd)
+				dev_dbg_ratelimited(hdmi->dev,
+						    "i2c read timed out\n");
+			else
+				dev_err(hdmi->dev, "i2c read timed out\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EAGAIN;
 		}
 
 		/* Check for error condition on the bus */
 		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
-			dev_err(hdmi->dev, "i2c read error\n");
+			if (hdmi->no_hpd)
+				dev_dbg_ratelimited(hdmi->dev,
+						    "i2c read error\n");
+			else
+				dev_err(hdmi->dev, "i2c read error\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EIO;
 		}
@@ -879,6 +888,15 @@ static enum drm_connector_status
 dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
+	const struct drm_edid *drm_edid;
+
+	if (hdmi->no_hpd) {
+		drm_edid = drm_edid_read_ddc(connector, bridge->ddc);
+		if (drm_edid)
+			return connector_status_connected;
+		else
+			return connector_status_disconnected;
+	}
 
 	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
 }
@@ -904,6 +922,11 @@ dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
+	/*
+	 * TODO: when hdmi->no_hpd is 1 we must not support modes that
+	 * require scrambling, including every mode with a clock above
+	 * HDMI14_MAX_TMDSCLK.
+	 */
 	if (rate > HDMI14_MAX_TMDSCLK) {
 		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
@@ -1074,12 +1097,15 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	hdmi->no_hpd = device_property_read_bool(dev, "no-hpd");
+
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
-			   DRM_BRIDGE_OP_HDMI_AUDIO |
-			   DRM_BRIDGE_OP_HPD;
+			   DRM_BRIDGE_OP_HDMI_AUDIO;
+	if (!hdmi->no_hpd)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
-- 
2.43.0

