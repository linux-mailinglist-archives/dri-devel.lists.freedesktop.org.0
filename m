Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A17B9C26
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9412410E1C2;
	Thu,  5 Oct 2023 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6910E1C2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1696498221; x=1728034221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJbtQ1MlE1W9rRSJGxdgP3sxAM2uACs3ZmeI+EII/UM=;
 b=olM7QrRk7D37kibfAYNh1pvNVl9n5ylVsKNm/kFv7B53CFUsrp+n56Jb
 xLLaLHscWgiZX2yNfNOCIlx6YaImmcQrcNW5fJkN2mtrC+MYIrHnRPRAA
 XzTzem8Ek0tNT6ymRsjKvbBbGlvRQbBWNMymXGe7/bYsobKcrmf2eP8hw
 iDYUNmvKjT2kdD7Kq4XkOTGiktFilBnDZJhi0/L2DlFGIrfQO6J2s8L6F
 g9Ul/0a6MhfEV83BmAU0c08luRoiPM+neQ5PWzw/Z4F9DsVgU0WNxqNfe
 FtKBUaraYRoorMl2NmilCEdGitd2Zim2bM86eK63c2xo3duSMOnadb0Yc A==;
X-CSE-ConnectionGUID: pNqRUMmsQ46P00UoeOunFg==
X-CSE-MsgGUID: z1nv3CqUSoywBv3Qj0wD/Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="8182740"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2023 02:30:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 5 Oct 2023 02:30:12 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Thu, 5 Oct 2023 02:30:05 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Date: Thu, 5 Oct 2023 14:59:48 +0530
Message-ID: <20231005092954.881059-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005092954.881059-1-manikandan.m@microchip.com>
References: <20231005092954.881059-1-manikandan.m@microchip.com>
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
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add is_xlcdc flag and LCD IP specific ops in driver data to differentiate
XLCDC and HLCDC code within the atmel-hlcdc driver files.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 5b5c774e0edf..d5e01ff8c7f9 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -177,6 +177,9 @@ struct atmel_hlcdc_layer_cfg_layout {
 	int csc;
 };
 
+struct atmel_hlcdc_plane_state;
+struct atmel_hlcdc_dc;
+
 /**
  * Atmel HLCDC DMA descriptor structure
  *
@@ -288,6 +291,36 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
 	return container_of(layer, struct atmel_hlcdc_plane, layer);
 }
 
+/**
+ * struct atmel_lcdc_dc_ops - describes atmel_lcdc ops group
+ * to differentiate HLCDC and XLCDC IP code support.
+ * @plane_setup_scaler: update the vertical and horizontal scaling factors
+ * @update_lcdc_buffers: update the each LCDC layers DMA registers.
+ * @lcdc_atomic_disable: disable LCDC interrupts and layers
+ * @lcdc_update_general_settings: update each LCDC layers general
+ * confiugration register.
+ * @lcdc_atomic_update: enable the LCDC layers and interrupts.
+ * @lcdc_csc_init: update the color space conversion co-efficient of
+ * High-end overlay register.
+ * @lcdc_irq_dbg: to raise alert incase of interrupt overrun in any LCDC layer.
+ */
+struct atmel_lcdc_dc_ops {
+	void (*plane_setup_scaler)(struct atmel_hlcdc_plane *plane,
+				   struct atmel_hlcdc_plane_state *state);
+	void (*update_lcdc_buffers)(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state,
+				    u32 sr, int i);
+	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane);
+	void (*lcdc_update_general_settings)(struct atmel_hlcdc_plane *plane,
+					     struct atmel_hlcdc_plane_state *state);
+	void (*lcdc_atomic_update)(struct atmel_hlcdc_plane *plane,
+				   struct atmel_hlcdc_dc *dc);
+	void (*lcdc_csc_init)(struct atmel_hlcdc_plane *plane,
+			      const struct atmel_hlcdc_layer_desc *desc);
+	void (*lcdc_irq_dbg)(struct atmel_hlcdc_plane *plane,
+			     const struct atmel_hlcdc_layer_desc *desc);
+};
+
 /**
  * Atmel HLCDC Display Controller description structure.
  *
@@ -304,8 +337,10 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
  * @conflicting_output_formats: true if RGBXXX output formats conflict with
  *				each other.
  * @fixed_clksrc: true if clock source is fixed
+ * @is_xlcdc: true if XLCDC IP is supported
  * @layers: a layer description table describing available layers
  * @nlayers: layer description table size
+ * @ops: atmel lcdc dc ops
  */
 struct atmel_hlcdc_dc_desc {
 	int min_width;
@@ -317,8 +352,10 @@ struct atmel_hlcdc_dc_desc {
 	int max_hpw;
 	bool conflicting_output_formats;
 	bool fixed_clksrc;
+	bool is_xlcdc;
 	const struct atmel_hlcdc_layer_desc *layers;
 	int nlayers;
+	const struct atmel_lcdc_dc_ops *ops;
 };
 
 /**
-- 
2.25.1

