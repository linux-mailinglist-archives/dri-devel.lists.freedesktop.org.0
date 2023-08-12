Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38477B25E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE46210E128;
	Mon, 14 Aug 2023 07:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1076 seconds by postgrey-1.36 at gabe;
 Sat, 12 Aug 2023 09:37:32 UTC
Received: from wxsgout04.xfusion.com (wxsgout03.xfusion.com [36.139.52.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA56210E012;
 Sat, 12 Aug 2023 09:37:32 +0000 (UTC)
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
 by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4RNFSl53Y4z9xyqf;
 Sat, 12 Aug 2023 17:18:15 +0800 (CST)
Received: from fedora (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sat, 12 Aug
 2023 17:19:29 +0800
Date: Sat, 12 Aug 2023 17:19:28 +0800
From: Wang Jinchao <wangjinchao@xfusion.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915: Fix Kconfig error for CONFIG_DRM_I915
Message-ID: <ZNdOoHvIg7HXh7Gg@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.82.147.3]
X-ClientProxiedBy: wuxshcsitd00603.xfusion.com (10.32.134.231) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
X-Mailman-Approved-At: Mon, 14 Aug 2023 07:25:51 +0000
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
Cc: stone.xulei@xfusion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM_I915 is set to 'y' and CONFIG_BACKLIGHT_CLASS_DEVICE
is set to 'm', we encountered an ld.lld error during the build process:

	ld.lld: error: undefined symbol: backlight_device_get_by_name
	>>> referenced by intel_backlight.c:955
	>>>               vmlinux.o:(intel_backlight_device_register)

	ld.lld: error: undefined symbol: backlight_device_register
	>>> referenced by intel_backlight.c:971
	>>>               vmlinux.o:(intel_backlight_device_register)

	ld.lld: error: undefined symbol: backlight_device_unregister
	>>> referenced by intel_backlight.c:999
	>>>               vmlinux.o:(intel_backlight_device_unregister)

This issue occurred because intel_backlight_device_register and
intel_backlight_device_unregister were enclosed within
However, according to Kconfig, CONFIG_DRM_I915 will select
BACKLIGHT_CLASS_DEVICE only if ACPI is enabled.
This led to an error, which can be resolved by removing the
conditional statements related to ACPI.

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 drivers/gpu/drm/i915/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 01b5a8272a27..5003de921bf7 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -24,7 +24,7 @@ config DRM_I915
 	select IRQ_WORK
 	# i915 depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
-	select BACKLIGHT_CLASS_DEVICE if ACPI
+	select BACKLIGHT_CLASS_DEVICE
 	select INPUT if ACPI
 	select X86_PLATFORM_DEVICES if ACPI
 	select ACPI_WMI if ACPI
-- 
2.40.0

