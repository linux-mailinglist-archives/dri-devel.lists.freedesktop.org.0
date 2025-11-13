Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA479C59C11
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD810E92A;
	Thu, 13 Nov 2025 19:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMM6r5uR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD9910E927
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:32:12 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7c6d1ebb0c4so905227a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763062331; x=1763667131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjY5bSDF/34na4x5qJa/vBhMjZyyo09Xbv/ulTjTfew=;
 b=aMM6r5uRRWuZNsLS9HbxfILt+aYLP5R4e3MJPzFiA6D7AgBguNKSPaqmlsWSrSeKqP
 1ih5QbTWyeYwlR6KVlIEJCghXmnEnuoCNFPrDliGZgC3iK/9uv5vG/OhQX3mf+W1zwpJ
 cOWD5fX2uJIxXyTLZKVwdavqJtuWBsa+vQ0018mKtD43tSAUxvzNKxGXxjkf9Q2xomdR
 wZLdRik9vrlu5VmZ3aCR7upiLYHI57FdyyhLWVxUxWJQT9tlfhP2xA7fd2ArkoaqXB53
 XNJLOGa8leV6ZqemXQHyIk/oJ6hecTC5nEIQgQAjQcnBiQAjnB5nAb2mHFnn52qgkjrk
 qW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763062331; x=1763667131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WjY5bSDF/34na4x5qJa/vBhMjZyyo09Xbv/ulTjTfew=;
 b=vBd/W4Olo9N2BVuqIdQkCsZXwsvQMFAJtjfx+mY/Rk7QX2vi9h/0fOEobPiCwEo6mt
 ySrI5IT2/NcYpJuYq8srfac3wzNagtb0ofWbjrdGzwHXtZeX3799M5boEPCLwC+3JtYO
 JIQmiJCS4vHf+chW5Z1Qzd1FaPEyFUXqDzC98HdG4GlruHhBtR6Y5b63lhHOhHx1fKi9
 v9PxDNXhnWvgH9xKMQGRadp8eHNPIAkJyjHOfHWKXdqvO+ZiR4fOkG8gS32LZtwVtxts
 rzXbDxhROqSUE9m1LU6PrRsagFI088r8p/zJH3bGeBfjrwKUdAxNbs0zKbeQUQc9GWsD
 dHuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSChaOU51GgzUUQxjcy3DL+T69LzEgpmf8TGDsBk6t2LS7+bWjVzqRe4AjkTGFqX4jYN5XskYDRAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4YNOgkqhtHshm8+zkgBIrCoErugMaTE657Vy1M37VYxcPaexZ
 aZGZt9WZwFB5QQ0h2uKMhchqjBY/lRi8fkYRAP8Z47bF3BCp8/kUUFZI
X-Gm-Gg: ASbGnct1UtZNPTeunQ555bANkIJ8MbLOpTXBzOwfEiMyT0DAInJXPSQ5NrHriDhBB1n
 hwDEZzBhNMEz5AhiIXa0p0YiAi3ErcKHsMz3s7o/UdFueP010hLMR8B6VXaTdXbYgUPdRIP1Z//
 7FsthB0Wo2M9pVANnI2nbR/Z7LPQOEa126S/mLfDENgG80dux9u9ScQCyuElTfXxxSO0g45Giet
 SImjYsn+O6h5dBzLJyljExwq/wz7pxz1FhYMNPFWNTxVqFjZkqBK7Gh0aYJc7LlZjczbTl+prtA
 onBZz+wr83phodDcmbsWGumjh+R8AOmCA87y+fyXPBeScGh89K0n7Ki5gZeKgBp9LQJZ9WOCJeo
 zMj6p7RzSsNG045FBfJR2IvlF4+Qp1z5fDFykaIx2+tHZhVlSkn8QlKm3Znz6Er48IcsVQnDE9b
 L6zi5ckgcx
X-Google-Smtp-Source: AGHT+IEN0ly3jkiturhspnw+/Ap8OVCxuw6kbAXWdNt7i/HmMqvW9s6jce50wrIfcbraP1DJ8sELaQ==
X-Received: by 2002:a05:6830:3690:b0:7ae:dbc5:4705 with SMTP id
 46e09a7af769-7c744505ddamr468309a34.27.1763062331474; 
 Thu, 13 Nov 2025 11:32:11 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c73a392fa5sm1693527a34.19.2025.11.13.11.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 11:32:10 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Date: Thu, 13 Nov 2025 13:29:38 -0600
Message-ID: <20251113192939.30031-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113192939.30031-1-macroalpha82@gmail.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 32 +++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c5..a2b1a4821714 100644
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
@@ -1074,12 +1095,15 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
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

