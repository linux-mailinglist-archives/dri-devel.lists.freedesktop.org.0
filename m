Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298F4DA1F6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5E10E455;
	Tue, 15 Mar 2022 18:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775710E455;
 Tue, 15 Mar 2022 18:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 529E31F43052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367510;
 bh=ToS8lMBol1VOlB+6o7QPgccbMJbV2qQuGt1LNM0xKzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mgkg5vPTu4489UhKxp8356PXehcPFvkKbjF4txpVFKtgjZcdn/BNH7T2RjOfcjs1x
 xAIph6X0fJLkVMe66iZV8BqufuSMIsd+7jeNY4dqCHVQFHqSvB/RvQ2l8Iz2Lu0Ra+
 JM1CxniNI6V+X3CHmiOTM9J18gmykw6nbqT3MEkhSyp7d/GyuWVdAQUFFpJJeZdY50
 IadRUhuf7ASVgfyWCLSOvg8cwvgw0VXhKdMXfqSTDTKkUq+GvxbO4/rSZXc2W46s1D
 M7QvkaLWvHwRBT4XU3ma1Rhf17am85K2T6T1kJPcezv5iauWB44jUt6nd5D18K1VK0
 klN+6aJcrNrtw==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 6/7] drm/i915: add range busy check for ttm region
Date: Tue, 15 Mar 2022 18:04:43 +0000
Message-Id: <20220315180444.3327283-7-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFC: should this become a generic interface in intel_memory_region_ops?

RFC: would we prefer an different interface? e.g. for_each_obj_in_range

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/intel_region_ttm.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/intel_region_ttm.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index bb564b830c96..2ccefa76348f 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -256,3 +256,22 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 
 	man->func->free(man, res);
 }
+
+/**
+ * intel_region_ttm_range_busy - check whether range has any allocations
+ * @mem: The region to check
+ * @start: the start of the range to check
+ * @end: the end of the range to check
+ *
+ * Return: true if something is alloceted within the region, false otherwise.
+ */
+bool intel_region_ttm_range_busy(struct intel_memory_region *mem,
+				 u64 start, u64 end)
+{
+	struct ttm_resource_manager *man = mem->region_private;
+
+	/* currently only supported for range allocator */
+	GEM_BUG_ON(!mem->is_range_manager);
+
+	return ttm_range_man_range_busy(man, PFN_DOWN(start), PFN_UP(end));
+}
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index fdee5e7bd46c..670ba9b618f7 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -29,6 +29,9 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 				    struct ttm_resource *res);
 
+bool intel_region_ttm_range_busy(struct intel_memory_region *mem,
+				 u64 start, u64 end);
+
 int intel_region_to_ttm_type(const struct intel_memory_region *mem);
 
 struct ttm_device_funcs *i915_ttm_driver(void);
-- 
2.25.1

