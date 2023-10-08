Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD57BCF45
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 18:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341BF10E044;
	Sun,  8 Oct 2023 16:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FE010E044;
 Sun,  8 Oct 2023 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696783725; x=1728319725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dNl5OmrmUJZw5IyRI+6izMIu5Y4DVfiRjQzkFmrQT0Y=;
 b=NTkhHGy2qXzosTAFWuLHoHgmXbjSbAt6BL0cR74vONppPrJyJUVKXhlM
 neEdN/tBEnRPmuY3IN2Gj9mggHn4C/Pxhi109bKwTVhtOLZdzJIpF2YXR
 /oQy6cbbTIJTRr2VsNjF86HakvN2BusHyBFQYGJh15f16RTayg0L1PQIy
 GYY/ui0ji6BOXtXtnpXZCAocA9jRscTTPoy8+9raZCLy92lOyvF+aMBxi
 ZAfFybG2whp0D0yOMtHVCjQSL8I7G5wrHUuOqyLFe7hEiVKHNCA0W7pAq
 V5ob3TFQuhvYyz8E4kzYsy1SSIzybnpzj85ULM+8v/OYwjJ9mY6Jzk9Nq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381286552"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="381286552"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 09:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="702638700"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="702638700"
Received: from yunningn-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.214.162.182])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 09:48:35 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/mtl: Remove the 'force_probe' requirement for Meteor
 Lake
Date: Sun,  8 Oct 2023 18:48:24 +0200
Message-Id: <20231008164824.919262-1-andi.shyti@linux.intel.com>
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
Cc: Aditya Chauhan <aditya.chauhan@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Meteor Lake has demonstrated consistent stability for some time.
All user-space API modifications tide to its core platform
functions are operational.

The necessary firmware components are set up and comprehensive
testing has been condused over a period.

Given the recent faborable CI results, as well, we believe it's
time to eliminate the 'force_probe' prerequisite and activate the
platform by default.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
Hello,

This patch eliminates the 'force probe' for the MTL platforms. Over the recent
weeks, MTL has demonstrated stability, consistently passing BAT tests with
success rates ranging from 98% to 100%.

There's a single issue hindering us from achieving a 100% BAT test coverage.
Fortunately, we've identified the issue, and the proposed solution can be found
here[*]. The CI results are encouraging.

Once all reviews are addressed, we plan to submit this series with the "Fixes:"
tag.

Thank you and best regards,
Andi and Radhakrishna

[*] https://patchwork.freedesktop.org/series/124744/

 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index df7c261410f7..fe748906c06f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
 	.has_pxp = 1,
 	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-	.require_force_probe = 1,
 	MTL_CACHELEVEL,
 };
 
-- 
2.40.1

