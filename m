Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C67D5934
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0A10E093;
	Tue, 24 Oct 2023 16:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D3210E093
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 16:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698166438; x=1729702438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZuKWSR+jwIerwneO+k1w+QchySUEV+9klHFpQSVHRXA=;
 b=etTWMz+Qmp3krqwxNS32dMeiemy0xDxZw0/L94uoy2SJBQ9wPqVpZMgg
 D1q+glONZBEhL6/z3dIYbvpRkfhfmb1TPIGYR93b4egPmh3x1N6O49hb+
 edzuwxp6e048V3hd8rtojOf9H1HM5CGjB5POLaS3Jgcx0uJiWt3bomjry
 LhV1ELEDiamFR8738PpctFIfoF1fFtC96EA9DCzhq1TtzL3qEtBipuLNE
 itkIBS/GxRE8O8nPQ9Sfyg5hEi725sH2YyYR6iTRni1yNvEDrVyXCIT3p
 1xbBp4yyC/Y/F8gZc0qjpTANaJoPlDFXdvk17tZ+BS4slvp7zPO6gzXcZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390987221"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="390987221"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1089928281"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="1089928281"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:53:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/ivpu: Disable PLL after VPU IP reset during FLR
Date: Tue, 24 Oct 2023 18:53:53 +0200
Message-Id: <20231024165353.761507-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

IP reset has to followed by ivpu_pll_disable() to properly enter
reset state.

Fixes: 828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")
Cc: stable@vger.kernel.org
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: use ivpu_hw_37xx_ip_reset() in ivpu_hw_37xx_power_up()

 drivers/accel/ivpu/ivpu_hw_37xx.c | 23 ++++++++++++++++++++---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 23 ++++++++++++++++++++---
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 5c0246b9e522..56b53833ede2 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -598,7 +598,7 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 	return 0;
 }
 
-static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
+static int ivpu_hw_37xx_ip_reset(struct ivpu_device *vdev)
 {
 	int ret;
 	u32 val;
@@ -623,6 +623,23 @@ static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
 	return ret;
 }
 
+static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
+{
+	int ret = 0;
+
+	if (ivpu_hw_37xx_ip_reset(vdev)) {
+		ivpu_err(vdev, "Failed to reset VPU IP\n");
+		ret = -EIO;
+	}
+
+	if (ivpu_pll_disable(vdev)) {
+		ivpu_err(vdev, "Failed to disable PLL\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
 static int ivpu_hw_37xx_d0i3_enable(struct ivpu_device *vdev)
 {
 	int ret;
@@ -651,7 +668,7 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_37xx_reset(vdev);
+	ret = ivpu_hw_37xx_ip_reset(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
 
@@ -722,7 +739,7 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_reset(vdev))
+	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_ip_reset(vdev))
 		ivpu_err(vdev, "Failed to reset the VPU\n");
 
 	if (ivpu_pll_disable(vdev)) {
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index e691c49c9841..b25d02dc541b 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -742,7 +742,7 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 	return 0;
 }
 
-static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
+static int ivpu_hw_40xx_ip_reset(struct ivpu_device *vdev)
 {
 	int ret;
 	u32 val;
@@ -764,6 +764,23 @@ static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
 	return ret;
 }
 
+static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
+{
+	int ret = 0;
+
+	if (ivpu_hw_40xx_ip_reset(vdev)) {
+		ivpu_err(vdev, "Failed to reset VPU IP\n");
+		ret = -EIO;
+	}
+
+	if (ivpu_pll_disable(vdev)) {
+		ivpu_err(vdev, "Failed to disable PLL\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
 static int ivpu_hw_40xx_d0i3_enable(struct ivpu_device *vdev)
 {
 	int ret;
@@ -824,7 +841,7 @@ static int ivpu_hw_40xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_40xx_reset(vdev);
+	ret = ivpu_hw_40xx_ip_reset(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to reset HW: %d\n", ret);
 		return ret;
@@ -902,7 +919,7 @@ static int ivpu_hw_40xx_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_reset(vdev))
+	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_ip_reset(vdev))
 		ivpu_warn(vdev, "Failed to reset the VPU\n");
 
 	if (ivpu_pll_disable(vdev)) {
-- 
2.25.1

