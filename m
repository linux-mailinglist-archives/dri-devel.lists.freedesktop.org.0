Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BAB98AD75
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AB810E588;
	Mon, 30 Sep 2024 19:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJSnEqjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD76E10E593
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726037; x=1759262037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yM0MKhjoKxQEyZyw7LFYjlTYiHAf664qO/W9thWv00g=;
 b=CJSnEqjnwif4/AV9YzadSsbH6ktJDADKEvEg29Y8/KQ2E4QAVdOORSP1
 pshvjdfiRwPwXlzj2T0/WHXGWXdP2DVFdOchWRsBiDHhqJ4+9/SU8l3qo
 Ul578mg/+u6Y8U8LGV4x0yRfMotoov8lYwDLoRS4BjbBbe54d3hKOWarj
 +xZEZ+QDcCvHYpETst6qk0zUpSuaTUAiWMTaxeAqdoxr12zp3J6mAltYk
 aRx2Hb+4mARjygdJS3a+P1HvCYQsNlL1Fp41WckrVZfCHfQPacZxEZvlk
 wDd63ZqcbuTns1dSBVLozPS7xDZGagIRgvKOzEAN2/UTMhftnarkERCIp Q==;
X-CSE-ConnectionGUID: J/0hC54wTiOAnUHiQBWBng==
X-CSE-MsgGUID: 4UGuyhJrRquRMfWvRT66jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962352"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:57 -0700
X-CSE-ConnectionGUID: 8f0ByfkaRMGz9kOX/jhFmA==
X-CSE-MsgGUID: WrvWuu3sTxCznSvKOy4NlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370152"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:55 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 20/31] accel/ivpu: Remove skip of clock own resource ack on
 Simics
Date: Mon, 30 Sep 2024 21:53:11 +0200
Message-ID: <20240930195322.461209-21-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

With recent Simics model update CLOCK_RESOURCE_OWN_ACK signal
was implemented as part of VPU STATUS register and workaround
is no longer needed.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 7dc8e333dcec2..6d5f1cc711435 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -459,9 +459,6 @@ int ivpu_hw_btrs_wait_for_clock_res_own_ack(struct ivpu_device *vdev)
 	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
 		return 0;
 
-	if (ivpu_is_simics(vdev))
-		return 0;
-
 	return REGB_POLL_FLD(VPU_HW_BTRS_LNL_VPU_STATUS, CLOCK_RESOURCE_OWN_ACK, 1, TIMEOUT_US);
 }
 
-- 
2.45.1

