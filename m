Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32E9559BE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6E510E0FD;
	Sat, 17 Aug 2024 21:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us+cD4LV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E375B10E0FF;
 Sat, 17 Aug 2024 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928491; x=1755464491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zSjn1GkGALePdFiX3Zw3+EhUS0nsXynOjHud1rGJYog=;
 b=Us+cD4LVRwi1ziJC0evYY1jrFe5tqhQsuje1wi7htewNkDIH/e9oCLKW
 RYLarOW9+b3NsT+sxe4j7MLYe3ZA34isbyV4NNUVxxwzer5uR2J2QTz2f
 aXPpD0Luo/6MHzc44MUjClRSEvOOziQdHOxZ5m7wVgoZs5wEf92KeXqBp
 1Z8Sl0/DUiin1cfH9mdzhp7iozPRLCIwi8hCtKJts9Aq1X5RFUNVxceyd
 /IuOCwWIJxMIBwa2WakIwVMHosHIMXoMbfkNNsNqIMZyDzkCXSvuLxQzO
 5tyfCawLjsjN0/xOErnfI6srbOZPFtXY2AYyl6OSakDKZKNSCGZb/gVHk Q==;
X-CSE-ConnectionGUID: lzbCeDlJSPSUDkX+3eOSVw==
X-CSE-MsgGUID: xKqrl/AsT3mODTBIxnadww==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32775440"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="32775440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:31 -0700
X-CSE-ConnectionGUID: j8rVicVhRW2eYaqeerbEvw==
X-CSE-MsgGUID: G6o9C0gNRFebw1WXKPBuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64382540"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:29 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 07/11] drm/i915/gt: Store engine-related sysfs kobjects
Date: Sat, 17 Aug 2024 23:00:22 +0200
Message-ID: <20240817210026.310645-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 3 +++
 drivers/gpu/drm/i915/gt/sysfs_engines.c      | 6 ++++++
 drivers/gpu/drm/i915/i915_drv.h              | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index ba55c059063d..a0f2f5c08388 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -388,6 +388,9 @@ struct intel_engine_cs {
 	u32 context_size;
 	u32 mmio_base;
 
+	struct kobject *kobj;
+	struct kobject *kobj_defaults;
+
 	struct intel_engine_tlb_inv tlb_inv;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 021f51d9b456..d0bb2aa561ed 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -479,6 +479,8 @@ static void add_defaults(struct kobj_engine *parent)
 	if (intel_engine_has_preempt_reset(ke->engine) &&
 	    sysfs_create_file(&ke->base, &preempt_timeout_def.attr))
 		return;
+
+	parent->engine->kobj_defaults = &ke->base;
 }
 
 void intel_engines_add_sysfs(struct drm_i915_private *i915)
@@ -506,6 +508,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 	if (!dir)
 		return;
 
+	i915->sysfs_engine = dir;
+
 	for_each_uabi_engine(engine, i915) {
 		struct kobject *kobj;
 
@@ -526,6 +530,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 
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

