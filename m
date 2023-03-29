Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AF6CEFF9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350D910EB96;
	Wed, 29 Mar 2023 16:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65C710EB96;
 Wed, 29 Mar 2023 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680109041; x=1711645041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/NnTNnKX6BcEmvzrj0pliIl/GSE7H/KgEHGVBiwSl4w=;
 b=TfurkRbab++3fIzYwqWFPZSIJxV2zm4tbbkck2mVgewHiXQAk+ok5Lcp
 da6RaTqJ6ow4TaNnN+74bIgpslkfYZOlhmXAg1xqzHiq2R1RhBaH1HmiW
 44GWi2iAFOpwZaeDpPZHWKJH6Ks4styP5/u11m83y7c5pRvD0uBR89Swu
 neit60cc9UQVT/VuVmPxTo7UkW9Gm08hZtribHOtfM40IoFRQNgxcMZin
 xBoOVhTDWnT1qp1ySF+jaLVKlktO3dLik7plQsgfaO1U5mDPtM5vcVyQp
 sH/0mVMtZHWF80gQZC7roOuCdRKiAfURgGTsVrWyrngklqV6ziyB2dl4a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342543324"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="342543324"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748843586"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="748843586"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/mtl: Define GSC Proxy component interface
Date: Wed, 29 Mar 2023 09:56:55 -0700
Message-Id: <20230329165658.2686549-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
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
Cc: suraj.kandpal@intel.com, alan.previn.teres.alexis@intel.com,
 gregkh@linuxfoundation.org, alexander.usyskin@intel.com,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

GSC Proxy component is used for communication between the
Intel graphics driver and MEI driver.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/i915_component.h               |  3 +-
 include/drm/i915_gsc_proxy_mei_interface.h | 36 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
index c1e2a43d2d1e..56a84ee1c64c 100644
--- a/include/drm/i915_component.h
+++ b/include/drm/i915_component.h
@@ -29,7 +29,8 @@
 enum i915_component_type {
 	I915_COMPONENT_AUDIO = 1,
 	I915_COMPONENT_HDCP,
-	I915_COMPONENT_PXP
+	I915_COMPONENT_PXP,
+	I915_COMPONENT_GSC_PROXY,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/i915_gsc_proxy_mei_interface.h
new file mode 100644
index 000000000000..e817bb316d5c
--- /dev/null
+++ b/include/drm/i915_gsc_proxy_mei_interface.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2022-2023 Intel Corporation
+ */
+
+#ifndef _I915_GSC_PROXY_MEI_INTERFACE_H_
+#define _I915_GSC_PROXY_MEI_INTERFACE_H_
+
+#include <linux/mutex.h>
+#include <linux/device.h>
+
+/**
+ * struct i915_gsc_proxy_component_ops - ops for GSC Proxy services.
+ * @owner: Module providing the ops
+ * @send: sends data through GSC proxy
+ * @recv: receives data through GSC proxy
+ */
+struct i915_gsc_proxy_component_ops {
+	struct module *owner;
+
+	int (*send)(struct device *dev, const void *buf, size_t size);
+	int (*recv)(struct device *dev, void *buf, size_t size);
+};
+
+/**
+ * struct i915_gsc_proxy_component - Used for communication between i915 and
+ * MEI drivers for GSC proxy services
+ * @mei_dev: device that provide the GSC proxy service.
+ * @ops: Ops implemented by GSC proxy driver, used by i915 driver.
+ */
+struct i915_gsc_proxy_component {
+	struct device *mei_dev;
+	const struct i915_gsc_proxy_component_ops *ops;
+};
+
+#endif /* _I915_GSC_PROXY_MEI_INTERFACE_H_ */
-- 
2.37.3

