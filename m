Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0926CBD299
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B3310E2DE;
	Mon, 15 Dec 2025 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYYW6RXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2F10E2DE;
 Mon, 15 Dec 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765790833; x=1797326833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K7rGYcDgup0mYT0xXApu3yTzo0YPXf5/isB1jezk7tA=;
 b=NYYW6RXnL6B4afEfw9kcJa6+bTCcxzKyJmpEifrSS9Lh/I/9UWIN6WrY
 5EKm6GWzz6agJq3z1pcqeWoyKmQUanbO0MfY8jKLMJTIK2TqCTf+azhK9
 x0REzI4ofynvTRDEmdC8A5mvd3jTg52xKwPipdUB9tAzyAeg0cK3Y6gHu
 JyAqQQsHbRMSY8V4nLYOKaV2FDlxCgfJpOeK5H7xPqHVdLALAOEW7XXxy
 Z+uWZ4QBoeIP2L9EDPX1Vtg7dBLBbEPB990iQNBycNnvBHSu6jZXo0q0A
 weqERJZPeDyfswVRZU2x0iumYHS/V2Lur3xNJ7zrm2se8vBNGO/kIONhJ g==;
X-CSE-ConnectionGUID: GdaY9kpkQ7GOQD3UtMx9UA==
X-CSE-MsgGUID: H5GsoHLXQmGH5PHNrNvGXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66675509"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="66675509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:27:12 -0800
X-CSE-ConnectionGUID: QasBYOo9QTec2jI2QSvYNw==
X-CSE-MsgGUID: eP1uxJvhRfuSCVs/JI1dMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197568896"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:27:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/gem: fix build for mm_get_unmapped_area() call after
 backmerge
Date: Mon, 15 Dec 2025 11:27:06 +0200
Message-ID: <20251215092706.3218018-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Commit 9ac09bb9feac ("mm: consistently use current->mm in
mm_get_unmapped_area()") upstream dropped a parameter from
mm_get_unmapped_area() while commit 99bda20d6d4c ("drm/gem: Introduce
drm_gem_get_unmapped_area() fop") in drm-misc-next added a new user.

Drop the extra parameter from the call.

Fixes: 7f790dd21a93 ("Merge drm/drm-next into drm-misc-next")
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index bcc08a6aebf8..28d6792112be 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1303,8 +1303,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
 
 	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
 	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
-		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
-					    flags);
+		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
 
 	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
 						 flags);
-- 
2.47.3

