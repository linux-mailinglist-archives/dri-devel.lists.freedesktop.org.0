Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2040B53940
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 18:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B4D10E12D;
	Thu, 11 Sep 2025 16:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxyA6Tuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D810E12D;
 Thu, 11 Sep 2025 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757608153; x=1789144153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gw+sXxiTsZmH+DQ2p+UZWkOvzQqNrFFlv6TRPIdCtMo=;
 b=HxyA6Tuqcffps22y1s2+3QVkxMlMrQIEUtNoinfry+QQ4iW4SsMO1nob
 YmcpSaNEF0csEObFPzkkeSKVsXploAGcwSwuRnt+0eHOsVs3tbQuTsdIA
 bclSYeFJAvKYnOi2FaRGenN303dN/wA6WsR9vIyaykDL66KROTICBN2fj
 gt1LFRn4LX9z4EKvc+ED+BAWcpwWG0j/F6TewDt50n3Pb+3hceRu86flT
 5FWk54iNBxoOsNR/ARKA5qniDBvLU0Uz00a6VbsdEzSGUXOUCUGKeazg4
 Ef1YbWIKAdDCNwKjfD5wYUiurLGuskESNlMc4JAdbuOsou6GyMMD0HB0T w==;
X-CSE-ConnectionGUID: V3zjs9GSR6CTCHhKV8EWVA==
X-CSE-MsgGUID: 9cj596xSSnyCEFg2QTFIKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60057070"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="60057070"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 09:29:13 -0700
X-CSE-ConnectionGUID: 9IOE0gMzQxCToaSo5JBRcg==
X-CSE-MsgGUID: ORJ+mhG1TCC9suqAFX08JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173301753"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 09:29:13 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] fixup! drm/i915/guc: Don't receive all G2H messages in irq
 handler
Date: Thu, 11 Sep 2025 12:29:11 -0400
Message-Id: <20250911162911.884529-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GuC IRQ and tasklet handler receive just single G2H message, and let other
messages to be received from next tasklet. During this chained tasklet
process, if reset process started, communication will be disabled.
Skip warning for this condition.

Fixes: 65dd4ed0f4e1 ("drm/i915/guc: Don't receive all G2H messages in irq handler")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 380a11c92d63..baeaa437c174 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1326,8 +1326,12 @@ static void ct_try_receive_message(struct intel_guc_ct *ct)
 {
 	int ret;
 
-	if (GEM_WARN_ON(!ct->enabled))
+	if (!ct->enabled) {
+		struct intel_gt *gt = guc_to_gt(ct_to_guc(ct));
+
+		GEM_WARN_ON(!gt->uc.reset_in_progress);
 		return;
+	}
 
 	ret = ct_receive(ct);
 	if (ret > 0)
-- 
2.34.1

