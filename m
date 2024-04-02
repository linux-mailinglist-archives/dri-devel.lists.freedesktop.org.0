Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B698950C6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0C110FC4A;
	Tue,  2 Apr 2024 10:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbv+bjw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DC310FC4A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055011; x=1743591011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6lBfGpyYrM7UmFRJx/uEzPLjeYuHkK68XVP6SOldfac=;
 b=cbv+bjw3MxWTqFYgMGP/aKfs6HFWFkC7WH4Ge51lSaH6h71NTncs7rBV
 bT96lxrUdW6wHSJT7iumAxZ74RX2i4iiFL3wpSH6Htuu13S97aHFdh7mG
 n73v0gQZIjCXXTrTVHHc+LxnZzSbrYDo78CosYsk4ByHEHsDoCr8BBQQv
 Y8KmZi5TWqpTew9ZyPov6ZgAwubxri8huHvgmhWfnV8ctrELHehimqrIh
 BSMWkYzH0TWEfjxoOLX827Hb22DTzhuMykmT8DwPBGb85Um9InGGx6bxw
 MkHAGTUbXV98xteVnPpAgTkN/IK+T0hQW43+rIs8IR8f7W0ftUMzk42cK A==;
X-CSE-ConnectionGUID: eNloyoBrQai9G+kj2NAwNw==
X-CSE-MsgGUID: AKMNehLQQsqWvkD2LzqXKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944420"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944420"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002502"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:09 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>, stable@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 3/8] accel/ivpu: Fix PCI D0 state entry in resume
Date: Tue,  2 Apr 2024 12:49:24 +0200
Message-ID: <20240402104929.941186-4-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

In case of failed power up we end up left in PCI D3hot
state making it impossible to access NPU registers on retry.
Enter D0 state on retry before proceeding with power up sequence.

Fixes: 28083ff18d3f ("accel/ivpu: Fix DevTLB errors on suspend/resume and recovery")
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 9cbd7af6576b..325b82f8d971 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -71,10 +71,10 @@ static int ivpu_resume(struct ivpu_device *vdev)
 {
 	int ret;
 
-	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D0);
+retry:
 	pci_restore_state(to_pci_dev(vdev->drm.dev));
+	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D0);
 
-retry:
 	ret = ivpu_hw_power_up(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
-- 
2.43.2

