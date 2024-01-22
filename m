Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F6836AB0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F09110F5E5;
	Mon, 22 Jan 2024 16:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2BC10F5E5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:32:42 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705941160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odkYqjzTWVuL5bWOI6DRA1l4DPeGSEAeS9hiMNWXJJ8=;
 b=GiDxdmtZc1x5dCXVgT4BFw0UWGv7oQkINHwu127uWmaaETnWhpHHIo/Eptolf70gx4Q5RO
 LKYUO4oHXqhhIEyDvp5Ob2qSK31ThTj/vkp/36T1hretTg9MPqV44tjB4m+J3+kuQnO90l
 /rbZEF7Yv5M4j9YPHUN4tOY5tj0RrlY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 4/5] drm/bridge: display-connector: Extend match support for
 non-DT based systems
Date: Tue, 23 Jan 2024 00:32:19 +0800
Message-Id: <20240122163220.110788-5-sui.jingfeng@linux.dev>
In-Reply-To: <20240122163220.110788-1-sui.jingfeng@linux.dev>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On which case the driver is not probed by OF, Instead, a fwnode is
associated to the platform device before this driver is probed. The newly
added code is intended to be used on non-DT environment. It is assumed
that there is a string fwnode property associated with the platform device,
the name of the string property is compatible, the value of the string
property is used to get platform match data.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/display-connector.c | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 08bd5695ddae..eb7e194e7735 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -202,6 +202,24 @@ static int display_connector_get_supply(struct platform_device *pdev,
 	return PTR_ERR_OR_ZERO(conn->supply);
 }
 
+static const void *display_connector_get_match_data(const struct device *dev)
+{
+	const struct of_device_id *matches = dev->driver->of_match_table;
+
+	/* Try to get the match data by software node */
+	while (matches) {
+		if (!matches->compatible[0])
+			break;
+
+		if (device_is_compatible(dev, matches->compatible))
+			return matches->data;
+
+		matches++;
+	}
+
+	return NULL;
+}
+
 static int display_connector_probe(struct platform_device *pdev)
 {
 	struct display_connector *conn;
@@ -215,7 +233,10 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, conn);
 
-	type = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		type = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	else
+		type = (uintptr_t)display_connector_get_match_data(&pdev->dev);
 
 	/* Get the exact connector type. */
 	switch (type) {
@@ -434,3 +455,4 @@ module_platform_driver(display_connector_driver);
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_DESCRIPTION("Display connector driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:display-connector");
-- 
2.25.1

