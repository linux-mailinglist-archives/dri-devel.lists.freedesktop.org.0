Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C94A006C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7C310E818;
	Fri, 28 Jan 2022 18:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028C310E76F;
 Fri, 28 Jan 2022 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395938; x=1674931938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PS1m/23XRkcfXAhz6RTQAnh4TmNL9PFELEsRwE9opwc=;
 b=RAB2GBNZtWqLCIFi+z3GhEtlrze9B3uKQ9if2rj8CtqYM3903/m723Dx
 LeOS8Xc7cgtSQIZXZCpE7bv7fTGqimsCgh/yLXAxQ9XyoEh3A/1kamJmm
 ChRv0gkiSzjymB9qjUconQWPhuRZg5f6WeIfH7W4Yqski0qiLZ3DydPMT
 Okr6mL2Bca91gVlFsPNqzJmegOOT6GvrDED8i8enHpsznoqWZIDyIuWRZ
 ZLKp3yUGgMb33Lc2hkHcNfiLNIp65UxpG6zsB0zWU4n/5n9HMYJlLgWdo
 LUX361VG4s/R3wwujgXG1eD/sumKBdXtWZihWLsjifanCHpYcQm+D70PB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490208"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490208"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718077"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:14 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/i915/dg2: Add Wa_22011100796
Date: Sat, 29 Jan 2022 00:22:08 +0530
Message-Id: <20220128185209.18077-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220128185209.18077-1-ramalingam.c@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bruce Chang <yu.bruce.chang@intel.com>

Whenever Full soft reset is required, reset all individual engines
first, and then do a full soft reset.

Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6f2821cca409..5fae56b89319 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -600,6 +600,15 @@ static int gen8_reset_engines(struct intel_gt *gt,
 		 */
 	}
 
+	/*
+	 * Wa_22011100796:dg2, whenever Full soft reset is required,
+	 * reset all individual engines firstly, and then do a full soft reset.
+	 *
+	 * This is best effort, so ignore any error from the initial reset.
+	 */
+	if (IS_DG2(gt->i915) && engine_mask == ALL_ENGINES)
+		gen11_reset_engines(gt, gt->info.engine_mask, 0);
+
 	if (GRAPHICS_VER(gt->i915) >= 11)
 		ret = gen11_reset_engines(gt, engine_mask, retry);
 	else
-- 
2.20.1

