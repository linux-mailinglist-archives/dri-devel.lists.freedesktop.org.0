Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD54E7A28
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B2610E769;
	Fri, 25 Mar 2022 18:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F63B10E769;
 Fri, 25 Mar 2022 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648231457; x=1679767457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uIj2vn0NEDn6EEIzxQkqGz+Rh1kiEMIU4TpCRurFyb8=;
 b=nyONb+KUIGs22afKGDvFuQUAMKmTkYBctAX5Zkt2Fz8Z2s04Xa8Eow0a
 Emo4mXuX3/l0bkYYvSA4ENyH1qqs1WN8iPQVx4IJOwsnBk4SbhF/sKK0Z
 55lP4tuyQ496+ZWZTp1TU7oK3aoNrygGetr4Auvw0RwELXiLWV7QdhE8c
 /gbxiCew8Cgi/0/pjcz4nrgqKXKDXYnM1v32+6bkTlGjcDkDEvNIUIwSv
 VwsHZO6SHa1QUBXfAncsH2DvUOFfHLyBWw9fLe2zjKJ+EyDUZ0taitlHx
 /POLGmpF1//curwyoPXon7rtMFjnz+dGsbUKhEMFN0Mn9v1LyQ6e3mgMM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="258880162"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="258880162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:04:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="561922917"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:04:10 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: fix remaining_timeout in
 intel_gt_retire_requests_timeout
Date: Fri, 25 Mar 2022 10:58:39 -0700
Message-Id: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In intel_gt_wait_for_idle, we use the remaining timeout returned from
intel_gt_retire_requests_timeout to wait on the GuC being idle. However,
the returned variable can have a negative value if something goes wrong
during the wait, leading to us hitting a GEM_BUG_ON in the GuC wait
function.
To fix this, make sure to only return the timeout if it is positive.

Fixes: b97060a99b01b ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index edb881d756309..ef70c209976d8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -197,7 +197,7 @@ out_active:	spin_lock(&timelines->lock);
 		active_count++;
 
 	if (remaining_timeout)
-		*remaining_timeout = timeout;
+		*remaining_timeout = timeout > 0 ? timeout : 0;
 
 	return active_count ? timeout : 0;
 }
-- 
2.25.1

