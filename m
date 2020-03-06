Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FB17B7EB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D096EC7C;
	Fri,  6 Mar 2020 08:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494F6EC3A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 00:21:20 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id l41so304604pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 16:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQNm02H2pkyGLIgvDKszi1b0CdSZhepdAZyMaDXtVwg=;
 b=ML2beaIHhWoozMw1+GSjXS6qI18fIn3bQiw4wGMoMgs7HoD+Tac2WoXr33cjpS4ql4
 43z7U70hRhKReNNVfPIm18tp61lQKs41g/2G0HkyyE9sIEOrzn3W86c45EfrK1TQEgdL
 amSUe8jJvSy0iNM7lBbUtjU3vOQwXczM68WDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQNm02H2pkyGLIgvDKszi1b0CdSZhepdAZyMaDXtVwg=;
 b=EI9y8CzWmQ0RHxERFXbvfo8/EYrQRCSfDu7wjtnmxWnDWzOqso3kWUixEOsPedR/Jg
 JRKq4T83iB4o0zn8QeuX3tsgcFp47i6Pxh7Wxs36PBo1/VZIMP84eBluh7m/c5dAHKrV
 2G7wdoST9FCTBQX7FWSTMQf5EEOWZTawWcSk9JKQU3RNNOf5p87obWY1iapDcKdPmKfQ
 E5R5UOWuSZMovBtIjJuZpzRc6Tcf3f7FrUVS02WOdsSVSkxE5QYCJ6MNgjGW9Ok1NoRx
 Hh6oWfSCqNvAU+FD1MQj3DHBI8HjRwnUqeCqZa8tGSNxrqjv97WqhsTyLNrlhxOt6g6r
 0M0w==
X-Gm-Message-State: ANhLgQ0YS4g4CYpeKqwxAs8OBNTbTe8d2OtK3u0OM7L47IU6D1KydbG+
 9it6omji5Z6XVznl93YmT+iutQ==
X-Google-Smtp-Source: ADFU+vv9+4Lv/MOLWzhzniPKnDbwFzcA2Mk2UDwJzSTrY1lkMFavDoPeI8WQLyuZ9uYwMmBe4J2X1w==
X-Received: by 2002:a17:90a:170e:: with SMTP id
 z14mr725943pjd.156.1583454080536; 
 Thu, 05 Mar 2020 16:21:20 -0800 (PST)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y1sm30080225pgs.74.2020.03.05.16.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 16:21:19 -0800 (PST)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/2] drm/panel: read panel orientation for BOE tv101wum-nl6
Date: Thu,  5 Mar 2020 16:21:12 -0800
Message-Id: <20200306002112.255361-3-dbasehore@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200306002112.255361-1-dbasehore@chromium.org>
References: <20200306002112.255361-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reads the DT setting for the panel rotation to set the panel
orientation in the get_modes callback.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 48a164257d18..ee2d96413900 100644
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
@@ -717,6 +719,7 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
@@ -756,6 +759,9 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
+	if (err < 0)
+		return err;
 
 	err = drm_panel_of_backlight(&boe->base);
 	if (err)
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
