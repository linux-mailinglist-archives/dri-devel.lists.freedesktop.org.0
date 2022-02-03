Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DF4A8A09
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBFB10E1ED;
	Thu,  3 Feb 2022 17:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931010E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643909399; x=1675445399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbO6V5LmdIwbGFOj0hb/lH/sCr1eBWlcl5dO80AzHZQ=;
 b=goAwVyAnJYEe3eCmG3t9vCQpRI0J2AZUSAa+DGOjQfYg4Zr9/4AE6vJJ
 OlsLc6c8AqEcTmcfOB2IMYInCADWF3xj1a9OKCnPIMYeVsw/m1xbPhSLO
 wZ5TKZKwv7j9SuXEe5NsjQNSkkWYWQmer91XFZVbqGOaDTaBxNUtlPm9t
 38UGWabQYaO2R1+qQi/zR/zBc2LaJud8JsM2/Urs+J9CZVUuUfuMKQnyi
 ExB7FWJUGF3Wel7nKC6KqNc2PJuuL+nhhYsxNnFuVLKWwDP79nyFq4wBi
 3cU2a+/tTU/3d9XbJIc+KVG/IMPx1VboiLCOb4gosFk5QKPeYh2oMBXis w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248411959"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="248411959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:29:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="676845001"
Received: from jtvanhoo-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.132.101])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:29:58 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH v4 3/4] drm/i915/gt: Re-work reset_csb
Date: Thu,  3 Feb 2022 09:29:52 -0800
Message-Id: <20220203172953.371921-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203172953.371921-1-michael.cheng@intel.com>
References: <20220203172953.371921-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of directly invoking clflush. This
will prevent compiler errors when building for non-x86 architectures.

v2(Michael Cheng): Remove extra clflush

v3(Michael Cheng): Remove memory barrier since drm_clflush_virt_range
		   takes care of it.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7500c06562da..22505aa428d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2944,9 +2944,8 @@ reset_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 
-	mb(); /* paranoia: read the CSB pointers from after the reset */
-	clflush(execlists->csb_write);
-	mb();
+	drm_clflush_virt_range(execlists->csb_write,
+			sizeof(execlists->csb_write));
 
 	inactive = process_csb(engine, inactive); /* drain preemption events */
 
-- 
2.25.1

