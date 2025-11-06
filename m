Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C813C3D07D
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C125910E9A2;
	Thu,  6 Nov 2025 18:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsBd+cJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683D710E9A0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:11:40 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-3d56d0cb3dbso605364fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762452699; x=1763057499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5NgunL5KwvJK+2gOf+mj57OQ2fhqgmw6auCXGkvoKy8=;
 b=dsBd+cJousd6BwYe+JN2+MdfbMEog+6hhTlLuWn/zERkkWl6QNOb6bZXSu/F0UGxBd
 a6X9MOXfvLiL3hxQopaUTV2xb6KXRjNtab/0jcrsw4XOWRr51NZbAHacKdw4X3hM8vD3
 wv282nKEpWn8uZUbRchyCbpjUo7GMvUrh23pOmrp6Uasyu2P6+efnwF+e0uDhZ8gRaSn
 DTe9zw+kHV1JDYgdVsuDTunqB5G/yAi0BlRK8A/rMFVc2Vled4utfZYOUAoHAVbbSOtA
 wOMEBjpwmXWoMGd18xH4F6CvAZhfjJUghJssP34Ww6L5kzI8MZryhMJSLASippRUDTLc
 yKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762452699; x=1763057499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5NgunL5KwvJK+2gOf+mj57OQ2fhqgmw6auCXGkvoKy8=;
 b=AoCHvjCV+nVWouFESYvVhVulrSotezYcJ+yUSX2xdrtfUPU+kfUCJf+aCbX7G3iX2K
 K41urW+mwA8d7tUDM7BTaCiJ7iETJ9i67Xt1NnsHfY/9Fi4Wu3AmT1RmlLhxYj3Bdb5d
 ORsf0miU0rXKwq1J+P87Qb1JRB8abcApQ8jhYjHRXwU/yn/9MdZYL1MsbUoPM34rZwR5
 GthY883vg8ADsoSovEndJUa13qZMtiSYmBbpnTTTaBnm9jHy68vGET953Dy0CuKUbhl8
 fE065qTTlH/cCTrR4I1mCjaY/s+p7LZCrgfwV7WP4DcoBoeqSlEVvkInWRYycayk3mgB
 ODvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDFiJynJ6tj0WdwKw+BMONXyo/xLC3atRLPwL7QkkU0GH6xxY5J9n7sEivU5dQmuwIdrMFYdoOT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4BgAY+yVkBIkybcg3epuKTetc1rM7JM+OV99nlzQ04sEOwe7H
 UOrKAAnekspJ1xnzfUbMcBOr3ZmpwY5RiX+RkKWPxnjhbuG67PUreFLH
X-Gm-Gg: ASbGncsaRGzAudp49FG0U7nWe47ZO6Uy2cntQ+fPdZRxuicYQMCWOlRCTt7ONsDmXxz
 S5+tocI3FcnolhaIjAbTTJzFwRRgO/OLUfxKmYNYP0uM8mQb48ajRZ045BMrAlXJUgYIdOzvcFM
 wSJ9w3Jni0O9vlFM/8q5MFjsPt3r/Y90R6a4t4u/q+U2EY1AaHgd74iXvh+1gfSpL7jypukv8dj
 RwsjRQ97tQwKOgUTzOGXkaPqbsMQ37znzRFcgtUn2zbGsYqxNOLC8JEQ6yOZS3mUptY6aoG4aVM
 pHVqBa2PnlT3WDFK99ywU1x977L6H4eVni+phmVKDP3tpVh0dE2VcfpLMM68YR/eGvspXjuNe6I
 V8U6/vnNxnXJJUVdtgHfleIUin3Mu0FN6fW5iY5dA1WA1BWitl/YbiZjtu9Kg7C5ofh7pa5yUlp
 LjHJnG/0X1/JOMIJlHs8w=
X-Google-Smtp-Source: AGHT+IHma/9oT2QhA0Uh2NSevURHZ6LEIHNkUwqOc+ooh6n5wL5HT6VMsKbcFKmAmJ5kNfBQsS2VOA==
X-Received: by 2002:a05:6871:5b0c:b0:3d9:2fe2:f5c8 with SMTP id
 586e51a60fabf-3e41e608999mr373400fac.32.1762452699528; 
 Thu, 06 Nov 2025 10:11:39 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:41f9:c9d3:db30:c36a])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e41ed0aa06sm137739fac.8.2025.11.06.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 10:11:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, andy.yan@rock-chips.com, heiko@sntech.de,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Date: Thu,  6 Nov 2025 12:09:13 -0600
Message-ID: <20251106180914.768502-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106180914.768502-1-macroalpha82@gmail.com>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
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
change the error message to a debug message when we are unable to
complete an i2c read, as a disconnected device would otherwise fill
dmesg with i2c read errors.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 35 +++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c5..b221f797de3d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -145,6 +145,7 @@ struct dw_hdmi_qp {
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
+	bool no_hpd;
 };
 
 static void dw_hdmi_qp_write(struct dw_hdmi_qp *hdmi, unsigned int val,
@@ -520,6 +521,11 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 		i2c->is_regaddr = true;
 	}
 
+	/*
+	 * Mark errors as debug messages when using no_hpd so no device
+	 * attached does not fill up dmesg.
+	 */
+
 	while (length--) {
 		reinit_completion(&i2c->cmp);
 
@@ -535,14 +541,20 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *hdmi,
 
 		stat = wait_for_completion_timeout(&i2c->cmp, HZ / 10);
 		if (!stat) {
-			dev_err(hdmi->dev, "i2c read timed out\n");
+			if (hdmi->no_hpd)
+				dev_dbg(hdmi->dev, "i2c read timed out\n");
+			else
+				dev_err(hdmi->dev, "i2c read timed out\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EAGAIN;
 		}
 
 		/* Check for error condition on the bus */
 		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
-			dev_err(hdmi->dev, "i2c read error\n");
+			if (hdmi->no_hpd)
+				dev_dbg(hdmi->dev, "i2c read error\n");
+			else
+				dev_err(hdmi->dev, "i2c read error\n");
 			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
 			return -EIO;
 		}
@@ -879,6 +891,15 @@ static enum drm_connector_status
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
@@ -1074,12 +1095,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (of_property_present(pdev->dev.of_node, "no-hpd"))
+		hdmi->no_hpd = 1;
+	else
+		hdmi->no_hpd = 0;
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

