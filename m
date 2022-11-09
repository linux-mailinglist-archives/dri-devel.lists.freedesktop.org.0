Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5562209B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 01:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA10E10E051;
	Wed,  9 Nov 2022 00:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C7189B30;
 Wed,  9 Nov 2022 00:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667952818; x=1699488818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lu/dE8y7lzwnFXO0aHAuRErweGaKFfnHqiq0aM3lg98=;
 b=NW1AIhop2ovJGfL0DUdYXQWcfrtxz1uIStvQm6EDdyr/H5EmzLCLa1lW
 bQvvC5tlFBwun4bccLGUXlU4rc6asr2yjJ/ei5yQDtt++Jca3vY0L3xdM
 xnSxgmDFFS+n64uMXo5aLWzIT6aUrhM0Y8WL16KO9JYh8FVeQCSQaCPPD
 fE/UiYLOAO9/eamh192XN9iV7E1BIxPu76fDi7cS0/sNSMWroTRwZ4wYJ
 VVvt3S59jjv/ENrBMoACdu7vF2gQN8LmR3q3WghlZPVvH7BiHQDofHsGd
 bqTAZHSS1N1qToBycLZ59NreMWSwny/COllOoAVJZ5R0BhlEsndoKZV7V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="308463084"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="308463084"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 16:13:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="667784503"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="667784503"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 16:13:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Drop force_probe requirement
Date: Tue,  8 Nov 2022 16:13:28 -0800
Message-Id: <20221109001328.732000-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DG2 has been very usable for a while now, and all of the uapi changes
related to fundamental platform usage have been finalized.  Recent CI
results have also been healthy, so we're ready to drop the force_probe
requirement and enable the platform by default.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---

There was some recent offline discussion questioning whether we'd fully
identified the root cause of some historic CI failures, or whether it
was possible we might still have a bug lurking somewhere causing
sporadic failures.  Let's use this patch to centralize discussion about
any remaining concerns and make sure they're addressed before we apply
this.

 drivers/gpu/drm/i915/i915_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 211913be40ce..0866300243aa 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1078,7 +1078,6 @@ static const struct intel_device_info dg2_info = {
 	XE_LPD_FEATURES,
 	.__runtime.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 			       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
-	.require_force_probe = 1,
 };
 
 static const struct intel_device_info ats_m_info = {
-- 
2.38.1

