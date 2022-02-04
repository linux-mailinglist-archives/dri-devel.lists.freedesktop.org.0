Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DD4A9D08
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D711C10E781;
	Fri,  4 Feb 2022 16:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8176E10E6D6;
 Fri,  4 Feb 2022 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643992640; x=1675528640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbO6V5LmdIwbGFOj0hb/lH/sCr1eBWlcl5dO80AzHZQ=;
 b=iUWhXXrVR5pdSWvgXDH9rQuZ/QsF15hXo2dbzH1hiKWXZQUQzjSUkRaN
 UFPAqby04/FXQBzABwVjxAk8T+sl+gg0/KLS+ROPdCnxhhDQ4Cppez8F7
 yq5Hr0lW8Pfh+R8CJIDNU1vakIJUSLr6kjwLr8ckK2gP9AgcMaskjQQIi
 +55FJChSZLaf9tsyqaAQCaXVmO9tPA/vwmVWQ3hz7kLbhqv9i7GraEBf5
 1qo5gal5u9nO9kVuwJRXPW7q9A5Le3sI+uExzG6Bj4lcB486dNegcwamn
 rPqGANJC71UBu6Gl3Zj4BCgaA6zlbRBNTJ0Ec/vuMD1MHlPT66fscg7U3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228368855"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="228368855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="699724236"
Received: from pwaterl-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.197.34])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/5] drm/i915/gt: Re-work reset_csb
Date: Fri,  4 Feb 2022 08:37:09 -0800
Message-Id: <20220204163711.439403-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204163711.439403-1-michael.cheng@intel.com>
References: <20220204163711.439403-1-michael.cheng@intel.com>
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

