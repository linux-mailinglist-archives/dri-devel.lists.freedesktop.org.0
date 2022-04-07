Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B064F7744
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1C610E568;
	Thu,  7 Apr 2022 07:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AA710E48B;
 Thu,  7 Apr 2022 07:19:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b21so8066987lfb.5;
 Thu, 07 Apr 2022 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=hhGxeURLZ59DftusEYx1alpsXXNNYNVJ3p1q1D0s6eQ/fu51CqONFsgoyfeGdvMXGF
 /OsB7LG0gRdd6jT9knDXO/EbLHOO2FKeEJssE3HwTtBOiNUiRvkc432598qs54rdjiee
 udXd/UNdwKvjIzS7J6pNXlgnmjX7ZJFdrL5dO3XvVwhjItWfhMk0dD7FztHxgSC0V8c5
 /FxBcnAIfnxuWGU34V9fUgtLvowhNdefZv5RvCQ8gSlC8U7Fc3ROKMqGhIDZNqrnJhf/
 YSO9hAZfKxldkMxdGW82diCIMz60F3m32k1moJI5ddboeS2oi0hbFPFId0ErJTQBeoTM
 eQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3YdE7NZj+L8Dg/chDHlwxEN35uclyYb0VXoHTgKIhw=;
 b=w5Wni6xU5l7lOZJ3nQ8ps2h8SnYF1bUSWBRExZ6pwSmguNJfb8FqQ5V6P5jOXJhJFN
 Xcwe3cT/Escq20JWi1Xik6hBzo4y4s59nHMQcf7IZx2jh22jCzan/nLz8Pc5qZLQal6s
 bfUhmHhqrxHF54f1KqI+Sr2R0pbyjZq+6ooxeEsJR9mFkAmxqZq50pzYKrtQkl/evh1z
 xY9cwgrmCv498my5IucYd8IeBUs6NN5d3NAFykZJrSFj4MRX9l7U8Vx+DRxHGldAtGzo
 O4KzTl+Kx4LjKyR+bN+uqtKxz1iJYJbqSViDcx7d10mqLjndbh/aZiTldKafS+dt9DUE
 JtGg==
X-Gm-Message-State: AOAM5305DmZAkwdXm++7XK3UvhcQpgqWLgH0bswbbO6bR9NEujH3u3F1
 p37THJvNuyPfZ6+jY7Ylv3ypN5CwWxk=
X-Google-Smtp-Source: ABdhPJyU6i8B6QzGlf/AR+FLn6olOfRUr++T8sQ2rwwiTalavs8/pFf99Ti8hVcfMxbfaEod78epMA==
X-Received: by 2002:a05:6512:3f96:b0:44a:f504:597f with SMTP id
 x22-20020a0565123f9600b0044af504597fmr8507756lfa.621.1649315991992; 
 Thu, 07 Apr 2022 00:19:51 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b0044a308dad8csm2081465lfu.149.2022.04.07.00.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 00:19:51 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v9 3/3] i915/gvt: Use the initial HW state snapshot saved in
 i915
Date: Thu,  7 Apr 2022 03:19:45 -0400
Message-Id: <20220407071945.72148-4-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407071945.72148-1-zhi.a.wang@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
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

