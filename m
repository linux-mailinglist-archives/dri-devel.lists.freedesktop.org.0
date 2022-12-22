Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0439654884
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D6210E5C5;
	Thu, 22 Dec 2022 22:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BB510E5A1;
 Thu, 22 Dec 2022 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748121; x=1703284121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iDPh17Mb5+e063lEFVO+z7SsagRv7L5XzRmvd4hmfwo=;
 b=bal8C8WFWU8lgsdNajkF+hyUSKCp5Q5dSQ74Cx5QNHkyX7D8wzU8AiUP
 tmCf7tINN6rXxxC8hbR8eAjLNfpqmH6lsviPKaWEuHP53ajxgHrE+lw4R
 iQuOL99y+AtpVkYWP7jjqESi5jzo26ZuQLTHA3paPpXv0ZDZfpl+ULJzA
 D+wjrUymvTWxnp8DsxPjT/xsEI1VNvLH2M9zCe9u6aZ9VEPg6NwbIdUtA
 zE0u3QFzLJ67lbAR+1mMwFrbHkLwaYnu4qj7qtrwsLRWzrO8SYZqdeH7f
 n5pBmpX71yMPUCXwjwIoUh5fobgpE6GohFFIpZee3rZ4Ij/VUbVMTsWIv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472864"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472864"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412329"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412329"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 16/20] drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
Date: Thu, 22 Dec 2022 14:21:23 -0800
Message-Id: <20221222222127.34560-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Only required for some old pre-gen9 platforms, not for Xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile                         | 2 +-
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f47f00b162a4..a6e7cd2185c2 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -12,7 +12,7 @@
 # Note the danger in using -Wall -Wextra is that when CI updates gcc we
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
-subdir-ccflags-y := -Wall -Wextra
+subdir-ccflags-y := -Wall -Wextra -DI915
 subdir-ccflags-y += -Wno-format-security
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index 02605418ff08..e163eedd8ffd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -8,7 +8,11 @@
 
 #include "i915_reg_defs.h"
 
+#ifdef I915
 #define DISPLAY_MMIO_BASE(dev_priv)	(INTEL_INFO(dev_priv)->display.mmio_offset)
+#else
+#define DISPLAY_MMIO_BASE(dev_priv)    ((dev_priv) ? 0U : 0U)
+#endif
 
 #define VLV_DISPLAY_BASE		0x180000
 
-- 
2.37.3

