Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5E5005CD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A064410F13E;
	Thu, 14 Apr 2022 06:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3C10F13E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:14:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so8404663pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=xSaEo9LO7falECQjCcduKi//QmoNEw98a9U9ZQZJgh0=;
 b=kxTi7L39zBMmLwbO/yI0P60LXETiezuazG6rlO5ELFcbhEY1oEruR/u/1yo6N3KdQM
 2O3AUj5NiRsJ7q8fAiWhsh1U7XzByWNXQ0o+0xTNY6Fm/VpR3V3BCHnj6q1Y4ZmerDhl
 ml3SH/gbEb8sBaGbfujS5u45t1wFcG08OKiubAk72kE3re/C0hcN5oRWV5yHx2cWPh3G
 4EHxbAAxD5TeYvB/GTp04kn5Ko8AZzXvBXTj5w73Klbl6Pym2+BixMDk3gFHJN2VGOg0
 7cDTVYIflbge4PL8N9KjNv+cRh+9M1Nx1gAYdPFS3eYVK5FrN+1+TYR4Yd2qMNOSfcC9
 GKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xSaEo9LO7falECQjCcduKi//QmoNEw98a9U9ZQZJgh0=;
 b=n3FGRbF91BtBl+BQ1g0UuRG23T1K1dA7VHYyfDNi22beyU2nMJQTWMg/qw/rqhX1Bu
 6Q0KCRnbXificy67zgmgczArophbNFb7eJL2pLyT2AMr6fD02Y/t05kzvbSfaXIvqejv
 gIYJFUW/goVs5505T77Wj7X1muDO5WjL3QRwyWKJRQGmY3wIUAWJ2yHUW+lNevjM/Emd
 9rh/laYyo/Z6bvoVLCHUQuED0JqDn5rnHaI9M4g0d7OU4vIXytQSPoYANXZVWAsM7usP
 hw4BcE8A/r2eel6TDkO/eQXmYhjwsuPr0ojP00KAmngxAsnl1HK9ltuZh+hIzbd6SFbQ
 lmNQ==
X-Gm-Message-State: AOAM532mQJnAOuIsCY95eC2zYT4TeEIwge1pzh1JtDY1sIRrzcmvNMhQ
 F634tt6eOxfbFdiTsWvYGAA=
X-Google-Smtp-Source: ABdhPJzfqbuE+SKFgvlaHYYvwCo6iZQfPGv6i6/v9EAG/8WGUTum8VyjBgQWC5Y8dRWej4ZxlU0lQQ==
X-Received: by 2002:a17:90a:ca:b0:1ca:5253:b625 with SMTP id
 v10-20020a17090a00ca00b001ca5253b625mr2065267pjd.220.1649916860983; 
 Wed, 13 Apr 2022 23:14:20 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.gmail.com with ESMTPSA id
 25-20020a631259000000b0039d353e6d75sm927364pgs.57.2022.04.13.23.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 23:14:20 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [RESEND][PATCH] omapdrm: fix missing check on list iterator
Date: Thu, 14 Apr 2022 14:14:10 +0800
Message-Id: <20220414061410.7678-1-xiam0nd.tong@gmail.com>
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
Cc: stable@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

