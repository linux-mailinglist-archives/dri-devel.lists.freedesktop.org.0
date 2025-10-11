Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD26BCF90D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41BC10E327;
	Sat, 11 Oct 2025 17:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Hv+mgUvx";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="brkdXaII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2430F10E325
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:34 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLX6r0Hz9spd;
 Sat, 11 Oct 2025 19:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV/qyG9vDb+LB23XSMaQgIBpcX9H0uHItNjlEfUTKIU=;
 b=Hv+mgUvxdIM1lUXd9wCBp8Zbpkhsw8IOnQ+5Z5zTMkt9a96ZDbWjzjx91hjipqSOphPBd6
 RuV1u72MAxtf/dZYqBGrmtheqEqBoMiUkZPMQsJdFGfyuxl0XF5urembVtiKgYdhGqeXA/
 ehLzUeULzA+50bGYRYKwOoDKkKxETkdY4FChSEqKKQQdW0yTokIeVjEUrxk7mRO8syCUq0
 9kSJPdTBE3mJT+sHq9D2v9PGluJkYb3TwO4GOAnRngcGthm/LNPT4tqTS6HN2i50ggvCkx
 Dm8Wr+gTdcLSNwK0Z3L/+xBdp282B4iBepGdGSvZehiRKT/Fg1i9yAykMEMmXw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV/qyG9vDb+LB23XSMaQgIBpcX9H0uHItNjlEfUTKIU=;
 b=brkdXaIIvSlhvOalFAd0af2iWRhLkJ5AT/BYj7gy9P8nhSK4bqjGSNoGBfFaMsRmRDgAsL
 JTHjsjYXUZl5BDfFs5uY6JakcCo5yNad9ybyipQWgyJb2xsxTIg7VqQvqa/7DivQo4qYFv
 FvTwWXVpnt+w1AnoXSfa81WdkiX+4r0TsUsEESjr6QFzja1AzagUiFpliXRGvR0TSOdNH0
 a7RUogHkpTstlWAFQX3GXxLYqT+PsVUCbS923bxvOCArtrGZ6rBPpnhINxwDtHFXQgeq/C
 5jRNTxqBJKZykGzzXuqtZq+OHBIDFwycJi7izR9b403RRhKO+heHFPh/eQAb3g==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 14/39] drm/imx: dc: fu: Inline FRAC_OFFSET into FetchLayer and
 FetchWrap
Date: Sat, 11 Oct 2025 18:51:29 +0200
Message-ID: <20251011170213.128907-15-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gbi86qkmuend4t47n6modi9q5n79f1k1
X-MBO-RS-ID: 12dafd71f199e8d4fad
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

Move FRAC_OFFSET into FetchLayer and FetchLayer drivers, because
FetchLayer is present on i.MX95 with different FRAC_OFFSET and
FetchWrap is not present. Prepare the register offset calculation
for i.MX95 addition. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-fl.c | 46 +++++++++++++++++++---------------
 drivers/gpu/drm/imx/dc/dc-fu.h |  3 ---
 drivers/gpu/drm/imx/dc/dc-fw.c | 45 ++++++++++++++++++---------------
 3 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 8571871c6a683..a76825dc75fe1 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -15,16 +15,19 @@
 #include "dc-drv.h"
 #include "dc-fu.h"
 
-#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
-#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
-#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
-#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
-#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
-#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
-#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
-#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
-#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
-#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAC_OFFSET			0x28
+
+#define BURSTBUFFERMANAGEMENT		0xc
+#define BASEADDRESS			0x10
+#define SOURCEBUFFERATTRIBUTES		0x14
+#define SOURCEBUFFERDIMENSION		0x18
+#define COLORCOMPONENTBITS		0x1c
+#define COLORCOMPONENTSHIFT		0x20
+#define LAYEROFFSET			0x24
+#define CLIPWINDOWOFFSET		0x28
+#define CLIPWINDOWDIMENSIONS		0x2c
+#define CONSTANTCOLOR			0x30
+#define LAYERPROPERTY			0x34
 #define FRAMEDIMENSIONS			0x150
 
 struct dc_fl {
@@ -98,6 +101,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
+	unsigned int off_base, off_regs;
 	struct resource *res_pec;
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
@@ -130,16 +134,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	fu->link_id = LINK_ID_FETCHLAYER0;
 	fu->id = DC_FETCHUNIT_FL0;
 	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
-		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
-		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
-		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
-		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
-		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
-		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
-		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
-		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
-		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
-		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+		off_base = i * FRAC_OFFSET;
+		fu->reg_baseaddr[i]		  = BASEADDRESS + off_base;
+		off_regs = i * FRAC_OFFSET;
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off_regs;
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off_regs;
+		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off_regs;
+		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT + off_regs;
+		fu->reg_layeroffset[i]		  = LAYEROFFSET + off_regs;
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET + off_regs;
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS + off_regs;
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off_regs;
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off_regs;
 	}
 	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
 	fu->reg_framedimensions = FRAMEDIMENSIONS;
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 2a330c0abf6a1..3983ef23e40fb 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -15,10 +15,7 @@
 
 #include "dc-pe.h"
 
-#define FRAC_OFFSET			0x28
-
 #define STATICCONTROL			0x8
-#define BURSTBUFFERMANAGEMENT		0xc
 
 /* COLORCOMPONENTBITS */
 #define R_BITS(x)			FIELD_PREP_CONST(GENMASK(27, 24), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index dc036121f0d23..7bbe06a840c93 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -16,16 +16,19 @@
 
 #define PIXENGCFG_DYNAMIC		0x8
 
-#define BASEADDRESS(x)			(0x10 + FRAC_OFFSET * (x))
-#define SOURCEBUFFERATTRIBUTES(x)	(0x14 + FRAC_OFFSET * (x))
-#define SOURCEBUFFERDIMENSION(x)	(0x18 + FRAC_OFFSET * (x))
-#define COLORCOMPONENTBITS(x)		(0x1c + FRAC_OFFSET * (x))
-#define COLORCOMPONENTSHIFT(x)		(0x20 + FRAC_OFFSET * (x))
-#define LAYEROFFSET(x)			(0x24 + FRAC_OFFSET * (x))
-#define CLIPWINDOWOFFSET(x)		(0x28 + FRAC_OFFSET * (x))
-#define CLIPWINDOWDIMENSIONS(x)		(0x2c + FRAC_OFFSET * (x))
-#define CONSTANTCOLOR(x)		(0x30 + FRAC_OFFSET * (x))
-#define LAYERPROPERTY(x)		(0x34 + FRAC_OFFSET * (x))
+#define FRAC_OFFSET			0x28
+
+#define BURSTBUFFERMANAGEMENT		0xc
+#define BASEADDRESS			0x10
+#define SOURCEBUFFERATTRIBUTES		0x14
+#define SOURCEBUFFERDIMENSION		0x18
+#define COLORCOMPONENTBITS		0x1c
+#define COLORCOMPONENTSHIFT		0x20
+#define LAYEROFFSET			0x24
+#define CLIPWINDOWOFFSET		0x28
+#define CLIPWINDOWDIMENSIONS		0x2c
+#define CONSTANTCOLOR			0x30
+#define LAYERPROPERTY			0x34
 #define FRAMEDIMENSIONS			0x150
 #define CONTROL				0x170
 
@@ -130,6 +133,7 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	struct resource *res_pec;
 	void __iomem *base_pec;
 	void __iomem *base_cfg;
+	unsigned int off;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
 	int i, id;
@@ -167,16 +171,17 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	fu->link_id = LINK_ID_FETCHWARP2;
 	fu->id = DC_FETCHUNIT_FW2;
 	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
-		fu->reg_baseaddr[i]		  = BASEADDRESS(i);
-		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
-		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
-		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS(i);
-		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT(i);
-		fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
-		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
-		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
-		fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
-		fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
+		off = i * FRAC_OFFSET;
+		fu->reg_baseaddr[i]		  = BASEADDRESS + off;
+		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off;
+		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off;
+		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off;
+		fu->reg_colorcomponentshift[i]    = COLORCOMPONENTSHIFT + off;
+		fu->reg_layeroffset[i]		  = LAYEROFFSET + off;
+		fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET + off;
+		fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS + off;
+		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off;
+		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off;
 	}
 	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
 	fu->reg_framedimensions = FRAMEDIMENSIONS;
-- 
2.51.0

