Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E757B0801
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA510E4A7;
	Wed, 27 Sep 2023 15:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FFB10E4A7;
 Wed, 27 Sep 2023 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695827966; x=1727363966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rzXFAAALld5B62v8Pm9Q2oLhNcZEuo35k2vWSq88vv0=;
 b=SU6y2UGIC/SR9eOYkcwO+U9lbYi2M4I52mzISRZaFnUKMKceWHrV53LO
 7BlhIpGIKnKWvH0T8fxk+O/jqHKvrnmm6BdU3Um4HNiQxxF/bHDLj0kG6
 RvMzkRuwP+NIhFxX38zyizM4ZkuZl+GvUL3cSzFd26tO2pqt/sbDOq3Fa
 FLNMci4+igtxXHp6jRe20Vs7wMk6tPmoltlF8T6dhqL2ojlgv68Jxl4aO
 zk1A/1gE+JAWUJaCQdjan3t4Rm0o7NP4jDNQxw/IJEkLzLYyHX927PWgW
 qatCF7B1+WPNMqx1LjlNmkrdKFKpINS6i/IsJOxZ+9sLQxFfWYpzkIzBF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362098963"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="362098963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 08:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819461153"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="819461153"
Received: from xueqilim-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.83])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 08:19:19 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH] drm/i915/gt: Apply Workaround 22016122933 to all the GT's
Date: Wed, 27 Sep 2023 17:18:39 +0200
Message-Id: <20230927151839.319008-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nirmoy Das <nirmoy.das@intel.com>

Commit f1530f912ed8 ("drm/i915/gt: Apply workaround 22016122933
correctly") adds the workaround only in non media GT's, which is
GT-0 in case of MTL. It turns out that we need to apply it in
both the GT's.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 93062c35e072..7f7af1d4dc10 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1022,5 +1022,5 @@ enum i915_map_type intel_gt_coherent_map_type(struct intel_gt *gt,
 
 bool intel_gt_needs_wa_22016122933(struct intel_gt *gt)
 {
-	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0) && gt->type == GT_MEDIA;
+	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0);
 }
-- 
2.40.1

