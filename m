Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF0A8D6FFC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18E10E0FD;
	Sat,  1 Jun 2024 13:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pO6OX9Oj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FACA10E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717247582;
 bh=Potzyhce4Kbwz3ncwPjojzHRgtcLidd3K5wALNG0/oc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pO6OX9OjOlVw2zgG4UMuwGPgr5eFHKPkM6BxwVf91cGAoBdeHPp/mHCOh5y209HHc
 DE/TQtHE4PRl4TxnlN1oiKNv5ZHIa726dDR14f3edfE3W6DNBCXMkuF1lE6rwH5Ep4
 zlG/G0IjilZe1HjP23lAhe7sXxlGRBNwtMIFQTQ1gI0hzbAhRcPerXFXqHVwsW6si0
 AgW2jfWvrByf50eA/ftQEKmYSkWCJYYKT8kWH7N/LTwByntz/LlU8ugj5hn0m9erkH
 4lbGM38X9d/wKUw8HGngoK2qTrPdcOejSgfGkVgyplAK4NsIU1G6Ca+XK0tWEsjRQg
 utPcLRCnIjZPg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 02CEF37821EC;
 Sat,  1 Jun 2024 13:13:02 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 01 Jun 2024 16:12:25 +0300
Subject: [PATCH 03/14] drm/bridge: dw-hdmi: Commonize dw_hdmi_i2c_adapter()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-b4-rk3588-bridge-upstream-v1-3-f6203753232b@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14-dev-f7c49
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

In preparation to add support for the HDMI 2.1 Quad-Pixel TX Controller
and minimize code duplication, export dw_hdmi_i2c_adapter() while adding
a new parameter to allow using a different i2c_algorithm.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h | 2 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
index 28e26ac142e6..ffd2ee16466c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h
@@ -146,6 +146,8 @@ struct dw_hdmi {
 };
 
 void dw_handle_plugged_change(struct dw_hdmi *hdmi, bool plugged);
+struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi,
+					const struct i2c_algorithm *algo);
 bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi,
 			  const struct drm_display_info *display);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b66877771f56..5dd0e2bc080d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -376,7 +376,8 @@ static const struct i2c_algorithm dw_hdmi_algorithm = {
 	.functionality	= dw_hdmi_i2c_func,
 };
 
-static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
+struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi,
+					const struct i2c_algorithm *algo)
 {
 	struct i2c_adapter *adap;
 	struct dw_hdmi_i2c *i2c;
@@ -392,7 +393,7 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	adap = &i2c->adap;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
-	adap->algo = &dw_hdmi_algorithm;
+	adap->algo = algo ? algo : &dw_hdmi_algorithm;
 	strscpy(adap->name, "DesignWare HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
@@ -409,6 +410,7 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 
 	return adap;
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_i2c_adapter);
 
 static void hdmi_set_cts_n(struct dw_hdmi *hdmi, unsigned int cts,
 			   unsigned int n)
@@ -3373,7 +3375,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			}
 		}
 
-		hdmi->ddc = dw_hdmi_i2c_adapter(hdmi);
+		hdmi->ddc = dw_hdmi_i2c_adapter(hdmi, NULL);
 		if (IS_ERR(hdmi->ddc))
 			hdmi->ddc = NULL;
 	}

-- 
2.45.0

