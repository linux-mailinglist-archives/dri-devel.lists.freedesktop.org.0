Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B17A1CB4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12010E611;
	Fri, 15 Sep 2023 10:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C14A10E611
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1694774958; x=1726310958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckPgITI/NxgsJVm0GcOJlhwu7zgJtbOu0GsUL58eVt4=;
 b=WoODLmObccQM+q/doorZNx24hJdjle8MMNdZY/guaCuORoJ/4+xDt8bA
 zeuc+inbUtM/96OLCPziMXwBNoWjyBkR+NuCfmfMS+qjsNoA0MLFy9xU3
 NS5Ve20wR3lCfUtHdIATQq7lsiqPJdA5o5BBL2cp4loUd5rwlKVFKkvrj
 D9kjjkVpoT9DYH1O+nnPXPeHzO0alwDdQdGVBxPt380SLGETl5h4DBqkb
 Fd07ralIBlsJt+cUBhcTpSt0yNlXz0byy9J5pbEfwUTptlfqpwYfMvOvl
 xyUMLUKfGxSWL2Lrl1hUbXbKyxK8Ibn8pt34lE15zsebMBZNBwcLO1Beg A==;
X-CSE-ConnectionGUID: hk8tCQZzSVuMTtVQhU7nfA==
X-CSE-MsgGUID: jbbyrfdGTO6TMbz7iIux7A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="4844773"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2023 03:49:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 03:49:05 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 15 Sep 2023 03:48:59 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/8] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Date: Fri, 15 Sep 2023 16:18:43 +0530
Message-ID: <20230915104849.187146-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915104849.187146-1-manikandan.m@microchip.com>
References: <20230915104849.187146-1-manikandan.m@microchip.com>
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
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 68 ++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 5b5c774e0edf..c61fa1733da4 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -177,6 +177,9 @@ struct atmel_hlcdc_layer_cfg_layout {
 	int csc;
 };
 
+struct atmel_hlcdc_plane_state;
+struct atmel_lcdc_dc_ops;
+
 /**
  * Atmel HLCDC DMA descriptor structure
  *
@@ -304,8 +307,10 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
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
@@ -317,8 +322,10 @@ struct atmel_hlcdc_dc_desc {
 	int max_hpw;
 	bool conflicting_output_formats;
 	bool fixed_clksrc;
+	bool is_xlcdc;
 	const struct atmel_hlcdc_layer_desc *layers;
 	int nlayers;
+	const struct atmel_lcdc_dc_ops *ops;
 };
 
 /**
@@ -345,6 +352,67 @@ struct atmel_hlcdc_dc {
 	} suspend;
 };
 
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
+void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state);
+void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state);
+void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,
+			  struct atmel_hlcdc_plane_state *state,
+			  u32 sr, int i);
+void update_xlcdc_buffers(struct atmel_hlcdc_plane *plane,
+			  struct atmel_hlcdc_plane_state *state,
+			  u32 sr, int i);
+void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
+void xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
+void
+atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
+					  struct atmel_hlcdc_plane_state *state);
+void
+atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
+					  struct atmel_hlcdc_plane_state *state);
+void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
+			 struct atmel_hlcdc_dc *dc);
+void xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
+			 struct atmel_hlcdc_dc *dc);
+void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+		    const struct atmel_hlcdc_layer_desc *desc);
+void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+		    const struct atmel_hlcdc_layer_desc *desc);
+void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+		   const struct atmel_hlcdc_layer_desc *desc);
+void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+		   const struct atmel_hlcdc_layer_desc *desc);
+
 extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
 extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_and_yuv_formats;
 
-- 
2.25.1

