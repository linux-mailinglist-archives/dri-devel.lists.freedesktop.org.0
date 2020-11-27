Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2E2C6543
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3126ECFB;
	Fri, 27 Nov 2020 12:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C236ECF3;
 Fri, 27 Nov 2020 12:11:15 +0000 (UTC)
IronPort-SDR: JmVHXIBqFTgWINqGZDfVoXkFTM8fQjQ/0lEc47zFdkng/3myROGJP8PyFLGcci/7axtgBYx3fk
 nLrQ3pRxhV8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092861"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092861"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:14 -0800
IronPort-SDR: 3QyeH0i8+0meaZcphmIIdXHw0Jzh+pKyMAtTca40/PgLF3t634KcbbRjQXj2f/bx+yNXQW4Wf0
 Ev7Z4MH1LfRg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029709"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 116/162] drm/i915/dsb: Enable lmem for dsb
Date: Fri, 27 Nov 2020 12:06:32 +0000
Message-Id: <20201127120718.454037-117-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Animesh Manna <animesh.manna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Animesh Manna <animesh.manna@intel.com>

For dgfx, DSB should use local memory instead of system memory. Using
local memory surely brings performance improvement as local memory is
close to gpu. Also want to avoid multiple gpu using system memory.

Use LMEM API to create gem object needed for DSB command buffer.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 857126822a88..73795e415ad5 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -6,6 +6,7 @@
 
 #include "i915_drv.h"
 #include "intel_display_types.h"
+#include "gem/i915_gem_lmem.h"
 
 #define DSB_BUF_SIZE    (2 * PAGE_SIZE)
 
@@ -278,7 +279,11 @@ void intel_dsb_prepare(struct intel_crtc_state *crtc_state)
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-	obj = i915_gem_object_create_internal(i915, DSB_BUF_SIZE);
+	if (HAS_LMEM(i915))
+		obj = i915_gem_object_create_lmem(i915, DSB_BUF_SIZE, 0);
+	else
+		obj = i915_gem_object_create_internal(i915, DSB_BUF_SIZE);
+
 	if (IS_ERR(obj)) {
 		drm_err(&i915->drm, "Gem object creation failed\n");
 		kfree(dsb);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
