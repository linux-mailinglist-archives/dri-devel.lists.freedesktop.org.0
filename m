Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA949E1F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 13:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6BD10EE87;
	Thu, 27 Jan 2022 12:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2512410EEA7;
 Thu, 27 Jan 2022 12:05:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b9so4882341lfq.6;
 Thu, 27 Jan 2022 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vm1E71F2uByMj2KZTvDJ3fTHLhMzGhMUgIxJrXZsp4=;
 b=A4Z0B38tFCdnTnwmo8i7Pii7TfHPDvY+ASacGfyJebTmdFyPbtTWc+TpMGoyHjYvOM
 pHt00wStZDe/K6oskhDPJycAlhmb4U6c6XSYxGVdKDe2bu1ITOmRFTpWGIB3U1iUM7mZ
 DDqGZs/pjopDoq7baQ59r268Rxy5Qz9dy0UMc6xEo/05ggqDuhxyO0vRTaUgnKwuvvS4
 8ibZEQDXpAjFxl//Elyku32Q5ngWSLtNOwCDgzBerRo50xP5owCkQ1nTBDzFgUlZgFq+
 dbRYuZ7/Up4sIV0oHItvscaO5Jm2rMhD7w7spbguMTYXY6d6JCosnWwuq2a/AsHmkutj
 bkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vm1E71F2uByMj2KZTvDJ3fTHLhMzGhMUgIxJrXZsp4=;
 b=Gayl1/wXJOOibSdfeR6xqsYszc8WOuaW3fhq/iMsYjG1Z2Gt80w1z4nZn3Cjq+8XJ/
 lY0Vf6R9i1XzaPDzFEqgLIu7yWfBqVnRVOG0VRDglpWbIUcmXhVCyry2m9c8fpAff7/w
 JU1hkJPQOHWju+TYNnATRLtWRZ5HK0GDL/uuUGguSlNwZiQguFGEslscfUAZZbJKhWmF
 bbfu44bzv7XFCZhq81mayM+Tme3eUMndH1O4bSleOQT3QGcHNInwhFv4+FNVjupkNG7s
 44m1xziZ+GCrA2hCUwaaqBJ4eB6BGucn1+s6r68GFVlrqw16ASymuqQX219OAVKO6+Gq
 v5HQ==
X-Gm-Message-State: AOAM5301ri4KumZqGlGEuXJgjJUAY8VeHdz67Ih+bxodsMmey/svcSS0
 ah2vWJdMnh2bXEOtOGKWJuw=
X-Google-Smtp-Source: ABdhPJwbTzq36KRvgCw0o66FybiSoiVYrW1RKwASrCpIjf0iKTu325bNkBLndiiz42Xc62AHOU4Feg==
X-Received: by 2002:a19:700b:: with SMTP id h11mr2571510lfc.377.1643285143412; 
 Thu, 27 Jan 2022 04:05:43 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id b5sm1418722ljk.123.2022.01.27.04.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:05:43 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: hch@lst.de,
	jgg@nvidia.com,
	jani.nikula@linux.intel.com
Subject: [PATCH 3/3] i915/gvt: Use the initial HW state snapshot saved in i915
Date: Thu, 27 Jan 2022 07:05:08 -0500
Message-Id: <20220127120508.11330-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127120508.11330-1-zhi.a.wang@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
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
index 1a8274a3f4b1..1d55920bfd42 100644
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
+			info->cfg_space_size);
+	memcpy(p, gvt->firmware.cfg_space, info->cfg_space_size);
 
 	p = firmware + h->mmio_offset;
 
-	/* Take a snapshot of hw mmio registers. */
-	intel_gvt_for_each_tracked_mmio(gvt, mmio_snapshot_handler, p);
+	memcpy(gvt->firmware.mmio, i915->vgpu.initial_mmio,
+			info->mmio_size);
 
-	memcpy(gvt->firmware.mmio, p, info->mmio_size);
+	memcpy(p, gvt->firmware.mmio, info->mmio_size);
 
 	crc32_start = offsetof(struct gvt_firmware_header, crc32) + 4;
 	h->crc32 = crc32_le(0, firmware + crc32_start, size - crc32_start);
-- 
2.25.1

