Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1D800EE0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 16:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752B88130;
	Fri,  1 Dec 2023 15:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454FD10E0C6;
 Fri,  1 Dec 2023 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701446259; x=1732982259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s5skdTv7Xeg2ackpodlWcVbqhKqy3/vsHCfL29KIB28=;
 b=hlihhprZ4TODyFeUtIFrwDx/PezxQ2OivCwn8J3o+vMBd4Nr51lZkxD9
 ShEhS521iPudY3iXt00RilK7hdIIGkh5vLsYwnvVWp6mFH+u/fplkpsoX
 55SORqddZ10D2b72E4vBdtQw0OwtTMY46XLH5R77ELavPutPomN0T4fhE
 TECNhICDQwDmK6Vw3qrMjTsBh6LvNvE/nPp0ueL3JCYCI0AXdAGxmqN4f
 lG0WmOSPcCowy6kacH2M6qaEjkbSvugp5i6neYUZRMMKQm+BoJRDxY4tk
 0G76AbalS0u3sqDyYrntJOcQVwjG41E4YUhkmCoyp5TRqIhCuTLiy1wUx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397403238"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="397403238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="11193704"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:57:37 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Reduce log severity on reset prepare.
Date: Fri,  1 Dec 2023 16:44:43 +0100
Message-ID: <20231201154443.16660-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gen8_engine_reset_prepare() can fail when HW fails to set
RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
error as driver will retry.

Let the caller of gen8_engine_reset_prepare() decide if a
failure in gen8_engine_reset_prepare is an error or not.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index d5ed904f355d..e6fbc6202c80 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct intel_engine_cs *engine)
 	ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
 					   700, 0, NULL);
 	if (ret)
-		gt_err(engine->gt,
-		       "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
-		       engine->name, request,
-		       intel_uncore_read_fw(uncore, reg));
+		GT_TRACE(engine->gt,
+			 "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
+			 engine->name, request,
+			 intel_uncore_read_fw(uncore, reg));
 
 	return ret;
 }
-- 
2.42.0

