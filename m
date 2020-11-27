Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AA2C6508
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057D16ECBC;
	Fri, 27 Nov 2020 12:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5EB6ECA3;
 Fri, 27 Nov 2020 12:10:16 +0000 (UTC)
IronPort-SDR: Xtg8DNnnlt1osZMBD6cHfMf46B0nTnhlBEqxa0YXj4II8tmRVG22y9RJarBEjBtnnZiBl1OLX5
 33BSMQwviTow==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540790"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:16 -0800
IronPort-SDR: 6tGEk5/QA0QLkZUTC35fiM0XBEk4ylsyWkAM3QYByXB+0vbfEwbCTVVN2PpcNa/J190jHpn8Zv
 sToEj7rJJH+A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029299"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 091/162] drm/i915: Store gt in memory region
Date: Fri, 27 Nov 2020 12:06:07 +0000
Message-Id: <20201127120718.454037-92-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>

Store pointer to gt closest to its memory region so that we can access
the engines corresponding to that gt via memory region.

Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 1 +
 drivers/gpu/drm/i915/intel_memory_region.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index dca1e367ab98..6f40748901da 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -298,6 +298,7 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		mem->id = i;
 		mem->type = type;
 		mem->instance = instance;
+		mem->gt = &i915->gt;
 
 		i915->mm.regions[i] = mem;
 	}
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index c047cf7c5e7c..15dcb57b4b5a 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -91,6 +91,7 @@ struct intel_memory_region {
 	u16 instance;
 	enum intel_region_id id;
 	char name[8];
+	struct intel_gt *gt; /* GT closest to this region. */
 
 	dma_addr_t remap_addr;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
