Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939534B1558
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 19:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5710E334;
	Thu, 10 Feb 2022 18:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208C410E334;
 Thu, 10 Feb 2022 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644518202; x=1676054202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LyWhbupHNmIXjb6Pei3uI7laM6LGvM10gjUbm3K//NU=;
 b=TXqDS3HqE3egBuWDxsppskcJ2Psh87ZoSqTNzZQm2pNGhyGeBjSnCVbT
 W8pf/tDP893yN9fK2uAZJANyX1uTjI45KiAVeqMTwRc83Lf9if8iX039g
 nD1cEd3G3Dh1MgvLONmuPnL23GvK1Frtyfb9A4NTn3KCHfi55r0q7P//T
 izNgby/1/Obl4auJtGPNNZ2Rrc4D1P/dPvIFQLiqAK/XDTzw/T3lW/zI3
 9n+hZMXhPJKRct5f9H5sIZJapVGh/Ti9UC+KrnWbeb3/SX/utArIfTScE
 g5Yiy+tX6nKf+2VwErIuqvuHVA4PmWgGmgNERyXNlWR6T2CUk7KTzRh1r g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248392697"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="248392697"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="526616772"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:40 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 4/6] drm/i915/gt: Re-work reset_csb
Date: Thu, 10 Feb 2022 10:36:34 -0800
Message-Id: <20220210183636.1187973-5-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210183636.1187973-1-michael.cheng@intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
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
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
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
index 6186a5e4b191..11b864fd68a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2945,9 +2945,8 @@ reset_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 
-	mb(); /* paranoia: read the CSB pointers from after the reset */
-	clflush(execlists->csb_write);
-	mb();
+	drm_clflush_virt_range(execlists->csb_write,
+			       sizeof(execlists->csb_write));
 
 	inactive = process_csb(engine, inactive); /* drain preemption events */
 
-- 
2.25.1

