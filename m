Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A927A815
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09A6E204;
	Mon, 28 Sep 2020 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA8A6E223
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601139910; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dKx0iyOA32oFUtWLpsntW1t7mf/nGBpfmUGlu82Qug=;
 b=cWzKY+YpKFcJxQdxjkzfwzfZWAo7RzcJpv4885Wl3nsRE/9Qzdc7Y3x8mkbToKSOv5C6vf
 XWgYFkZIk985JXBKJDaw2Ar0hS5U0YHqBB4f0EhJASgoXwYbLcK1fAdlCCKc/ppwA+FtEp
 9prsIk337LJWb0QVWOOtfN+kU8qCFng=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/7] drm/ingenic: Add support for reserved memory
Date: Sat, 26 Sep 2020 19:04:56 +0200
Message-Id: <20200926170501.1109197-3-paul@crapouillou.net>
In-Reply-To: <20200926170501.1109197-1-paul@crapouillou.net>
References: <20200926170501.1109197-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

v2: Don't abort probe if reserved memory cannot be obtained. The driver
    will still work fine provided the kernel configuration is sane.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index eadfe3a20bf1..d34e76f5f57d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -837,6 +838,11 @@ static void ingenic_drm_unbind_all(void *d)
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
@@ -858,6 +864,19 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return -EINVAL;
 	}
 
+	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
+		ret = of_reserved_mem_device_init(dev);
+
+		if (ret && ret != -ENODEV)
+			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
+
+		if (!ret) {
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
