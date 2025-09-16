Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA02B588F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 02:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52710E02B;
	Tue, 16 Sep 2025 00:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1tOZqmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD6810E132;
 Tue, 16 Sep 2025 00:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757981782; x=1789517782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HWUAbUGpHErEa0pJrgYy/+fOTvKDQMO/vkZ3djONlx4=;
 b=m1tOZqmJ26TkVj79ZuEOTl6gwUtIegqoLdfCC9CFLdSOKJnCMCAHNcTg
 NLsna//uqRXKuUbw3GHo2lHnb6IgFdJPue6l5moB8XY3zxV/g7aoN9qAH
 2CElMmHAn1Q81ck37z9J8mq7PfEb4KYXNDxt/TTfP6XP762tZWt6Q8yNp
 FTTOdC4K77wmrLadly2ERyRf3zVp2pwVHP8iSmItZaZaZPIxK2f/2lNga
 Z74y+b2wiSBLBj//j8v2KDGjg2fVRNZfIfVHL46CWStu6HjHtVSV9jw4t
 +74eiOL/B5Mm5lhKhUanRVQG0kF+HblYx/8nbqbLXs3v+WD+rgWc3Tyck A==;
X-CSE-ConnectionGUID: zqZthw+7S/a1OjIAk65bBQ==
X-CSE-MsgGUID: 9T2wknCKTf2dVoNkjcya4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60397343"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60397343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 17:16:21 -0700
X-CSE-ConnectionGUID: hilxYBMwQZKRKhZrvBFBDw==
X-CSE-MsgGUID: wITuX+U3QaOv6dOqr5Ry8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="178786208"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 15 Sep 2025 17:16:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3] drm/i915/guc: Skip communication warning on reset in
 progress
Date: Mon, 15 Sep 2025 20:16:18 -0400
Message-Id: <20250916001618.2138901-1-zhanjun.dong@intel.com>
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
v3: Add skip on interrupt disabled case
v2: Update subject text, removed fixup
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3e7e5badcc2b..78308ff00d68 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1325,9 +1325,15 @@ static int ct_receive(struct intel_guc_ct *ct)
 
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
+	if (!guc->interrupts.enabled)
 		return;
 
 	ret = ct_receive(ct);
-- 
2.34.1

