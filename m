Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB954E85F6
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA410E395;
	Sun, 27 Mar 2022 05:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B76710E395
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 05:33:51 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id c23so12135822plo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=xSaEo9LO7falECQjCcduKi//QmoNEw98a9U9ZQZJgh0=;
 b=lGH+n2l5hbyQ3oeQV+8To9w7NYMbU1mNpdI5etgt2b/SaqSpTPk8Jcr8H008L2ru5M
 RDP1RsfEsbdT+3ClnYQ4TtmoUHlrtsenl/HCd040hLBMfOw9rvLCgUZjUG95Wz7097D2
 oqJrsybkccDLMPIxa4R/MGoMYleRdKkXLvoKAdslDyrLIrNOdjJpvoznMFzi6FMtMKm7
 klcoxCekVLTOt0sj167R63L7OUzbNaYPYkoczk7MQ2GTwp4NUHWGFlmVBqWxoulTtOLn
 GxvGK9D8vyvzNm3NKQrpknUprTMCrsJ/a6h98VRfNOLcv06Zy9MBQ9GcQJd4fqZBvfEa
 NHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xSaEo9LO7falECQjCcduKi//QmoNEw98a9U9ZQZJgh0=;
 b=5SzFBJSIww2+RjgIjOVUWWUxtlm0i3aZ3MccraSqQG0VIA365i2aQYeuxP9DIrJht8
 gaJyN9JJ8cQDbkqLHst3a3rjYg5/ocwPIqG7nR0qwDNy6E0tYKcw/UBTu2/WhA5YsKIN
 bUNQUL07vjj1H+OEoI+4swk/DXGYrgmc08KYMjJ5vFOi2Hgknn/FvflaP0zTWECJ0YB9
 FUZ6IW6JhD7sQ0+68Cxiuwck3RDmv2mIYtDn5dsm8JllMzYRSbtgvSIAx8oShyg1Zu0r
 5b9W7PTQ7WX7xRYWw0Nc3M4vl6vTTEQTCHW8ehQm+HslnZq8Az+fnit8gzfAeTEHOLWa
 O+fQ==
X-Gm-Message-State: AOAM532FZz6f7O4eaxnZ8dpapXpVCs5jHYJp4sPwxlDtOauwCkQuPVZS
 2LhMl46+6JRyibg6fO4GLvk=
X-Google-Smtp-Source: ABdhPJzZ18rhjsZXOUmdR1MF8whBPlQuLAFQEDXUlRLG9T0g/Unls8OXFNRgC9YAvDov3k0h3cyoFw==
X-Received: by 2002:a17:902:b597:b0:151:e24e:a61e with SMTP id
 a23-20020a170902b59700b00151e24ea61emr19886693pls.66.1648359230883; 
 Sat, 26 Mar 2022 22:33:50 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 d80-20020a621d53000000b004fae1119955sm11654765pfd.213.2022.03.26.22.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:33:50 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: tomba@kernel.org
Subject: [PATCH] omapdrm: fix missing check on list iterator
Date: Sun, 27 Mar 2022 13:33:44 +0800
Message-Id: <20220327053344.2696-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	bus_flags = connector->display_info.bus_flags;

The list iterator 'connector-' will point to a bogus position containing
HEAD if the list is empty or no element is found. This case must
be checked before any use of the iterator, otherwise it will lead
to a invalid memory access.

To fix this bug, add an check. Use a new value 'iter' as the list
iterator, while use the old value 'connector' as a dedicated variable
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: ("drm/omap: Add support for drm_panel")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_encoder.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 4dd05bc732da..d648ab4223b1 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -76,14 +76,16 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *output = omap_encoder->output;
 	struct drm_device *dev = encoder->dev;
-	struct drm_connector *connector;
+	struct drm_connector *connector = NULL, *iter;
 	struct drm_bridge *bridge;
 	struct videomode vm = { 0 };
 	u32 bus_flags;
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->encoder == encoder)
+	list_for_each_entry(iter, &dev->mode_config.connector_list, head) {
+		if (iter->encoder == encoder) {
+			connector = iter;
 			break;
+		}
 	}
 
 	drm_display_mode_to_videomode(adjusted_mode, &vm);
@@ -106,8 +108,10 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 		omap_encoder_update_videomode_flags(&vm, bus_flags);
 	}
 
-	bus_flags = connector->display_info.bus_flags;
-	omap_encoder_update_videomode_flags(&vm, bus_flags);
+	if (connector) {
+		bus_flags = connector->display_info.bus_flags;
+		omap_encoder_update_videomode_flags(&vm, bus_flags);
+	}
 
 	/* Set timings for all devices in the display pipeline. */
 	dss_mgr_set_timings(output, &vm);
-- 
2.17.1

