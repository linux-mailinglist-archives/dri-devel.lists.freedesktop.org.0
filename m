Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF134E32BC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9092C10E4A3;
	Mon, 21 Mar 2022 22:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D291E10E495;
 Mon, 21 Mar 2022 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902304; x=1679438304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9hPR30ny74TAemwm+WbdmiuVE8CEZG+FxIv9PWxe9jE=;
 b=nE7WJT6DP83Lh3Zp4cByoZuwgejO531TPNhG21sSx83veVXvrKUhOwuv
 RicKmFeWDqRy1zII8/z4wrx8vYFuWblZDuyTMwedGBXJ6JKXqf6nBu/Zf
 sExC8npRQ98SmBG3WYJ5l/rlFkbL1gA9OmFBc1YcgL3FzrI8Ov+Q0jogb
 qRl2OxCWctECRTkkMQuFw/x6xyMMSG1GEqFlWMEBXZ+n50A3FdzZGd9sy
 cB5VE+DcVyh1V5yuFedmTFQzgcUEsUS3ZVxf6sLVEf7qlQe2Y39kUZn4C
 HH0E56CIGt1xkIJRK+bLoMYu6ikC5O+fNoEOCz/JEIYstnw59opCOAUa/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255227170"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="255227170"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518616767"
Received: from prithika-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.251.16.248])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:23 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 3/5] drm/i915/gt: Re-work reset_csb
Date: Mon, 21 Mar 2022 15:38:17 -0700
Message-Id: <20220321223819.72833-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321223819.72833-1-michael.cheng@intel.com>
References: <20220321223819.72833-1-michael.cheng@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of directly invoking clflush. This
will prevent compiler errors when building for non-x86 architectures.

v2(Michael Cheng): Remove extra clflush

v3(Michael Cheng): Remove memory barrier since drm_clflush_virt_range
		   takes care of it.

v4(Michael Cheng): Get the size of value and not the size of the pointer
		   when passing in execlists->csb_write. Thanks to Matt
		   Roper for pointing this out.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 5f8cf4942f07..46a2087a66de 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2953,9 +2953,8 @@ reset_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 
-	mb(); /* paranoia: read the CSB pointers from after the reset */
-	clflush(execlists->csb_write);
-	mb();
+	drm_clflush_virt_range(execlists->csb_write,
+			       sizeof(execlists->csb_write[0]));
 
 	inactive = process_csb(engine, inactive); /* drain preemption events */
 
-- 
2.25.1

