Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13642984034
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3018B10E669;
	Tue, 24 Sep 2024 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sx0W2bak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B148610E664
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165921; x=1758701921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AtZjkLx6XUq8qKopW+YPOcdS8PvcoGoC2E2FOAtQY3s=;
 b=Sx0W2bakhlhhaGx3D7bDsSH+dCPvh4icwO+8eSI+L24UAINK8ti33OAa
 vuM00aszeXalYCZIgD6qDzAoejMwOeyehkkF+kkdpugeCIc+n8Qbw8gue
 POFaENgh+Ev90ecIbs7AFnqBfRKIDhA37HrmMKAGTgVIrrUV/9PyeztVD
 PpNH81/J/T+FjfSqjWzj1qeGyeuPYnX+QQnRPv5MKv3nsTpRU/iRaDD/j
 HmwXRJbyAfskBqRm0w7N4wECWtyr//EI0XP293NxHZJ+kRge6avn/rwYY
 7/c0zUK7kr9yJWRQW/vJ36/xSX7h0xgQO5ty/J1Nv10FKglYuQ9yqlUpO w==;
X-CSE-ConnectionGUID: dm/F9jdjTrSTahY6QX0m9A==
X-CSE-MsgGUID: BjJfjmquQAui2Nq8zitUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506980"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:41 -0700
X-CSE-ConnectionGUID: NXbK63IDQCu5zgdpSYvhrA==
X-CSE-MsgGUID: WGKN1ulvTNujPKk2wUN4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170732"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:40 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 18/29] accel/ivpu: Remove skip of clock own resource ack on
 Simics
Date: Tue, 24 Sep 2024 10:17:43 +0200
Message-ID: <20240924081754.209728-19-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

