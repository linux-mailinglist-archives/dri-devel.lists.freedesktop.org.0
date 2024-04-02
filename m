Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAE8950C8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EC110FC4C;
	Tue,  2 Apr 2024 10:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvIH1DGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E73310FC4D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055012; x=1743591012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1NDW3+cRfP0+wLX17eTWGKjCkMauyc5RVspxlnwfXg=;
 b=PvIH1DGl645NXRoGsWOXbFN0Tvy5hSwP0wlLcuH2aoBK2qtFEkERTYQX
 kUzcCwmZ+zI6IS/L4Kx6PGwTm1SbCM+umc+N9aQ6NlbCkaDk60vPQwjuR
 5Wu7RCPjdwhWqLqMJoepfbEltrFLoIEcULbR03czELW/aF/7/Au9pGH4b
 ygiLPMXhNU2iBOE8j4mY5F2g438pfMEdYaZmM07Oxh1DUA/0y6xiI8S0y
 PEdKcSLPNiZE3JES7zaix0+4bpaXvh+e5t5FEcUdU75oxUaAwmdVlPQnB
 u7faOyKHgsussTLcmvg98SKIxU0Rgi/4HwaZyl3h3PIAT3zJ3b9uUX+0p Q==;
X-CSE-ConnectionGUID: Tx0t4Z9GSIG/l3q5tpWP4w==
X-CSE-MsgGUID: GVNTA7TrQXmLbMjzFvmZGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944427"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002503"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:11 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 4/8] accel/ivpu: Put NPU back to D3hot after failed resume
Date: Tue,  2 Apr 2024 12:49:25 +0200
Message-ID: <20240402104929.941186-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

Put NPU in D3hot after ivpu_resume() fails to power up the device.
This will assure that D3->D0 power cycle will be performed before
the next resume and also will minimize power usage in this corner case.

Fixes: 28083ff18d3f ("accel/ivpu: Fix DevTLB errors on suspend/resume and recovery")
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 325b82f8d971..ba51781b5896 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -97,6 +97,7 @@ static int ivpu_resume(struct ivpu_device *vdev)
 	ivpu_mmu_disable(vdev);
 err_power_down:
 	ivpu_hw_power_down(vdev);
+	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 
 	if (!ivpu_fw_is_cold_boot(vdev)) {
 		ivpu_pm_prepare_cold_boot(vdev);
-- 
2.43.2

