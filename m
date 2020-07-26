Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2D22E285
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100FF89C25;
	Sun, 26 Jul 2020 20:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616689C0D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so15001532ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kb6rhhd4yAVo8imxNoYzCr/Y6WmeBxmKHR7gEo1ltg4=;
 b=p4g3fPFUxDNJlS6LRmzynhWo9XOjN4u+TOw3it7ff26SVSxw82xMNM/ixDEAb+fmVG
 flfvpW3b06ChOx9HFBx5JBYktPjoVo3KYS/FDe9zk6t5RIY8WYVtOoH8GVB2Lgk393w8
 B/KPsMA2L2WBQ3rfv94GbLC0ypYZH11f2P5S9gC4O4BxV9ae6Y7l/pVV3f3wNPknxGof
 tmxZ0uI+FaeLCh6Gi4h2XDQU1a+t6v8SqPEN6W8sYpDmSVIpbDD747EITLKBTD2NAVcV
 DkZYmZlZWpPfSQs7z/Fm17gAJRtED4zYYsb/nvUHRtqRLxCfn84U8DBX7nbLhhGoiwBC
 PjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kb6rhhd4yAVo8imxNoYzCr/Y6WmeBxmKHR7gEo1ltg4=;
 b=afSMVNC0q88JSP0+x3qrd1CVB01jKxgyFfU1vxp2hm9hKBOxZ1seOMu9wYOCixHcMy
 qbxKCbAV4n5YrcO1GJzIdJe5ogNyP3l2I8rE2klntzz66PffFmta6rlWo5ATi8GIkOZy
 CQQdXZWyHcBMbSb043O1SXQBLYUhLpJpSZSVxztIYZpeHLkbVdLO4XYK7GEcGSeebPRZ
 Z39gZGj61iWGc77ebuediffqBN6UG2cp/Rpw+iuJZksTQ8SAj2YKY7njp4QMFB9RfV9i
 0pHThvvD+xMtxHiLlZqPzT5WVj21EJ9EnXyL/BfNmiAwVeXLKva8C9zw1JFTxAqjsuT3
 NsZg==
X-Gm-Message-State: AOAM530TdqHiaQSnLnV9/C3Mt2d1Rk3chJnShyYcvGy7n2gQwrgNAZe0
 Uqmi+Noov/EMxwNwoKMJ6gZTU+0KiOs=
X-Google-Smtp-Source: ABdhPJwXEGfh/6Pr62d86QJkp6tmh+kpLJFyA8GRH8yp+o0zYZ9oAKhmNX0+ymaRg+wDYfyamQJPjA==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr7912855ljn.380.1595795612889; 
 Sun, 26 Jul 2020 13:33:32 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 01/15] drm/panel: panel-simple: validate panel description
Date: Sun, 26 Jul 2020 22:33:10 +0200
Message-Id: <20200726203324.3722593-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kbuild test robot <lkp@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Warn if we detect a panel with incomplete/wrong description.
This is inspired by a similar patch by Laurent that introduced checks
for LVDS panels - this extends the checks to the remaining type of
connectors.

This is known to warn for some of the existing panels but added
despite this as we need help from people using the panels to
add the missing info.
The checks are not complete but will catch the most common mistakes.

The checks at the same time serves as documentation for the minimum
required description for a panel.

The checks uses dev_warn() as we know this will hit. WARN() was
too noisy at the moment for anything else than LVDS.

v2:
  - Use dev_warn (Laurent)
  - Check for empty bus_flags

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 41 ++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 54323515ca2c..a8d68102931e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
+	u32 bus_flags;
 	int err;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
@@ -549,8 +550,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
-	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
-		/* Catch common mistakes for LVDS panels. */
+	/* Catch common mistakes for panels. */
+	switch (desc->connector_type) {
+	case 0:
+		dev_warn(dev, "Specify missing connector_type\n");
+		break;
+	case DRM_MODE_CONNECTOR_LVDS:
 		WARN_ON(desc->bus_flags &
 			~(DRM_BUS_FLAG_DE_LOW |
 			  DRM_BUS_FLAG_DE_HIGH |
@@ -564,6 +569,38 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
 			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
 			desc->bpc != 8);
+		break;
+	case DRM_MODE_CONNECTOR_eDP:
+		if (desc->bus_format == 0)
+			dev_warn(dev, "Specify missing bus_format\n");
+		if (desc->bpc != 6 && desc->bpc != 8)
+			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);
+		break;
+	case DRM_MODE_CONNECTOR_DSI:
+		if (desc->bpc != 6 && desc->bpc != 8)
+			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);
+		break;
+	case DRM_MODE_CONNECTOR_DPI:
+		bus_flags = DRM_BUS_FLAG_DE_LOW |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB |
+			    DRM_BUS_FLAG_DATA_LSB_TO_MSB |
+			    DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
+			    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
+		if (desc->bus_flags & ~bus_flags)
+			dev_warn(dev, "Unexpected bus_flags(%d)\n", desc->bus_flags & ~bus_flags);
+		if (!(desc->bus_flags & bus_flags))
+			dev_warn(dev, "Specify missing bus_flags\n");
+		if (desc->bus_format == 0)
+			dev_warn(dev, "Specify missing bus_format\n");
+		if (desc->bpc != 6 && desc->bpc != 8)
+			dev_warn(dev, "Expected bpc in {6,8} but got: %d\n", desc->bpc);
+		break;
+	default:
+		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
+		break;
 	}
 
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
