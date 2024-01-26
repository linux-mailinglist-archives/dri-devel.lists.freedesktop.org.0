Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDE83DA26
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379A610F9FD;
	Fri, 26 Jan 2024 12:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4926010F9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272092; x=1737808092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3Jx00fhCon5Fno3vnzaAhGnAgKQqCLXJ+wVzwpiAos=;
 b=BjrZRGOrbf16rwLLCRW4DTvHwxi27Xh4VC1i/24IU1C4zw2TM3PDhAhF
 4ksR2VFgg5YxRgSg3ybHHl+aHbeceJVNgrsXQJsjDe+JdY9iV4B0IBusX
 jNF0AnCCkiODyVxCFfNctFKS/ql4+zqDAnCTl//KnmelUfjM8KOmKWZoc
 CYBO28OAMZbKo7R0Na+N3fV+FmopykMXkOBsyvl8EfP8LmaCDizWY+733
 mASD1Lbv2ZdxSDcJG/in3GYw2ALrUJNXDv4mK8YxsgCSI7ICqho7sqzSZ
 bzM8Cv8vh3OqOJZaPta/YLua37XgaGqoIrCub0ifEMVe1F/kbBNDSQOZA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207442"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731898"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:11 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] accel/ivpu: Disable d3hot_delay on all NPU generations
Date: Fri, 26 Jan 2024 13:28:00 +0100
Message-ID: <20240126122804.2169129-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NPU does not require this delay regardless of the generation.
All generations are integrated into the SOC.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 9418c73ee8ef..4b0640226986 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -480,9 +480,8 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
 	/* Clear any pending errors */
 	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
 
-	/* VPU 37XX does not require 10m D3hot delay */
-	if (ivpu_hw_gen(vdev) == IVPU_HW_37XX)
-		pdev->d3hot_delay = 0;
+	/* NPU does not require 10m D3hot delay */
+	pdev->d3hot_delay = 0;
 
 	ret = pcim_enable_device(pdev);
 	if (ret) {
-- 
2.43.0

