Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18724AD5F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0555B10E5F9;
	Tue,  8 Feb 2022 11:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBFD10E484;
 Tue,  8 Feb 2022 11:12:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q22so23903559ljh.7;
 Tue, 08 Feb 2022 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=gfII+Nwx1VjIsaSP4LQmgh3hZb6JLQuWkaGJn7wixjuQfPv3QyvbHQ/oGIZUTtOcQM
 mdTJh8oLCCPtQBPynShSzCfuDC6PL9luMyQ8FuVwhEgLbAcXk+l4HjHY7J1Pui0v8+kO
 y0dth9sdtPDmKnSx2W51YS0t+oBg4vEAAeH1f45DHfcfF5Wde3kf09c/vt7JlIfYWDgV
 QSZnJ83AFJ4qKpDjxnTrsHSZ2PmZcv75+Jw7ZWA2GfEfikQkKTCC3RaM9zW7bKkaaegU
 JW6KpDFdIr/fOXa8boE1ifHKcs6pqU+Q/uM+ybWnB5CsmCmyU2Jf0nDgxOO4Me0afYUm
 SD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=rHqOmXoxiEKiju5/T0WXA4KUIRGhUM7OGAux55lJVH2iwc5UxQSSuFl354Rqpgt4NS
 tqjQfdAASMTjzPeGgH+JzCmOmwWgMRS7hLp9Ol2XoyLBqYxHGvEwfb2fgfdXPZ+G0p/d
 ECiAoXm5752Gng26bE/St455S6fRYzMzxFma3ucBgp6YQRcwa+pBifhSXH1s4wcxMZ1q
 J5DUZHwsOOi1gItzkmgLE4gk+px0vywkQc5Mb8Rj8GFPMZhz+BK1st+jJtmK0pVhooL6
 HUovmGLWkCHPJKdDbqgrRGC5MCbiudqV966X15o8s528B+Hpte0S4jAcl72UVxlhd/nD
 /Naw==
X-Gm-Message-State: AOAM531v/RAizuUUTNTx9FOgNlTPtsuPAopu9tCiO6v37WBBZTErszHv
 XqGuFxc2luQ8lgcShTjcvDk=
X-Google-Smtp-Source: ABdhPJx0d8ixDSztvu9X8ZBCPCS4PpsRoyejigGduJK3j2wDoPXeKUcXiFPmXq+pnTua4nGk9wq1Lg==
X-Received: by 2002:a2e:502:: with SMTP id 2mr2416253ljf.445.1644318722046;
 Tue, 08 Feb 2022 03:12:02 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id j20sm1878093lfg.232.2022.02.08.03.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:12:01 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: hch@lst.de,
	jgg@nvidia.com,
	jani.nikula@linux.intel.com
Subject: [PATCH v6 3/3] i915/gvt: Use the initial HW state snapshot saved in
 i915
Date: Tue,  8 Feb 2022 06:11:51 -0500
Message-Id: <20220208111151.13115-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208111151.13115-1-zhi.a.wang@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
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

