Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AEA7519A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2512A10EAC9;
	Fri, 28 Mar 2025 20:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5SqXESh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F2C10EAC2;
 Fri, 28 Mar 2025 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194717; x=1774730717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EegjHAouIXYQ7gyWNayidzRBJxX19BdfHBV9I1UGOJg=;
 b=W5SqXEShlyqiD2/3yXCLxuGggfozdlupjwx98HEUFSOVfh0fR1sdrMZ4
 0TRqW0g21d+EAQdNFjhbY/zuGZfqedKZlUiWUmArcKcBR3qeTg6h5+JZp
 nfa2G41SFeGqq5Q6g7Z0F+kORKIHzCAnr3xacp7jhNm+87h0O21CDTNgP
 BBWEhfV5JkWR3pLvvCGtjvwboQ8YCpsj007TU3Kv3ysc74wZHIFkB0EBT
 wmzAAt/d8z+hyO6aMklT4/K97b3rmN8MZIz9GHNu/G94pXQNdu2Iz+nwB
 5P7KdKmCUhYvE1COzzeEeo5R2bRYOycPd8Uq4bveJXOhsCUWHyRyiJZHR g==;
X-CSE-ConnectionGUID: Zguh/9VXSBmHxg0OtNTnYQ==
X-CSE-MsgGUID: +L0vrRDmQp2t/ww61KJ03w==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55945079"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55945079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
X-CSE-ConnectionGUID: W5wo62WxQ821E4Eg1nIAxA==
X-CSE-MsgGUID: ZTvlZuP6REWoUlmhVFjrbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156463084"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com
Subject: [PATCH 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper function
Date: Fri, 28 Mar 2025 20:45:13 +0000
Message-ID: <20250328204515.158038-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328204515.158038-1-jonathan.cavitt@intel.com>
References: <20250328204515.158038-1-jonathan.cavitt@intel.com>
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

Add a helper function, xe_vm_get_property, that calls the
drm_xe_vm_get_property ioctl.  Since the ioctl behaves similarly to an
xe_query in that it needs to be called once to get the size of the
return data and again to save the data, the helper function takes the
ioctl structure as a parameter.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_ioctl.c | 5 +++++
 lib/xe/xe_ioctl.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d83889188..a82714cdfd 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -232,6 +232,11 @@ void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, DRM_XE_VM_BIND_OP_UNMAP);
 }
 
+void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query)
+{
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, query), 0);
+}
+
 void xe_vm_destroy(int fd, uint32_t vm)
 {
 	struct drm_xe_vm_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 18cc2b72b2..cfeeb79f66 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -65,6 +65,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
+void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query);
 void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			uint32_t flags, uint32_t *handle);
-- 
2.43.0

