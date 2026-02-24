Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MG5AVbInWk8SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:48:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AF18948E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26EA10E5BE;
	Tue, 24 Feb 2026 15:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEUc/oTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573B10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771948113; x=1803484113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JgVIB0mXPT308ji3d+UFF09u3oVgViQL+FDTYiy2Yp4=;
 b=iEUc/oTFaHGzsSFZiO9OQw49uv0MaOx8cPfmzloJm/J/BIh0LN9xyDks
 laRLXYSGd5+SZH8A/4aJ4gbGumqLS3EnafP2LPhm3HbmwtPcH9U1y9fgZ
 mSV6ZNrMOkSOk/SQTbVwAOw33J1Nl3qKUwG65zvw/8pSGwEUMwNS/z42Y
 P2+J/f/Lzl6eQ/T1Lwl7tao22LgeiuBGE3edSIlktYtZQK2UaXe3J6IFF
 4xvrlu3PINi/lUNRJUDEWlWhrnrYoYTuLniv6BM8ReYIM+v5nVdfASz5F
 iuHwcERBd1V8LN1kj+iVKU8/zAqGKDs9tRQeNL2YARZ26SGat4JDI609R g==;
X-CSE-ConnectionGUID: 1i6cVzaMTna3wMETU/oovQ==
X-CSE-MsgGUID: 82nPqm+OQjCnm7OeJit0Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84330661"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84330661"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:48:33 -0800
X-CSE-ConnectionGUID: Zummcx4WSYSxj3LxnS8Yhg==
X-CSE-MsgGUID: uFdf4DnPQLuJ1OXUwL7cwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215178094"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4420LNL.fm.intel.com) ([10.105.10.30])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:48:32 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 matthew.brost@intel.com
Subject: [PATCH v2] drm/pagemap_util: Ensure proper cache lock management on
 free
Date: Tue, 24 Feb 2026 15:48:33 +0000
Message-ID: <20260224154832.7249-2-jonathan.cavitt@intel.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 7C4AF18948E
X-Rspamd-Action: no action

Static analysis issue:

Though probably unnecessary given the cache is being freed at this step,
for the sake of consistency, ensure that the cache lock is always
unlocked after drm_pagemap_cache_fini.

v2:
- Use requested code flow (Maarten)

Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index 14ddb948a32e..66203a19f8f6 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -65,18 +65,13 @@ static void drm_pagemap_cache_fini(void *arg)
 	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
 	spin_lock(&cache->lock);
 	dpagemap = cache->dpagemap;
-	if (!dpagemap) {
-		spin_unlock(&cache->lock);
-		goto out;
-	}
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

