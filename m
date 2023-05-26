Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EB712A81
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D4210E808;
	Fri, 26 May 2023 16:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D80A10E1D4;
 Fri, 26 May 2023 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118062; x=1716654062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBbrZY0sucNG0n/qHpQc7emE4qijI4QH11Qmkwa10AI=;
 b=Fpa6jAKF9DfPa/pvfIOW+cHON+auuwrVXFVvzAx1cugEz8k8g7ZArZOk
 Yqmm/6E3nph1Wmxt5Uq1Lxtk6YLCdxirUv1NpISXadkUkEX/ptb/LV52E
 +1VF44zUlY/IrSrVbGXsC4g1bHVa25OT5JZnKE4kEA4CwI2qNjUFF1zb8
 59BcqchLONOB3voJhfOC08SErgq008P4oD9Uu8EKbqdhJ5THN1+57c2DO
 zsBOZpoz90Ohy+KiEfKTs38VYMMW/aIEGZFvphbq05XxgD6cG1jo8oaLD
 R8WaDkQSjjwvNYIfr7CxZQQ3jQkZGTEKFjUC3pHBSKMCXi3+D3zaGdufw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343735784"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343735784"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849620121"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849620121"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:20:59 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/5] drm/netlink: Add netlink infrastructure
Date: Fri, 26 May 2023 21:50:12 +0530
Message-Id: <20230526162016.428357-2-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define the netlink commands and attributes that can be commonly used
across by drm drivers.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 include/uapi/drm/drm_netlink.h | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 include/uapi/drm/drm_netlink.h

diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
new file mode 100644
index 000000000000..28e7a334d0c7
--- /dev/null
+++ b/include/uapi/drm/drm_netlink.h
@@ -0,0 +1,68 @@
+/*
+ * Copyright 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _DRM_NETLINK_H_
+#define _DRM_NETLINK_H_
+
+#include <linux/netdevice.h>
+#include <net/genetlink.h>
+#include <net/sock.h>
+
+#define DRM_GENL_VERSION 1
+
+enum error_cmds {
+	DRM_CMD_UNSPEC,
+	/* command to list all errors names with config-id */
+	DRM_CMD_QUERY,
+	/* command to get a counter for a specific error */
+	DRM_CMD_READ_ONE,
+	/* command to get counters of all errors */
+	DRM_CMD_READ_ALL,
+
+	__DRM_CMD_MAX,
+	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
+};
+
+enum error_attr {
+	DRM_ATTR_UNSPEC,
+	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
+	DRM_ATTR_REQUEST, /* NLA_U8 */
+	DRM_ATTR_QUERY_REPLY, /*NLA_NESTED*/
+	DRM_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
+	DRM_ATTR_ERROR_ID, /* NLA_U64 */
+	DRM_ATTR_ERROR_VALUE, /* NLA_U64 */
+
+	__DRM_ATTR_MAX,
+	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
+};
+
+/* attribute policies */
+static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
+	[DRM_ATTR_REQUEST] = { .type = NLA_U8 },
+};
+
+static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
+	[DRM_ATTR_ERROR_ID] = { .type = NLA_U64 },
+};
+
+#endif
-- 
2.25.1

