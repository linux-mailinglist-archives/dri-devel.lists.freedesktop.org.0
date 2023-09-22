Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2177AB300
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7FC10E671;
	Fri, 22 Sep 2023 13:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692E10E669;
 Fri, 22 Sep 2023 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695390432; x=1726926432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVw9wU2XgxZguPJaJpSBOG1Ig9/3oFpj/oLi+q5jzy4=;
 b=dM8XW3SNDtCQEvwweQRaqz1gCEPhyppqQalOm8Vzbgn13RpZr+RHDOEo
 8Asds7slhswcvM8xMYgKaeeEBbrmThnAzAd5y3q92Pp/PVwNT/R3TiMbD
 HGnrECbUPHeF1C14ZfFECsQ42IrrirNrJcbLlq0F5SzxEbYxFug2/wtt7
 CVHq6KnB0h7LoPyyOJJWLoSzzZkcz0qFlVH1oZr1ZdNOpb4hqrZAIzvWj
 bO2VdTFc9Kyqd/CH9lv61v/PLBJ7i+gymK/RIhainXpIVbcoaqpHPHdhe
 BLKAF4HuUROFyCpQjRi5BiJkwqx3Eopui5hGGaoB4CRbuqCQS2nwpzj6K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467126592"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="467126592"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078376243"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="1078376243"
Received: from placki-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:10 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: Add stable memory region names
Date: Fri, 22 Sep 2023 14:46:59 +0100
Message-Id: <20230922134700.235039-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

