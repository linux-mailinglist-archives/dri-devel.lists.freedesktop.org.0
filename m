Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E983A8D0523
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597710E838;
	Mon, 27 May 2024 15:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="C9DfpX3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB7310E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:40 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822151; bh=3+YL0eQjbechtjlZb3uB0GxuQXjYmHn+ITIAg1aUPEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C9DfpX3sPr8XuD5qvYfKgzv7yT1uDuxthmI+jZAwXvStGpd+6Ob4hp0jgI6kzq9y+
 4raN1k3zAFntcTcuomUAXid5l18NuFDS8xQQiaRKEr/JCse6Fxel7ZjUQYeK+itxUS
 w2RvauWjnaO9JIM7nJmM3cjHs6u7ikKo2au/Q1X2VR02OdQZNqBROrtXLN+EP9VHWk
 eNXOolsXpmvXpYofsL6Xdg/Wv3ZdZlhQnJrGn9b7VahTaFxxpU0BvJQpC9dWwQ4Dcv
 G1ywwBF61DXnsQr0kC4v8QUasQDKODyHA8Gc+k30jT/Z7zXPxGQy8lek1g6Cu7Atsv
 M8wbqUXKDajcw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiV1954007; Mon, 27 May 2024 18:02:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Vitaly Margolin <vmargolin@habana.ai>
Subject: [PATCH 4/8] accel/habanalabs: add cpld ts cpld_timestamp cpucp
Date: Mon, 27 May 2024 18:02:20 +0300
Message-Id: <20240527150224.1953969-4-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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

From: Vitaly Margolin <vmargolin@habana.ai>

Add cpld_timestamp field to cpucp_info structure and return cpld
timestamp as part of cpld version

Signed-off-by: Vitaly Margolin <vmargolin@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/sysfs.c | 5 +++--
 include/linux/habanalabs/cpucp_if.h     | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index b6c63f8a0c1b..e9f8ccc0bbf9 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -142,8 +142,9 @@ static ssize_t cpld_ver_show(struct device *dev, struct device_attribute *attr,
 {
 	struct hl_device *hdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "0x%08x\n",
-			le32_to_cpu(hdev->asic_prop.cpucp_info.cpld_version));
+	return sprintf(buf, "0x%08x%08x\n",
+		le32_to_cpu(hdev->asic_prop.cpucp_info.cpld_timestamp),
+		le32_to_cpu(hdev->asic_prop.cpucp_info.cpld_version));
 }
 
 static ssize_t cpucp_kernel_ver_show(struct device *dev,
diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index 0913415243e8..1ed17887f1a8 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -1146,6 +1146,7 @@ struct cpucp_security_info {
  *                (0 = fully functional, 1 = lower-half is not functional,
  *                 2 = upper-half is not functional)
  * @sec_info: security information
+ * @cpld_timestamp: CPLD programmed F/W timestamp.
  * @pll_map: Bit map of supported PLLs for current ASIC version.
  * @mme_binning_mask: MME binning mask,
  *                    bits [0:6]   <==> dcore0 mme fma
@@ -1193,7 +1194,7 @@ struct cpucp_info {
 	__u8 substrate_version;
 	__u8 eq_health_check_supported;
 	struct cpucp_security_info sec_info;
-	__le32 reserved2;
+	__le32 cpld_timestamp;
 	__u8 pll_map[PLL_MAP_LEN];
 	__le64 mme_binning_mask;
 	__u8 fw_os_version[VERSION_MAX_LEN];
-- 
2.34.1

