Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C237903B6E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E4310E5FA;
	Tue, 11 Jun 2024 12:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLRsE91y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9D10E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107498; x=1749643498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/Buo7Tqz95K0hexP/Ulb9XWFX4BQtf7jNZLuX2wsko=;
 b=hLRsE91yCUNBbOVjDoqMKCKA+vWDIDY0VC14Qnkt35EWQyB7z5aAxPiD
 wS7z3c9+HUwlj9tcvTr6sbpsNP7sC0MX22kTrpI3fTRvIj2A1h62Jm3EC
 /twOitl8pnjujNVqUD5jEqBGmaFqLNARx1fONFCzRQAK2jW+ZseCROgbo
 DCEk3RK2uwLPY8e4uO8tjQ74cf/YM7woDBwhCfuTqdmw3jT7DQMMZN7XP
 ZoFaALMRnl2/xzYblie5fIGBLddDP3XemBTGPx2Mbl7dIJtGKxSWA0Nez
 xsZRjhrSFFeQfnQYcTviuyrO8wMm4YAQavr5hwnQy8kL56GUFIhxHtmfG g==;
X-CSE-ConnectionGUID: mFVZzACoST6RtvXU4y2ZdA==
X-CSE-MsgGUID: 8X2kJSScSf2LujkSRjVGpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296092"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:57 -0700
X-CSE-ConnectionGUID: tKmS9AA0SRChzqEo/MPyJQ==
X-CSE-MsgGUID: Sl31U88FQz2hi4hCI8IE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877178"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:55 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 12/15] accel/ivpu: Synchronize device unbind with recovery work
Date: Tue, 11 Jun 2024 14:04:29 +0200
Message-ID: <20240611120433.1012423-13-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Do not allow unbinding device in the middle of recovery flow.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c59c6f113098..c91400ecf926 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -695,14 +695,14 @@ static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
 
 static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
+	ivpu_jobs_abort_all(vdev);
+	ivpu_pm_cancel_recovery(vdev);
 	ivpu_pm_disable(vdev);
 	ivpu_prepare_for_reset(vdev);
 	ivpu_shutdown(vdev);
 
 	ivpu_ms_cleanup_all(vdev);
-	ivpu_jobs_abort_all(vdev);
 	ivpu_job_done_consumer_fini(vdev);
-	ivpu_pm_cancel_recovery(vdev);
 	ivpu_bo_unbind_all_user_contexts(vdev);
 
 	ivpu_ipc_fini(vdev);
-- 
2.45.1

