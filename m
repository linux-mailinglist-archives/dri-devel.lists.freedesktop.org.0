Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBB903B6A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296AD10E5F2;
	Tue, 11 Jun 2024 12:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtNeI3ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E666210E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107486; x=1749643486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHs+M0cV7JNoVYesp0bbKA9Vv73upHhTBosk02sX1F8=;
 b=FtNeI3ot9MqEwRPLUaGCh9qF14OPlScyiOSODOjd6AgsinoVLwS2FGhV
 HV95+XcmdUHRy1T23D7zE5W6KrsAOfGt96b14ui2u/7hOeK+dWTzTZH2U
 eoV7VUghO5ZPlLhOSS5cBKMLE5Z9EK08bvmEJu2uaWINgqmN/B0NvCm1O
 bLx3lj0C3isyt28WY89zB8eoTDWMEIYyBbGOBUMuRTx6GMS144eCsqjKe
 PfNRi17R8JU9/I+CFQf8ZrG5DhdLR0eN5bTgBL5Tj4CKpN1WQPlwhNAvw
 qVLygntjZLWyE7uS8CFnVkBFEOvfCPOq1RdHkB/J9FWdGAwWvv6BhcDCG w==;
X-CSE-ConnectionGUID: gyKYh/qjQ4aWi0f1mWmElQ==
X-CSE-MsgGUID: rV8MIN5+TSitw8McKXkJuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296043"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:46 -0700
X-CSE-ConnectionGUID: 2INI65nUSASBrP5ciu3Qiw==
X-CSE-MsgGUID: TIs/5+xrQ6muKtfgCcL9/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877018"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:44 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 05/15] accel/ivpu: Disable clock relinquish for MMIO reset
Date: Tue, 11 Jun 2024 14:04:22 +0200
Message-ID: <20240611120433.1012423-6-jacek.lawrynowicz@linux.intel.com>
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

It is required to disable NPU clock relinquish for the time
of MMIO reset. Clock relinquish gets into default (enabled)
state after MMIO reset is performed.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 13734d1abc7d..123c1f2fd554 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -504,6 +504,8 @@ static int ip_reset_lnl(struct ivpu_device *vdev)
 	int ret;
 	u32 val;
 
+	ivpu_hw_btrs_clock_relinquish_disable_lnl(vdev);
+
 	ret = REGB_POLL_FLD(VPU_HW_BTRS_LNL_IP_RESET, TRIGGER, 0, TIMEOUT_US);
 	if (ret) {
 		ivpu_err(vdev, "Wait for *_TRIGGER timed out\n");
-- 
2.45.1

