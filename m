Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA359DA96
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272FB306C;
	Tue, 23 Aug 2022 10:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D99B2FDE;
 Tue, 23 Aug 2022 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661249878; x=1692785878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uWNiR7M8bUT4JAhynBPIOlI6cvuOcXNpkpD1siwzhag=;
 b=mL+SgThu6xW7P9gWPcJLHIg6r5/5L4lKn4SxuJFVadGpMRiQ0CDZ7saC
 JUdXeX6/UkZ1XyoK89b3EGi1W8rvHMDJJzdDErE230PLf4T7q8fjSSAwN
 L4e4W3zMO4kNSrnFiJHsmq0J6ql09f4K081+A+wKOU/WivaC2S3dV3zEP
 Mk6KADA/lp5UiVhcyZC2vCAXjdmnO+utehQmeATCPVs26FJE4rnXmpJw1
 r/WE7dYc9pIEEBUWBMDoQnn54uMJmV11gFSm6Oirwb6f/eX9rLv7UWvgt
 5gUCRzwZMbh55VpGRvKJhWTo4UNO7KRgxoQY2Uq8vShPWXc8UST+xwtK2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273400739"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="273400739"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 03:17:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="751639913"
Received: from jabish-mobl2.amr.corp.intel.com (HELO paris.amr.corp.intel.com)
 ([10.254.9.209])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 03:17:52 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 2/8] util_macros: Add exact_type macro to catch type
 mis-match while compiling
Date: Tue, 23 Aug 2022 19:17:23 +0900
Message-Id: <20220823101729.2098841-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823101729.2098841-1-gwan-gyeong.mun@intel.com>
References: <20220823101729.2098841-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, andrzej.hajda@intel.com,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It adds exact_type and exactly_pgoff_t macro to catch type mis-match while
compiling. The existing typecheck() macro outputs build warnings, but the
newly added exact_type() macro uses the BUILD_BUG_ON() macro to generate
a build break when the types are different and can be used to detect
explicit build errors.

v6: Move macro addition location so that it can be used by other than drm
    subsystem (Jani, Mauro, Andi)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 include/linux/util_macros.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
index 72299f261b25..b6624b275257 100644
--- a/include/linux/util_macros.h
+++ b/include/linux/util_macros.h
@@ -2,6 +2,9 @@
 #ifndef _LINUX_HELPER_MACROS_H_
 #define _LINUX_HELPER_MACROS_H_
 
+#include <linux/types.h>
+#include <linux/bug.h>
+
 #define __find_closest(x, a, as, op)					\
 ({									\
 	typeof(as) __fc_i, __fc_as = (as) - 1;				\
@@ -38,4 +41,26 @@
  */
 #define find_closest_descending(x, a, as) __find_closest(x, a, as, >=)
 
+/**
+ * exact_type - break compile if source type and destination value's type are
+ * not the same
+ * @T: Source type
+ * @n: Destination value
+ *
+ * It is a helper macro for a poor man's -Wconversion: only allow variables of
+ * an exact type. It determines whether the source type and destination value's
+ * type are the same while compiling, and it breaks compile if two types are
+ * not the same
+ */
+#define exact_type(T, n) \
+	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
+
+/**
+ * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
+ * @n: value to compare pgoff_t type
+ *
+ * It breaks compile if the argument value's type is not pgoff_t type.
+ */
+#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
+
 #endif
-- 
2.37.1

