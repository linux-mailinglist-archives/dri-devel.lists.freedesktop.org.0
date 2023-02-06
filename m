Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400068C5D6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62FB10EA0B;
	Mon,  6 Feb 2023 18:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE1F10EA00;
 Mon,  6 Feb 2023 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675708399; x=1707244399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pr+nXUxDPenDsA2d3rV2417ybQW8Aq0jqs5u4zQTh00=;
 b=XDlhLghw3c3bXQ624H8O1ORj3GzKYq7mlxKk8uwvLs1Hiz3cLQeS72H6
 ASP92fLR+AXuahCzRRoLfiXkxgZEImpDaZwrkrjmNMujiXOVNjeDnpIAo
 E7JM4RxqHV2jHdbphyJBJh1C9OJ8QC36trHHdV6AU0HELSbysAZxsKyfY
 kBs5gRdxJtM2xN+ONYfoTkWIQZfKYT0J4wFXebSzRw5ItuimTN1LhBt/g
 AmijUllASzOd0w1xLkXAUZC2e7e5hlc7yI+j/n0VoLKYSh4cuI2455Y+A
 Mgs18EGtDzcWQPOUc2M88H9TOuEHHck0Rqeis8iHO+eJ0SmEzNEc0C7Xv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356645199"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="356645199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 10:32:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809218470"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="809218470"
Received: from bducamp-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.36.163])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 10:32:54 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/pcode: Give the punit time to settle before
 fatally failing
Date: Mon,  6 Feb 2023 19:32:36 +0100
Message-Id: <20230206183236.109908-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

During module load the punit might still be busy with its booting
routines. During this time we try to communicate with it but we
fail because we don't receive any feedback from it and we return
immediately with a -EINVAL fatal error.

At this point the driver load is "dramatically" aborted. The
following error message notifies us about it.

   i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)

It would be enough to wait a little in order to give the punit
the chance to come up bright and shiny, ready to interact with
the driver.

Wait up 10 seconds for the punit to settle and complete any
outstanding transactions upon module load. If it still fails try
again with a longer timeout, 180s, 3 minutes. If it still fails
then return -EPROBE_DEFER, in order to give the punit a second
chance.

Even if these timers might look long, we should consider that the
punit, depending on the platforms, might need long times to
complete its routines. Besides we want to try anything possible
to move forward before deciding to abort the driver's load.

The issue has been reported in:

   https://gitlab.freedesktop.org/drm/intel/-/issues/7814

The changes in this patch are valid only and uniquely during
boot. The common transactions with the punit during the driver's
normal operation are not affected.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
Hi,

I'm proposing again the same patch as v1 with a hopefully more
descriptive commit log in order to minimize the
misunderstandings that we had during the v1 review.

Thanks,
Andi

Changelog:
==========
v1 -> v2:
 - write a more descriptive commit log.
 - add Chris SoB which was triggering a checkpatch error.

 drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
index a234d9b4ed143..3db2ba439bb57 100644
--- a/drivers/gpu/drm/i915/intel_pcode.c
+++ b/drivers/gpu/drm/i915/intel_pcode.c
@@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
 #undef COND
 }
 
+static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
+{
+	if (__intel_wait_for_register_fw(uncore,
+					 GEN6_PCODE_MAILBOX,
+					 GEN6_PCODE_READY, 0,
+					 500, timeout_ms,
+					 NULL))
+		return -EPROBE_DEFER;
+
+	return skl_pcode_request(uncore,
+				 DG1_PCODE_STATUS,
+				 DG1_UNCORE_GET_INIT_STATUS,
+				 DG1_UNCORE_INIT_STATUS_COMPLETE,
+				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
+}
+
 int intel_pcode_init(struct intel_uncore *uncore)
 {
+	int err;
+
 	if (!IS_DGFX(uncore->i915))
 		return 0;
 
-	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
-				 DG1_UNCORE_GET_INIT_STATUS,
-				 DG1_UNCORE_INIT_STATUS_COMPLETE,
-				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
+	/*
+	 * Wait 10 seconds so that the punit to settle and complete
+	 * any outstanding transactions upon module load
+	 */
+	err = pcode_init_wait(uncore, 10000);
+
+	if (err) {
+		drm_notice(&uncore->i915->drm,
+			   "Waiting for HW initialisation...\n");
+		err = pcode_init_wait(uncore, 180000);
+	}
+
+	return err;
 }
 
 int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
-- 
2.39.1

