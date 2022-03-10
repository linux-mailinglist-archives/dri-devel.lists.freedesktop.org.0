Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A64D46E5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF0910EAB2;
	Thu, 10 Mar 2022 12:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432F210EA9D;
 Thu, 10 Mar 2022 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915308; x=1678451308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Gwec4q2cDKHyNIkCz+6Fl23U8jm8YNf66wvC8Un4Y0=;
 b=FoLfTL5EJ0r4PQ4aa2VkWMXbvq3xDkbTGhT/l1mdBX5cHM6jY7qUpVDt
 vCZiOqN2CrZMKq/t0v9GEviavVnDa46Odxkh3txtzOwrLoTAmn8afSe/i
 H5e3UFiHHEM32dA3UxzXNs0zPAPE/RE9YLv1w1soKYQPnO/N0JKZe8+Dw
 BiICpnHrG3KksG2G7B1HexDqFwwj1JDnf6gWKaiXiwvdP2ujp4seJ9pM5
 VqxmjX/uEAib/Q3bpT+L01Hz3CR6oyeTmDYNpAebCDvyQC4yhsKHBQrhl
 HDkt0wmSqULOjxMfmb8k9+TNgHB3n9LS3HP2GuZxAvX+WV3AYm4m/YTGT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665172"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665172"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237743"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/i915/display: Check mappable aperture when pinning
 preallocated vma
Date: Thu, 10 Mar 2022 12:27:49 +0000
Message-Id: <20220310122751.89693-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310122751.89693-1-matthew.auld@intel.com>
References: <20220310122751.89693-1-matthew.auld@intel.com>
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
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Ap Kamal <kamal.ap@intel.com>, Chris P Wilson <chris.p.wilson@intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

When system does not have mappable aperture, ggtt->mappable_end=0. In
this case if we pass PIN_MAPPABLE when pinning vma, the pinning code
will return -ENOSPC. So conditionally set PIN_MAPPABLE if HAS_GMCH().

Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Ap Kamal <kamal.ap@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 5227e5b35206..f797fcef18fc 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -51,6 +51,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	u32 base, size;
+	u64 pinctl;
 
 	if (!mem || plane_config->size == 0)
 		return NULL;
@@ -101,7 +102,10 @@ initial_plane_vma(struct drm_i915_private *i915,
 	if (IS_ERR(vma))
 		goto err_obj;
 
-	if (i915_ggtt_pin(vma, NULL, 0, PIN_MAPPABLE | PIN_OFFSET_FIXED | base))
+	pinctl = PIN_GLOBAL | PIN_OFFSET_FIXED | base;
+	if (HAS_GMCH(i915))
+		pinctl |= PIN_MAPPABLE;
+	if (i915_vma_pin(vma, 0, 0, pinctl))
 		goto err_obj;
 
 	if (i915_gem_object_is_tiled(obj) &&
-- 
2.34.1

