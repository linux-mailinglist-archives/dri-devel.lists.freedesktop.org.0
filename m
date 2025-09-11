Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B6B53D52
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 22:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8666810EB93;
	Thu, 11 Sep 2025 20:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvZIgljQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB3010EB90;
 Thu, 11 Sep 2025 20:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624200; x=1789160200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dh49mMIafGb6UV1KQySaY0mqAH9BH3tJDWJ2Nd0MRzg=;
 b=GvZIgljQaoZNLA0yoxmy5x3RxNfmGYy/MVpz+DaFb63bcMz6dSKBwHf9
 Vi9iz+L+EJ0oBZTafw7y556y3/GvcTAyp14hhuKpESX/MCrd1VpT9tysY
 Y0r5J0VGuf+Y61TIvV/FYd7kSd7aM1Wg53shhgR38KZibnDoF+g68jJB/
 pAv1niRJdHzgJKhcJWCqRwIJ36yAtL0ASBVXMHai6p2U8DbReoDwvAJgM
 3ihqcGt6CuZgrGoyU4r6Kc30GiFgMGNEKJLCN3/VztgGJZ0l/qkj6bHW4
 Qrd2qAkJDK+eYUWBBZCYN0POOMJgs4QXcp6Y7587y0UQAu9LG0tabSEUR w==;
X-CSE-ConnectionGUID: SNRYGELfQLCzQ7Nd6twUQw==
X-CSE-MsgGUID: NJ/yEaqvTFKFiDHbD275iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59825186"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="59825186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 13:56:39 -0700
X-CSE-ConnectionGUID: VtdvIJwvRFq2d+NUqcrNsg==
X-CSE-MsgGUID: YfVYgqlqTryVBoKt3cFVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="174234321"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2025 13:56:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/i915/guc: Skip communication warning on reset in
 progress
Date: Thu, 11 Sep 2025 16:56:37 -0400
Message-Id: <20250911205637.895174-1-zhanjun.dong@intel.com>
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
History:
v2: Update subject text, removed fixup
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

