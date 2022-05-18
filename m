Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716052B93D
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB29610E439;
	Wed, 18 May 2022 11:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B12E10E298
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:56:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i27so3307573ejd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1dlEPWVrVXPU9+OpPy+DjsXYyATJBO85j2ZJWlY2iE=;
 b=TiI4GaMGCOCddV8HiwnOPd+gCJrAzBja0E8iUAqdeogfrF97bB9p2YgK5SmMjS+dHe
 hULnBAFx1ZiHmqCIRYB/YCeauOMyPq6gkykmrA6TbbF6ThxF86HbBWx2PpLbwf6hr919
 cMhrjO2ci5BLTIlmhJCQ/wgDkY31t+Av8D1Jm9PkwQ9AVrNR+OroorbOt0Ym0WBb/10t
 Kxo8lIZrGU4MnUYhi0DTFrTkWEPCANMNwIroHtvKLrE94MUGt+DtPIy/3xQkQsWJMHlu
 0BawCST4HeH4l7tjEgVLCJXDtVtEtSBDQg0xJLyEwEeb0x0qXtdeXNmw8T4qjtomgtFB
 470A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1dlEPWVrVXPU9+OpPy+DjsXYyATJBO85j2ZJWlY2iE=;
 b=4kRCTuSETkiglfeKPMejAQlCWzn5MGZ6Z4WD/ckWJEZSPd7d013JvG9K0FFoTbGMML
 6QzvvD4MxIXx5jw7GpAc0RLvNd+d9qt9SZNlFmw+R8TsiIsFzUnykWKQfaSJTtIPDNJt
 +n59u0RZFsEw37PnRZWsaVho1UwUcRa3qTrVtYymez2wksdQg4QIpWoxUXgIK5JRTaCJ
 jJ+FjYTyJSP7BFkncvrSBLFzewtprnGIGzt47RKFeaPlhE86UjOr8rybWf0EAhMaTmKm
 MRUr2UhKp1bqGfO5JLNRdebG6d+Sllf0KSHQAOmL4S/oXdgTSIHLQ/mCrwdBoT/0zNe6
 shXw==
X-Gm-Message-State: AOAM5310Hj3PcbfBsYWfvIVLotbPhRWR0nxcRvbCC8pWK12VHVbjnL8g
 fzsJefA7iAHcmFlF5GhjQX0=
X-Google-Smtp-Source: ABdhPJwRW8Qy/kDVW3sedgwCmFrhZm2ha7NIB6DPX7bqZVmgNOIrDmk3X7+B9X5LnQadvHmbSyWwXA==
X-Received: by 2002:a17:907:3d91:b0:6f5:2b6a:ef55 with SMTP id
 he17-20020a1709073d9100b006f52b6aef55mr24549365ejc.352.1652874976966; 
 Wed, 18 May 2022 04:56:16 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 dq20-20020a170907735400b006f5294986besm873999ejc.111.2022.05.18.04.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:56:16 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v2 3/3] drm/panel: simple: add bus-format support for panel-dpi
Date: Wed, 18 May 2022 13:55:40 +0200
Message-Id: <20220518115541.38407-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518115541.38407-1-max.oss.09@gmail.com>
References: <20220518115541.38407-1-max.oss.09@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

Evaluate the device tree bus-format property to set bus_format for
a 'panel-dpi' panel. Additionally infer the bpc value from the
given bus-format.

Valid values for bus-format are found in:
<include/dt-bindings/display/dt-media-bus-format.h>

This completes the addition of panel-dpi to completely specify
a panel-simple panel from the device tree.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

Changes in v2:
    None

 drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..090c60abb014 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/display/dt-media-bus-format.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -453,6 +454,7 @@ static int panel_dpi_probe(struct device *dev,
 	struct panel_desc *desc;
 	unsigned int bus_flags;
 	struct videomode vm;
+	u32 bus_format;
 	int ret;
 
 	np = dev->of_node;
@@ -477,6 +479,47 @@ static int panel_dpi_probe(struct device *dev,
 	of_property_read_u32(np, "width-mm", &desc->size.width);
 	of_property_read_u32(np, "height-mm", &desc->size.height);
 
+	if (!of_property_read_u32(np, "bus-format", &bus_format)) {
+		/* infer bpc from bus-format */
+		switch (bus_format) {
+		case DT_MEDIA_BUS_FMT_RGB565_1X16:
+			desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+			desc->bpc = 6;
+			break;
+		case DT_MEDIA_BUS_FMT_RGB666_1X18:
+			desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+			desc->bpc = 6;
+			break;
+		case DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+			desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+			desc->bpc = 6;
+			break;
+		case DT_MEDIA_BUS_FMT_BGR888_1X24:
+			desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
+			desc->bpc = 8;
+			break;
+		case DT_MEDIA_BUS_FMT_GBR888_1X24:
+			desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
+			desc->bpc = 8;
+			break;
+		case DT_MEDIA_BUS_FMT_RBG888_1X24:
+			desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
+			desc->bpc = 8;
+			break;
+		case DT_MEDIA_BUS_FMT_RGB888_1X24:
+			desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+			desc->bpc = 8;
+			break;
+		case DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI:
+			desc->bus_format = MEDIA_BUS_FMT_RGB888_1X32_PADHI;
+			desc->bpc = 8;
+			break;
+		default:
+			dev_err(dev, "%pOF: unknown bus-format property\n", np);
+			return -EINVAL;
+		}
+	}
+
 	/* Extract bus_flags from display_timing */
 	bus_flags = 0;
 	vm.flags = timing->flags;
-- 
2.20.1

