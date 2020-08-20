Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3C24CEA9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177B6EAAE;
	Fri, 21 Aug 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EC06E941
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597925583; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvfqokvJjJRDHqpcvn1CFRGBXyq8hxfGePqgX0+Z6F4=;
 b=LtgwUm8buWv6hWZGys+DG4WS+MDEUISCg4IkvO42mHToB8Om6L8FH1GoNE7FiVHQz5OE64
 83BvSojIvNK8F6W7nWrV0e4fCRN/HZFgrQZWfwRf9yWYoIYbWISJLCTeesCeqTrhfrYUSB
 KCj7cQB361s8B6qI4s6KzFYDvTo9tkc=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/2] drm/panel: novatek,nt39016: Reorder calls in probe
Date: Thu, 20 Aug 2020 14:12:55 +0200
Message-Id: <20200820121256.32037-2-paul@crapouillou.net>
In-Reply-To: <20200820121256.32037-1-paul@crapouillou.net>
References: <20200820121256.32037-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_panel_of_backlight() function must be called after
drm_panel_init(), according to the function's documentation; otherwise
the backlight won't be properly initialized.

v2: New patch

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 39f7be679da5..daa583030246 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -285,6 +285,9 @@ static int nt39016_probe(struct spi_device *spi)
 		return PTR_ERR(panel->map);
 	}
 
+	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
 	err = drm_panel_of_backlight(&panel->drm_panel);
 	if (err) {
 		if (err != -EPROBE_DEFER)
@@ -292,9 +295,6 @@ static int nt39016_probe(struct spi_device *spi)
 		return err;
 	}
 
-	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&panel->drm_panel);
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
