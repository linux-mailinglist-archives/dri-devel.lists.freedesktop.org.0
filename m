Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAD4C6CB4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 13:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052B10E43B;
	Mon, 28 Feb 2022 12:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352810E3D5;
 Mon, 28 Feb 2022 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646051802; x=1677587802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsviqFt7hNWLRd1G/kWAuLtD+yQ6NYGQgD0mKlu86PE=;
 b=QKfSdnWzxfvXn+CjLvTQXGrxZYlL97laxiW7WayEPl27TeFneASyi3ra
 /JsO5SWjMqVioELcIf7q4qFPthDVpqsHdml15nInNeyr2Onek0+y1tuKU
 4EIs0saFacCwsnamcmnuBeKKck6cGRzMmoomqh3fy3i0qpyH4HyG0gp1q
 XNT026j+fGsmwLJ5Ahbh/rRasoIyPSDlboheIi/d6rm3hCwszOWfyvo3J
 PRYp2CzHQholz8dQrnDbtJ6kmJMrn9qd0pj124vOuIPvUVcKX4J7G0B3T
 YrGDAol9OSa15VjBhmGZGQkJpF63sjTtb3fmhszqUGv+bh96JkE9DILMe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="233490735"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="233490735"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="550218623"
Received: from acroni2x-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 04:36:40 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 3/4] drm/i915/selftests: handle allocation failures
Date: Mon, 28 Feb 2022 12:36:06 +0000
Message-Id: <20220228123607.580432-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228123607.580432-1-matthew.auld@intel.com>
References: <20220228123607.580432-1-matthew.auld@intel.com>
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
index dbbae53f820a..7a84fa68a99c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1345,7 +1345,7 @@ static int igt_ppgtt_smoke_huge(void *arg)
 
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

