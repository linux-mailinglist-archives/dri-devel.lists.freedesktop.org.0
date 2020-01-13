Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B413A2CE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273F6E2EC;
	Tue, 14 Jan 2020 08:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD06689F8E;
 Mon, 13 Jan 2020 10:56:37 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EADF8C8F92939C5BCCD0;
 Mon, 13 Jan 2020 18:56:35 +0800 (CST)
Received: from localhost.localdomain (10.175.124.28) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 Jan 2020 18:56:26 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <vivek.kasireddy@intel.com>, <matthew.d.roper@intel.com>,
 <zhangxiaoxu5@huawei.com>
Subject: [PATCH] drm/i915/dsi: Fix implicit declaration of function
 'acpi_dev*' in 'mipi_exec_i2c'
Date: Mon, 13 Jan 2020 18:55:39 +0800
Message-ID: <20200113105539.9493-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If no 'CONFIG_ACPI' configured, shouldn't call 'acpi_device_handle',
'acpi_dev_get_resources' and 'acpi_dev_free_resource_list' in function
'mipi_exec_i2c'.

Fixes: 8cbf89db2941("drm/i915/dsi: Parse the I2C element from the VBT MIPI sequence block (v3)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 89fb0d90b694..73a25e7ae090 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -384,6 +384,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	return data;
 }
 
+#ifdef CONFIG_ACPI
 static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 {
 	struct i2c_adapter_lookup *lookup = data;
@@ -399,7 +400,6 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 
 	if (lookup->slave_addr != sb->slave_address)
 		return 1;
-
 	status = acpi_get_handle(lookup->dev_handle,
 				 sb->resource_source.string_ptr,
 				 &adapter_handle);
@@ -412,15 +412,13 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 
 	return 1;
 }
+#endif
 
 static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
 	struct device *dev = &drm_dev->pdev->dev;
 	struct i2c_adapter *adapter;
-	struct acpi_device *acpi_dev;
-	struct list_head resource_list;
-	struct i2c_adapter_lookup lookup;
 	struct i2c_msg msg;
 	int ret;
 	u8 vbt_i2c_bus_num = *(data + 2);
@@ -430,8 +428,13 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 	u8 *payload_data;
 
 	if (intel_dsi->i2c_bus_num < 0) {
+#ifdef CONFIG_ACPI
+		struct acpi_device *acpi_dev;
+		struct list_head resource_list;
+		struct i2c_adapter_lookup lookup;
+#endif
 		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
-
+#ifdef CONFIG_ACPI
 		acpi_dev = ACPI_COMPANION(dev);
 		if (acpi_dev) {
 			memset(&lookup, 0, sizeof(lookup));
@@ -445,6 +448,7 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 					       &lookup);
 			acpi_dev_free_resource_list(&resource_list);
 		}
+#endif
 	}
 
 	adapter = i2c_get_adapter(intel_dsi->i2c_bus_num);
-- 
2.17.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
