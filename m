Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DA72DA8C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284AA10E335;
	Tue, 13 Jun 2023 07:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE19110E334
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686640401; x=1718176401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NtZ1w67xZL59awaoTi+PT78oJSyEe138AbnOfIJ/pYE=;
 b=ryRegFsdJpVhE0r5eRZU9CcP2qCGg8EjLlCnJD2/cCWA0Jw2OcLfzzN9
 2V8UCVUxEswu8jHUaa1ZwZ8hWSDFHqaxEZhOThRMCWm2C/UIRIVwjausN
 g8FtFwN3BuxjspF/cGbarfhA4ARx7n1JAW2b+6ZVxG6r3au46BzcHR4n/
 HFLX53JxEUnr3P03ufOT7kzTnFGAoDZiwGXCh86samNb5Hb6JDKOiewZA
 cEMUj8dhPym/5HKuP8p54jwhyGARspiGJ9cMbhOaYTx7Hf2SZDOBACTM8
 lOOCSuzhc2s1/LOWt2zaFLYymAVYxKIIiEZBai1n7IGyVl0d3ppvTVWxy Q==;
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; d="scan'208";a="229806934"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 00:06:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 00:06:14 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 13 Jun 2023 00:06:06 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/9] drm: atmel-hlcdc: add vertical and horizontal scaling
 support for XLCDC
Date: Tue, 13 Jun 2023 12:34:25 +0530
Message-ID: <20230613070426.467389-9-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613070426.467389-1-manikandan.m@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan <manikandan.m@microchip.com>, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

update the LCDC_HEOCFG30 and LCDC_HEOCFG31 registers of XLCDC IP which
supports vertical and horizontal scaling with Bilinear and Bicubic
co-efficients taps for Chroma and Luma componenets of the Pixel.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c   |  2 ++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h   |  4 ++++
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index fbbd2592efc7..8fcaa4023155 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -536,6 +536,8 @@ static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x7_layers[] = {
 			.general_config = 12,
 			.csc = 16,
 			.scaler_config = 23,
+			.vxs_config = 30,
+			.hxs_config = 31,
 		},
 		.clut_offset = 0x1300,
 	},
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 804e4d476f2b..9aedfd0f6039 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -264,6 +264,8 @@
  * @disc_pos: discard area position register
  * @disc_size: discard area size register
  * @csc: color space conversion register
+ * @vxs_config: vertical scalar filter taps control register
+ * @hxs_config: horizontal scalar filter taps control register
  */
 struct atmel_hlcdc_layer_cfg_layout {
 	int xstride[ATMEL_HLCDC_LAYER_MAX_PLANES];
@@ -283,6 +285,8 @@ struct atmel_hlcdc_layer_cfg_layout {
 	int disc_pos;
 	int disc_size;
 	int csc;
+	int vxs_config;
+	int hxs_config;
 };
 
 /**
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index fe33476818c4..613382baa553 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -961,6 +961,24 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
 						    desc->layout.csc + 6,
 						    0x00000007);
 		}
+		if (desc->layout.vxs_config && desc->layout.hxs_config) {
+			/*
+			 * Updating vxs.config and hxs.config fixes the
+			 * Green Color Issue in SAM9X7 EGT Video Player App
+			 */
+			atmel_hlcdc_layer_write_cfg(&plane->layer,
+						    desc->layout.vxs_config,
+						    ATMEL_XLCDC_LAYER_VXSYCFG_ONE |
+						    ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE |
+						    ATMEL_XLCDC_LAYER_VXSCCFG_ONE |
+						    ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE);
+			atmel_hlcdc_layer_write_cfg(&plane->layer,
+						    desc->layout.hxs_config,
+						    ATMEL_XLCDC_LAYER_HXSYCFG_ONE |
+						    ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE |
+						    ATMEL_XLCDC_LAYER_HXSCCFG_ONE |
+						    ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE);
+		}
 	}
 
 	return 0;
-- 
2.25.1

