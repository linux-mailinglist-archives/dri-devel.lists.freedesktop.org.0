Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLc6Nx/2qmlaZAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:43:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD8224143
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A81210ED6C;
	Fri,  6 Mar 2026 15:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKNXIg0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A999710ED6A;
 Fri,  6 Mar 2026 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772811803; x=1804347803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+av5cZrq/tj7cwB42vCk7jloSX+rgxaAjOnL+EpwXno=;
 b=GKNXIg0fzE8ygULKYdoBLTlrWAwPxACqiLOq+GnLDVvnvwb49LXgx4Up
 61mrOTQ6EKuZds/xwcdLMDE+5VgXegaUsIlSqODKxVUqaCFEDOSMxZviN
 ZOrH9m4wfL2jMAMEhW4j1dsW00QU8saOzXMrKTdVNfllpeqC3A0wuw0OM
 7mU65JoBW5GyjPMXODVau3Ixah4dXpFRANfoeUoNvGH7+xX3WuYYQV4LZ
 M+lCIrkMHgFNHrByJSDbKN/UuHSmq2BhlT4UhXQkguett3X5Ot5MubeA0
 zC5pXTYRPLqTmDnpMZ3Y3GryfbImZTBl8I4aLyAt5vjh+rX7xpM+473Kp Q==;
X-CSE-ConnectionGUID: 5sdOi3cnTqOQtyjIZjlWsQ==
X-CSE-MsgGUID: avlGjJGVRqqZJkdUE5i7Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85266397"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="85266397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 07:43:23 -0800
X-CSE-ConnectionGUID: a4a7t3ABTtGsYm0+DJEY2g==
X-CSE-MsgGUID: prJDx8AxQmWea7uGxiljSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="242056400"
Received: from dut4086lnl.fm.intel.com ([10.105.10.23])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 07:43:22 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, thomas.hellstrom@linux.intel.com
Subject: [PATCH v3] drm/pagemap_util: Ensure proper cache lock management on
 free
Date: Fri,  6 Mar 2026 15:43:23 +0000
Message-ID: <20260306154322.60120-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: 64CD8224143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Static analysis issue:

Though probably unnecessary given the cache is being freed at this step,
for the sake of consistency, ensure that the cache lock is always
unlocked after drm_pagemap_cache_fini.

v2:
- Use requested code flow (Maarten)

v3:
- Clear cache->dpagemap (Matt Brost, Maarten)

Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index 14ddb948a32e..6111d90a38e2 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -65,18 +65,14 @@ static void drm_pagemap_cache_fini(void *arg)
 	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
 	spin_lock(&cache->lock);
 	dpagemap = cache->dpagemap;
-	if (!dpagemap) {
-		spin_unlock(&cache->lock);
-		goto out;
-	}
+	cache->dpagemap = NULL;
+	if (dpagemap && !drm_pagemap_shrinker_cancel(dpagemap))
+		dpagemap = NULL;
+	spin_unlock(&cache->lock);
 
-	if (drm_pagemap_shrinker_cancel(dpagemap)) {
-		cache->dpagemap = NULL;
-		spin_unlock(&cache->lock);
+	if (dpagemap)
 		drm_pagemap_destroy(dpagemap, false);
-	}
 
-out:
 	mutex_destroy(&cache->lookup_mutex);
 	kfree(cache);
 }
-- 
2.43.0

