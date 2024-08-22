Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1D95BD3E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB61210EB9D;
	Thu, 22 Aug 2024 17:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nz0pCvEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CC910EB9C;
 Thu, 22 Aug 2024 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347778; x=1755883778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4aqNMy6s4FMTFWd5KlQ+lJRbmiAVnRP9Ol42MyvyaU=;
 b=Nz0pCvEaZWkC/4ZLX5AKdTgEGCg9diIB1p88Ipb7DRIig3kGGPTZCU8I
 P6ZHGpU9v77n9WFXYkvOFwfG+OJN0dkdqqgYcusCn3qYmQ+ymYkvLTc2+
 GXZbEwHQAjnvTbXZfT8D/OsG1CrytvSjo9DGW06HLpLFWsYKT+MgqMurf
 nSrPwMrAsTo9bSaa2QMx1lxqN106+u8G1PIViGYo8LnjG9pqvfUmB/9lp
 uVoK5TOuFys9ZD7nhMrxNhylmJw/QwgLmQcP3ZeMBEgM6yJuUFxXLuAL/
 CV5/VH6j4dEjEtJvDXBuEF5D0hBgVmqwXa2NIrgj6mRvK0pVTUaYYgIkH A==;
X-CSE-ConnectionGUID: oY4syDV6RlyAddTk40rTGA==
X-CSE-MsgGUID: F1fd2eNeR/SQLD6nxrws6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22935383"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22935383"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:38 -0700
X-CSE-ConnectionGUID: MWA9CRWlTNWj3FA6QeignQ==
X-CSE-MsgGUID: t54Bmj7dT4aA4xnsmS07wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84706433"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 10/15] drm/i915/gt: Store engine-related sysfs kobjects
Date: Thu, 22 Aug 2024 19:28:27 +0200
Message-ID: <20240822172832.494994-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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

