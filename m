Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357749544F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3410EAFB;
	Thu, 20 Jan 2022 18:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FADF10EAFB;
 Thu, 20 Jan 2022 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642704165; x=1674240165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0EpvSC4oxJou59KY+wxq7DshBKfzOxqJmU69byYoqY=;
 b=eom1NYnsrjHJ3zD/rgdwoahVjjm8bYQZQW3xQ2YoAxwTkcT+PjiQ7hHQ
 sJR0tB0FnhJ+U5oDf26dpNxXKQWyKZl4A9hG3qSCwZ7cBm/gSylBAHWsb
 172wAbzUNTCZh8XaTauXG2tlA+odkmFt9LtFzXPihcfW/wbtsOuEn/eyY
 8Nzx7R/D+boZWYhTQg2yY4cywCkUgAJRq7rQSQO9GA8DzjDkHCdj6ZPWj
 03x54x4gqQj6eBDctls4V/taGzoBpGatP2ZAC+SXZp7nCgjHSUCQDOrEw
 8i3oi8/HclHCO3el4QfSOkNr1PEFK68b0uByVrW3ac2zzMIwapuzxoN7I w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245220043"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245220043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="626416204"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915/guc: Don't check CT descriptor status before CT
 write / read
Date: Thu, 20 Jan 2022 10:36:54 -0800
Message-Id: <20220120183655.3228-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120183655.3228-1-matthew.brost@intel.com>
References: <20220120183655.3228-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't check CT descriptor status, unless CONFIG_DRM_I915_DEBUG_GUC is
set, before CT write / read as this could result in a read across the
PCIe bus thus adding latency to every CT write / read. On well behavied
systems this vaue should always read as zero. For some reason it doesn't
the CT channel is broken and will eventually recover from a GT reset,
albeit the GT reset will not be triggered immediately by seeing that
descriptor status is non-zero.

v2:
 (CI)
  - Fix build error (hide corrupted label in write function behind
    CONFIG_DRM_I915_DEBUG_GUC)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index de89d40abd38d..948cf31429412 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -379,8 +379,10 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(desc->status))
 		goto corrupted;
+#endif
 
 	GEM_BUG_ON(tail > size);
 
@@ -445,11 +447,13 @@ static int ct_write(struct intel_guc_ct *ct,
 
 	return 0;
 
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
 corrupted:
 	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
 		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
+#endif
 }
 
 /**
@@ -815,8 +819,10 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(desc->status))
 		goto corrupted;
+#endif
 
 	GEM_BUG_ON(head > size);
 
-- 
2.34.1

