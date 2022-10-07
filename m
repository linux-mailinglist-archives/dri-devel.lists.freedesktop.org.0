Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E35F7847
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A542610E109;
	Fri,  7 Oct 2022 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EABE10E0F8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:50:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k2so11139523ejr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8upa/AE8nGpXl24ostbZMoh41mWOyaVWO9cdEU+UC6c=;
 b=KqioInl1OGok63D0PEYJEYdJmf6l6crQEOdxne1TXTN7RwWaTISgSVvmKDjkysZpfR
 xy2FVwlfn8rkJD7CWIknL7k6j7y2W97eeiTF59k+utBZWWUyCZbT4n9JQas3h95UJ/5p
 eJh4bwFMQW1xyrJNxmNohvs4C8x4nza/5StFnLEQ3XEcOok24nxiYEZxblZTESgEY7Yp
 iAD2Fs20vPrZJofrSG9H19Y/fy9d3ijnwVwcmvrtrQfcZ6Kv2ULIel2+Cpe5PBgcWuT0
 nhAhHX6fJBvEGhHDLTfZbvd5JWMu9F9XpQAV6aXkd5DxcMRvfEvVjZvCntQYO97bckM7
 1gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8upa/AE8nGpXl24ostbZMoh41mWOyaVWO9cdEU+UC6c=;
 b=R7r+rDbQyHd+RyMk4b0tPoYbZ7iLfMiR2+NG+rbmiq5jjxI3+QnuOJxacemsUIEJ+I
 15FCZ7GOckxqNiSezeLWfLvNhO3ZZVBMlVcA6uyjI3nAl9dO/lpeMiTE2v4tXF5cLPOy
 WFSMqluSKhNffr8Io487ul8c3zFXM1EKRDmGjlh/2Gl0NYSCOyFfw6a1pT25twHpvrvy
 kH0zgGfKmJPW10YsQb3GjIbw6YMyqfbrdnWCs3JUjkOYOvyQbFaNar5MBGm8kyEvoHO4
 JEVk7fPvCe0ixvKi4kUiP7yAxBfiTAhII64sWAtW3n8McRWsyBT2jsxIsnnMgv6itJ+m
 H0Kg==
X-Gm-Message-State: ACrzQf2TUW9WfG+OLTP0HmsZZaUnExlCIT2o3YJxlU/ABPvO4Z7ImyCd
 lfC6JrCdb2b6V7xp4vZ3jUM=
X-Google-Smtp-Source: AMsMyM56DggySACNM4kUVGOr3nTN2K4x0R0idGdKggbS7mIKRxTkL/rKnQT+lLyDg2/BOtWmBl8koA==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr3865892ejb.593.1665146999629; 
 Fri, 07 Oct 2022 05:49:59 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 j9-20020aa7ca49000000b00458d383a6ddsm1416515edt.44.2022.10.07.05.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:49:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
Date: Fri,  7 Oct 2022 14:49:43 +0200
Message-Id: <20221007124946.406808-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Simple framebuffers can be set up in system memory, which cannot be
requested and/or I/O remapped using the I/O resource helpers. Add a
separate code path that obtains system memory framebuffers from the
reserved memory region referenced in the memory-region property.

v2: make screen base a struct iosys_map to avoid sparse warnings

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 177 ++++++++++++++++++++++++-------
 1 file changed, 141 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 18489779fb8a..cf36f67d22e4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -2,6 +2,7 @@
 
 #include <linux/clk.h>
 #include <linux/of_clk.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/minmax.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
@@ -207,7 +208,9 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	void __iomem *screen_base;
+	struct iosys_map screen_base;
+	phys_addr_t sysmem_start;
+	size_t sysmem_size;
 
 	/* modesetting */
 	uint32_t formats[8];
@@ -441,6 +444,106 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 }
 #endif
 
+/*
+ * Memory management
+ */
+
+static int simpledrm_device_init_mm_sysmem(struct simpledrm_device *sdev, phys_addr_t start,
+					   size_t size)
+{
+	struct drm_device *dev = &sdev->dev;
+	phys_addr_t end = start + size - 1;
+	void *screen_base;
+
+	drm_info(dev, "using system memory framebuffer at [%pa-%pa]\n", &start, &end);
+
+	screen_base = devm_memremap(dev->dev, start, size, MEMREMAP_WC);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr(&sdev->screen_base, screen_base);
+
+	return 0;
+}
+
+static int simpledrm_device_init_mm_io(struct simpledrm_device *sdev, phys_addr_t start,
+				       size_t size)
+{
+	struct drm_device *dev = &sdev->dev;
+	phys_addr_t end = start + size - 1;
+	void __iomem *screen_base;
+	struct resource *mem;
+
+	drm_info(dev, "using I/O memory framebuffer at [%pa-%pa]\n", &start, &end);
+
+	mem = devm_request_mem_region(dev->dev, start, size, sdev->dev.driver->name);
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the I/O-memory resource as-is and try to map that instead.
+		 */
+		drm_warn(dev, "could not acquire memory region [%pa-%pa]\n", &start, &end);
+	} else {
+		size = resource_size(mem);
+		start = mem->start;
+	}
+
+	screen_base = devm_ioremap_wc(dev->dev, start, size);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+
+	return 0;
+}
+
+static void simpledrm_device_exit_mm(void *data)
+{
+	struct simpledrm_device *sdev = data;
+	struct drm_device *dev = &sdev->dev;
+
+	of_reserved_mem_device_release(dev->dev);
+}
+
+static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
+{
+	int (*init)(struct simpledrm_device *sdev, phys_addr_t start, size_t size);
+	struct drm_device *dev = &sdev->dev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
+	phys_addr_t start, end;
+	size_t size;
+	int ret;
+
+	ret = of_reserved_mem_device_init_by_idx(dev->dev, dev->dev->of_node, 0);
+	if (ret) {
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return -EINVAL;
+
+		init = simpledrm_device_init_mm_io;
+		size = resource_size(res);
+		start = res->start;
+	} else {
+		devm_add_action_or_reset(dev->dev, simpledrm_device_exit_mm, sdev);
+		init = simpledrm_device_init_mm_sysmem;
+		start = sdev->sysmem_start;
+		size = sdev->sysmem_size;
+	}
+
+	end = start + size - 1;
+
+	ret = devm_aperture_acquire_from_firmware(dev, start, size);
+	if (ret) {
+		drm_err(dev, "could not acquire memory range [%pa-%pa]: %d\n", &start, &end, ret);
+		return ret;
+	}
+
+	return init(sdev, start, size);
+}
+
 /*
  * Modesetting
  */
@@ -491,15 +594,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
 		struct drm_rect dst_clip = plane_state->dst;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-			    &damage);
+		iosys_map_incr(&sdev->screen_base, drm_fb_clip_offset(sdev->pitch, sdev->format,
+								      &dst_clip));
+		drm_fb_blit(&sdev->screen_base, &sdev->pitch, sdev->format->format,
+			    shadow_plane_state->data, fb, &damage);
 	}
 
 	drm_dev_exit(idx);
@@ -518,7 +621,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
 		return;
 
 	/* Clear screen to black if disabled */
-	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay);
+	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mode.vdisplay);
 
 	drm_dev_exit(idx);
 }
@@ -635,8 +738,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -706,35 +807,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
 
-	/*
-	 * Memory management
-	 */
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return ERR_PTR(-EINVAL);
-
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
+	ret = simpledrm_device_init_mm(sdev);
+	if (ret)
 		return ERR_PTR(ret);
-	}
-
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
-
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
-	if (!screen_base)
-		return ERR_PTR(-ENOMEM);
-	sdev->screen_base = screen_base;
 
 	/*
 	 * Modesetting
@@ -878,5 +953,35 @@ static struct platform_driver simpledrm_platform_driver = {
 
 module_platform_driver(simpledrm_platform_driver);
 
+static int simple_framebuffer_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	struct simpledrm_device *sdev = dev_get_drvdata(dev);
+
+	sdev->sysmem_start = rmem->base;
+	sdev->sysmem_size = rmem->size;
+
+	return 0;
+}
+
+static void simple_framebuffer_device_release(struct reserved_mem *rmem, struct device *dev)
+{
+}
+
+static const struct reserved_mem_ops simple_framebuffer_ops = {
+	.device_init = simple_framebuffer_device_init,
+	.device_release = simple_framebuffer_device_release,
+};
+
+static int simple_framebuffer_init(struct reserved_mem *rmem)
+{
+	pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
+		(unsigned long)rmem->size);
+
+	rmem->ops = &simple_framebuffer_ops;
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
+
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL v2");
-- 
2.37.3

