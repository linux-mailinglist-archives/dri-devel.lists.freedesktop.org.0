Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A2245D06
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A846E44F;
	Mon, 17 Aug 2020 07:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC3F6E260
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 21:56:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f26so7828067ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsQa4/wa/hr0FMOOmoE7ekivRXN/hVmPW68FrHf8SvM=;
 b=Ze4erFzxVZru3NYe8ZT3q5z8yGB9elgvo7xXqLgr3HyM8VAXlGsbMRFGm7Vn0nukuD
 iYkmKOCclAEFhHkuONXsFf4vwblr1D366Z/GpDydV78x0rFZ0xoftTPfHf0M+UPcdJ+3
 vavJIqbINSp9T0P/TWNnKjPBg7ekVbBb/O4OnuJI3AYepEXXeN2StzEEmQ4Y5Qhxtil1
 FGfUGs6TCMe8snfF/qGLwUDYVXjU10xrvffpLo1XNOQqx3FFHtJfK3TFq2rxd6JhrJm4
 SOJqamOllhCBPM/6/+oNf83P9OjcrYz72AC/oz0hj/bILw0v9VtBvgAhJWimfZ5COcoL
 olxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsQa4/wa/hr0FMOOmoE7ekivRXN/hVmPW68FrHf8SvM=;
 b=UJfh4dFP5JCMD2CFYL2rZjS4fOBmdRsPOnA93yqbZvcEjzpcv1wGy5oH2yKRoWE6Hx
 bc6/DOQPbK0XTDGVBGE2MGVP2U+XKKv8XA93jxp0FDxzS6UA04LybxWdECzfPSFbGL8+
 xdjXnQXhm4P6t+K8b60iUCLl8S+E7BJ4vyet9MH3EDg6gvHVEeARXbPanCjwG/Ar7z6x
 dguffbrghO118mbXyHqaHqmoTkAuDPl9co9QYXUU8yUP7FQBJQNkZyU36sgvh29nkHU/
 QntBwpXhTsQUHR2/zo6MFIoDfGeZRoa5BRgjV6pCMlyUjPdTpY5Ld3LsYdxpf6T1dvgr
 Saow==
X-Gm-Message-State: AOAM532igbvrHuVZOuYTMUZfmFDkzJWtnmxIbVkewZosaMHfCpamTRdh
 8bwUikK2pn1s3mFPEG71VHQ=
X-Google-Smtp-Source: ABdhPJxF5FcrTFOve8Js3QSlq60WT7ItL6LDIqEAG+J+TDbZvERjyEBqiXw7AdoTfQFFusczr4OHvg==
X-Received: by 2002:a2e:7c0f:: with SMTP id x15mr3055969ljc.205.1597355791880; 
 Thu, 13 Aug 2020 14:56:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1349977ljk.97.2020.08.13.14.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 14:56:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH RESEND v12 2/4] drm/panel: Read panel orientation for BOE
 TV101WUM-NL6
Date: Fri, 14 Aug 2020 00:56:07 +0300
Message-Id: <20200813215609.28643-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index e320aa30b9ae..6824363fcff1 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
