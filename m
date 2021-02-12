Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8131A63D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 21:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5987D6E20E;
	Fri, 12 Feb 2021 20:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0218.hostedemail.com
 [216.40.44.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9966E20E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 20:52:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id BB94E7597;
 Fri, 12 Feb 2021 20:52:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:69:146:327:355:379:617:960:967:968:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1437:1500:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:1801:2198:2199:2393:2525:2560:2563:2682:2685:2693:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3865:3866:3867:3868:3870:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4605:5007:7652:7875:7903:8603:8784:8957:9025:10004:10848:11026:11232:11233:11657:11914:12043:12295:12296:12297:12438:12555:12679:12698:12710:12737:12760:12895:12986:13161:13229:13439:13972:14096:14097:14394:14659:21080:21094:21220:21323:21433:21451:21611:21627:21939:21987:21990:30029:30034:30045:30054:30055:30070:30080,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:80, LUA_SUMMARY:none
X-HE-Tag: box83_1706e0227624
X-Filterd-Recvd-Size: 48256
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Fri, 12 Feb 2021 20:52:51 +0000 (UTC)
Message-ID: <6b1f24d022f35fc331556d7d0c7bf2d1e33adf3e.camel@perches.com>
Subject: [PATCH] drm: Convert S_<FOO> permission uses to octal
From: Joe Perches <joe@perches.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 12 Feb 2021 12:52:50 -0800
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert S_<FOO> permissions to the more readable octal.

Link: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/

Done using:
$ git ls-files -- drivers/gpu/drm/*.[ch] |
  xargs ./scripts/checkpatch.pl -f --fix-inplace --types=SYMBOLIC_PERMS

No difference in generated .o files allyesconfig x86-64

The files below were not compiled for x86-64:

drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
drivers/gpu/drm/msm/msm_debugfs.c
drivers/gpu/drm/msm/msm_perf.c
drivers/gpu/drm/msm/msm_rd.c
drivers/gpu/drm/sti/sti_drv.c

checkpatch does report several places where permissions perhaps could
be downgraded.  None of these locations are modified by this patch.

WARNING:EXPORTED_WORLD_WRITABLE: Exporting world writable files is usually an error. Consider more restrictive permissions.
#165: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1146:
+	debugfs_create_file("ras_ctrl", 0666, con->dir,

ERROR:EXPORTED_WORLD_WRITABLE: Exporting writable files is usually an error. Consider more restrictive permissions.
#165: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1146:
+	debugfs_create_file("ras_ctrl", 0666, con->dir,
 				adev, &amdgpu_ras_debugfs_ctrl_ops);
WARNING:EXPORTED_WORLD_WRITABLE: Exporting world writable files is usually an error. Consider more restrictive permissions.
#168: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1148:
+	debugfs_create_file("ras_eeprom_reset", 0666, con->dir,

ERROR:EXPORTED_WORLD_WRITABLE: Exporting writable files is usually an error. Consider more restrictive permissions.
#168: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1148:
+	debugfs_create_file("ras_eeprom_reset", 0666, con->dir,
 				adev, &amdgpu_ras_debugfs_eeprom_ops);
WARNING:EXPORTED_WORLD_WRITABLE: Exporting world writable files is usually an error. Consider more restrictive permissions.
#177: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1159:
+	debugfs_create_bool("auto_reboot", 0666, con->dir,

ERROR:EXPORTED_WORLD_WRITABLE: Exporting writable files is usually an error. Consider more restrictive permissions.
#177: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1159:
+	debugfs_create_bool("auto_reboot", 0666, con->dir,
 				&con->reboot);

WARNING:EXPORTED_WORLD_WRITABLE: Exporting world writable files is usually an error. Consider more restrictive permissions.
#688: FILE: drivers/gpu/drm/msm/adreno/a5xx_debugfs.c:157:
+	debugfs_create_file("reset", 0222, minor->debugfs_root, dev,

ERROR:EXPORTED_WORLD_WRITABLE: Exporting writable files is usually an error. Consider more restrictive permissions.
#688: FILE: drivers/gpu/drm/msm/adreno/a5xx_debugfs.c:157:
+	debugfs_create_file("reset", 0222, minor->debugfs_root, dev,
 			    &reset_fops);

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 14 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  6 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 90 +++++++++++-----------
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |  4 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |  2 +-
 drivers/gpu/drm/drm_debugfs.c                      |  8 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |  4 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  4 +-
 drivers/gpu/drm/drm_sysfs.c                        |  2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   | 10 +--
 drivers/gpu/drm/i915/gvt/firmware.c                |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  4 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  | 22 +++---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  2 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  2 +-
 drivers/gpu/drm/msm/msm_rd.c                       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 | 30 ++++----
 drivers/gpu/drm/radeon/radeon_ttm.c                |  4 +-
 drivers/gpu/drm/sti/sti_drv.c                      |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  2 +-
 drivers/gpu/drm/ttm/ttm_memory.c                   | 12 +--
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |  2 +-
 36 files changed, 137 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 0a25fecf488a..d78da8acf1b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1224,7 +1224,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(debugfs_regs); i++) {
 		ent = debugfs_create_file(debugfs_regs_names[i],
-					  S_IFREG | S_IRUGO, root,
+					  S_IFREG | 0444, root,
 					  adev, debugfs_regs[i]);
 		if (!i && !IS_ERR_OR_NULL(ent))
 			i_size_write(ent->d_inode, adev->rmmio_size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7052dc35d278..d6afbea30145 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -139,7 +139,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
 }
 
-static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
+static DEVICE_ATTR(pcie_replay_count, 0444,
 		amdgpu_device_get_pcie_replay_count, NULL);
 
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
@@ -163,7 +163,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_name);
 }
 
-static DEVICE_ATTR(product_name, S_IRUGO,
+static DEVICE_ATTR(product_name, 0444,
 		amdgpu_device_get_product_name, NULL);
 
 /**
@@ -185,7 +185,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_number);
 }
 
-static DEVICE_ATTR(product_number, S_IRUGO,
+static DEVICE_ATTR(product_number, 0444,
 		amdgpu_device_get_product_number, NULL);
 
 /**
@@ -207,7 +207,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", adev->serial);
 }
 
-static DEVICE_ATTR(serial_number, S_IRUGO,
+static DEVICE_ATTR(serial_number, 0444,
 		amdgpu_device_get_serial_number, NULL);
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
index 8d1ad294cb02..4dd144c9547b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
@@ -133,7 +133,7 @@ void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
 		return;
 
 	debugfs_create_file("amdgpu_fw_attestation",
-			    S_IRUSR,
+			    0400,
 			    adev_to_drm(adev)->primary->debugfs_root,
 			    adev,
 			    &amdgpu_fw_attestation_debugfs_ops);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8980329cded0..51ff3811413d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -72,9 +72,9 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 			amdgpu_gtt_mgr_usage(man));
 }
 
-static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
+static DEVICE_ATTR(mem_info_gtt_total, 0444,
 	           amdgpu_mem_info_gtt_total_show, NULL);
-static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
+static DEVICE_ATTR(mem_info_gtt_used, 0444,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 839917eb7bc3..04f3710e743b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2978,7 +2978,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
+static DEVICE_ATTR(usbc_pd_fw, 0644,
 		   psp_usbc_pd_fw_sysfs_read,
 		   psp_usbc_pd_fw_sysfs_write);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 8da5356c36f1..41262c96d459 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -121,7 +121,7 @@ void amdgpu_rap_debugfs_init(struct amdgpu_device *adev)
 	if (!adev->psp.rap_context.rap_initialized)
 		return;
 
-	debugfs_create_file("rap_test", S_IWUSR, minor->debugfs_root,
+	debugfs_create_file("rap_test", 0200, minor->debugfs_root,
 				adev, &amdgpu_rap_debugfs_ops);
 #endif
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 1fb2a91ad30a..6598b11eabb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1065,7 +1065,7 @@ int amdgpu_ras_sysfs_create(struct amdgpu_device *adev,
 	obj->sysfs_attr = (struct device_attribute){
 		.attr = {
 			.name = obj->fs_data.sysfs_name,
-			.mode = S_IRUGO,
+			.mode = 0444,
 		},
 			.show = amdgpu_ras_sysfs_read,
 	};
@@ -1143,9 +1143,9 @@ static void amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
 	struct drm_minor *minor = adev_to_drm(adev)->primary;
 
 	con->dir = debugfs_create_dir(RAS_FS_NAME, minor->debugfs_root);
-	debugfs_create_file("ras_ctrl", S_IWUGO | S_IRUGO, con->dir,
+	debugfs_create_file("ras_ctrl", 0666, con->dir,
 				adev, &amdgpu_ras_debugfs_ctrl_ops);
-	debugfs_create_file("ras_eeprom_reset", S_IWUGO | S_IRUGO, con->dir,
+	debugfs_create_file("ras_eeprom_reset", 0666, con->dir,
 				adev, &amdgpu_ras_debugfs_eeprom_ops);
 
 	/*
@@ -1156,7 +1156,7 @@ static void amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
 	 * ERREVENT_ATHUB_INTERRUPT generated. Normal GPU recovery routine
 	 * will never be called.
 	 */
-	debugfs_create_bool("auto_reboot", S_IWUGO | S_IRUGO, con->dir,
+	debugfs_create_bool("auto_reboot", 0666, con->dir,
 				&con->reboot);
 
 	/*
@@ -1183,7 +1183,7 @@ static void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
 			sizeof(obj->fs_data.debugfs_name));
 
 	obj->ent = debugfs_create_file(obj->fs_data.debugfs_name,
-				       S_IWUGO | S_IRUGO, con->dir, obj,
+				       0666, con->dir, obj,
 				       &amdgpu_ras_debugfs_ops);
 }
 
@@ -1239,9 +1239,9 @@ static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)
 /* debugfs end */
 
 /* ras fs */
-static BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
+static BIN_ATTR(gpu_vram_bad_pages, 0444,
 		amdgpu_ras_sysfs_badpages_read, NULL, 0);
-static DEVICE_ATTR(features, S_IRUGO,
+static DEVICE_ATTR(features, 0444,
 		amdgpu_ras_sysfs_features_read, NULL);
 static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index b644c78475fd..95bc82c7d344 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -423,7 +423,7 @@ int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 	sprintf(name, "amdgpu_ring_%s", ring->name);
 
 	ent = debugfs_create_file(name,
-				  S_IFREG | S_IRUGO, root,
+				  S_IFREG | 0444, root,
 				  ring, &amdgpu_debugfs_ring_fops);
 	if (!ent)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 834440ab9ff7..327f97e76c2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -170,7 +170,7 @@ void amdgpu_securedisplay_debugfs_init(struct amdgpu_device *adev)
 	if (!adev->psp.securedisplay_context.securedisplay_initialized)
 		return;
 
-	debugfs_create_file("securedisplay_test", S_IWUSR, adev_to_drm(adev)->primary->debugfs_root,
+	debugfs_create_file("securedisplay_test", 0200, adev_to_drm(adev)->primary->debugfs_root,
 				adev, &amdgpu_securedisplay_debugfs_ops);
 #endif
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9fd2157b133a..42a904d41d9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2499,7 +2499,7 @@ int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 	for (count = 0; count < ARRAY_SIZE(ttm_debugfs_entries); count++) {
 		ent = debugfs_create_file(
 				ttm_debugfs_entries[count].name,
-				S_IFREG | S_IRUGO, root,
+				S_IFREG | 0444, root,
 				adev,
 				ttm_debugfs_entries[count].fops);
 		if (IS_ERR(ent))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index c89b66bb70e2..96e6ebe6ae56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -143,15 +143,15 @@ static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,
 	}
 }
 
-static DEVICE_ATTR(mem_info_vram_total, S_IRUGO,
+static DEVICE_ATTR(mem_info_vram_total, 0444,
 		   amdgpu_mem_info_vram_total_show, NULL);
-static DEVICE_ATTR(mem_info_vis_vram_total, S_IRUGO,
+static DEVICE_ATTR(mem_info_vis_vram_total, 0444,
 		   amdgpu_mem_info_vis_vram_total_show,NULL);
-static DEVICE_ATTR(mem_info_vram_used, S_IRUGO,
+static DEVICE_ATTR(mem_info_vram_used, 0444,
 		   amdgpu_mem_info_vram_used_show, NULL);
-static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
+static DEVICE_ATTR(mem_info_vis_vram_used, 0444,
 		   amdgpu_mem_info_vis_vram_used_show, NULL);
-static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
+static DEVICE_ATTR(mem_info_vram_vendor, 0444,
 		   amdgpu_mem_info_vram_vendor, NULL);
 
 static const struct attribute *amdgpu_vram_mgr_attributes[] = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 659b385b27b5..3ec41db315db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -171,7 +171,7 @@ static const struct amdgpu_pcs_ras_field wafl_pcs_ras_fields[] = {
 
 static struct attribute amdgpu_xgmi_hive_id = {
 	.name = "xgmi_hive_id",
-	.mode = S_IRUGO
+	.mode = 0444
 };
 
 static struct attribute *amdgpu_xgmi_hive_attrs[] = {
@@ -250,8 +250,8 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
 }
 
 
-static DEVICE_ATTR(xgmi_device_id, S_IRUGO, amdgpu_xgmi_show_device_id, NULL);
-static DEVICE_ATTR(xgmi_error, S_IRUGO, amdgpu_xgmi_show_error, NULL);
+static DEVICE_ATTR(xgmi_device_id, 0444, amdgpu_xgmi_show_device_id, NULL);
+static DEVICE_ATTR(xgmi_error, 0444, amdgpu_xgmi_show_error, NULL);
 
 static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 					 struct amdgpu_hive_info *hive)
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 6b4b30a8dce5..868ffdb1d4e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -209,7 +209,7 @@ static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
 }
 
 /* device attr for available perfmon counters */
-static DEVICE_ATTR(df_cntr_avail, S_IRUGO, df_v3_6_get_df_cntr_avail, NULL);
+static DEVICE_ATTR(df_cntr_avail, 0444, df_v3_6_get_df_cntr_avail, NULL);
 
 static void df_v3_6_query_hashes(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 5fa65f191a37..058c7165610d 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2256,7 +2256,7 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 		if (DEVICE_ATTR_IS(pp_dpm_mclk) ||
 		    DEVICE_ATTR_IS(pp_dpm_socclk) ||
 		    DEVICE_ATTR_IS(pp_dpm_fclk)) {
-			dev_attr->attr.mode &= ~S_IWUGO;
+			dev_attr->attr.mode &= ~0222;
 			dev_attr->store = NULL;
 		}
 	}
@@ -3335,48 +3335,48 @@ static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
  *
  */
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, amdgpu_hwmon_show_temp, NULL, PP_TEMP_EDGE);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, amdgpu_hwmon_show_temp_thresh, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO, amdgpu_hwmon_show_temp_thresh, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp1_emergency, S_IRUGO, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_EDGE);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, amdgpu_hwmon_show_temp, NULL, PP_TEMP_JUNCTION);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IRUGO, amdgpu_hwmon_show_hotspot_temp_thresh, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, amdgpu_hwmon_show_hotspot_temp_thresh, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_emergency, S_IRUGO, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_JUNCTION);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, amdgpu_hwmon_show_temp, NULL, PP_TEMP_MEM);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IRUGO, amdgpu_hwmon_show_mem_temp_thresh, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, amdgpu_hwmon_show_mem_temp_thresh, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp3_emergency, S_IRUGO, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_MEM);
-static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_EDGE);
-static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_JUNCTION);
-static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_MEM);
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, amdgpu_hwmon_get_pwm1, amdgpu_hwmon_set_pwm1, 0);
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, amdgpu_hwmon_get_pwm1_enable, amdgpu_hwmon_set_pwm1_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO, amdgpu_hwmon_get_pwm1_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO, amdgpu_hwmon_get_pwm1_max, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, amdgpu_hwmon_get_fan1_input, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_min, S_IRUGO, amdgpu_hwmon_get_fan1_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_max, S_IRUGO, amdgpu_hwmon_get_fan1_max, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_target, S_IRUGO | S_IWUSR, amdgpu_hwmon_get_fan1_target, amdgpu_hwmon_set_fan1_target, 0);
-static SENSOR_DEVICE_ATTR(fan1_enable, S_IRUGO | S_IWUSR, amdgpu_hwmon_get_fan1_enable, amdgpu_hwmon_set_fan1_enable, 0);
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, amdgpu_hwmon_show_vddgfx, NULL, 0);
-static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO, amdgpu_hwmon_show_vddgfx_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, amdgpu_hwmon_show_vddnb, NULL, 0);
-static SENSOR_DEVICE_ATTR(in1_label, S_IRUGO, amdgpu_hwmon_show_vddnb_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(power1_average, S_IRUGO, amdgpu_hwmon_show_power_avg, NULL, 0);
-static SENSOR_DEVICE_ATTR(power1_cap_max, S_IRUGO, amdgpu_hwmon_show_power_cap_max, NULL, 0);
-static SENSOR_DEVICE_ATTR(power1_cap_min, S_IRUGO, amdgpu_hwmon_show_power_cap_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(power1_cap, S_IRUGO | S_IWUSR, amdgpu_hwmon_show_power_cap, amdgpu_hwmon_set_power_cap, 0);
-static SENSOR_DEVICE_ATTR(power1_label, S_IRUGO, amdgpu_hwmon_show_power_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(power2_average, S_IRUGO, amdgpu_hwmon_show_power_avg, NULL, 1);
-static SENSOR_DEVICE_ATTR(power2_cap_max, S_IRUGO, amdgpu_hwmon_show_power_cap_max, NULL, 1);
-static SENSOR_DEVICE_ATTR(power2_cap_min, S_IRUGO, amdgpu_hwmon_show_power_cap_min, NULL, 1);
-static SENSOR_DEVICE_ATTR(power2_cap, S_IRUGO | S_IWUSR, amdgpu_hwmon_show_power_cap, amdgpu_hwmon_set_power_cap, 1);
-static SENSOR_DEVICE_ATTR(power2_label, S_IRUGO, amdgpu_hwmon_show_power_label, NULL, 1);
-static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, amdgpu_hwmon_show_sclk, NULL, 0);
-static SENSOR_DEVICE_ATTR(freq1_label, S_IRUGO, amdgpu_hwmon_show_sclk_label, NULL, 0);
-static SENSOR_DEVICE_ATTR(freq2_input, S_IRUGO, amdgpu_hwmon_show_mclk, NULL, 0);
-static SENSOR_DEVICE_ATTR(freq2_label, S_IRUGO, amdgpu_hwmon_show_mclk_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, amdgpu_hwmon_show_temp, NULL, PP_TEMP_EDGE);
+static SENSOR_DEVICE_ATTR(temp1_crit, 0444, amdgpu_hwmon_show_temp_thresh, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_crit_hyst, 0444, amdgpu_hwmon_show_temp_thresh, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp1_emergency, 0444, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_EDGE);
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, amdgpu_hwmon_show_temp, NULL, PP_TEMP_JUNCTION);
+static SENSOR_DEVICE_ATTR(temp2_crit, 0444, amdgpu_hwmon_show_hotspot_temp_thresh, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_crit_hyst, 0444, amdgpu_hwmon_show_hotspot_temp_thresh, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp2_emergency, 0444, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_JUNCTION);
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, amdgpu_hwmon_show_temp, NULL, PP_TEMP_MEM);
+static SENSOR_DEVICE_ATTR(temp3_crit, 0444, amdgpu_hwmon_show_mem_temp_thresh, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp3_crit_hyst, 0444, amdgpu_hwmon_show_mem_temp_thresh, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp3_emergency, 0444, amdgpu_hwmon_show_temp_emergency, NULL, PP_TEMP_MEM);
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_EDGE);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_JUNCTION);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, amdgpu_hwmon_show_temp_label, NULL, PP_TEMP_MEM);
+static SENSOR_DEVICE_ATTR(pwm1, 0644, amdgpu_hwmon_get_pwm1, amdgpu_hwmon_set_pwm1, 0);
+static SENSOR_DEVICE_ATTR(pwm1_enable, 0644, amdgpu_hwmon_get_pwm1_enable, amdgpu_hwmon_set_pwm1_enable, 0);
+static SENSOR_DEVICE_ATTR(pwm1_min, 0444, amdgpu_hwmon_get_pwm1_min, NULL, 0);
+static SENSOR_DEVICE_ATTR(pwm1_max, 0444, amdgpu_hwmon_get_pwm1_max, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan1_input, 0444, amdgpu_hwmon_get_fan1_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan1_min, 0444, amdgpu_hwmon_get_fan1_min, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan1_max, 0444, amdgpu_hwmon_get_fan1_max, NULL, 0);
+static SENSOR_DEVICE_ATTR(fan1_target, 0644, amdgpu_hwmon_get_fan1_target, amdgpu_hwmon_set_fan1_target, 0);
+static SENSOR_DEVICE_ATTR(fan1_enable, 0644, amdgpu_hwmon_get_fan1_enable, amdgpu_hwmon_set_fan1_enable, 0);
+static SENSOR_DEVICE_ATTR(in0_input, 0444, amdgpu_hwmon_show_vddgfx, NULL, 0);
+static SENSOR_DEVICE_ATTR(in0_label, 0444, amdgpu_hwmon_show_vddgfx_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in1_input, 0444, amdgpu_hwmon_show_vddnb, NULL, 0);
+static SENSOR_DEVICE_ATTR(in1_label, 0444, amdgpu_hwmon_show_vddnb_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_average, 0444, amdgpu_hwmon_show_power_avg, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_cap_max, 0444, amdgpu_hwmon_show_power_cap_max, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_cap_min, 0444, amdgpu_hwmon_show_power_cap_min, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_cap, 0644, amdgpu_hwmon_show_power_cap, amdgpu_hwmon_set_power_cap, 0);
+static SENSOR_DEVICE_ATTR(power1_label, 0444, amdgpu_hwmon_show_power_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(power2_average, 0444, amdgpu_hwmon_show_power_avg, NULL, 1);
+static SENSOR_DEVICE_ATTR(power2_cap_max, 0444, amdgpu_hwmon_show_power_cap_max, NULL, 1);
+static SENSOR_DEVICE_ATTR(power2_cap_min, 0444, amdgpu_hwmon_show_power_cap_min, NULL, 1);
+static SENSOR_DEVICE_ATTR(power2_cap, 0644, amdgpu_hwmon_show_power_cap, amdgpu_hwmon_set_power_cap, 1);
+static SENSOR_DEVICE_ATTR(power2_label, 0444, amdgpu_hwmon_show_power_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(freq1_input, 0444, amdgpu_hwmon_show_sclk, NULL, 0);
+static SENSOR_DEVICE_ATTR(freq1_label, 0444, amdgpu_hwmon_show_sclk_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(freq2_input, 0444, amdgpu_hwmon_show_mclk, NULL, 0);
+static SENSOR_DEVICE_ATTR(freq2_label, 0444, amdgpu_hwmon_show_mclk_label, NULL, 0);
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -3500,13 +3500,13 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 		     attr == &sensor_dev_attr_pwm1.dev_attr.attr) || /* can't query fan */
 		    (!adev->powerplay.pp_funcs->get_fan_control_mode &&
 		     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr)) /* can't query state */
-			effective_mode &= ~S_IRUGO;
+			effective_mode &= ~0444;
 
 		if ((!adev->powerplay.pp_funcs->set_fan_speed_percent &&
 		     attr == &sensor_dev_attr_pwm1.dev_attr.attr) || /* can't manage fan */
 		    (!adev->powerplay.pp_funcs->set_fan_control_mode &&
 		     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr)) /* can't manage state */
-			effective_mode &= ~S_IWUSR;
+			effective_mode &= ~0200;
 	}
 
 	if (((adev->family == AMDGPU_FAMILY_SI) ||
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
index 45a22e101d15..974ecbb6cbd2 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
@@ -71,11 +71,11 @@ struct amdgpu_device_attr_entry {
 			     _flags, ##__VA_ARGS__)
 
 #define AMDGPU_DEVICE_ATTR_RW(_name, _flags, ...)			\
-	AMDGPU_DEVICE_ATTR(_name, S_IRUGO | S_IWUSR,			\
+	AMDGPU_DEVICE_ATTR(_name, 0644,			\
 			   _flags, ##__VA_ARGS__)
 
 #define AMDGPU_DEVICE_ATTR_RO(_name, _flags, ...)			\
-	__AMDGPU_DEVICE_ATTR(_name, S_IRUGO,				\
+	__AMDGPU_DEVICE_ATTR(_name, 0444,				\
 			     amdgpu_get_##_name, NULL,			\
 			     _flags, ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index fceda010d65a..74d0d856f1a2 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -555,7 +555,7 @@ static void malidp_debugfs_init(struct drm_minor *minor)
 	malidp_error_stats_init(&malidp->de_errors);
 	malidp_error_stats_init(&malidp->se_errors);
 	spin_lock_init(&malidp->errors_lock);
-	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->debugfs_root,
+	debugfs_create_file("debug", 0644, minor->debugfs_root,
 			    minor->dev, &malidp_debugfs_fops);
 }
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3d7182001004..1cc2506f4a1a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -191,7 +191,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 
 		tmp->minor = minor;
 		tmp->dent = debugfs_create_file(files[i].name,
-						S_IFREG | S_IRUGO, root, tmp,
+						S_IFREG | 0444, root, tmp,
 						&drm_debugfs_fops);
 		tmp->info_ent = &files[i];
 
@@ -425,15 +425,15 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	connector->debugfs_entry = root;
 
 	/* force */
-	debugfs_create_file("force", S_IRUGO | S_IWUSR, root, connector,
+	debugfs_create_file("force", 0644, root, connector,
 			    &drm_connector_fops);
 
 	/* edid */
-	debugfs_create_file("edid_override", S_IRUGO | S_IWUSR, root, connector,
+	debugfs_create_file("edid_override", 0644, root, connector,
 			    &drm_edid_fops);
 
 	/* vrr range */
-	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
+	debugfs_create_file("vrr_range", 0444, root, connector,
 			    &vrr_range_fops);
 }
 
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index 3dd70d813f69..ae9b499fe51e 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -374,9 +374,9 @@ void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc)
 
 	crc_ent = debugfs_create_dir("crc", crtc->debugfs_entry);
 
-	debugfs_create_file("control", S_IRUGO | S_IWUSR, crc_ent, crtc,
+	debugfs_create_file("control", 0644, crc_ent, crtc,
 			    &drm_crtc_crc_control_fops);
-	debugfs_create_file("data", S_IRUGO, crc_ent, crtc,
+	debugfs_create_file("data", 0444, crc_ent, crtc,
 			    &drm_crtc_crc_data_fops);
 }
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 230c4fd7131c..abcb43059dda 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1292,10 +1292,10 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
 void mipi_dbi_debugfs_init(struct drm_minor *minor)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
-	umode_t mode = S_IFREG | S_IWUSR;
+	umode_t mode = S_IFREG | 0200;
 
 	if (dbidev->dbi.read_commands)
-		mode |= S_IRUGO;
+		mode |= 0444;
 	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
 }
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f0336c804639..2a252d7dd648 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -57,7 +57,7 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
 }
 
-static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
+static CLASS_ATTR_STRING(version, 0444, "drm 1.1.0 20060810");
 
 /**
  * drm_sysfs_init - initialize sysfs helpers
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index d62b18d5ecd8..b987c031adb1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -2133,7 +2133,7 @@ void intel_display_debugfs_register(struct drm_i915_private *i915)
 
 	for (i = 0; i < ARRAY_SIZE(intel_display_debugfs_files); i++) {
 		debugfs_create_file(intel_display_debugfs_files[i].name,
-				    S_IRUGO | S_IWUSR,
+				    0644,
 				    minor->debugfs_root,
 				    to_i915(minor->dev),
 				    intel_display_debugfs_files[i].fops);
@@ -2351,16 +2351,16 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
 		return -ENODEV;
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
-		debugfs_create_file("i915_panel_timings", S_IRUGO, root,
+		debugfs_create_file("i915_panel_timings", 0444, root,
 				    connector, &i915_panel_fops);
-		debugfs_create_file("i915_psr_sink_status", S_IRUGO, root,
+		debugfs_create_file("i915_psr_sink_status", 0444, root,
 				    connector, &i915_psr_sink_status_fops);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
-		debugfs_create_file("i915_hdcp_sink_capability", S_IRUGO, root,
+		debugfs_create_file("i915_hdcp_sink_capability", 0444, root,
 				    connector, &i915_hdcp_sink_capability_fops);
 	}
 
@@ -2368,7 +2368,7 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
 	    ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 	      !to_intel_connector(connector)->mst_port) ||
 	     connector->connector_type == DRM_MODE_CONNECTOR_eDP))
-		debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
+		debugfs_create_file("i915_dsc_fec_support", 0444, root,
 				    connector, &i915_dsc_fec_support_fops);
 
 	/* Legacy panels doesn't lpsp on any platform */
diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 990a181094e3..e81ab968f9b1 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -60,7 +60,7 @@ gvt_firmware_read(struct file *filp, struct kobject *kobj,
 }
 
 static struct bin_attribute firmware_attr = {
-	.attr = {.name = "gvt_firmware", .mode = (S_IRUSR)},
+	.attr = {.name = "gvt_firmware", .mode = (0400)},
 	.read = gvt_firmware_read,
 	.write = NULL,
 	.mmap = NULL,
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 88336ff4bf09..6ae073e4865e 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -999,11 +999,11 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 
 	i915_debugfs_params(dev_priv);
 
-	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
+	debugfs_create_file("i915_forcewake_user", 0400, minor->debugfs_root,
 			    to_i915(minor->dev), &i915_forcewake_fops);
 	for (i = 0; i < ARRAY_SIZE(i915_debugfs_files); i++) {
 		debugfs_create_file(i915_debugfs_files[i].name,
-				    S_IRUGO | S_IWUSR,
+				    0644,
 				    minor->debugfs_root,
 				    to_i915(minor->dev),
 				    i915_debugfs_files[i].fops);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 112ba5f2ce90..6ab8312c59e8 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3989,7 +3989,7 @@ static int create_dynamic_oa_sysfs_entry(struct i915_perf *perf,
 {
 	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
 	oa_config->sysfs_metric_id.attr.name = "id";
-	oa_config->sysfs_metric_id.attr.mode = S_IRUGO;
+	oa_config->sysfs_metric_id.attr.mode = 0444;
 	oa_config->sysfs_metric_id.show = show_dynamic_id;
 	oa_config->sysfs_metric_id.store = NULL;
 
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 45d32ef42787..fdbefa082fe5 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -107,11 +107,11 @@ show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
 	return snprintf(buf, PAGE_SIZE, "%u\n", rc6_residency);
 }
 
-static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
-static DEVICE_ATTR(rc6_residency_ms, S_IRUGO, show_rc6_ms, NULL);
-static DEVICE_ATTR(rc6p_residency_ms, S_IRUGO, show_rc6p_ms, NULL);
-static DEVICE_ATTR(rc6pp_residency_ms, S_IRUGO, show_rc6pp_ms, NULL);
-static DEVICE_ATTR(media_rc6_residency_ms, S_IRUGO, show_media_rc6_ms, NULL);
+static DEVICE_ATTR(rc6_enable, 0444, show_rc6_mask, NULL);
+static DEVICE_ATTR(rc6_residency_ms, 0444, show_rc6_ms, NULL);
+static DEVICE_ATTR(rc6p_residency_ms, 0444, show_rc6p_ms, NULL);
+static DEVICE_ATTR(rc6pp_residency_ms, 0444, show_rc6pp_ms, NULL);
+static DEVICE_ATTR(media_rc6_residency_ms, 0444, show_media_rc6_ms, NULL);
 
 static struct attribute *rc6_attrs[] = {
 	&dev_attr_rc6_enable.attr,
@@ -240,7 +240,7 @@ i915_l3_write(struct file *filp, struct kobject *kobj,
 }
 
 static const struct bin_attribute dpf_attrs = {
-	.attr = {.name = "l3_parity", .mode = (S_IRUSR | S_IWUSR)},
+	.attr = {.name = "l3_parity", .mode = (0600)},
 	.size = GEN7_L3LOG_SIZE,
 	.read = i915_l3_read,
 	.write = i915_l3_write,
@@ -249,7 +249,7 @@ static const struct bin_attribute dpf_attrs = {
 };
 
 static const struct bin_attribute dpf_attrs_1 = {
-	.attr = {.name = "l3_parity_slice_1", .mode = (S_IRUSR | S_IWUSR)},
+	.attr = {.name = "l3_parity_slice_1", .mode = (0600)},
 	.size = GEN7_L3LOG_SIZE,
 	.read = i915_l3_read,
 	.write = i915_l3_write,
@@ -442,9 +442,9 @@ static DEVICE_ATTR_RW(gt_min_freq_mhz);
 static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
 
 static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf);
-static DEVICE_ATTR(gt_RP0_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
-static DEVICE_ATTR(gt_RP1_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
-static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
+static DEVICE_ATTR(gt_RP0_freq_mhz, 0444, gt_rp_mhz_show, NULL);
+static DEVICE_ATTR(gt_RP1_freq_mhz, 0444, gt_rp_mhz_show, NULL);
+static DEVICE_ATTR(gt_RPn_freq_mhz, 0444, gt_rp_mhz_show, NULL);
 
 /* For now we have a static number of RP states */
 static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
@@ -534,7 +534,7 @@ static ssize_t error_state_write(struct file *file, struct kobject *kobj,
 
 static const struct bin_attribute error_state_attr = {
 	.attr.name = "error",
-	.attr.mode = S_IRUSR | S_IWUSR,
+	.attr.mode = 0600,
 	.size = 0,
 	.read = error_state_read,
 	.write = error_state_write,
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index fc2c905b6c9e..e00ebdfa8c75 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -154,6 +154,6 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 				 ARRAY_SIZE(a5xx_debugfs_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
+	debugfs_create_file("reset", 0222, minor->debugfs_root, dev,
 			    &reset_fops);
 }
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 85ad0babc326..347cd30fccdf 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -231,7 +231,7 @@ void msm_debugfs_init(struct drm_minor *minor)
 				 ARRAY_SIZE(msm_debugfs_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
+	debugfs_create_file("gpu", 0400, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
 	if (priv->kms && priv->kms->funcs->debugfs_init)
diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
index 3a27153eef08..4565564b29a3 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -211,7 +211,7 @@ int msm_perf_debugfs_init(struct drm_minor *minor)
 	mutex_init(&perf->read_lock);
 	priv->perf = perf;
 
-	debugfs_create_file("perf", S_IFREG | S_IRUGO, minor->debugfs_root,
+	debugfs_create_file("perf", S_IFREG | 0444, minor->debugfs_root,
 			    perf, &perf_debugfs_fops);
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 659e5cc4b40a..d677383fb2d7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -248,7 +248,7 @@ static struct msm_rd_state *rd_init(struct drm_minor *minor, const char *name)
 
 	init_waitqueue_head(&rd->fifo_event);
 
-	debugfs_create_file(name, S_IFREG | S_IRUGO, minor->debugfs_root, rd,
+	debugfs_create_file(name, S_IFREG | 0444, minor->debugfs_root, rd,
 			    &rd_debugfs_fops);
 
 	return rd;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index c2bc05eb2e54..9f762618bdc8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -231,7 +231,7 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
 		debugfs_create_file(nouveau_debugfs_files[i].name,
-				    S_IRUGO | S_IWUSR,
+				    0644,
 				    minor->debugfs_root, minor->dev,
 				    nouveau_debugfs_files[i].fops);
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 1995dad59dd0..f9592b66b627 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -661,10 +661,10 @@ static ssize_t radeon_hwmon_get_pwm1(struct device *dev,
 	return sprintf(buf, "%i\n", speed);
 }
 
-static DEVICE_ATTR(power_profile, S_IRUGO | S_IWUSR, radeon_get_pm_profile, radeon_set_pm_profile);
-static DEVICE_ATTR(power_method, S_IRUGO | S_IWUSR, radeon_get_pm_method, radeon_set_pm_method);
-static DEVICE_ATTR(power_dpm_state, S_IRUGO | S_IWUSR, radeon_get_dpm_state, radeon_set_dpm_state);
-static DEVICE_ATTR(power_dpm_force_performance_level, S_IRUGO | S_IWUSR,
+static DEVICE_ATTR(power_profile, 0644, radeon_get_pm_profile, radeon_set_pm_profile);
+static DEVICE_ATTR(power_method, 0644, radeon_get_pm_method, radeon_set_pm_method);
+static DEVICE_ATTR(power_dpm_state, 0644, radeon_get_dpm_state, radeon_set_dpm_state);
+static DEVICE_ATTR(power_dpm_force_performance_level, 0644,
 		   radeon_get_dpm_forced_performance_level,
 		   radeon_set_dpm_forced_performance_level);
 
@@ -705,13 +705,13 @@ static ssize_t radeon_hwmon_show_temp_thresh(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, radeon_hwmon_show_temp, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO, radeon_hwmon_show_temp_thresh, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO, radeon_hwmon_show_temp_thresh, NULL, 1);
-static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, radeon_hwmon_get_pwm1, radeon_hwmon_set_pwm1, 0);
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, radeon_hwmon_get_pwm1_enable, radeon_hwmon_set_pwm1_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO, radeon_hwmon_get_pwm1_min, NULL, 0);
-static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO, radeon_hwmon_get_pwm1_max, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, radeon_hwmon_show_temp, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_crit, 0444, radeon_hwmon_show_temp_thresh, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_crit_hyst, 0444, radeon_hwmon_show_temp_thresh, NULL, 1);
+static SENSOR_DEVICE_ATTR(pwm1, 0644, radeon_hwmon_get_pwm1, radeon_hwmon_set_pwm1, 0);
+static SENSOR_DEVICE_ATTR(pwm1_enable, 0644, radeon_hwmon_get_pwm1_enable, radeon_hwmon_set_pwm1_enable, 0);
+static SENSOR_DEVICE_ATTR(pwm1_min, 0444, radeon_hwmon_get_pwm1_min, NULL, 0);
+static SENSOR_DEVICE_ATTR(pwm1_max, 0444, radeon_hwmon_get_pwm1_max, NULL, 0);
 
 static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 				      struct device_attribute *attr, char *buf)
@@ -735,7 +735,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", sclk);
 }
 
-static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
+static SENSOR_DEVICE_ATTR(freq1_input, 0444, radeon_hwmon_show_sclk, NULL,
 			  0);
 
 static ssize_t radeon_hwmon_show_vddc(struct device *dev,
@@ -756,7 +756,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
 }
 
-static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
+static SENSOR_DEVICE_ATTR(in0_input, 0444, radeon_hwmon_show_vddc, NULL,
 			  0);
 
 static struct attribute *hwmon_attributes[] = {
@@ -809,13 +809,13 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	     attr == &sensor_dev_attr_pwm1.dev_attr.attr) || /* can't query fan */
 	    (!rdev->asic->dpm.fan_ctrl_get_mode &&
 	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr)) /* can't query state */
-		effective_mode &= ~S_IRUGO;
+		effective_mode &= ~0444;
 
 	if ((!rdev->asic->dpm.set_fan_speed_percent &&
 	     attr == &sensor_dev_attr_pwm1.dev_attr.attr) || /* can't manage fan */
 	    (!rdev->asic->dpm.fan_ctrl_set_mode &&
 	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr)) /* can't manage state */
-		effective_mode &= ~S_IWUSR;
+		effective_mode &= ~0200;
 
 	/* hide max/min values if we can't both query and manage the fan */
 	if ((!rdev->asic->dpm.set_fan_speed_percent &&
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e8c66d10478f..2d65fd9ad794 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -1010,11 +1010,11 @@ static int radeon_ttm_debugfs_init(struct radeon_device *rdev)
 	struct drm_minor *minor = rdev->ddev->primary;
 	struct dentry *root = minor->debugfs_root;
 
-	rdev->mman.vram = debugfs_create_file("radeon_vram", S_IFREG | S_IRUGO,
+	rdev->mman.vram = debugfs_create_file("radeon_vram", S_IFREG | 0444,
 					      root, rdev,
 					      &radeon_ttm_vram_fops);
 
-	rdev->mman.gtt = debugfs_create_file("radeon_gtt", S_IFREG | S_IRUGO,
+	rdev->mman.gtt = debugfs_create_file("radeon_gtt", S_IFREG | 0444,
 					     root, rdev, &radeon_ttm_gtt_fops);
 
 	count = ARRAY_SIZE(radeon_ttm_debugfs_list);
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index c7efb43b83ee..d420f82d02c6 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -98,7 +98,7 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
 				 ARRAY_SIZE(sti_drm_dbg_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
+	debugfs_create_file("fps_show", 0644, minor->debugfs_root,
 			    minor->dev, &sti_drm_fps_fops);
 
 	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b65f4b12f986..dd68b909cbcb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -56,7 +56,7 @@ EXPORT_SYMBOL(ttm_bo_glob);
 
 static struct attribute ttm_bo_count = {
 	.name = "bo_count",
-	.mode = S_IRUGO
+	.mode = 0444
 };
 
 /* default destructor */
diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
index a3bfbd9cea68..aa315ef0d55b 100644
--- a/drivers/gpu/drm/ttm/ttm_memory.c
+++ b/drivers/gpu/drm/ttm/ttm_memory.c
@@ -58,23 +58,23 @@ struct ttm_mem_zone {
 
 static struct attribute ttm_mem_sys = {
 	.name = "zone_memory",
-	.mode = S_IRUGO
+	.mode = 0444
 };
 static struct attribute ttm_mem_emer = {
 	.name = "emergency_memory",
-	.mode = S_IRUGO | S_IWUSR
+	.mode = 0644
 };
 static struct attribute ttm_mem_max = {
 	.name = "available_memory",
-	.mode = S_IRUGO | S_IWUSR
+	.mode = 0644
 };
 static struct attribute ttm_mem_swap = {
 	.name = "swap_limit",
-	.mode = S_IRUGO | S_IWUSR
+	.mode = 0644
 };
 static struct attribute ttm_mem_used = {
 	.name = "used_memory",
-	.mode = S_IRUGO
+	.mode = 0444
 };
 
 static void ttm_mem_zone_kobj_release(struct kobject *kobj)
@@ -174,7 +174,7 @@ static struct kobj_type ttm_mem_zone_kobj_type = {
 
 static struct attribute ttm_mem_global_lower_mem_limit = {
 	.name = "lower_mem_limit",
-	.mode = S_IRUGO | S_IWUSR
+	.mode = 0644
 };
 
 static ssize_t ttm_mem_global_show(struct kobject *kobj,
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 6da22af4ee91..97e374008955 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -26,7 +26,7 @@ vc4_debugfs_init(struct drm_minor *minor)
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
 	struct vc4_debugfs_info_entry *entry;
 
-	debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
+	debugfs_create_bool("hvs_load_tracker", 0644,
 			    minor->debugfs_root, &vc4->load_tracker_enabled);
 
 	list_for_each_entry(entry, &vc4->debugfs_list, link) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
