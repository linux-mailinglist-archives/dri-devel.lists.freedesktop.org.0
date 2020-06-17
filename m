Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508581FEC3F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF716EB1D;
	Thu, 18 Jun 2020 07:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851B76E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:20:17 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i8so2360195lfo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8a80cd6rsqQPYsCUSUM1tVHpjysV4lBd8Pl7EvdCM6E=;
 b=FoJaxzrFflE6LaxOfQk0IXXpNw1TcB02BfpukudUJvvz0sjvCgMY8OmLJaKiwz6XDx
 C/gDE3IRJKA2HqRaebAbdKt3EM4L0NCotHTWYsjSM/Mo+wvbvRSzwV0vKZdqaEs8YHHw
 Q4yN2ni8w97tvCST897K2FmpQWGITAxaGsNkGnZQ7dP/MXpaR1zkfQgG7yVdgXBq1hvS
 4tNNMXJAeC5nwzeVdBpl+XLE3E9umAlbP515ioqawoagpNJMgNrwWNiUMTOaqpJQI95M
 eweugxKOUmR8JXv6E2amCZgwBBDFAaS/mlBa79sH6in53tIFz2lVaVJEMD1AGdg95Jy+
 RPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8a80cd6rsqQPYsCUSUM1tVHpjysV4lBd8Pl7EvdCM6E=;
 b=A5572o7/xvIrvI806NvWXJjFDr4unsMTVjldTaT4yV0LE6R5Ov/DW04Cyz7CJdtS/R
 FhJaMIqKzirLWOaJzyY/msfnesd6OS13P38eKcX4ZTPidT4VR81tFYiAPW3tBw5gJU9L
 fIaPTHCOJol0XnWvaz8rZjfrDF+9UFo14cuQD6PP1r92OyV3lCOxtCcE1WBxJ0q1ffDc
 JFkLCcf1CdV76p8CXHsI0Ve56ABO4IWHH3Tri8YePv9udMHbcWnXSY9+gAfzrwz59mAY
 P0kY04QqGVUqPSBeFFRpY/3IJYoBYC4e8aaIZKV7z9YBWqlH+COmI5+2xOJGorcGiNPj
 8ydg==
X-Gm-Message-State: AOAM5331SWRi2cqBq2fhc6mc7Xe1rjBixDgfBp8QH20e66qExCIR2+dI
 si+E40LDvFMBiTGTQKiD3Cc=
X-Google-Smtp-Source: ABdhPJyQaSu56OgPGPclXqeIRJpQaUDkKkpFcF+C8Dt6uF1baj+c8borYAv8N0iz6g9JAlKh/k/ULw==
X-Received: by 2002:ac2:560f:: with SMTP id v15mr704327lfd.160.1592436015981; 
 Wed, 17 Jun 2020 16:20:15 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id x3sm235100ljc.82.2020.06.17.16.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:20:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v11 2/4] drm/panel: Read panel orientation for BOE TV101WUM-NL6
Date: Thu, 18 Jun 2020 02:18:40 +0300
Message-Id: <20200617231842.30671-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617231842.30671-1-digetx@gmail.com>
References: <20200617231842.30671-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Derek Basehore <dbasehore@chromium.org>

This reads the DT setting for the panel rotation to set the panel
orientation in the get_modes callback.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db5b866357f2..4bd9397972e8 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
@@ -43,6 +44,7 @@ struct boe_panel {
 
 	const struct panel_desc *desc;
 
+	enum drm_panel_orientation orientation;
 	struct regulator *pp1800;
 	struct regulator *avee;
 	struct regulator *avdd;
@@ -740,6 +742,7 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
@@ -779,6 +782,9 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
+	if (err < 0)
+		return err;
 
 	err = drm_panel_of_backlight(&boe->base);
 	if (err)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
