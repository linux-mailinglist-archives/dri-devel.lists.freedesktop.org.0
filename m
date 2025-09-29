Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F31DBA9CD4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B4A10E44D;
	Mon, 29 Sep 2025 15:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz7Nr/T9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1D10E44D;
 Mon, 29 Sep 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759159747; x=1790695747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I5wvUhRSJOvr9m7LdNJUFgpmYGUNTLW2qzAHCN6ffkM=;
 b=Vz7Nr/T9Zu6pqMZ3oirB/k/b2Ne9dqj4nNCnIOcvKdyiKImSW0fcVYk7
 KSVR7s5J9T/B5imbmEcX4ifMIs+IVpi03eBYD/MwWUBM7ALDW3Jv25MKz
 pGNwCmEXw0vd3bYW/LKZqqAIiK7nJOUStopd3Wzq2Paw6ln8HRHx0oUKH
 zodMry/TddDpVU3xMGZqAVm9kLyZOzvoEjCskLPLlblQX8zG9xTRpLSjL
 pAShgwnM1o7j6ZpDN0Mw4UP69svppM2nF2pnb5x7UzjaEAeCtXSgVg5w9
 om26L2VL4wr+4VEuR9FxrWv1MyzNjwMi1zrEhU6URls2vB5Ur0FYWVovy A==;
X-CSE-ConnectionGUID: 8u4utJm+QuyMMv5h1QTriw==
X-CSE-MsgGUID: tijgtRmwToivGja9y+kVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71649825"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71649825"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:29:07 -0700
X-CSE-ConnectionGUID: 98GuWbLLS2iw9ITaRfdlQA==
X-CSE-MsgGUID: C5gE/Pj9TqmRJhU9PyDM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178310283"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 29 Sep 2025 08:29:06 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
	Belgaumkar@freedesktop.org, Vinay <vinay.belgaumkar@intel.com>
Subject: [PATCH v4] drm/i915/guc: Skip communication warning on reset in
 progress
Date: Mon, 29 Sep 2025 11:29:04 -0400
Message-Id: <20250929152904.269776-1-zhanjun.dong@intel.com>
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
Cc: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
History:
v4: Add code comment
v3: Add skip on interrupt disabled case
v2: Update subject text, removed fixup
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3e7e5badcc2b..2c651ec024ef 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1325,9 +1325,16 @@ static int ct_receive(struct intel_guc_ct *ct)
 
 static void ct_try_receive_message(struct intel_guc_ct *ct)
 {
+	struct intel_guc *guc = ct_to_guc(ct);
 	int ret;
 
-	if (GEM_WARN_ON(!ct->enabled))
+	if (!ct->enabled) {
+		GEM_WARN_ON(!guc_to_gt(guc)->uc.reset_in_progress);
+		return;
+	}
+
+	/* When interrupt disabled, message handling is not expected */
+	if (!guc->interrupts.enabled)
 		return;
 
 	ret = ct_receive(ct);
-- 
2.34.1

