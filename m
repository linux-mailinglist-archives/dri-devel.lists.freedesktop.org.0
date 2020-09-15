Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADC26A743
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C756E0FB;
	Tue, 15 Sep 2020 14:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A2E6E239
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1600173515; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnThdIg2YWGNs9dq3b6T62D7NZe5+JkYnSB4sOV6bH0=;
 b=l3R87eYCLItM1825bdqH0xrnmFEiUx4Ml7y8PW6jezQV6I1eFtT9gYmyX/0EeSMUzboTq6
 9FLOsFI9sJvszZZIaQ4tEkVhNjSyrhWOF9fOCEsDGzy2RboRaE8rqPWeT6GGEVx2JW6KvQ
 WyZgHM8L8kvwWxdXStaz4MfbT1TIoe4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/ingenic: Add support for reserved memory
Date: Tue, 15 Sep 2020 14:38:18 +0200
Message-Id: <20200915123818.13272-4-paul@crapouillou.net>
In-Reply-To: <20200915123818.13272-1-paul@crapouillou.net>
References: <20200915123818.13272-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Sep 2020 14:38:31 +0000
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
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for static memory reserved from Device Tree. Since we're
using GEM buffers backed by CMA, it is interesting to have an option to
specify the CMA area where the GEM buffers will be allocated.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index aa32660033d2..44b0d029095e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -827,6 +828,11 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
+static void __maybe_unused ingenic_drm_release_rmem(void *d)
+{
+	of_reserved_mem_device_release(d);
+}
+
 static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -848,6 +854,19 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return -EINVAL;
 	}
 
+	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
+		ret = of_reserved_mem_device_init(dev);
+
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(dev, ret, "Failed to get reserved memory\n");
+
+		if (ret != -ENODEV) {
+			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
+			if (ret)
+				return ret;
+		}
+	}
+
 	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
 				  struct ingenic_drm, drm);
 	if (IS_ERR(priv))
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
