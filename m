Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F446B3EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 08:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272248BBA6;
	Tue,  7 Dec 2021 07:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635CF8BBA6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 07:30:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DB85D420CF;
 Tue,  7 Dec 2021 07:30:52 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
Date: Tue,  7 Dec 2021 16:29:41 +0900
Message-Id: <20211207072943.121961-2-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207072943.121961-1-marcan@marcan.st>
References: <20211207072943.121961-1-marcan@marcan.st>
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
Cc: Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code is required for both simplefb and simpledrm, so let's move it
into the OF core instead of having it as an ad-hoc initcall in the
drivers.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/of/platform.c          |  5 +++++
 drivers/video/fbdev/simplefb.c | 21 +--------------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b3faf89744aa..e097f40b03c0 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -540,6 +540,11 @@ static int __init of_platform_default_populate_init(void)
 		of_node_put(node);
 	}
 
+	for_each_child_of_node(of_chosen, node) {
+		if (of_device_is_compatible(node, "simple-framebuffer"))
+			of_platform_device_create(node, NULL, NULL);
+	}
+
 	/* Populate everything else. */
 	of_platform_default_populate(NULL, NULL, NULL);
 
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index b63074fd892e..57541887188b 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -541,26 +541,7 @@ static struct platform_driver simplefb_driver = {
 	.remove = simplefb_remove,
 };
 
-static int __init simplefb_init(void)
-{
-	int ret;
-	struct device_node *np;
-
-	ret = platform_driver_register(&simplefb_driver);
-	if (ret)
-		return ret;
-
-	if (IS_ENABLED(CONFIG_OF_ADDRESS) && of_chosen) {
-		for_each_child_of_node(of_chosen, np) {
-			if (of_device_is_compatible(np, "simple-framebuffer"))
-				of_platform_device_create(np, NULL, NULL);
-		}
-	}
-
-	return 0;
-}
-
-fs_initcall(simplefb_init);
+module_platform_driver(simplefb_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren@wwwdotorg.org>");
 MODULE_DESCRIPTION("Simple framebuffer driver");
-- 
2.33.0

