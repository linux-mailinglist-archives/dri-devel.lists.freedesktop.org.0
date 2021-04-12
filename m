Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210035BF7B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C30489DD2;
	Mon, 12 Apr 2021 09:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3434489533;
 Mon, 12 Apr 2021 09:09:20 +0000 (UTC)
IronPort-SDR: hC/kcfzc0YvwBtVtk1WjJNbd3j+NtyFSurmT8caJUiHDgc8TvYHDdlJJvfCAIS3pHsi9GUou9O
 nC9Zw4wJ9iLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709699"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:19 -0700
IronPort-SDR: l8H/5WGNpI7D/N3MRi12Qjk1ZJE+YO+Y9zjqH5be5CFyVx2pwl0BAg7/5slgT1DI3IrLWj/ukQ
 A5h5yQuj4KRg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712589"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/19] drm/i915/gt: Skip aperture remapping selftest where
 there is no aperture
Date: Mon, 12 Apr 2021 10:05:08 +0100
Message-Id: <20210412090526.30547-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

If there is no mappable aperture, we cannot remap it for access, and the
selftest is void.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 5fe7b80ca0bd..dd0607254a95 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -967,6 +967,9 @@ static int igt_vma_remapped_gtt(void *arg)
 	intel_wakeref_t wakeref;
 	int err = 0;
 
+	if (!i915_ggtt_has_aperture(&i915->ggtt))
+		return 0;
+
 	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
