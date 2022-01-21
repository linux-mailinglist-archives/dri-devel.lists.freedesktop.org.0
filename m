Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41864958F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3419810E56B;
	Fri, 21 Jan 2022 04:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0310E4CC;
 Fri, 21 Jan 2022 04:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642739829; x=1674275829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTdd8/O36pIBpX8B8vOvIBMgOq7icQmr3hTL4xnipDc=;
 b=KoXn2djgHWrNTmVR4yjk6HB/g+zQMKpqo8NDw87oVt4Nksr8/BE4DD46
 rzuT4TSX+oUNcxcBGwMov9CPPMdNn3SfedDm2vl7DTxkOhim237yD6U5E
 3CujAWibAO30txudykrxvEheiCi6q3e+u/GOtlomexJ0mJcIPaWL0G9bt
 ULCzmUYGFJk1jWhWb4iwFOOAUKjNvL1SDTO2uP5nLI5DacDR9Nz8W4aXb
 kMR2s6h8ZLYANMuN61vHc9DhqadJ11Cjrl2Akal8k9j0kkDA/Nk0G4aGG
 HzvTciQxN9YQIWsaI7axNBWY+DecBVEoq2i0XhzoEjX04TPevWWSJPrYl w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244384010"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="244384010"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="626596551"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Date: Thu, 20 Jan 2022 20:31:16 -0800
Message-Id: <20220121043118.24886-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121043118.24886-1-matthew.brost@intel.com>
References: <20220121043118.24886-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
GFP_KERNEL to fully decouple the error capture from fence signalling.

v2:
 (John Harrison)
  - Fix typo in commit message (s/do/to)

Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 67f3515f07e7a..aee42eae4729f 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1516,7 +1516,7 @@ capture_engine(struct intel_engine_cs *engine,
 	struct i915_request *rq = NULL;
 	unsigned long flags;
 
-	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
+	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL);
 	if (!ee)
 		return NULL;
 
-- 
2.34.1

