Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEF86DB10
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 06:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBE310EAFF;
	Fri,  1 Mar 2024 05:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="taxTuynQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6F710EAFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709270821; x=1740806821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sGj2r3BTZtlTZdhXJyW5ZMuKV0lCaO7NB6RlNOiv/9M=;
 b=taxTuynQh457uPkYj3naoLPeU7Et/yJs6bvhS9Hd81ocTjpBSBXpGO2f
 IewtBcV4u9svQrFgWPYhXlJFTr8HMIjk4msMW9VnOaEYLw6n9okEcRsxu
 iWy0FA7adCpc9xejQgcERKCTqNSoxtbcHIko0bmtulWLKAtI3UJLmUwev
 PnpVHID6Y+OZPN7QumpeLQyNHFhQ79vjsS73CdbEDgyCIK5zbcEpSvo+M
 ZfRlWYFbH9WdQ41d3sSok7aV39x4wfc0vNbW9FL0SY5baV7+VXK+IZRkX
 SXlqqHxNKekrDOfgXOvM+9aSnN5jSsQHD/KWKKwtTlEOV4eUT96R8jBnA g==;
X-CSE-ConnectionGUID: 6cUC41M7S5CRl+XUlEKwVg==
X-CSE-MsgGUID: trh9EL9ARQab2pj+Ip0jJA==
X-IronPort-AV: E=Sophos;i="6.06,195,1705388400"; d="scan'208";a="18663418"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Feb 2024 22:27:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 22:26:46 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 22:26:38 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH v9 6/8] drm: atmel-hlcdc: add vertical and horizontal scaling
 support for XLCDC
Date: Fri, 1 Mar 2024 10:55:32 +0530
Message-ID: <20240301052534.38651-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301052534.38651-1-manikandan.m@microchip.com>
References: <20240301052534.38651-1-manikandan.m@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the vertical and horizontal scaler registers of XLCDC IP
with Bilinear and Bicubic co-efficients taps for Chroma and
Luma componenets of the Pixel.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  4 ++++
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 20 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 1153d402f810..e1a0bb24b511 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -198,6 +198,8 @@
  * @disc_pos: discard area position register
  * @disc_size: discard area size register
  * @csc: color space conversion register
+ * @vxs_config: vertical scalar filter taps control register
+ * @hxs_config: horizontal scalar filter taps control register
  */
 struct atmel_hlcdc_layer_cfg_layout {
 	int xstride[ATMEL_HLCDC_LAYER_MAX_PLANES];
@@ -217,6 +219,8 @@ struct atmel_hlcdc_layer_cfg_layout {
 	int disc_pos;
 	int disc_size;
 	int csc;
+	int vxs_config;
+	int hxs_config;
 };
 
 /**
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 8a5419ccc343..55ce4b2fcb88 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -966,6 +966,26 @@ static void atmel_xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
 					    desc->layout.csc + i,
 					    xlcdc_csc_coeffs[i]);
 	}
+
+	if (desc->layout.vxs_config && desc->layout.hxs_config) {
+		/*
+		 * Updating vxs.config and hxs.config fixes the
+		 * Green Color Issue in SAM9X7 EGT Video Player App
+		 */
+		atmel_hlcdc_layer_write_cfg(&plane->layer,
+					    desc->layout.vxs_config,
+					    ATMEL_XLCDC_LAYER_VXSYCFG_ONE |
+					    ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE |
+					    ATMEL_XLCDC_LAYER_VXSCCFG_ONE |
+					    ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE);
+
+		atmel_hlcdc_layer_write_cfg(&plane->layer,
+					    desc->layout.hxs_config,
+					    ATMEL_XLCDC_LAYER_HXSYCFG_ONE |
+					    ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE |
+					    ATMEL_XLCDC_LAYER_HXSCCFG_ONE |
+					    ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE);
+	}
 }
 
 static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
-- 
2.25.1

