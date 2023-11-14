Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BD7EA801
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E24610E43E;
	Tue, 14 Nov 2023 00:59:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947AD10E43D;
 Tue, 14 Nov 2023 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699923583; x=1731459583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zhs7+rZwn/e9+7E9fIyFMAl6CcNTd3H1MzZvegtp0ys=;
 b=K5TjL34oy5XsuYH/X74CVXSEd+YuSsQHqxUL+0ySh4VnPnHiNsw79iYk
 /+iOKooE8GRsrxhQ3qpMr3WaOrJAPvK/bmGgi74CEbrjRMHzf6oW2F6v1
 eoNMYgBfxkce8e+HVudjHklUOudt5CIosBhMYriDZbS4wZvizkNotZcPR
 teHws4Pc/3v1s+Ukhy+l63yqMFeMiMC7fAtXRpx3V79mvBq8JZK9+Fj0W
 LU8gGkoeg5y1seqDleudkKkNv3oxDafLH2p+eP9kwp/StRSUvpFbUXKkg
 lNrpFpc4XD0MOW7FP0eZwZ97Cz5neCd83g0bNm3Xc47YUkzbnDKJzAt/m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476758179"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="476758179"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714392478"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="714392478"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 13 Nov 2023 16:59:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/2] drm/i915/guc: Fix for potential false positives in GuC
 hang selftest
Date: Mon, 13 Nov 2023 17:00:15 -0800
Message-ID: <20231114010016.234570-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114010016.234570-1-John.C.Harrison@Intel.com>
References: <20231114010016.234570-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Noticed that the hangcheck selftest is submitting a non-preemptoble
spinner. That means that even if the GuC does not die, the heartbeat
will still kick in and trigger a reset. Which is rather defeating the
purpose of the test - to verify that the heartbeat will kick in if the
GuC itself has died. The test is deliberately killing the GuC, so it
should never hit the case of a non-dead GuC. But it is not impossible
that the kill might fail at some future point due to other driver
re-work.

So, make the spinner pre-emptible. That way the heartbeat can get
through if the GuC is alive and context switching. Thus a reset only
happens if the GuC dies. Thus, if the kill should stop working the
test will now fail rather than claim to pass.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index 34b5d952e2bcb..26fdc392fce6c 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -74,7 +74,7 @@ static int intel_hang_guc(void *arg)
 		goto err;
 	}
 
-	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
+	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
 	intel_context_put(ce);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-- 
2.41.0

