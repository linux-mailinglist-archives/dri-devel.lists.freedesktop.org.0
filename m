Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023506731F8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 07:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E8810E8BB;
	Thu, 19 Jan 2023 06:50:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE6310E8B1;
 Thu, 19 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674111033; x=1705647033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ApBBVQEaos4a6GRX2pfjG8CAy0S+vGQGh3ubPkQY46g=;
 b=Ug9MTBVsx028ogDDhSYVOtRQg66cuQvcbbasmR2Cb3SU5DLEFRbh6XRH
 qjWfl2B3Xn9ZklgU4SyFmDOq4VIsGfF/FpI15hVKraEMLQ6Myr023+hzY
 7tBJFyKWp6346Gbpe6jezJDcWcUGJ1qRGt+RYHF6yoMwGYOaly0M7Zmer
 nXNc4L7pp0jtgrVm2+dXvyxQEXVmkaZvUJP9HjGgbVCoakBsuxdjj5Ndi
 bEkuR9WzAt7ojCspJKP3qUqGDpVUBevL8GQ4a1VXViQj6M1jv0d1/blnq
 VsyNYKNn7jItR0uSFqbORwmlbzpKoeMsibvbH+kyQab7HecCAbukK/Jt7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323897864"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="323897864"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 22:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723385745"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="723385745"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 22:50:21 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 4/6] drm/i915: Allow error capture of a pending request
Date: Wed, 18 Jan 2023 22:49:58 -0800
Message-Id: <20230119065000.1661857-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A hang situation has been observed where the only requests on the
context were either completed or not yet started according to the
breaadcrumbs. However, the register state claimed a batch was (maybe)
in progress. So, allow capture of the pending request on the grounds
that this might be better than nothing.

v2: Reword 'not started' warning message (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 743614fff5472..0d1e68830b75e 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1624,12 +1624,9 @@ capture_engine(struct intel_engine_cs *engine,
 		return NULL;
 
 	intel_get_hung_entity(engine, &ce, &rq);
-	if (rq && !i915_request_started(rq)) {
-		drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
-			 engine->name);
-		i915_request_put(rq);
-		rq = NULL;
-	}
+	if (rq && !i915_request_started(rq))
+		drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
+			 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
 
 	if (rq) {
 		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
-- 
2.39.0

