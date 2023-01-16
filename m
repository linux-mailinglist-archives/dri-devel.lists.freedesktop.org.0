Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD366BDA9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B3010E3F1;
	Mon, 16 Jan 2023 12:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82E110E3F1;
 Mon, 16 Jan 2023 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673871515; x=1705407515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vmajSOdlgev8/0PZszXAK7RBRxRuIzCR9sbh+xD8KlM=;
 b=TC0n+7GYHsTy4ijNqyE0jljgC2QQyu9YA+/brJO6rk1pEzCCHniq1RhM
 yr9FahHe1Ei+b2uo0eNw4ElFZbCRAqkSLuN9JLM4lpL8u5jnnBtD03PsZ
 D+SkfbiErVQoKlZMOKjxXdY6k5mwSKy+EMljToyNEmynNWKdZTuy7VTi+
 0s8gSuXiRTQPitl8zvQ/byjJUauf7zRkO3gC8idrfkZHZP9yFnOQy43Lm
 SMfQQxheBoKjWTdCXilFfW5Kh5cEpR8r+suW+lzMKr98qGmjahOHNn58q
 Q4PrfIfvsAP9op6kE/HppJl56lMxKWV/9rdYmYmgZ3Y4aydZDy2eldqIC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="386795099"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="386795099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="691232309"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="691232309"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.13.137])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/pciids: use designated initializers for struct
 pci_device_id
Date: Mon, 16 Jan 2023 14:18:20 +0200
Message-Id: <fdeca1e86f4d81b2be0f210421b062d2bea1710b.1673871359.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673871359.git.jani.nikula@intel.com>
References: <cover.1673871359.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use designated initializers for struct pci_device_id in kernel to avoid
the dependency on struct pci_device_id remaining unchanged. Recently,
commit 343b7258687e ("PCI: Add 'override_only' field to struct
pci_device_id") added a new member leading to warnings about missing
field initializers.

Any userspace using this header should switch to defining their own
initializers. The old one is left in place for now.

References: https://lore.kernel.org/all/202108272322.EipbBEAp-lkp@intel.com
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_pciids.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index 0987bc12476f..7baf14fcb7c2 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -25,15 +25,18 @@
 #ifndef _I915_PCIIDS_H
 #define _I915_PCIIDS_H
 
+#ifdef __KERNEL__
+/* Initializer for struct pci_device_id. */
+#define INTEL_VGA_DEVICE_INIT(__id, __subvendor, __subdevice, __info) { \
+		.vendor = 0x8086, .device = (__id),			\
+		.subvendor = (__subvendor), .subdevice = (__subdevice),	\
+		.class = 0x030000, .class_mask = 0xff0000,		\
+		.driver_data = (kernel_ulong_t)(__info),		\
+	}
+#else
 /*
- * A pci_device_id struct {
- *	__u32 vendor, device;
- *      __u32 subvendor, subdevice;
- *	__u32 class, class_mask;
- *	kernel_ulong_t driver_data;
- * };
- * Don't use C99 here because "class" is reserved and we want to
- * give userspace flexibility.
+ * Transitional. Non-kernel users should define INTEL_VGA_DEVICE_INIT()
+ * themselves.
  */
 #define INTEL_VGA_DEVICE_INIT(__id, __subvendor, __subdevice, __info) { \
 		0x8086, (__id),						\
@@ -41,6 +44,7 @@
 		0x030000, 0xff0000,					\
 		(unsigned long)(__info),				\
 	}
+#endif
 
 #define INTEL_VGA_DEVICE(__id, __info)			\
 	INTEL_VGA_DEVICE_INIT(__id, ~0, ~0, __info)
-- 
2.34.1

