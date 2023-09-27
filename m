Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEB67B05A3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080E10E528;
	Wed, 27 Sep 2023 13:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CB210E528;
 Wed, 27 Sep 2023 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821941; x=1727357941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOSjxxSOK1zv287zbRh6ewhylMLtFduGVoCrCqa70s8=;
 b=Hj0IVVaUl4xtlW68f8z3PL8dtpFathmQUwElZnOk8htu/uiAGZQOEGaH
 aGQhmdcC+qDdhPP6ZhEejY1DyZH1wMVf1yu1fvnkR9DyC+VC0P0zNUSDO
 ywUsf5K4riW8k8bN9nJA7UjGZXjy5LIxpXYphXGJwd/ID/E1RISBE2fV9
 b9NwhA2CEmat70qQ5nsa9+1Z2SRkgkwjw43zgfn0somubJGfIkM2c9mjO
 K0a8rreR2WiAiYpQLDVHBEUEbhRRyieUUDtae7GlyFy6i/SAMMI4woS0G
 qYUtKpXONDeuipVfH+5rxdXma4DQ7+3PwsjE4qkJADC4sy/UbxHAaVCzK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412738622"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412738622"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752597206"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752597206"
Received: from mscanex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.17])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:38:59 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915: Add stable memory region names
Date: Wed, 27 Sep 2023 14:38:42 +0100
Message-Id: <20230927133843.247957-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

At the moment memory region names are a bit too varied and too
inconsistent to be used for ABI purposes, like for upcoming fdinfo
memory stats.

System memory can be either system or system-ttm. Local memory has the
instance number appended, others do not. Not only incosistent but thi
kind of implementation detail is uninteresting for intended users of
fdinfo memory stats.

Add a stable name always formed as $type$instance. Could have chosen a
different stable scheme, but I think any consistent and stable scheme
should do just fine.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 3d1fdea9811d..60a03340bbd4 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -216,6 +216,22 @@ static int intel_memory_region_memtest(struct intel_memory_region *mem,
 	return err;
 }
 
+static const char *region_type_str(u16 type)
+{
+	switch (type) {
+	case INTEL_MEMORY_SYSTEM:
+		return "system";
+	case INTEL_MEMORY_LOCAL:
+		return "local";
+	case INTEL_MEMORY_STOLEN_LOCAL:
+		return "stolen-local";
+	case INTEL_MEMORY_STOLEN_SYSTEM:
+		return "stolen-system";
+	default:
+		return "unknown";
+	}
+}
+
 struct intel_memory_region *
 intel_memory_region_create(struct drm_i915_private *i915,
 			   resource_size_t start,
@@ -244,6 +260,9 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	mem->type = type;
 	mem->instance = instance;
 
+	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
+		 region_type_str(type), instance);
+
 	mutex_init(&mem->objects.lock);
 	INIT_LIST_HEAD(&mem->objects.list);
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 2953ed5c3248..9ba36454e51b 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -80,6 +80,7 @@ struct intel_memory_region {
 	u16 instance;
 	enum intel_region_id id;
 	char name[16];
+	char uabi_name[16];
 	bool private; /* not for userspace */
 
 	struct {
-- 
2.39.2

