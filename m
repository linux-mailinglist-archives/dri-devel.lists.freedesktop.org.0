Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814536B5B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 17:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89546E83C;
	Mon, 26 Apr 2021 15:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EB56E835;
 Mon, 26 Apr 2021 15:24:45 +0000 (UTC)
Received: from 1-171-221-133.dynamic-ip.hinet.net ([1.171.221.133]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1lb361-0006QB-RA; Mon, 26 Apr 2021 15:24:26 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v3] drm/i915: Invoke another _DSM to enable MUX on HP
 Workstation laptops
Date: Mon, 26 Apr 2021 23:24:10 +0800
Message-Id: <20210426152420.359402-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Karthik B S <karthik.b.s@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On HP Fury G7 Workstations, graphics output is re-routed from Intel GFX
to discrete GFX after S3. This is not desirable, because userspace will
treat connected display as a new one, losing display settings.

The expected behavior is to let discrete GFX drives all external
displays.

The platform in question uses ACPI method \_SB.PCI0.HGME to enable MUX.
The method is inside the another _DSM, so add the _DSM and call it
accordingly.

I also tested some MUX-less and iGPU only laptops with that _DSM, no
regression was found.

v3:
 - Remove BXT from names.
 - Change the parameter type.
 - Fold the function into intel_modeset_init_hw().

v2:
 - Forward declare struct pci_dev.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3113
References: https://lore.kernel.org/intel-gfx/1460040732-31417-4-git-send-email-animesh.manna@intel.com/
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 833d0c1be4f1..d008d3976261 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -13,12 +13,17 @@
 #include "intel_display_types.h"
 
 #define INTEL_DSM_REVISION_ID 1 /* For Calpella anyway... */
+#define INTEL_DSM_FN_PLATFORM_MUX_ENABLE 0 /* No args */
 #define INTEL_DSM_FN_PLATFORM_MUX_INFO 1 /* No args */
 
 static const guid_t intel_dsm_guid =
 	GUID_INIT(0x7ed873d3, 0xc2d0, 0x4e4f,
 		  0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
 
+static const guid_t intel_dsm_guid2 =
+	GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
+		  0x9d, 0x15, 0xc7, 0x1f, 0xba, 0xda, 0xe4, 0x14);
+
 static char *intel_dsm_port_name(u8 id)
 {
 	switch (id) {
@@ -176,6 +181,19 @@ void intel_unregister_dsm_handler(void)
 {
 }
 
+void intel_dsm_enable_mux(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = i915->drm.pdev;
+	acpi_handle dhandle;
+
+	dhandle = ACPI_HANDLE(&pdev->dev);
+	if (!dhandle)
+		return;
+
+	acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
+			  INTEL_DSM_FN_PLATFORM_MUX_ENABLE, NULL);
+}
+
 /*
  * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate All Devices
  * Attached to the Display Adapter).
diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
index e8b068661d22..def013cf6308 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.h
+++ b/drivers/gpu/drm/i915/display/intel_acpi.h
@@ -11,11 +11,14 @@ struct drm_i915_private;
 #ifdef CONFIG_ACPI
 void intel_register_dsm_handler(void);
 void intel_unregister_dsm_handler(void);
+void intel_dsm_enable_mux(struct drm_i915_private *i915);
 void intel_acpi_device_id_update(struct drm_i915_private *i915);
 #else
 static inline void intel_register_dsm_handler(void) { return; }
 static inline void intel_unregister_dsm_handler(void) { return; }
 static inline
+void intel_dsm_enable_mux(struct drm_i915_private *i915) { return; }
+static inline
 void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
 #endif /* CONFIG_ACPI */
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a10e26380ef3..d79dae370b20 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11472,6 +11472,8 @@ void intel_modeset_init_hw(struct drm_i915_private *i915)
 {
 	struct intel_cdclk_state *cdclk_state;
 
+	intel_dsm_enable_mux(i915);
+
 	if (!HAS_DISPLAY(i915))
 		return;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
