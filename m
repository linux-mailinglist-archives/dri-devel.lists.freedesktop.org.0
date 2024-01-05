Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFE8252AA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77B10E5BF;
	Fri,  5 Jan 2024 11:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482B910E5BE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453746; x=1735989746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UWNLdrcrKTEq+t2GiyY0xLZPjEC7J0rSpLBMMGOEOO0=;
 b=Gz1r9LXFzwdhozULcGvBHp9NuTDbv8EYRuidI7itM9bcfA1BbZMc6G9+
 bJoT11azQ11d3Y6c4u/cLIRTiG+y7ZZNPOKlhjVehAamFw2K7NcGV29q0
 a0IuBVXlk5yC3juxoctEvBTjAgFSqo4fUJTeGlo9bybw5Q8JmzK5ShS5g
 KLSYDF/7WR4Ke3d5nuPF2ngRlTuGQ+ILn/eZAPeyYh5VmKu3jV/4Sw+iH
 Cvti9lXt85XJ0kIFQpQ32QbfkowuKjzCsFAXR73jtGTTSNAbw3D7oj140
 1U8L/UTsjFP8Sn16WHn8T0M1UHVcJSnwg8fPV8TOXtqkFd/RfQ1u74Mxe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255392"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255392"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918712"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918712"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:24 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] accel/ivpu: Call diagnose failure in
 ivpu_mmu_cmdq_sync()
Date: Fri,  5 Jan 2024 12:22:10 +0100
Message-ID: <20240105112218.351265-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Check for possible failure reasons in the buttress.
Some errors (like external abort) should have corresponding buttress errors
registers set indicating the real reason of failure.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 92ef651098d8..1f813625aab3 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -7,6 +7,7 @@
 #include <linux/highmem.h>
 
 #include "ivpu_drv.h"
+#include "ivpu_hw.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
@@ -518,6 +519,7 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 
 		ivpu_err(vdev, "Timed out waiting for MMU consumer: %d, error: %s\n", ret,
 			 ivpu_mmu_cmdq_err_to_str(err));
+		ivpu_hw_diagnose_failure(vdev);
 	}
 
 	return ret;
-- 
2.43.0

