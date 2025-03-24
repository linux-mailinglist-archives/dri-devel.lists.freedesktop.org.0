Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365DA6DB91
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153310E401;
	Mon, 24 Mar 2025 13:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6755M92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D55110E401;
 Mon, 24 Mar 2025 13:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823088; x=1774359088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5dZ7i6KdiiglMR3Z15YUXNXvlJx0fpT6bB4NJxyP8hc=;
 b=J6755M92DPMWVcZJ8dKGHxdIxEFbq8jLB+LGJZBweixCpR3d+VPJsvCl
 Rpeyzcblf1SbmHtisemCodo6hI+sBT5U3qHQgyt3l/RcmftboVrvOmKmr
 Ho3/M4G9xqNxqcnUES/9h0Hc+ONuEcTm/jgKdzbTX4i9OjyuWOR+oyhR5
 u/NR1DEGKJLtJzZqR/Z9/IEfrPJ5lS9GCCmwYrgeyVuuFg8icdCc1G/Hv
 oTUL6NrZWcRplgPiME3Yy1EYa0oSTxcORn5oWg9+EgiKNkO3X4Msa8q61
 fzUuCiN/q6Cd0GXMfKALW14n/HHQf0OSmY5Zt+PzwXXTHzkdD2N6nRYA/ Q==;
X-CSE-ConnectionGUID: Nn7JFTYZRUemA0oNNaDUag==
X-CSE-MsgGUID: +wXerguBRwmqR/SKkb3OLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55024724"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55024724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:27 -0700
X-CSE-ConnectionGUID: OGo991j7TcSNaQLJHUwMkA==
X-CSE-MsgGUID: 6iE5unEZTVWgoi/NWRltug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155060104"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 10/15] drm/i915/gt: Store engine-related sysfs kobjects
Date: Mon, 24 Mar 2025 14:29:46 +0100
Message-ID: <20250324132952.1075209-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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
index 155b6255a63e..be8f1eb77b29 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -393,6 +393,8 @@ struct intel_engine_cs {
 	u32 context_size;
 	u32 mmio_base;
 
+	struct kobject *kobj;
+
 	struct intel_engine_tlb_inv tlb_inv;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index aab2759067d2..f70f0a2983f1 100644
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
index ffc346379cc2..97806e44429c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -319,6 +319,7 @@ struct drm_i915_private {
 	struct intel_gt *gt[I915_MAX_GT];
 
 	struct kobject *sysfs_gt;
+	struct kobject *sysfs_engine;
 
 	/* Quick lookup of media GT (current platforms only have one) */
 	struct intel_gt *media_gt;
-- 
2.47.2

