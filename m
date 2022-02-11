Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11A4B2471
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC7110EAA3;
	Fri, 11 Feb 2022 11:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0310F10EAC6;
 Fri, 11 Feb 2022 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579304; x=1676115304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N3hcgO3ng4lFRfd8iCo1pyUlCOeXik2sIUtWfSVPkks=;
 b=TCzenP97+GWf5m2yS9YIQ0X/U6/D40z+lDWx9v2/TiwTGAAU0QxZRygz
 KldpwId1tRDL7lfHohGUyn2FHs8LgELKiURL/EW8ba5jDFJat2YdZopZu
 g3eakazVFNHivaJMv/WcUQ12c5V59vRzxgfSuaTJG0OZNZFEyuDhqw+v5
 qXCFtBJJTB8Y2ZNUfPM+dVIms1K9RUYi3REYDeWZAS4+I3chXrSP8fw40
 JxDQSFNi3BaqF04YMoqvcHXfiyIrZ8Ou+qokAKfRI4v247IXLUPylJaC0
 FQySx2cMc4FaK1aWhhg/zirNEdw2Cc8ggbBVXuVFTMIg4MKZCKMyAF1Yj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548252"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354997"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/15] drm/i915/selftests: handle allocation failures
Date: Fri, 11 Feb 2022 11:34:33 +0000
Message-Id: <20220211113437.874691-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have to contend with non-mappable LMEM, then we need to ensure the
object fits within the mappable portion, like in the selftests, where we
later try to CPU access the pages. However if it can't then we need to
gracefully handle this, without throwing an error.

Also it looks like TTM will return -ENOMEM, in ttm_bo_mem_space() after
exhausting all possible placements.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 2 +-
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 42db9cd30978..3caa178bbd07 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1344,7 +1344,7 @@ static int igt_ppgtt_smoke_huge(void *arg)
 
 		err = i915_gem_object_pin_pages_unlocked(obj);
 		if (err) {
-			if (err == -ENXIO || err == -E2BIG) {
+			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
 				i915_gem_object_put(obj);
 				size >>= 1;
 				goto try_again;
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 56dec9723601..ba32893e0873 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -822,8 +822,14 @@ static int igt_lmem_create_with_ps(void *arg)
 
 		i915_gem_object_lock(obj, NULL);
 		err = i915_gem_object_pin_pages(obj);
-		if (err)
+		if (err) {
+			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
+				pr_info("%s not enough lmem for ps(%u) err=%d\n",
+					__func__, ps, err);
+				err = 0;
+			}
 			goto out_put;
+		}
 
 		daddr = i915_gem_object_get_dma_address(obj, 0);
 		if (!IS_ALIGNED(daddr, ps)) {
-- 
2.34.1

