Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83CA528A5E
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 18:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC4D112203;
	Mon, 16 May 2022 16:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE81A10FDBC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 16:29:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z2so29735311ejj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5Y01zEzcSsKU36y1NINY4WVk0Q8FiEw0n1MhQ5vAp8=;
 b=MzyxhcHxfpe4omR3oQIY9vDe3Ma0gJNH+l6vr8yMxzIcE7WLpzv3gQNngtko+7CHYK
 wnP0JeSPU3TtjfSYW/enDtVoXotkr2zQaxjJ4/noQLVUmKYH/Evyj3q+VW9NG0M+7/sb
 ytL/7GBUy8dZKftxMPUtkUWexMF7cLI54DvLkj9ENKp2ajx9lcLrjW/wH4upreuq5cYF
 qM0rYYi40WxtyS/YxBSmjDaGd6XUd6zhO6FYmPFSzl9krsIP29DwGB1BnX/jGT0qMgxM
 5L27yb+KWA/IP1ElTWNYxoAkEazXi+bOENadZ9R133tfM5XSvTKGWI9l0NBcNVKqxbtX
 5PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5Y01zEzcSsKU36y1NINY4WVk0Q8FiEw0n1MhQ5vAp8=;
 b=4Qjx1NV/Mbws/P3uDW3FdKZT9mahoZuKgOakawqVlJrH6GPg/QVv8SiRSLPLllq4Gg
 VmdvUm+8ncVdLxoF826hM50bRh1ivVH01jpxWaVucn9WGIs+QHycuqK/rzu69G25od+Z
 8NolujF3Ag6bHinI4hEDO5vIeY2f6OBDj2i6Q74cFPAMdkdLApZ4Z4TE3rJD/Sqx8dLE
 RYhCGSTYoYcNItn8HszUndotmeZeZzzM3tKHyl9XpuHhPFhN4+qXxVv6XGWmfiO34KOf
 lKPPK5P+gPSjWBlxD2GcSgcSRan/5HInn206rJtvL7OCHZpekVeQtMtDW3SkCW9QZXH5
 DAsA==
X-Gm-Message-State: AOAM5327bHwD/lAuC1BUjVmI9n4FdU8zKCBRcXZvW96LxA7rpdlJrTZi
 fYqVuRbZNueX6btvp8ef2Mw=
X-Google-Smtp-Source: ABdhPJxCd+3OM7rVUlCJ415U5mos+W3z/pfP53EArLwIpkBM+GZj9NipDl9K9kC3z669g20z47imFg==
X-Received: by 2002:a17:906:730e:b0:6f4:e9e7:4f4 with SMTP id
 di14-20020a170906730e00b006f4e9e704f4mr15402269ejc.509.1652718550402; 
 Mon, 16 May 2022 09:29:10 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214e3bsm58819ejg.161.2022.05.16.09.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:29:10 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v1 2/2] drm/panel: simple: add bus-format support for panel-dpi
Date: Mon, 16 May 2022 18:28:26 +0200
Message-Id: <20220516162826.23025-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220516162826.23025-1-max.oss.09@gmail.com>
References: <20220516162826.23025-1-max.oss.09@gmail.com>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
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

