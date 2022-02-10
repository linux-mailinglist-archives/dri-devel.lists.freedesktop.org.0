Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE94B0D64
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 13:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDD10E855;
	Thu, 10 Feb 2022 12:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4210E855;
 Thu, 10 Feb 2022 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644495413; x=1676031413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zjxrYNJABbwO8rguV3U/HPho+jTAf9Uh9F18QktYDiM=;
 b=D5cKvpoXRUpTQ9gtk7YymEx0h7fc1htmId7OvEn+VvtaNYh2OL2z//AJ
 KmlKndGs5YjO07INbJL8Q78m23JZFObZcO1NGhfPpi++fNZtPWh5W0zRH
 nyMc84mPbJe7BZ9teV5tjZ79nClUaUyDrZmJJhnf7+46PbIdQ1ybRkWDE
 EFMJKqtR0t/8xwC3nMELn/5seqOm6r61htFBh+llGEeRl5eFxt101m/3Z
 mzpA23ZYY5qA6IuS++ZUjVdwIT/Bn1/HGfq/ENRPObaZFXfCUozVaBNP8
 phi/tndWT6fZjYiCXed68Zd70f7SLdh1nwOUXjlO2cz4sEz4G45dAvTaH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="247060984"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="247060984"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485664991"
Received: from paulbarr-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.11.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/15] drm/i915/create: apply ALLOC_GPU_ONLY by default
Date: Thu, 10 Feb 2022 12:13:10 +0000
Message-Id: <20220210121313.701004-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210121313.701004-1-matthew.auld@intel.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from DG2+, when dealing with LMEM, we assume that by default
all userspace allocations should be placed in the non-mappable portion
of LMEM.  Note that dumb buffers are not included here, since these are
not "GPU accelerated" and likely need CPU access.

In a later patch userspace will be able to provide a hint if CPU access
to the buffer is needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 9402d4bf4ffc..cc9ddb943f96 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		ext_data.n_placements = 1;
 	}
 
+	/*
+	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
+	 * can override this.
+	 */
+	if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
+			      ext_data.placements[0]->type !=
+			      INTEL_MEMORY_SYSTEM))
+		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
+
 	obj = __i915_gem_object_create_user_ext(i915, args->size,
 						ext_data.placements,
 						ext_data.n_placements,
-- 
2.34.1

