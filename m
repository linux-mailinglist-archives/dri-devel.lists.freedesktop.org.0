Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCB80879F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8110E1BB;
	Thu,  7 Dec 2023 12:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D2310E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 12:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45FDACE234C;
 Thu,  7 Dec 2023 12:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E23DC433C8;
 Thu,  7 Dec 2023 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701951889;
 bh=b3k0yhQCgpeSi1OnQRtgWWkuB5o+fZqueJOQrN6jfe8=;
 h=From:To:Cc:Subject:Date:From;
 b=mhrl3Zmr2Ew3ZZuhVVg12Z+dT/1mE7EANZGjTFyJh+xPhnzBEjegNLcld66ck5exh
 043MkAUSqVwETMpAq+Bw+6eHaFjfrcrLY0dlX002ETNxTMLMtTlNTSACVI/LRxtMM/
 Vn7QERquBX0p++zvfvpkmO7UQSYOGHij0ysPDLm1eQAYtmRf7ppnNODwXeUwch7ORN
 zH+bET+s9i8xX4bvZ2FGUgH2zxptfW02Lwar8e3xIg4jnLJmh29XE45GKNap/0vZEl
 XDtSc0UT/zzlxXahfNbSowiD3yz+edhtNjRILGWSl3U2K0apk6vuPnSiyzfO+Id3wA
 20iYAf0MkpCgw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] accel/habanalabs: report 3 instances of Infineon second
 stage
Date: Thu,  7 Dec 2023 14:24:40 +0200
Message-Id: <20231207122444.50512-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Ariel Suller <asuller@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ariel Suller <asuller@habana.ai>

Infineon controller second stage has 3 instances that their version
need to be reported by driver.

Signed-off-by: Ariel Suller <asuller@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/sysfs.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index 8d2164691d81..c940c5f1d109 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -8,6 +8,7 @@
 #include "habanalabs.h"
 
 #include <linux/pci.h>
+#include <linux/types.h>
 
 static ssize_t clk_max_freq_mhz_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -80,12 +81,27 @@ static ssize_t vrm_ver_show(struct device *dev, struct device_attribute *attr, c
 {
 	struct hl_device *hdev = dev_get_drvdata(dev);
 	struct cpucp_info *cpucp_info;
+	u32 infineon_second_stage_version;
+	u32 infineon_second_stage_first_instance;
+	u32 infineon_second_stage_second_instance;
+	u32 infineon_second_stage_third_instance;
+	u32 mask = 0xff;
 
 	cpucp_info = &hdev->asic_prop.cpucp_info;
 
+	infineon_second_stage_version = le32_to_cpu(cpucp_info->infineon_second_stage_version);
+	infineon_second_stage_first_instance = infineon_second_stage_version & mask;
+	infineon_second_stage_second_instance =
+					(infineon_second_stage_version >> 8) & mask;
+	infineon_second_stage_third_instance =
+					(infineon_second_stage_version >> 16) & mask;
+
 	if (cpucp_info->infineon_second_stage_version)
-		return sprintf(buf, "%#04x %#04x\n", le32_to_cpu(cpucp_info->infineon_version),
-				le32_to_cpu(cpucp_info->infineon_second_stage_version));
+		return sprintf(buf, "%#04x %#04x:%#04x:%#04x\n",
+				le32_to_cpu(cpucp_info->infineon_version),
+				infineon_second_stage_first_instance,
+				infineon_second_stage_second_instance,
+				infineon_second_stage_third_instance);
 	else
 		return sprintf(buf, "%#04x\n", le32_to_cpu(cpucp_info->infineon_version));
 }
-- 
2.34.1

