Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA95A60B0B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC1710E99B;
	Fri, 14 Mar 2025 08:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="nFWKjzl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Fri, 14 Mar 2025 01:26:06 UTC
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769C010E233;
 Fri, 14 Mar 2025 01:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1741915566; x=1773451566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hEW4U6cD4suRxcWupX1grIIgd9gT1ynebc3gndUAJag=;
 b=nFWKjzl5CxT1dHBiSrW9jJuP99Xzika19JY8UzQ3bewsMB+AYvKUdKxy
 w/QNi9B4vWyEaFytWWYUAQ+IHC/OKl6z3YIy9Hq6n0cscxF8redqe/MOY
 3Lo1eA7mfDsv89INHIoRd0Rq/wR5sOtYuDQQGPA0obfQ66NLeF2v1x9C9
 w2s4UGEgCpM2G07h8xbGEAotZHV96TpZTaJcMHn+QxRom6DYlVFVb9mU3
 a8IGxmbceev+MaS0Eae/HeqAyfFA+PlAZi+kn+6U7ShgvrvzTbO0gTyuK
 l39RSgTpTZ7nMvsQ1fpMthLbZH9ywN/7CAQ+zHUkwQDtsIhzPRwTOEBTY A==;
X-CSE-ConnectionGUID: 8jStVKQrQIWk8s8ci6C1Qw==
X-CSE-MsgGUID: DEzvPUuAS7ygq94cId+W6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="193328420"
X-IronPort-AV: E=Sophos;i="6.14,246,1736780400"; d="scan'208";a="193328420"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 10:18:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B83B96749;
 Fri, 14 Mar 2025 10:18:38 +0900 (JST)
Received: from m3002.s.css.fujitsu.com (msm3.b.css.fujitsu.com
 [10.128.233.104])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 104B4D17C5;
 Fri, 14 Mar 2025 10:18:38 +0900 (JST)
Received: from sm-x86-stp01.ssoft.mng.com (unknown [10.124.178.20])
 by m3002.s.css.fujitsu.com (Postfix) with ESMTP id BCDE22051973;
 Fri, 14 Mar 2025 10:18:37 +0900 (JST)
From: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch,
 Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
Subject: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
Date: Fri, 14 Mar 2025 10:18:09 +0900
Message-Id: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
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

Currently, ROCm requires CPUs that support PCIe atomics. The message is
more urgent for GPGPU users, meaning basic functionalities of ROCm are not
available on the node.

Signed-off-by: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 018dfccd771b..faeef136e272 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4374,7 +4374,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			return r;
 	}
 
-	/* enable PCIE atomic ops */
+	/* enable PCIe atomic ops */
 	if (amdgpu_sriov_vf(adev)) {
 		if (adev->virt.fw_reserve.p_pf2vf)
 			adev->have_atomics_support = ((struct amd_sriov_msg_pf2vf_info *)
@@ -4395,7 +4395,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	}
 
 	if (!adev->have_atomics_support)
-		dev_info(adev->dev, "PCIE atomic ops is not supported\n");
+		dev_warn(adev->dev, "PCIe atomic ops are not supported\n");
 
 	/* doorbell bar mapping and doorbell index init*/
 	amdgpu_doorbell_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index b4f9c2f4e92c..c52605a07597 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -240,7 +240,7 @@ struct amd_sriov_msg_pf2vf_info {
 	} mm_bw_management[AMD_SRIOV_MSG_RESERVE_VCN_INST];
 	/* UUID info */
 	struct amd_sriov_msg_uuid_info uuid_info;
-	/* PCIE atomic ops support flag */
+	/* PCIe atomic ops support flag */
 	uint32_t pcie_atomic_ops_support_flags;
 	/* Portion of GPU memory occupied by VF.  MAX value is 65535, but set to uint32_t to maintain alignment with reserved size */
 	uint32_t gpu_capacity;
-- 
2.39.1

