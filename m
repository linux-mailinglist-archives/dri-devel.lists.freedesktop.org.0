Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D584B62B9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 06:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9210E152;
	Tue, 15 Feb 2022 05:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796BB10E152;
 Tue, 15 Feb 2022 05:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644903063; x=1676439063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0J+vdgH3eFwh0we7BBwoCbeo6LZDOTWWC3rE9Mva/FU=;
 b=iMvCaHPMX+57Y4/kTvMsDqkk98jJJUwny/LKqGpTv+befTqi6Rz0Pse/
 bFwcRErZ5tLrkatfTM883j7BU8zwX23vq91C1+ep0fDSKVsWy/YQ0pTvI
 RELin6zo5Lgush0kLJYrWztr7Mu6hRhGx0pnjMnoFTwYQQSKkHHi7PZLG
 7OQlsPtDuN+tRzWn4DpPOCc5FCeJUnbxiGu8ihRylowRGpAPXrnUDOTry
 WTWMTrLpxCm4kdVhV5z9qOFaOL3GOvroJmqtOzic3q98ZEYh6XkGkXLXb
 +0d8Xy/z7azk3wAPGH209x/rC83Tb2CMft51fH9w8Rf+U3VUTJeuWrb8a Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250199689"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; d="scan'208";a="250199689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:31:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; d="scan'208";a="496778639"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:31:00 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/perf: Skip the i915_perf_init for dg2
Date: Tue, 15 Feb 2022 11:01:15 +0530
Message-Id: <20220215053115.6023-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Nerlige Ramappa Umesh <umesh.nerlige.ramappa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_perf is not enabled for dg2 yet, hence skip the feature
initialization.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 36f1325baa7d..5ac9604d07b3 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4373,6 +4373,10 @@ void i915_perf_init(struct drm_i915_private *i915)
 
 	/* XXX const struct i915_perf_ops! */
 
+	/* i915_perf is not enabled for DG2 yet */
+	if (IS_DG2(i915))
+		return;
+
 	perf->oa_formats = oa_formats;
 	if (IS_HASWELL(i915)) {
 		perf->ops.is_valid_b_counter_reg = gen7_is_valid_b_counter_addr;
-- 
2.20.1

