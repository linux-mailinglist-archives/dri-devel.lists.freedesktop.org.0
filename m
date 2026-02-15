Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCn9JDiJkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511313E4FC
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E9C890EB;
	Sun, 15 Feb 2026 08:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGSTExk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F60910E355
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b8f92f3db6fso355321866b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145522; x=1771750322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QsrjkTmy5gwbi4lIuh2lXC6D48YhS9iDOLRg0gWmGQ=;
 b=eGSTExk0cuaC/B4c5PAnEQ5a3aHFN6pJCGk543XRPwc00nkIkYUkZbCVILM9Bep/on
 c4xO9Y865xvTQuX16SuUJ5uMKLXlbABYiIgvG1Ip/YKdx2quykFde2DH3LaOR3bNl3kH
 l3lQjBITVvi9Xgw4TqeT/Lxb7BbojcV3SLqIx33Ik+ObtjZYekeLK4NqtHmGSEjuSvBa
 5S8mjaXLmlgteKA5UH6F2ntdnAnuEHNElc9RN7lTOEOnXb/wKY5t8obmLiIlwPkapc8j
 IspVvjzsQG2hsAPBHtPwvxwRr2RMzeiPNvMl/Fu+TIFv62ppiapIB1t6eOJYaRAcwRAf
 0IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145522; x=1771750322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8QsrjkTmy5gwbi4lIuh2lXC6D48YhS9iDOLRg0gWmGQ=;
 b=PD0MJY/kyR4YKHXsj8tOvok5sO1B3WYP+hBaIQniuRQmu6tVH1SNHbRxX9tLmIYEn4
 zBbRtv9QMjHJ4H7jqlcgXNRzHNl9mJ8JDnJqXj4WTDb7Mm+t6p0pmHJ+Q1zfBZNaYPUk
 TCHZmmUBQJbN2k+0yI5ElZExSoLvk3j/H5OZI8X5+htop41OtMOnQV1Zyz/fmcF2mfbv
 ITjerWMKIWhINJ3xUyXXup8o8haCbfI1xsls1vR04OxX+byIfk4rAm+dssjzdnuqBnJH
 4u/nx3jZHfzrHdyp9a719FO4C/ORXgOCMR7R4JaJ9YSrEAV1xqNjjtAObPJKGRUl0AOj
 JZbw==
X-Gm-Message-State: AOJu0Yz7/oKS52A6cw+eR9e+luBzN9kG6CFl2RxxLTKw3Pho5ifbMQsX
 axyLeYiFRr9QZQFPm4l0scs6IKa1F/GmQtdqJ7JgqDc28aSjMqfchdvT
X-Gm-Gg: AZuq6aIjfb09glXEX6ag0+mYMMTtZY6LSc5lBkreuESthoulfhpUQDWUxI/RpfOMaRj
 2+tw4RJvOv6OpsWvIym68EVgPS/Woa7Li88IpA5tA43Gahes0G2NzAHGkvjcCnEs5+zcfLvIH0v
 xttJO7YdUqo42W3K+QAEZR7pnwMha4q4qUctS+BdbEyrYBYdzpkfk92bEw8EP7/2keaM5nwdnLU
 72AWrl3RkyY++zEn4rU+MQPA7YeFctzK7Gr2pUJvHLcaQ0kuya/981pNEYlNgXVt5H5vgYM6JJa
 RnFxEVXCIqi4/1NCJPWrMDMIGeUplUADb51tJmziWzhWY/rvm//1a2qv36Dl59foeJivVBeOJRF
 AadOC8C8kRcfnFmNHLXj8QCaBRNYg54jnWytgHLb8RHEkEDabOZ8+H1wzNaTWA2YFM9sULt2Xkq
 ce2PHSEHB+0Aes
X-Received: by 2002:a17:906:7312:b0:b8d:c364:5e28 with SMTP id
 a640c23a62f3a-b8fb456d516mr362890066b.63.1771145521872; 
 Sun, 15 Feb 2026 00:52:01 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:52:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] drm/panel: r61307/r69328: convert to
 drm_connector_helper_get_modes_fixed
Date: Sun, 15 Feb 2026 10:51:36 +0200
Message-ID: <20260215085140.20499-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215085140.20499-1-clamor95@gmail.com>
References: <20260215085140.20499-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4511313E4FC
X-Rspamd-Action: no action

Switch to use of drm_connector_helper_get_modes_fixed helper for get_modes
operation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                |  2 ++
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 17 +++--------------
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 17 +++--------------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 477c54c90b01..47de5f6a9143 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -700,6 +700,7 @@ config DRM_PANEL_RENESAS_R61307
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
 	help
 	  Say Y here if you want to enable support for KOE tx13d100vm0eaa
 	  IPS-LCD module with Renesas R69328 IC. The panel has a 1024x768
@@ -713,6 +714,7 @@ config DRM_PANEL_RENESAS_R69328
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
 	help
 	  Say Y here if you want to enable support for JDI dx12d100vm0eaa
 	  IPS-LCD module with Renesas R69328 IC. The panel has a 720x1280
diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 873ef856184b..45afa44af114 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -14,6 +14,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 #define R61307_MACP		0xb0 /* Manufacturer CMD Protect */
 #define   R61307_MACP_ON	0x03
@@ -202,25 +203,13 @@ static const struct drm_display_mode renesas_r61307_mode = {
 	.vtotal = 1024 + 24 + 8 + 2,
 	.width_mm = 76,
 	.height_mm = 101,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
 static int renesas_r61307_get_modes(struct drm_panel *panel,
 				    struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &renesas_r61307_mode);
-	if (!mode)
-		return -ENOMEM;
-
-	drm_mode_set_name(mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &renesas_r61307_mode);
 }
 
 static const struct drm_panel_funcs renesas_r61307_panel_funcs = {
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
index 46287ab04c30..b40bfd702fac 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -14,6 +14,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 #define R69328_MACP		0xb0 /* Manufacturer Access CMD Protect */
 #define   R69328_MACP_ON	0x03
@@ -167,25 +168,13 @@ static const struct drm_display_mode renesas_r69328_mode = {
 	.vtotal = 1280 + 6 + 3 + 1,
 	.width_mm = 59,
 	.height_mm = 105,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
 static int renesas_r69328_get_modes(struct drm_panel *panel,
 				    struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &renesas_r69328_mode);
-	if (!mode)
-		return -ENOMEM;
-
-	drm_mode_set_name(mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &renesas_r69328_mode);
 }
 
 static const struct drm_panel_funcs renesas_r69328_panel_funcs = {
-- 
2.51.0

