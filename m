Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43FD6CAF45
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 21:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680CC10E74C;
	Mon, 27 Mar 2023 19:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9936410E74B;
 Mon, 27 Mar 2023 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679946996; x=1711482996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q2VBSez3j5yBTagWQwJvJHgIHgAfLi4yObWl6RlAFto=;
 b=IuBZQod33KLuaMQGdGYXuVnZnM2q6i1I78lDdld6VNMBDoXu+U/gyJ3u
 mDmL0I7cYgV1IVNLWcf0296dXPXF6wGhBSZwyJFMSYCvZAsJmBEKmfBHh
 bhQ4qDjTrRr29VS3kbGcOGz0PMvjgzBHutqfAOIHx4BwIrLtj2X+2ufZC
 kO7t/Zy+scKgA93jBPzRi36x9fwSlAe4vF9QicJ1x28OnAKt7XEIx0fuL
 k7uNYawiYYAXRiNaVz4LFejqoQE4iUEJe325PnYGHUP0IXX9HIpIQUK82
 6WLUrPNqyCeKxi0kXPu9sVuuH3V2wlbdNUX2RakWo15zdtS7KO+kZyD3+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405302648"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="405302648"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="807600384"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="807600384"
Received: from mgaucher-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.207])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:33 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 2/2] drm/i915: Check for unreliable MMIO during forcewake
Date: Mon, 27 Mar 2023 21:55:47 +0200
Message-Id: <20230327195547.356584-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327195547.356584-1-andi.shyti@linux.intel.com>
References: <20230327195547.356584-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Although we now sanitycheck MMIO access during driver load to make sure
the MMIO BAR isn't returning all 0xFFFFFFFF, there have been a few cases
where (temporarily?) unreliable MMIO access has happened after GPU
resets or power events.  We'll often notice this on our next GT register
access since forcewake handling will fail; let's change our handling
slightly so that when this happens we print a more meaningful message
clarifying that the problem is the MMIO access, not forcewake
specifically.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 14ec45e6facfa..796ebfe6c5507 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -177,12 +177,19 @@ wait_ack_set(const struct intel_uncore_forcewake_domain *d,
 static inline void
 fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
 {
-	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
+	if (!wait_ack_clear(d, FORCEWAKE_KERNEL))
+		return;
+
+	if (fw_ack(d) == ~0)
+		drm_err(&d->uncore->i915->drm,
+			"%s: MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+			intel_uncore_forcewake_domain_to_str(d->id));
+	else
 		drm_err(&d->uncore->i915->drm,
 			"%s: timed out waiting for forcewake ack to clear.\n",
 			intel_uncore_forcewake_domain_to_str(d->id));
-		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
-	}
+
+	add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
 }
 
 enum ack_type {
-- 
2.39.2

