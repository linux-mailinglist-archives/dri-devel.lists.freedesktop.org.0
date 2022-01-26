Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A449CE06
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBFB10E940;
	Wed, 26 Jan 2022 15:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502210E935;
 Wed, 26 Jan 2022 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210545; x=1674746545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7X/H2mlbUOUGVLFS85o8YXVSlb5lAuaTEr4TNGE9KgQ=;
 b=HNYOR3Ha7eNUhqw79qXMQ9mYqA/PgxnCqk0j/I04KA1eoRwrApRk1h03
 w7SEvvEUXlGxi0mydOn/REKlMShPPxjtaRwPZeaWiMMilekUCDuuELmJD
 R+YGkJS3MUJN4DsOcxMH783pAfsRKAl+mNP6ey3SCSNUFbRqMcbwCTVYV
 eGuBa9JtKS0JQtQqjYa2xtG8uDBTJi1YkXQ/n/0aPQmOUnXxBwtQR6YAZ
 KqcDHApXIAFAX6PZZM0OoeXTt2iV3/NUkIIQ0qvcZ3QQxQLvrkJ1Bkm7U
 vo//qRnFchOVR5bMCAr3q6EBxlLyeMnWWlTiosOB1rro+wMT1M+/X02ID g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885271"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386315"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/20] drm/i915/create: apply ALLOC_TOPDOWN by default
Date: Wed, 26 Jan 2022 15:21:51 +0000
Message-Id: <20220126152155.3070602-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
index 9402d4bf4ffc..e7456443f163 100644
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
+		ext_data.flags |= I915_BO_ALLOC_TOPDOWN;
+
 	obj = __i915_gem_object_create_user_ext(i915, args->size,
 						ext_data.placements,
 						ext_data.n_placements,
-- 
2.34.1

