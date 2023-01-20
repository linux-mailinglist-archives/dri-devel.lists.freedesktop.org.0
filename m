Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A473675B72
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359BC10E11F;
	Fri, 20 Jan 2023 17:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966BB10E11F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h12so1480094wrv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOqgdpqToWA5S18UMLkfS63Q0Xl2lO+o2375eUlRgI8=;
 b=Fn5m8NLD2sIpmyLtR/VrUuV3fgp+Xy4nvnxpCrxirKNblkgociu5lzX1mVT78Fg3Tp
 DfI+ajWMD53UpjZFoCDaYzZIwgwh7oPwgyvJ3gLcttwV2rwWbU2XWP0cIpVs24ha79z0
 Bbz8rcK3zpt7EFQZS7Cx6gbM9d5uVT2hcHqSYbolDVqMPwworHPQtKgza+lqCqjUY49P
 sWYaP6sYWSLnJ8kxgoU8LR4rDmearyXrkPK1DnCIYPRZP32qWKOO1BO4aCA64GKz70t3
 6vMCOccfxd7C0UDVdZ7r6yEde6m0zaWtESJ4ba9AnTmsWbZNkIdo4HSFU6DNDSQqJBaN
 uTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOqgdpqToWA5S18UMLkfS63Q0Xl2lO+o2375eUlRgI8=;
 b=zgHTrz2YJ4olCFautKHoZEcumCKVARk8Gl0KGwtNZdstJbKQQHKzCCsZCghKx+4NtG
 Eu8mCPxgL8dWHMLRWltxBIPBBTV4vysEse7dw+vyO4gnXROMimhJGgR+FwK2vfuFUySv
 j1HEiJ3MSv5oN25vzUcB4qXfCJMO6TbO0pq4eL2aYexlSx0IabBYCLw+ScnguoiL96PU
 7GMxREHlK3nKOH0yJbKOiYn0fE5DaT448/0o1K0R8HS+TInsIdQdyDl/zSnT6+zCMBOe
 hmui9GNaYBfqfhxbhDjtailzNk/lTga7J6MRgZplIZ4AfdHxwqncyp7651mWsy0ym2La
 1a4Q==
X-Gm-Message-State: AFqh2kpKoRz4UT74lCHuM+k44Qjc0NkYg4ot55rwMapc0oGbm958arIF
 wR9A7BXtvm3qNHWc7TlLgx0=
X-Google-Smtp-Source: AMrXdXuPyUil8dJ4H1vXqJh1dFD3RGgBy+Yg2OV3pzxReYLYgMKMw5l6i3wq1EvjMMzZ84xqKCoJgQ==
X-Received: by 2002:a05:6000:16ce:b0:2be:d04:3667 with SMTP id
 h14-20020a05600016ce00b002be0d043667mr16249463wrf.26.1674235871963; 
 Fri, 20 Jan 2023 09:31:11 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a05600018ab00b002be2279f100sm11342632wri.96.2023.01.20.09.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:11 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Date: Fri, 20 Jan 2023 18:31:00 +0100
Message-Id: <20230120173103.4002342-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Simple framebuffers can be set up in system memory, which cannot be
requested and/or I/O remapped using the I/O resource helpers. Add a
separate code path that obtains system memory framebuffers from the
reserved memory region referenced in the memory-region property.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- rebase onto latest format helper changes
- turn drm_info() into drm_dbg()
- add Reviewed-by from Thomas

Changes in v3:
- simplify memory code and move back to simpledrm_device_create()
- extract screen_base iosys_map fix into separate patch

Changes in v2:
- make screen base a struct iosys_map to avoid sparse warnings

 drivers/gpu/drm/tiny/simpledrm.c | 99 ++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index c1ed6dd426ec..2acc0eb32489 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -3,6 +3,7 @@
 #include <linux/clk.h>
 #include <linux/of_clk.h>
 #include <linux/minmax.h>
+#include <linux/of_address.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -184,6 +185,31 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 	return simplefb_get_validated_format(dev, format);
 }
 
+static struct resource *
+simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
+{
+	struct device_node *np;
+	struct resource *res;
+	int err;
+
+	np = of_parse_phandle(of_node, "memory-region", 0);
+	if (!np)
+		return NULL;
+
+	res = devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return ERR_PTR(-ENOMEM);
+
+	err = of_address_to_resource(np, 0, res);
+	if (err)
+		return ERR_PTR(err);
+
+	if (of_get_property(of_node, "reg", NULL))
+		drm_warn(dev, "preferring \"memory-region\" over \"reg\" property\n");
+
+	return res;
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -604,8 +630,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
+	struct resource *res, *mem = NULL;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -657,6 +682,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		format = simplefb_get_format_of(dev, of_node);
 		if (IS_ERR(format))
 			return ERR_CAST(format);
+		mem = simplefb_get_memory_of(dev, of_node);
+		if (IS_ERR(mem))
+			return ERR_CAST(mem);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
@@ -679,32 +707,55 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	 * Memory management
 	 */
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return ERR_PTR(-EINVAL);
+	if (mem) {
+		void *screen_base;
 
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
-		return ERR_PTR(ret);
-	}
+		ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
+		if (ret) {
+			drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
+			return ERR_PTR(ret);
+		}
 
-	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res), drv->name);
-	if (!mem) {
-		/*
-		 * We cannot make this fatal. Sometimes this comes from magic
-		 * spaces our resource handlers simply don't know about. Use
-		 * the I/O-memory resource as-is and try to map that instead.
-		 */
-		drm_warn(dev, "could not acquire memory region %pr\n", res);
-		mem = res;
-	}
+		drm_dbg(dev, "using system memory framebuffer at %pr\n", mem);
 
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
-	if (!screen_base)
-		return ERR_PTR(-ENOMEM);
+		screen_base = devm_memremap(dev->dev, mem->start, resource_size(mem), MEMREMAP_WC);
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+
+		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
+	} else {
+		void __iomem *screen_base;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return ERR_PTR(-EINVAL);
 
-	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
+		if (ret) {
+			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
+			return ERR_PTR(ret);
+		}
+
+		drm_dbg(dev, "using I/O memory framebuffer at %pr\n", res);
+
+		mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+					      drv->name);
+		if (!mem) {
+			/*
+			 * We cannot make this fatal. Sometimes this comes from magic
+			 * spaces our resource handlers simply don't know about. Use
+			 * the I/O-memory resource as-is and try to map that instead.
+			 */
+			drm_warn(dev, "could not acquire memory region %pr\n", res);
+			mem = res;
+		}
+
+		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+
+		iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+	}
 
 	/*
 	 * Modesetting
-- 
2.39.0

