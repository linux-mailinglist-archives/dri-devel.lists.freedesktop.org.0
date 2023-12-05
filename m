Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2D804D2F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0213310E4BE;
	Tue,  5 Dec 2023 09:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CDB10E4BD;
 Tue,  5 Dec 2023 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701767147; x=1733303147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bct7twb9lZj4S2IbQNME6rHyvO9QAWywg4pODCJR70k=;
 b=VJxmTMrFVkqRwtZFdjTAy2LnDrA5Pcx+H4C6HorCnXXaDxLW5w8drzsJ
 LdoDCzkqJ2mzVp5BOQhAAD8ZHQV2aDEBTkgOYpNqMMtY9kBgLCZGVaqnR
 eZiYR1/xMClBmpdfwM2d4/qF7p78PvC2gOznY+NqDO1+WjSvSdQZ2ysJh
 4vn064nmNMAeax22n/CgVe24bitRB06kcYnm39yGGZ0Hzo0Fr3c+Kl7TQ
 qRJiU73sbqYvn4FRflxjnhSHyt1uVurP1xa+PK8TxrmQMUaYboSf/crHK
 dQzrPE7Kx6zMc4va2FQ8zxpYyFX5DtkvEl5qSeY/1OvTRznfFN4hp7DS5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="708380"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="708380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774566592"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="774566592"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:05:44 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gt: Convert reset prepare failure log to trace
Date: Tue,  5 Dec 2023 09:52:48 +0100
Message-ID: <20231205085248.2577-1-nirmoy.das@intel.com>
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

Convert the log to a trace log for debugging without triggering
unnecessary concerns in CI or for end-users during non-fatal scenarios.

v2: Improve commit message(Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
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

