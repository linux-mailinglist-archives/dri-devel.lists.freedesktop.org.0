Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9627DA751
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 15:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F219810E0DE;
	Sat, 28 Oct 2023 13:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0210E12F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698500101; x=1730036101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dqe5u/vOjXOcmjTd6v317WYLrSHa6RcR/LHMZWlOD3Y=;
 b=ets0phhY5d6jy5NdfkTI+81yX/SSkQFTluYg5fOna+HPikABmfIissWE
 5QJgNh21fg0KZ6qHJjGkATQ5jkoKb1dSE/PWMWH7RSWafjPWUf2WtNan4
 tzpF+SIwJqPlJ1rAu6MSYrjVE11BAo8TvFSZ84WoJFgdP/msuVyx0zwx7
 iQCAnNXGyHp8m8KuM5DrFqCzOtkcc0ycq4Ig+AeUeDMtYA/C5FChBGnWp
 Mclu/RdtJ8hO1iblyvVN31muUSpgYNpbeLl/SqcDP3rSy8Ma0N7nZA96b
 aT9yvdNtOPNqjliWfYCKM1xzhFaQfmveSojrZosrpR64uSxNbamS9TCla A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="6530375"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="6530375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="7907957"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:44 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/11] accel/ivpu/37xx: Print warning when VPUIP is not
 idle during power down
Date: Sat, 28 Oct 2023 15:34:14 +0200
Message-Id: <20231028133415.1169975-11-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print warning if VPUIP is not idle during power down.

Use warn log level also when we fail to enter reset state
as this is not really an error but unexpected behavior.

Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 451c9777b237..1b47d77b4c6e 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -726,8 +726,11 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
 
 	ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
 
-	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_reset(vdev))
-		ivpu_err(vdev, "Failed to reset the VPU\n");
+	if (!ivpu_hw_37xx_is_idle(vdev)) {
+		ivpu_warn(vdev, "VPU not idle during power down\n");
+		if (ivpu_hw_37xx_reset(vdev))
+			ivpu_warn(vdev, "Failed to reset the VPU\n");
+	}
 
 	if (ivpu_pll_disable(vdev)) {
 		ivpu_err(vdev, "Failed to disable PLL\n");
-- 
2.25.1

