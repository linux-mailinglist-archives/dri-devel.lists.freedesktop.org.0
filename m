Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393EA21D43
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B586610E7E6;
	Wed, 29 Jan 2025 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJcmH+7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594A710E7E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738154416; x=1769690416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ORDKKvPDsTtumPUvXJ34As3hCg4Jf6LPzVj4Imt/ICQ=;
 b=QJcmH+7tk3idvl/GzUFwasy5OKYYCAS++PF5lyp7sFPLgJWvneOwLtjX
 TnMCooQCcmEJrZLq8b+HOUIK+hvTxFbypYzp2mUnpOz3ebW3tHwWP8nR1
 0VNb7Ugvp3+MmrNeJo0UY91ODw3SK+doXrCsvYhacRFEDFf+wvMT7f3VT
 F8YGTeJ1LTQJS7oCqG3egowau+jcGnnUPkjY5zML+BzZHYGUo0SrjfaTp
 qTRjd0f0zr+XED/aurR8r8AXbX7SrClgs0TV3lGDWfXBjTk8qU9YBwmTh
 pGiRd1ENPI6Z7ox82gz0U1X+In1Yfxp4h9o+kv6wut50utx/Dv0PFg5Zk g==;
X-CSE-ConnectionGUID: C5gd+gWoS0im6rIbOT5j7w==
X-CSE-MsgGUID: smbS6d10RfCvHpTx+c/UjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49647263"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="49647263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:16 -0800
X-CSE-ConnectionGUID: Zi/2YPCAQVSWEVsi2qhNiw==
X-CSE-MsgGUID: puULkPcaSXO+w6n18m+U7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113030871"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:40:13 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org, Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 1/3] accel/ivpu: Fix error handling in ivpu_boot()
Date: Wed, 29 Jan 2025 13:40:07 +0100
Message-ID: <20250129124009.1039982-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
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

Ensure IRQs and IPC are properly disabled if HW sched or DCT
initialization fails.

Fixes: cc3c72c7e610 ("accel/ivpu: Refactor failure diagnostics during boot")
Cc: <stable@vger.kernel.org> # v6.13+
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ca2bf47ce2484..0c4a82271c26d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -397,15 +397,19 @@ int ivpu_boot(struct ivpu_device *vdev)
 	if (ivpu_fw_is_cold_boot(vdev)) {
 		ret = ivpu_pm_dct_init(vdev);
 		if (ret)
-			goto err_diagnose_failure;
+			goto err_disable_ipc;
 
 		ret = ivpu_hw_sched_init(vdev);
 		if (ret)
-			goto err_diagnose_failure;
+			goto err_disable_ipc;
 	}
 
 	return 0;
 
+err_disable_ipc:
+	ivpu_ipc_disable(vdev);
+	ivpu_hw_irq_disable(vdev);
+	disable_irq(vdev->irq);
 err_diagnose_failure:
 	ivpu_hw_diagnose_failure(vdev);
 	ivpu_mmu_evtq_dump(vdev);
-- 
2.45.1

