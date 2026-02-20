Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANobLX6xmGntKwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 20:09:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9516A462
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 20:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BA410E11B;
	Fri, 20 Feb 2026 19:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPa4v80t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2930510E11B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771614585; x=1803150585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nMhnWyNVvNZFRI8F9ZyOeUfXIck33FD7fXD2xmhmiu8=;
 b=kPa4v80tgDSIGJ4CpahxMtMwTYwWXwHE2Yh1mIiq02ORMiPh3ser/IMa
 tYLBgIAIVR8WuvBwvHoSe5ebeL+AjMZFi+M5EZqVEheTpzEt0FSVyewfo
 JxnY4N/0l070jyJn4xF7jW3ppksJB0Hddbhp5B5VrKJld1tEDhHADaC8K
 dbvnhC1ISjAN5aa5qJXEJXykVg4ricN7dKfzXqB9nTOSja6xmMf/jEmjU
 +bWddAtlJsnyrB3tgLcGLtIg2PCRiH4nr7v3s1peeKKk1QfZZf8FCEh7Q
 PO36uTbDH8y4SOQfSlx/kxD9E+jXZTfsqZsJI3G4tNbT1NGKyDbd85wwn w==;
X-CSE-ConnectionGUID: t4rt/6SUSUu1x0jFJDBicg==
X-CSE-MsgGUID: Jg2snQSXSkag6bKXgLuwkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75323020"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75323020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 11:09:44 -0800
X-CSE-ConnectionGUID: rxiSZEnQTg2jeyFCcwK72w==
X-CSE-MsgGUID: pDEQn4SATjyQSi/ZtbzXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215065941"
Received: from dut4086lnl.fm.intel.com ([10.105.10.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 11:09:44 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 matthew.brost@intel.com
Subject: [PATCH] drm/pagemap_util: Ensure proper cache lock management on free
Date: Fri, 20 Feb 2026 19:09:44 +0000
Message-ID: <20260220190943.66961-2-jonathan.cavitt@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04C9516A462
X-Rspamd-Action: no action

Static analysis issue:

Though probably unnecessary given the cache is being freed at this step,
for the sake of consistency, ensure that the cache lock is always
unlocked after drm_pagemap_cache_fini.

Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index c6ae3357c7fb..79e07b3658ed 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -65,18 +65,18 @@ static void drm_pagemap_cache_fini(void *arg)
 	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
 	spin_lock(&cache->lock);
 	dpagemap = cache->dpagemap;
-	if (!dpagemap) {
-		spin_unlock(&cache->lock);
+	if (!dpagemap)
 		goto out;
-	}
 
 	if (drm_pagemap_shrinker_cancel(dpagemap)) {
 		cache->dpagemap = NULL;
 		spin_unlock(&cache->lock);
 		drm_pagemap_destroy(dpagemap, false);
+	} else {
+out:
+		spin_unlock(&cache->lock);
 	}
 
-out:
 	mutex_destroy(&cache->lookup_mutex);
 	kfree(cache);
 }
-- 
2.43.0

