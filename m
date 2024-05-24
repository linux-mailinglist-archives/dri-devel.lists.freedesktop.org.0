Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0A8CE638
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0CE10EBD7;
	Fri, 24 May 2024 13:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZleuUB2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C140C10EA4C;
 Fri, 24 May 2024 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557769; x=1748093769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C1PCh2T4eEpUbLo5g4nbRJtpGWGVFLkb+9vWRBO1gF0=;
 b=ZleuUB2yit82aKNd2I/Q7bb/ypM3Ow0CY6Qbb19NwsMPEr6VQarhh/oC
 scIpq+QSWRC+4wv7SqwHz0nJMPP+ydAzrwsQfvoBwqgRqZFKsPZJ+aDXZ
 r4hqh3KpiFYGUWHXsJgiEb0jK/qkzXk2bs33OXjjzSjc3B4H043rcOPlh
 1grAaNVcDdXjZTuccEg++3txjns7v+IR4YgAnkYP2p/sGK1VtJnVXHh0A
 gfz1kTOuIzaEEhdPzLCH3joDhtksxhwvCRK3bfrEPsQbKscrbcLYZ81KK
 dyE36TRE8fvIepuWAPuR8qLGPZ6qQmzQqnw6xfCaZVOXWGZdtB4fuy6ij w==;
X-CSE-ConnectionGUID: Fhki6aCGRquCAPo8LhgZOQ==
X-CSE-MsgGUID: gLjfPaB6Q/Owv3Ifp2uMhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13110047"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="13110047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:08 -0700
X-CSE-ConnectionGUID: qddlGSzwSFu/0rNsYyVUkA==
X-CSE-MsgGUID: HiSQpU6mQJym0tFPAhZvzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="64834727"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:36:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Use drm_device managed mutex/mm init helpers in
 GGTT
Date: Fri, 24 May 2024 15:35:18 +0200
Message-Id: <20240524133518.976-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240524133518.976-1-michal.wajdeczko@intel.com>
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is not need for private release action as there are existing
drmm_mm_init() and drmm_mutex_init() helpers that can be used.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 17e5066763db..7c91fe212dcb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -96,14 +96,6 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
-static void ggtt_fini_early(struct drm_device *drm, void *arg)
-{
-	struct xe_ggtt *ggtt = arg;
-
-	mutex_destroy(&ggtt->lock);
-	drm_mm_takedown(&ggtt->mm);
-}
-
 static void ggtt_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
@@ -141,6 +133,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
+	int err;
 
 	if (IS_SRIOV_VF(xe))
 		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
@@ -189,12 +182,18 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
-		    ggtt->size - xe_wopcm_size(xe));
-	mutex_init(&ggtt->lock);
+	err = drmm_mm_init(&xe->drm, &ggtt->mm, xe_wopcm_size(xe),
+			   ggtt->size - xe_wopcm_size(xe));
+	if (err)
+		return err;
+
+	err = drmm_mutex_init(&xe->drm, &ggtt->lock);
+	if (err)
+		return err;
+
 	primelockdep(ggtt);
 
-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
+	return 0;
 }
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
-- 
2.43.0

