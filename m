Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CB95CD4E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1802010E735;
	Fri, 23 Aug 2024 13:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Af9YUBZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3152010E726;
 Fri, 23 Aug 2024 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418621; x=1755954621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4aqNMy6s4FMTFWd5KlQ+lJRbmiAVnRP9Ol42MyvyaU=;
 b=Af9YUBZpjh81ndvNk317vQguIZrQBYIBp28iz8tvQm/EQvp5vtzbb+t2
 7LJfXSiQ2k8xkmAIj8nq3NnpF1NfwLRMZSHK1Z34J1CkC7WbZYqb6ItUs
 nRwwsis4AgvWsVRxKJUV8cljEQW+gdon/GYfJ0LEfdPYfE/z6ApZ/c/YF
 V27kiGpPHZ9yXK929HicHhYEiL1FoD6N5B6Lr6REWAi4NxgHFW5sS9Tk9
 Z/qfyu25PQoIcck73yveBFr5Zu2xhPXHnICkD4Q62vWx1FifmDou/Bvl+
 37UvL+KkHIFM0HpsgFe6qBwrk6vEyT2C+/QaYdwbyaRX3oUsJDABL36h+ g==;
X-CSE-ConnectionGUID: RHX69ZT1T9CrOVuUYH0Bgg==
X-CSE-MsgGUID: L6U7qpIAQNyF26t5jxKyZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22483372"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22483372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:16 -0700
X-CSE-ConnectionGUID: /TcCu5z6SlyCdYllpfgOYQ==
X-CSE-MsgGUID: cFu8rMLDT1i6yqHDQwbHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66614498"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:14 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 10/15] drm/i915/gt: Store engine-related sysfs kobjects
Date: Fri, 23 Aug 2024 15:08:50 +0200
Message-ID: <20240823130855.72436-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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

