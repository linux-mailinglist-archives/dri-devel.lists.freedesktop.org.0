Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7B74F633
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 18:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A5F10E40B;
	Tue, 11 Jul 2023 16:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-21.mta1.migadu.com (out-21.mta1.migadu.com
 [IPv6:2001:41d0:203:375::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79110E401
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:53:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689093831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi4iM6wkxmiCh7Toa8pia5vdqJbo9NSOCLkxp70eYG0=;
 b=FliLSndwDYIjP8JiUu8QT/T5KCdyHxGgYsO5BSzr4LgcOctrmmgGeB2MyfEdilZAYRJv+v
 u3Uk68mEPVZMQj92hxvLpVlcbsTe/5SyMdk4JvIYgXe1kFibyRM+OhpLNqtBWj+Xc/IUGP
 UNEGIHiX/bggBEDYF1XrTClNUQr51WA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH v3 7/9] drm/i915: Add an implement for the is_primary_gpu hook
Date: Wed, 12 Jul 2023 00:43:08 +0800
Message-Id: <20230711164310.791756-8-sui.jingfeng@linux.dev>
In-Reply-To: <20230711164310.791756-1-sui.jingfeng@linux.dev>
References: <20230711164310.791756-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch add a function to identify if a device is the default boot
selected by the firmware, it require the GPU has firmware framebuffer
driver support (such as efifb). If a specific hardware doesn't have
firmware framebuffer support, then the introduced function will just
return false. But even in this case, it still do no harms.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 30 +++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 98d7d4dffe9f..465ac61e2fd9 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -3,9 +3,12 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/aperture.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
 
+#include <drm/drm_aperture.h>
+
 #include <video/vga.h>
 
 #include "soc/intel_gmch.h"
@@ -113,6 +116,30 @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 }
 
+static bool intel_vga_is_primary_gpu(struct pci_dev *pdev)
+{
+	struct drm_i915_private *i915 = pdev_to_i915(pdev);
+	struct i915_gem_mm *mm = &i915->mm;
+	struct intel_gt *gt = &i915->gt0;
+	struct i915_ggtt *ggtt = gt->ggtt;
+	unsigned int i;
+
+	if (aperture_contain_firmware_fb(ggtt->gmadr.start, ggtt->gmadr.end))
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(mm->regions); i++) {
+		struct intel_memory_region *mr = mm->regions[i];
+
+		if (mr) {
+			if (drm_aperture_contain_firmware_fb(mr->io_start,
+							     mr->io_size))
+				return true;
+		}
+	}
+
+	return false;
+}
+
 int intel_vga_register(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -126,7 +153,8 @@ int intel_vga_register(struct drm_i915_private *i915)
 	 * then we do not take part in VGA arbitration and the
 	 * vga_client_register() fails with -ENODEV.
 	 */
-	ret = vga_client_register(pdev, intel_vga_set_decode, NULL);
+	ret = vga_client_register(pdev, intel_vga_set_decode,
+				  intel_vga_is_primary_gpu);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.25.1

