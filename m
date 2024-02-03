Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788884878B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1E510E9D8;
	Sat,  3 Feb 2024 16:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nFHgMUdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BB510E9D8
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:53:54 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7c01af010bcso114997339f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979234; x=1707584034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTz41youk0MNhd57tDHSRqDDcqb1mXikbXnVvCDl5qs=;
 b=nFHgMUdO4i0BAdTO0z6Xbbr7zQaH8+R/WUrnWiD48sAJD/4fkVbmUgbmphQkIDq+uD
 psGwpIzuDYgRGqO7sYCV42IFW9oO7t6Jw7tZtMMQo8JJQOqRYdbAV+zfGyxHuwtUcDbE
 sSK4rUpBJP79DwTVaOdFLsbJffwycUQZp/x2F+1KVmG0RdyAp8AvE56E+5qf+nZ9maPE
 ZPLOhhhyJANDGcfM/IRsEXG6diAUg008CTuNa/dEJOW9N63YnlZE1napz+T43qHyubzC
 tVW1seDNuKccYBI91bDHto1A05SZ+WQGzuvOsHQL+fKzw+Fz9ShyoGmCz1znERCh+26D
 J4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979234; x=1707584034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTz41youk0MNhd57tDHSRqDDcqb1mXikbXnVvCDl5qs=;
 b=W1JRdF4nLf/o9fkYKz5ibc6cJDWbT2g1XhwMZdaUjZQtiDH1tCVaoUJ3md/aJ3lCqw
 MBgljPDDYmkoucZ6xWHxdTVoIZcHEo995t9mUzghDYRpQ1WKqDQtipoF1XvZiHLOmagL
 IpIwH3OJvLk6D5VMsB0eP9T9vjPhIT0tbWeGq3/eizu37TwrMYqvgGyDvUjTtV2UfcUP
 T4Drg/il6I/cyvZ62V/Y8IRQDFNvMtUTwBhOYNePSVE381tD2bn1S9GU5GaZvV6UHa/F
 IgvjsJngOIujPj985N9eN6mVFDO5aW7fYBG/7voK64Pl6K7Bq3b8JXpgK3uJQviXJ6iu
 +00A==
X-Gm-Message-State: AOJu0Yzi7wJMK9ZOddXoKXEVmvL7JVfu+q86R9y0S57NoIfj3gsiBbaQ
 d5Z+cvjWAMpohHwvtzYQpZ1JcQdfnJrp0/v3HeLmRQGeM0rSzpdg
X-Google-Smtp-Source: AGHT+IFyEA0Xii6DxXVLQmKqTt50wj06h7R4pQOHBCC/7rAn9AxwjHk/98owuv5mKfuaCa0UFjMBEQ==
X-Received: by 2002:a6b:fb03:0:b0:7c0:3e75:f46d with SMTP id
 h3-20020a6bfb03000000b007c03e75f46dmr4802889iog.1.1706979233728; 
 Sat, 03 Feb 2024 08:53:53 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVZdVoNbFEdixs+13RcadW8GCllVZ7xKVTj2NXM54/anl1fBuhrAHCat0rqnv3RhPASNx1opDJMA21l2z1ij3X8Rx12yVkcQF3JZTOK/TdeH+RaAtahnLEJQFr1EBEUsLv9uMvFjgkQj5cv+aAdNFwFbShA0kgja3hR3iG+/3YWHfTuV/1S1mP0chXWaEzo1MccDnVMn18czRjOnRdwS7S8EUhB/wt2V5/2+DD3jLoPD1YGeWMWIWwvNSPDn99bqMs6krYj7WIBM8uXm9uPmLjqWgjON/i6J4pg7Gd0ha42QIp6q8ORyMPm+DNgUlu+ZnGaGNxp7pw/60q7lPdfXZAwTb4x3OFApr+MUxTmbZOXDfUy89W0rZix+B3E3fOytm2w1Os/SuG+zS2jWyWAG49gtmBoWgVC9EN0+CjvIUNdxiAk0NCabImRXO4kvDZ/05GrkGmjNjwhmCwOHTNxNJ/VYPYDz8C+m20Zh3YXaeRs/ZzFi1qNX6Hbu6nGQgB53BFrrE7DW8wy7BerDEwfQN7OF6Lxf3q82TSpWlsu+op0Si2PXXkMX/A9CMmDR5IQNaxVjjL4V/4Ykpc/iOapGlUYY9hGaC4h9/BtwNDpSpu9qJs5ZIS6Pds7A8ARxvis4/LecvT0lPDtItXD1lA9gzCH9fIkyLGw/tO9z1GQdU5fJzgUlbZQcdA1S2vN/dobTHOkGlgkEkBEEypLuGbX/OJCO0DBcGp7xE8+MtJradWpWSB7zSmA0Sp2ghrlum17CIgR353mLSHpuhim31D3HFt5reRqCIhlV5aClUhtcLqzM/ACrx3JM79u06NOcVklVWAb5WPhjkdTaw2RJA+/DBN7RMsH9Ruthu4++IamxsZN0zGXu94y3o/HqeWtxxec24GM6y7XWNJl1u7NWvSf9ptVeauIDMqfUwFnszPpQr0AR4e3aUVEVEPFasL8tlOP00vcN+
 mpGj9R8UMZ1+rT0d+JO6gXS+Yd+LDUMkxu/IWny7gVOlL4rA/IwaPBq/NnhEmmHkNPit6gfH7urCstUx8uEBN6/fIb4pnzHC1PX52xvzvlMLFrlSyowHFSRg+imxQyt00NhHYnbLy7R8EvstG8GndKToyv0053jjyytesykhtwZRO2JKVkUX/w6GQUERQnIpcKJZJ6aWP9YjuMSDPAxUDfkw/dQPb++belRYOp318rrcFN+Sd0dXaZDCDwVPT5KRGQZqg2zIermNjiPcM=
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:53:51 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Adam Ford <aford173@gmail.com>,
 Jacky Bai <ping.bai@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH V8 04/12] pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc
 clock to hdmimix domain
Date: Sat,  3 Feb 2024 10:52:44 -0600
Message-ID: <20240203165307.7806-5-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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

According to i.MX8MP RM and HDMI ADD, the fdcc clock is part of
hdmi rx verification IP that should not enable for HDMI TX.
But actually if the clock is disabled before HDMI/LCDIF probe,
LCDIF will not get pixel clock from HDMI PHY and print the error
logs:

[CRTC:39:crtc-2] vblank wait timed out
WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_atomic_helper.c:1634 drm_atomic_helper_wait_for_vblanks.part.0+0x23c/0x260

Add fdcc clock to LCDIF and HDMI TX power domains to fix the issue.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
V2:  No Change
---
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index e488cf79b800..77e889165eed 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -55,7 +55,7 @@ struct imx8mp_blk_ctrl_domain_data {
 	const char *gpc_name;
 };
 
-#define DOMAIN_MAX_CLKS 2
+#define DOMAIN_MAX_CLKS 3
 #define DOMAIN_MAX_PATHS 3
 
 struct imx8mp_blk_ctrl_domain {
@@ -457,8 +457,8 @@ static const struct imx8mp_blk_ctrl_domain_data imx8mp_hdmi_domain_data[] = {
 	},
 	[IMX8MP_HDMIBLK_PD_LCDIF] = {
 		.name = "hdmiblk-lcdif",
-		.clk_names = (const char *[]){ "axi", "apb" },
-		.num_clks = 2,
+		.clk_names = (const char *[]){ "axi", "apb", "fdcc" },
+		.num_clks = 3,
 		.gpc_name = "lcdif",
 		.path_names = (const char *[]){"lcdif-hdmi"},
 		.num_paths = 1,
@@ -483,8 +483,8 @@ static const struct imx8mp_blk_ctrl_domain_data imx8mp_hdmi_domain_data[] = {
 	},
 	[IMX8MP_HDMIBLK_PD_HDMI_TX] = {
 		.name = "hdmiblk-hdmi-tx",
-		.clk_names = (const char *[]){ "apb", "ref_266m" },
-		.num_clks = 2,
+		.clk_names = (const char *[]){ "apb", "ref_266m", "fdcc" },
+		.num_clks = 3,
 		.gpc_name = "hdmi-tx",
 	},
 	[IMX8MP_HDMIBLK_PD_HDMI_TX_PHY] = {
-- 
2.43.0

