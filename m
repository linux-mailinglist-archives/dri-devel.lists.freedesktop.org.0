Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F617DA74B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 15:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2448010E0C3;
	Sat, 28 Oct 2023 13:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470F610E0C3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698500076; x=1730036076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1vDHAe2Zp3cL/e7WUoPMHFDXdXShMV8RwZb3UQvydM=;
 b=KYPHr2Y3vjdyeUnd2dK8P5Z0R0rVG2DrpUpDNIeqcUo6KHsdhEgYJXvW
 ZeK7Tr5dj4Oox0e6LsvDlIsnW7hwZ0uiFnT5+kcZq6lI8VTrKLY4yBjSm
 /kRJ5hyCHMPaJocIJ86G9LUREZIJFtweLflk3nCfvFdiJS4dCbVLuiA+V
 R43uZDKWIJVML2DIVOqeUyFKyUNoq5ttPbEbsVoTirettrCU5hZM93x6P
 IwGdFRYcn+X/qBLdWCBjjRwV8va0e+ulUB5e5u4vDxtO2UrDC+VN4jm/M
 D/7qNo49AE3cchK9tfmLi7U7u6sSsJnGaHJCKJ3HaQHbJVhk0gOMAv3kI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474136720"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="474136720"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="794871464"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="794871464"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:34 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/11] accel/ivpu: Remove reset from power up sequence
Date: Sat, 28 Oct 2023 15:34:08 +0200
Message-Id: <20231028133415.1169975-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
References: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Setting a non-zero work point resets the IP hence IP_RESET
trigger is redundant.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 4 ----
 drivers/accel/ivpu/ivpu_hw_40xx.c | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index e5cb9d8acb82..8340c84ed6de 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -651,10 +651,6 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_37xx_reset(vdev);
-	if (ret)
-		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
-
 	ret = ivpu_hw_37xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 4bf4c8780044..eb8218d15f01 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -811,12 +811,6 @@ static int ivpu_hw_40xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_40xx_reset(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to reset HW: %d\n", ret);
-		return ret;
-	}
-
 	ret = ivpu_hw_40xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
-- 
2.25.1

