Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219C495433
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448910EC70;
	Thu, 20 Jan 2022 18:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2A10EC6C;
 Thu, 20 Jan 2022 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642703404; x=1674239404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1KvwH9U5LTuME2Q0NDVAi0auEid4oOyAMTMlLZm0+68=;
 b=OGd/U1rKn9Q6FaqnP2VXoK82rPqANouZvppy1xlw0njJRn+rZ0jwaprE
 Za5nwdAU8lBx3+23mzkwQqR0Za3X/E7m0ID5SOsV8Us8FHm5NGnFz168m
 W4zjUJQwfer/krLCEn94J28TmhVbJI3hV3q6Tyj2DajQPgUp++CL5Ukgf
 Qui23kbpik7YDTH2bM01QiufgRTnBH9q6U2XPL1l9cIKjaJSq5wOqo/7f
 6WljxzL34ykuJn9jhPq0GNBcJraTsIMdKf/TORDZ+P9754FqeGLsBUDcg
 nz7Jp7VxxLGCJYdLXwQ2mtmDkq1cj7zXDdJsFSemjEuRuPEwqfay77Tul w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="225402951"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="225402951"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:30:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="475627641"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:30:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Don't check CT descriptor status before CT
 write / read
Date: Thu, 20 Jan 2022 10:24:13 -0800
Message-Id: <20220120182413.8074-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't check CT descriptor status, unless CONFIG_DRM_I915_DEBUG_GUC is
set, before CT write / read as this could result in a read across the
PCIe bus thus adding latency to every CT write / read. On well behavied
systems this vaue should always read as zero. For some reason it doesn't
the CT channel is broken and will eventually recover from a GT reset,
albeit the GT reset will not be triggered immediately by seeing that
descriptor status is non-zero.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index de89d40abd38d..18af99a802f64 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -379,8 +379,10 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(desc->status))
 		goto corrupted;
+#endif
 
 	GEM_BUG_ON(tail > size);
 
@@ -815,8 +817,10 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+#ifdef CONFIG_DRM_I915_DEBUG_GUC
 	if (unlikely(desc->status))
 		goto corrupted;
+#endif
 
 	GEM_BUG_ON(head > size);
 
-- 
2.34.1

