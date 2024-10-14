Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2937399C666
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC47910E22B;
	Mon, 14 Oct 2024 09:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="pDZF2zp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDF710E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1728899426; x=1760435426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NkBDkiht3me8b2RWwXoEEEEvGTjmDHBukmLCCQGzqkI=;
 b=pDZF2zp1EdjAiy2E12dLPkq5BVGByT66wlK2bXaSmtJ+MKesUUsjIxBL
 W9InvrgvpGND6aT15rDWRznCimPbxCMtmUHCHC3Ds2mQ0gl1Pt/wsPcQ2
 f0rdmRPp+K120sh2a77VEiH45r7lQpkMMHnLA9znNf1aO10m0BuYB5m7u
 vp1wvhnq6OTlZLrIkJrZzZsz+4HworRnVszlDajlVWB5/5v19Dy7j/T2p
 gxEZMdaM/7aYTFQ2JZYjItA9gy+9NCV0lHtrZfGUS7yieDVq1Y0A2PvAs
 u06tPe6bggAeXpIjnWBt8BVGxk/Vkq7HoFFK1gzyajyb70xtr+HBHlR5A g==;
X-CSE-ConnectionGUID: 6GkUoRpBTjazw9ZDotKAkg==
X-CSE-MsgGUID: TPW6ZCp2TmCpx0urBWje2w==
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="36319939"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2024 02:50:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 14 Oct 2024 02:50:02 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 14 Oct 2024 02:49:56 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Hari.PrasathGE@microchip.com>,
 <durai.manickamkr@microchip.com>, <manikandan.m@microchip.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Date: Mon, 14 Oct 2024 15:19:42 +0530
Message-ID: <20241014094942.325211-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
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

From: Cyrille Pitchen <cyrille.pitchen@microchip.com>

On SoCs, like the SAM9X75, which embed the XLCDC ip, the registers that
configure the unified scaling engine were not filled with proper values.

Indeed, for YCbCr formats, the VXSCFACT bitfield of the HEOCFG25
register and the HXSCFACT bitfield of the HEOCFG27 register were
incorrect.

For 4:2:0 formats, both vertical and horizontal factors for
chroma chanels should be divided by 2 from the factors for the luma
channel. Hence:

HEOCFG24.VXSYFACT = VFACTOR
HEOCFG25.VSXCFACT = VFACTOR / 2
HEOCFG26.HXSYFACT = HFACTOR
HEOCFG27.HXSCFACT = HFACTOR / 2

However, for 4:2:2 formats, only the horizontal factor for chroma
chanels should be divided by 2 from the factor for the luma channel;
the vertical factor is the same for all the luma and chroma channels.
Hence:

HEOCFG24.VXSYFACT = VFACTOR
HEOCFG25.VXSCFACT = VFACTOR
HEOCFG26.HXSYFACT = HFACTOR
HEOCFG27.HXSCFACT = HFACTOR / 2

Fixes: d498771b0b83 ("drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops")
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4bcaf2cd7672..41c7351ae811 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -365,13 +365,34 @@ void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
 				    xfactor);
 
 	/*
-	 * With YCbCr 4:2:2 and YCbYcr 4:2:0 window resampling, configuration
-	 * register LCDC_HEOCFG25.VXSCFACT and LCDC_HEOCFG27.HXSCFACT is half
+	 * With YCbCr 4:2:0 window resampling, configuration register
+	 * LCDC_HEOCFG25.VXSCFACT and LCDC_HEOCFG27.HXSCFACT values are half
 	 * the value of yfactor and xfactor.
+	 *
+	 * On the other hand, with YCbCr 4:2:2 window resampling, only the
+	 * configuration register LCDC_HEOCFG27.HXSCFACT value is half the value
+	 * of the xfactor; the value of LCDC_HEOCFG25.VXSCFACT is yfactor (no
+	 * division by 2).
 	 */
-	if (state->base.fb->format->format == DRM_FORMAT_YUV420) {
+	switch (state->base.fb->format->format) {
+	/* YCbCr 4:2:2 */
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_NV61:
+		xfactor /= 2;
+		break;
+
+	/* YCbCr 4:2:0 */
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_NV21:
 		yfactor /= 2;
 		xfactor /= 2;
+		break;
+	default:
+		break;
 	}
 
 	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
-- 
2.25.1

