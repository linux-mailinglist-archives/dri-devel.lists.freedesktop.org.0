Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48749394253
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 14:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76E6E233;
	Fri, 28 May 2021 12:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F866E233;
 Fri, 28 May 2021 12:13:00 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fs3RD2xBCzYqKB;
 Fri, 28 May 2021 20:10:16 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 20:12:57 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 20:12:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Dennis.Li@amd.com>, <jonathan.kim@amd.com>
Subject: [PATCH -next] drm/amdgpu: use DEVICE_ATTR_*() macro
Date: Fri, 28 May 2021 20:12:47 +0800
Message-ID: <20210528121247.23168-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 28 +++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 16 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 17 +++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 38 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     | 14 ++++----
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c         |  7 ++--
 8 files changed, 54 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 96b7bb13a2dd..38ee4db1d841 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1754,9 +1754,8 @@ static uint32_t cail_reg_read(struct card_info *info, uint32_t reg)
 	return r;
 }
 
-static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
+static ssize_t vbios_version_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -1765,8 +1764,7 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 	return sysfs_emit(buf, "%s\n", ctx->vbios_version);
 }
 
-static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
-		   NULL);
+static DEVICE_ATTR_RO(vbios_version);
 
 static struct attribute *amdgpu_vbios_version_attrs[] = {
 	&dev_attr_vbios_version.attr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2fe4bdf5aa6f..fc516d905e50 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -134,8 +134,8 @@ const char *amdgpu_asic_name[] = {
  * number of replays as a sum of the NAKs generated and NAKs received
  */
 
-static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t pcie_replay_count_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -144,8 +144,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 	return sysfs_emit(buf, "%llu\n", cnt);
 }
 
-static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
-		amdgpu_device_get_pcie_replay_count, NULL);
+static DEVICE_ATTR_RO(pcie_replay_count);
 
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
 
@@ -159,8 +158,8 @@ static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
  * NOTE: This is only available for certain server cards
  */
 
-static ssize_t amdgpu_device_get_product_name(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t product_name_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -168,8 +167,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->product_name);
 }
 
-static DEVICE_ATTR(product_name, S_IRUGO,
-		amdgpu_device_get_product_name, NULL);
+static DEVICE_ATTR_RO(product_name);
 
 /**
  * DOC: product_number
@@ -181,8 +179,8 @@ static DEVICE_ATTR(product_name, S_IRUGO,
  * NOTE: This is only available for certain server cards
  */
 
-static ssize_t amdgpu_device_get_product_number(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t product_number_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -190,8 +188,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->product_number);
 }
 
-static DEVICE_ATTR(product_number, S_IRUGO,
-		amdgpu_device_get_product_number, NULL);
+static DEVICE_ATTR_RO(product_number);
 
 /**
  * DOC: serial_number
@@ -203,8 +200,8 @@ static DEVICE_ATTR(product_number, S_IRUGO,
  * NOTE: This is only available for certain server cards
  */
 
-static ssize_t amdgpu_device_get_serial_number(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -212,8 +209,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->serial);
 }
 
-static DEVICE_ATTR(serial_number, S_IRUGO,
-		amdgpu_device_get_serial_number, NULL);
+static DEVICE_ATTR_RO(serial_number);
 
 /**
  * amdgpu_device_supports_px - Is the device a dGPU with ATPX power control
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 6a84c9778cc0..16d7fdc53388 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -43,9 +43,8 @@ struct amdgpu_gtt_node {
  * The file mem_info_gtt_total is used for this, and returns the total size of
  * the GTT block, in bytes
  */
-static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
-					      struct device_attribute *attr,
-					      char *buf)
+static ssize_t mem_info_gtt_total_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -63,9 +62,8 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
  * The file mem_info_gtt_used is used for this, and returns the current used
  * size of the GTT block, in bytes
  */
-static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf)
+static ssize_t mem_info_gtt_used_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -75,10 +73,8 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 	return sysfs_emit(buf, "%llu\n", amdgpu_gtt_mgr_usage(man));
 }
 
-static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
-	           amdgpu_mem_info_gtt_total_show, NULL);
-static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
-	           amdgpu_mem_info_gtt_used_show, NULL);
+static DEVICE_ATTR_RO(mem_info_gtt_total);
+static DEVICE_ATTR_RO(mem_info_gtt_used);
 
 static struct attribute *amdgpu_gtt_mgr_attributes[] = {
 	&dev_attr_mem_info_gtt_total.attr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 3ff76cbaec8d..ce3e554d2e2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2985,9 +2985,8 @@ static int psp_set_powergating_state(void *handle,
 	return 0;
 }
 
-static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buf)
+static ssize_t usbc_pd_fw_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -3011,10 +3010,8 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
 	return sysfs_emit(buf, "%x\n", fw_ver);
 }
 
-static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
-						       struct device_attribute *attr,
-						       const char *buf,
-						       size_t count)
+static ssize_t usbc_pd_fw_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -3086,11 +3083,7 @@ void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size
 	drm_dev_exit(idx);
 }
 
-static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
-		   psp_usbc_pd_fw_sysfs_read,
-		   psp_usbc_pd_fw_sysfs_write);
-
-
+static DEVICE_ATTR_RW(usbc_pd_fw);
 
 const struct amd_ip_funcs psp_ip_funcs = {
 	.name = "psp",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index c2c791ca00f4..2e1ccf13cea8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1150,8 +1150,8 @@ static ssize_t amdgpu_ras_sysfs_badpages_read(struct file *f,
 	return s;
 }
 
-static ssize_t amdgpu_ras_sysfs_features_read(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t features_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct amdgpu_ras *con =
 		container_of(attr, struct amdgpu_ras, features_attr);
@@ -1360,8 +1360,8 @@ void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)
 /* ras fs */
 static BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
 		amdgpu_ras_sysfs_badpages_read, NULL, 0);
-static DEVICE_ATTR(features, S_IRUGO,
-		amdgpu_ras_sysfs_features_read, NULL);
+static DEVICE_ATTR_RO(features);
+
 static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 07e007dbff7c..a33210ea9b2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -54,8 +54,8 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
  * The file mem_info_vram_total is used for this and returns the total
  * amount of VRAM in bytes
  */
-static ssize_t amdgpu_mem_info_vram_total_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t mem_info_vram_total_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -71,8 +71,8 @@ static ssize_t amdgpu_mem_info_vram_total_show(struct device *dev,
  * The file mem_info_vis_vram_total is used for this and returns the total
  * amount of visible VRAM in bytes
  */
-static ssize_t amdgpu_mem_info_vis_vram_total_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t mem_info_vis_vram_total_show(struct device *dev,
+					    struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -88,9 +88,8 @@ static ssize_t amdgpu_mem_info_vis_vram_total_show(struct device *dev,
  * The file mem_info_vram_used is used for this and returns the total
  * amount of currently used VRAM in bytes
  */
-static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
-					      struct device_attribute *attr,
-					      char *buf)
+static ssize_t mem_info_vram_used_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -108,9 +107,8 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
  * The file mem_info_vis_vram_used is used for this and returns the total
  * amount of currently used visible VRAM in bytes
  */
-static ssize_t amdgpu_mem_info_vis_vram_used_show(struct device *dev,
-						  struct device_attribute *attr,
-						  char *buf)
+static ssize_t mem_info_vis_vram_used_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -128,9 +126,8 @@ static ssize_t amdgpu_mem_info_vis_vram_used_show(struct device *dev,
  * The file mem_info_vram_vendor is used for this and returns the name of the
  * vendor.
  */
-static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t mem_info_vram_vendor_show(struct device *dev,
+					 struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -161,16 +158,11 @@ static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,
 	}
 }
 
-static DEVICE_ATTR(mem_info_vram_total, S_IRUGO,
-		   amdgpu_mem_info_vram_total_show, NULL);
-static DEVICE_ATTR(mem_info_vis_vram_total, S_IRUGO,
-		   amdgpu_mem_info_vis_vram_total_show,NULL);
-static DEVICE_ATTR(mem_info_vram_used, S_IRUGO,
-		   amdgpu_mem_info_vram_used_show, NULL);
-static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
-		   amdgpu_mem_info_vis_vram_used_show, NULL);
-static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
-		   amdgpu_mem_info_vram_vendor, NULL);
+static DEVICE_ATTR_RO(mem_info_vram_total);
+static DEVICE_ATTR_RO(mem_info_vis_vram_total);
+static DEVICE_ATTR_RO(mem_info_vram_used);
+static DEVICE_ATTR_RO(mem_info_vis_vram_used);
+static DEVICE_ATTR_RO(mem_info_vram_vendor);
 
 static struct attribute *amdgpu_vram_mgr_attributes[] = {
 	&dev_attr_mem_info_vram_total.attr,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 8567d5d77346..764bfa69f7bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -209,9 +209,8 @@ struct kobj_type amdgpu_xgmi_hive_type = {
 	.default_attrs = amdgpu_xgmi_hive_attrs,
 };
 
-static ssize_t amdgpu_xgmi_show_device_id(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
+static ssize_t xgmi_device_id_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -221,9 +220,8 @@ static ssize_t amdgpu_xgmi_show_device_id(struct device *dev,
 }
 
 #define AMDGPU_XGMI_SET_FICAA(o)	((o) | 0x456801)
-static ssize_t amdgpu_xgmi_show_error(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf)
+static ssize_t xgmi_error_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
@@ -249,8 +247,8 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
 }
 
 
-static DEVICE_ATTR(xgmi_device_id, S_IRUGO, amdgpu_xgmi_show_device_id, NULL);
-static DEVICE_ATTR(xgmi_error, S_IRUGO, amdgpu_xgmi_show_error, NULL);
+static DEVICE_ATTR_RO(xgmi_device_id);
+static DEVICE_ATTR_RO(xgmi_error);
 
 static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 					 struct amdgpu_hive_info *hive)
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 14514a145c17..44abb4404fba 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -188,9 +188,8 @@ static int df_v3_6_perfmon_arm_with_retry(struct amdgpu_device *adev,
 }
 
 /* get the number of df counters available */
-static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
+static ssize_t df_cntr_avail_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	struct amdgpu_device *adev;
 	struct drm_device *ddev;
@@ -209,7 +208,7 @@ static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
 }
 
 /* device attr for available perfmon counters */
-static DEVICE_ATTR(df_cntr_avail, S_IRUGO, df_v3_6_get_df_cntr_avail, NULL);
+static DEVICE_ATTR_RO(df_cntr_avail);
 
 static void df_v3_6_query_hashes(struct amdgpu_device *adev)
 {
-- 
2.17.1

