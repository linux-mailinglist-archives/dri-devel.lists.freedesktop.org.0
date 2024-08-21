Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF13959C38
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD62F10E8FA;
	Wed, 21 Aug 2024 12:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBpqMuph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0010E8FA;
 Wed, 21 Aug 2024 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244315; x=1755780315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4aqNMy6s4FMTFWd5KlQ+lJRbmiAVnRP9Ol42MyvyaU=;
 b=oBpqMuph+WXJXt5/ylkyENS/5haPAR5hQX3gKJsv5ff4t7zUT5IdqejQ
 T2vfjFu4dCUkCFKrLngJ0+XYPd3D7w6th7P+Ohot4iUZF6pQcfphLsMod
 jXtzdKKTuw6ElCDWeLBoimlkwUQWcDOPGfNr5H2xMqEoTXh9tUwmQ9v57
 iqwWNVTf5/HtPSzyVFpZBprF0r8BUou6CImRegJLJLoLoMyog0qzmm+FC
 r8P1aOAgUF4akxBjkNzsb6Jmth9RczA5SMOBYOBbyEdVlLcabUtAZTbnB
 Q41I90uiK2t7gHsf2Q4NkSVarfpF5lfH1uWr9sCHX87HgUuzA8Mu9D6Rz w==;
X-CSE-ConnectionGUID: PPlrZD2dQRmWjyIGbdS90w==
X-CSE-MsgGUID: PnWqiBZfTlC3PPg7yg+atA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40059715"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40059715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:15 -0700
X-CSE-ConnectionGUID: TLU1CkbtShO6DOUr/u6tcA==
X-CSE-MsgGUID: ajmHN2vvSOe0FKbyDoE03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61052227"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:14 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 10/14] drm/i915/gt: Store engine-related sysfs kobjects
Date: Wed, 21 Aug 2024 14:43:45 +0200
Message-ID: <20240821124349.295259-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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

Upcoming commits will need to access engine-related kobjects to
enable the creation and destruction of sysfs interfaces at
runtime.

For this, store the "engine" directory (i915->sysfs_engine), the
engine files (gt->kobj), and the default data
(gt->kobj_defaults).

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 2 ++
 drivers/gpu/drm/i915/gt/sysfs_engines.c      | 4 ++++
 drivers/gpu/drm/i915/i915_drv.h              | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index ba55c059063d..cdc695fda918 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -388,6 +388,8 @@ struct intel_engine_cs {
 	u32 context_size;
 	u32 mmio_base;
 
+	struct kobject *kobj;
+
 	struct intel_engine_tlb_inv tlb_inv;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 021f51d9b456..f67f76df1cfe 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -506,6 +506,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 	if (!dir)
 		return;
 
+	i915->sysfs_engine = dir;
+
 	for_each_uabi_engine(engine, i915) {
 		struct kobject *kobj;
 
@@ -526,6 +528,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 
 		add_defaults(container_of(kobj, struct kobj_engine, base));
 
+		engine->kobj = kobj;
+
 		if (0) {
 err_object:
 			kobject_put(kobj);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 94f7f6cc444c..3a8a757f5bd5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -320,6 +320,7 @@ struct drm_i915_private {
 	struct intel_gt *gt[I915_MAX_GT];
 
 	struct kobject *sysfs_gt;
+	struct kobject *sysfs_engine;
 
 	/* Quick lookup of media GT (current platforms only have one) */
 	struct intel_gt *media_gt;
-- 
2.45.2

