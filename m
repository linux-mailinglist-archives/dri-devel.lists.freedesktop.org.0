Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6364E7A1E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF0310E95D;
	Fri, 25 Mar 2022 17:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165DB10E95D;
 Fri, 25 Mar 2022 17:53:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 5so14642271lfp.1;
 Fri, 25 Mar 2022 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=MMT0HILFjBkL/NOsKp9IJ2Rcg0Ta+95vRvNWBYWrlOSIdSS/HBuue+mPjlkij71azQ
 0P5eB1ylgJXrA8wISBW3MIEOQq9V8kTIOutdu1YyPl/RMmywWucplv9XzAl5Sofyu2NZ
 lcwi7kD1rUgaG48Ae5QuxCsXmr7Z/uB140i8qGVBqcVUTHKyG7HKBkKYESJoaGwgzq68
 1s6A5DrtAJAdS2gEUk1lYvC1sZJlg1dpf8QKwCvEYFMZRf+w683AQkn6WnStAT09ta9A
 fhVdJsfPydEoaCh1FmvyfMkAS6pIKS5EA6lHAzFT+DWHuqKlMgrxCEXVqreNKQzRlsNV
 1RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=lyzWANaOs+b5LrO2U0DiJQHaKhHy04lfqiMSDYtKwm+qvzbgjeIRGRx1B+7aoNFJGc
 54Hjwjk9/1mq3Qx+gHlhMRIFfzH/I8YRgfi5PFsLzJcM0b+y86sdhIil97XPUMU+kpH+
 tBdAUoJZk/NH0j0XyQSJ3D9/dKmlG9AtJw9nUpXvOgRmzP5UqKl4EgY6TUTJPf1kUEGj
 x3KppRTf54pHq0RB2aMeoNAN4OGgVHrBMqO+tCWSTbYdVI5uRAs3R3dmy7uaglBZKb1y
 rAej4TvwJZdCzLhQhKvyCo9Fn5M0keChEs8zEoH5EJODNm0iSfh4nBwocqR24nRPGkv/
 nvRw==
X-Gm-Message-State: AOAM532Jh5R0ZR4BnCiW5+/mA6C2G9OHBGQjhVuCO+GkU9BhRjM4wlPt
 sI78JTntzC5q39mfCJExzJ3EA1V3hYw=
X-Google-Smtp-Source: ABdhPJxqowdRvF8TpUgcla2uBNcWJcEpAgGvAQuP7q304zfdYLSVQZkvDg8CUxZ2rV0DY8768r2NlQ==
X-Received: by 2002:ac2:4c8a:0:b0:44a:3271:dc3b with SMTP id
 d10-20020ac24c8a000000b0044a3271dc3bmr8382480lfl.83.1648230791199; 
 Fri, 25 Mar 2022 10:53:11 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 z17-20020ac24191000000b004483a4d9a3esm775738lfh.152.2022.03.25.10.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:53:10 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v7 3/3] i915/gvt: Use the initial HW state snapshot saved in
 i915
Date: Fri, 25 Mar 2022 13:52:51 -0400
Message-Id: <20220325175251.167164-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325175251.167164-1-zhi.a.wang@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code of saving initial HW state snapshot has been moved into i915.
Let the GVT-g core logic use that snapshot.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/firmware.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 1a8274a3f4b1..54fe442238c6 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -66,22 +66,16 @@ static struct bin_attribute firmware_attr = {
 	.mmap = NULL,
 };
 
-static int mmio_snapshot_handler(struct intel_gvt *gvt, u32 offset, void *data)
-{
-	*(u32 *)(data + offset) = intel_uncore_read_notrace(gvt->gt->uncore,
-							    _MMIO(offset));
-	return 0;
-}
-
 static int expose_firmware_sysfs(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
+	struct drm_i915_private *i915 = gvt->gt->i915;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct gvt_firmware_header *h;
 	void *firmware;
 	void *p;
 	unsigned long size, crc32_start;
-	int i, ret;
+	int ret;
 
 	size = sizeof(*h) + info->mmio_size + info->cfg_space_size;
 	firmware = vzalloc(size);
@@ -99,17 +93,16 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 
 	p = firmware + h->cfg_space_offset;
 
-	for (i = 0; i < h->cfg_space_size; i += 4)
-		pci_read_config_dword(pdev, i, p + i);
-
-	memcpy(gvt->firmware.cfg_space, p, info->cfg_space_size);
+	memcpy(gvt->firmware.cfg_space, i915->vgpu.initial_cfg_space,
+	       info->cfg_space_size);
+	memcpy(p, gvt->firmware.cfg_space, info->cfg_space_size);
 
 	p = firmware + h->mmio_offset;
 
-	/* Take a snapshot of hw mmio registers. */
-	intel_gvt_for_each_tracked_mmio(gvt, mmio_snapshot_handler, p);
+	memcpy(gvt->firmware.mmio, i915->vgpu.initial_mmio,
+	       info->mmio_size);
 
-	memcpy(gvt->firmware.mmio, p, info->mmio_size);
+	memcpy(p, gvt->firmware.mmio, info->mmio_size);
 
 	crc32_start = offsetof(struct gvt_firmware_header, crc32) + 4;
 	h->crc32 = crc32_le(0, firmware + crc32_start, size - crc32_start);
-- 
2.25.1

