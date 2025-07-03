Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F2AF8018
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7410E8B6;
	Thu,  3 Jul 2025 18:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBXB5E/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804F10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 18:34:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8B164A53994;
 Thu,  3 Jul 2025 18:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB042C4CEF1;
 Thu,  3 Jul 2025 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751567690;
 bh=bDZvxl9Xe6x2DBmna5WFdeUtvHa3VGAXRUVqmCbgMh8=;
 h=From:To:Cc:Subject:Date:From;
 b=KBXB5E/AlNPTHFI2uVIqAIZ8xtl2jEMJdNKUt9x7wU7xvyx0D1zD3NeyNdFdEPeTQ
 kE2NPm5/5nLIunr3a/7cQx9O7KffTVL5AZoWhU5JdBtjfDq3msfwOoU86NQnDQLJ2P
 ZZ1GctqR44x9iPkvi8vb80i9K2tI12YHfNm3iwWdFjPu7DK9luuL7WcRHugK5sI7UK
 5ptEkiTYLtBT8C4ubbn6eMClY+46cnDTo37AuecM1uhvBtqVvOi/zulncHRaqWIupB
 hMdjWJ0zZgA1cGb+Eg24PpjPh5p39MjvKWAFhWpdb9khGDwfAUmWUWwohzW3lKLL8z
 NexAskl4ARGMA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/simpledrm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Date: Thu,  3 Jul 2025 13:34:47 -0500
Message-ID: <20250703183447.2073902-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330de..c8856e6645e2 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -4,7 +4,7 @@
 #include <linux/clk.h>
 #include <linux/of_clk.h>
 #include <linux/minmax.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -180,22 +180,17 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 static struct resource *
 simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
 {
-	struct device_node *np;
-	struct resource *res;
+	struct resource r, *res;
 	int err;
 
-	np = of_parse_phandle(of_node, "memory-region", 0);
-	if (!np)
+	err = of_reserved_mem_region_to_resource(of_node, 0, &r);
+	if (err)
 		return NULL;
 
-	res = devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
+	res = devm_kmemdup(dev->dev, &r, sizeof(r), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
-	err = of_address_to_resource(np, 0, res);
-	if (err)
-		return ERR_PTR(err);
-
 	if (of_property_present(of_node, "reg"))
 		drm_warn(dev, "preferring \"memory-region\" over \"reg\" property\n");
 
-- 
2.47.2

