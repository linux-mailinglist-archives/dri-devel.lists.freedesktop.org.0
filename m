Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001827887DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A210E681;
	Fri, 25 Aug 2023 12:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BBB10E681
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692968109; x=1724504109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aOaMtJTiIJ9T6N93TEgDZWLDHpyfendla0pMWkd2/w=;
 b=0EZiPogPDUaPSvvcoASbloieWt3AbLaDAiPNgUDH3QPu6Mwgw82MilXx
 B2CdshYtE1ndSi2Js3Fg0RbZM8pC5XWXTitlv1M4IPfZfeVQnWFqqgbqG
 kRoIdephB9c2VswZQ5bsTqZoLqxo5ujBOeFDneWs0BYnQUmIolhm4sA00
 1AFXpzmszFHDk+9a0VhdLhikuNW6C1MUuRhlGCoQEhYqUtdXsvMs1QYrZ
 gPs1xR2mIgXs2rJYkwjCGGoZX0fl2ee/9bo6SX4moNXh2TlaGPl5YsRJ3
 1ySF9w9t9MCYrHbzm3xVUVininNaXqjePgjppg73VxxkNLZBGEYQ5L6e2 Q==;
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1318866"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2023 05:55:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 25 Aug 2023 05:55:07 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 25 Aug 2023 05:55:01 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/8] drm: atmel-hlcdc: add flag to differentiate XLCDC and
 HLCDC IP
Date: Fri, 25 Aug 2023 18:24:38 +0530
Message-ID: <20230825125444.93222-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825125444.93222-1-manikandan.m@microchip.com>
References: <20230825125444.93222-1-manikandan.m@microchip.com>
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

Add is_xlcdc flag in driver data to differentiate XLCDC and HLCDC code
within the atmel-hlcdc driver files.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 5b5c774e0edf..d68c79a6eae7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -304,6 +304,7 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
  * @conflicting_output_formats: true if RGBXXX output formats conflict with
  *				each other.
  * @fixed_clksrc: true if clock source is fixed
+ * @is_xlcdc: true if XLCDC IP is supported
  * @layers: a layer description table describing available layers
  * @nlayers: layer description table size
  */
@@ -317,6 +318,7 @@ struct atmel_hlcdc_dc_desc {
 	int max_hpw;
 	bool conflicting_output_formats;
 	bool fixed_clksrc;
+	bool is_xlcdc;
 	const struct atmel_hlcdc_layer_desc *layers;
 	int nlayers;
 };
-- 
2.25.1

