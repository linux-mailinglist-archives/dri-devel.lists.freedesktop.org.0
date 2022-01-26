Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10249CE08
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321B410E920;
	Wed, 26 Jan 2022 15:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5710E920;
 Wed, 26 Jan 2022 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210544; x=1674746544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqwKgLLoLKvLUN0ctWqASxKCBQCvWn1O6I6S/Gs8cbE=;
 b=Xb+M3p4EMrCudDnxvTip/3pXfn9ilTWpWVJNlvIB+rrukOdSnfXAqQ57
 +ng1c0o/IsGYq1WHHCImL391Cg+dxgIpYBj6bCIBnQl2y14HEQDwbpPlI
 quBC5yTY7aAmWAthQ1Tb4P9R5UbSmRg/zKe/QfA2WLdROwWbFPusFsSCb
 YtCAzL9erumTc7qnxnteykaj7cFdfLWzwGIAbjCIB3OaewhPGq8xk0O9V
 +suNbW6vw/iFAasvcGad/fj+C8oofJD6Fc+mnm5Hyu1FCwLLuJanRJ+WK
 R44+iUVGE1eq/jEobPbRZMypk+OwSC5FeXp9w4xWanA3QvJAUGlFysfgX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885265"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885265"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386309"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/20] drm/i915/selftests: handle allocation failures
Date: Wed, 26 Jan 2022 15:21:50 +0000
Message-Id: <20220126152155.3070602-16-matthew.auld@intel.com>
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

If we have to contend with non-mappable LMEM, then we need to ensure the
object fits within the mappable portion, like in the selftests, where we
later try to CPU access the pages. However if it can't then we need to
gracefully handle this, without throwing an error.

Also it looks like TTM will return -ENOMEM if the object can't be
placed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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
index 04ae29779206..87bff7f83554 100644
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

