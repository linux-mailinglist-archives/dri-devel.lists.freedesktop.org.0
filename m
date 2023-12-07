Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3C8087A2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FA010E88C;
	Thu,  7 Dec 2023 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968C810E880
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 12:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6D896204D;
 Thu,  7 Dec 2023 12:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753FFC433C9;
 Thu,  7 Dec 2023 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701951894;
 bh=/Qy3zG8E9tn/KPpMqCwh71W5AGo9u8gLdNF43wXGlpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BHXT3Gp6YtSwXjgKhY9VyjB4fFNu4xOUcjKuBZtzYR9B1Bix0JeAo4pRptILBFT3o
 oMy28rqecKS6VJh7sRa+bPrnfoWNGxt6k94ma5nPHTXxVRmQjgixCEYGYXJG29Texl
 rZkIqlukgXqiKcyYgFig0ekPzIycT+XaXacBDr9qEIcoodG6764esxcSzGcc03qYMD
 DbAQ0T9+HXaqSnKfOA+NVeVVtM1ud3KvK5gqwGf+PhhGXk0G/8+lCEDD/+dPzkT3nk
 2XmNmggJJTwIKJEDVigIT7FMq+G8jAEYzs0MaIrm4gGytAEKTfZAP5VLbk6xqrchUh
 k97KEZKOFjDqg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] accel/habanalabs: add parent_device sysfs attribute
Date: Thu,  7 Dec 2023 14:24:43 +0200
Message-Id: <20231207122444.50512-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207122444.50512-1-ogabbay@kernel.org>
References: <20231207122444.50512-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The device debugfs directory was modified to be named as the
device-name.
This name is the parent device name, i.e. either the PCI address in case
of an ASIC, or the simulator device name in case of a simulator.

This change makes it more difficult for a user to access the debugfs
directory for a specific accel device, because he can't just use the
accel minor id, but he needs to do more device-dependent operations to
get the device name.

To make it easier to get this name, add a 'parent_device' sysfs
attribute that the user can read using the minor id before accessing
debugfs.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 Documentation/ABI/testing/sysfs-driver-habanalabs | 6 ++++++
 drivers/accel/habanalabs/common/habanalabs.h      | 3 +++
 drivers/accel/habanalabs/common/sysfs.c           | 9 +++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-habanalabs b/Documentation/ABI/testing/sysfs-driver-habanalabs
index 89fe3b09d4ad..4244f5af4b54 100644
--- a/Documentation/ABI/testing/sysfs-driver-habanalabs
+++ b/Documentation/ABI/testing/sysfs-driver-habanalabs
@@ -155,6 +155,12 @@ KernelVersion:  not yet upstreamed
 Contact:        ogabbay@kernel.org
 Description:    Displays the device's module id
 
+What:           /sys/class/accel/accel<n>/device/parent_device
+Date:           Nov 2023
+KernelVersion:  6.8
+Contact:        ttayar@habana.ai
+Description:    Displays the name of the parent device of the accel device
+
 What:           /sys/class/accel/accel<n>/device/pci_addr
 Date:           Jan 2019
 KernelVersion:  5.1
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index dd3fe3ddc00a..2a900c9941fe 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3521,6 +3521,9 @@ struct hl_device {
 	u8				heartbeat;
 };
 
+/* Retrieve PCI device name in case of a PCI device or dev name in simulator */
+#define HL_DEV_NAME(hdev)	\
+		((hdev)->pdev ? dev_name(&(hdev)->pdev->dev) : "NA-DEVICE")
 
 /**
  * struct hl_cs_encaps_sig_handle - encapsulated signals handle structure
diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index c940c5f1d109..8a9f98832157 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -410,6 +410,13 @@ static ssize_t module_id_show(struct device *dev,
 	return sprintf(buf, "%u\n", le32_to_cpu(hdev->asic_prop.cpucp_info.card_location));
 }
 
+static ssize_t parent_device_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct hl_device *hdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", HL_DEV_NAME(hdev));
+}
+
 static DEVICE_ATTR_RO(armcp_kernel_ver);
 static DEVICE_ATTR_RO(armcp_ver);
 static DEVICE_ATTR_RO(cpld_ver);
@@ -430,6 +437,7 @@ static DEVICE_ATTR_RO(uboot_ver);
 static DEVICE_ATTR_RO(fw_os_ver);
 static DEVICE_ATTR_RO(security_enabled);
 static DEVICE_ATTR_RO(module_id);
+static DEVICE_ATTR_RO(parent_device);
 
 static struct bin_attribute bin_attr_eeprom = {
 	.attr = {.name = "eeprom", .mode = (0444)},
@@ -456,6 +464,7 @@ static struct attribute *hl_dev_attrs[] = {
 	&dev_attr_fw_os_ver.attr,
 	&dev_attr_security_enabled.attr,
 	&dev_attr_module_id.attr,
+	&dev_attr_parent_device.attr,
 	NULL,
 };
 
-- 
2.34.1

