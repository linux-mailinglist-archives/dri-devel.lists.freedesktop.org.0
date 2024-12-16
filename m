Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FA9F2F7C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E669410E5CD;
	Mon, 16 Dec 2024 11:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="Q8zsUSw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD6C10E5B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734348890;
 bh=zuT+LJN8yyZdjBUYgx4LeWWwlVkL7wdTwqvya297jls=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q8zsUSw45BtgARRdWi3boy4K+6THyxtcF4oUO/jPWdN8pAVOI3rQJkUz2GF14htdS
 EJ2du0p7474uP0KSCM97/l/z1co3lKUSAc74rJf5fgoR6CzcZ1LWTHAsGnO8OtsJ4V
 Ns1bKYa8fvFqN9jvTm/aHo3VwdBTsiFTm1imSxpw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:34:50 +0100
Subject: [PATCH 4/5] drm/amdgpu: Constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-drm-v1-4-210f2b36b9bf@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348889; l=5717;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zuT+LJN8yyZdjBUYgx4LeWWwlVkL7wdTwqvya297jls=;
 b=t/e4NpjzaihOxUQhxM9fCFKwdSbBN4HpYBXnVQDcuR8p8/tYTm7wlNTElz/kh4GFe2sa+7MPl
 RfSBcyst2hbDjIWe0ng8erI2054SsD6gVbtFvLfTdtHkotBHapZ8aeM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    | 13 ++++++-------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index d272d95dd5b2f5eb83be279281d55af323f7f508..88459de2cd2e47390d33e5939875c3322b740b4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -223,7 +223,7 @@ static DEVICE_ATTR(pcie_replay_count, 0444,
 		amdgpu_device_get_pcie_replay_count, NULL);
 
 static ssize_t amdgpu_sysfs_reg_state_get(struct file *f, struct kobject *kobj,
-					  struct bin_attribute *attr, char *buf,
+					  const struct bin_attribute *attr, char *buf,
 					  loff_t ppos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -259,8 +259,8 @@ static ssize_t amdgpu_sysfs_reg_state_get(struct file *f, struct kobject *kobj,
 	return bytes_read;
 }
 
-BIN_ATTR(reg_state, 0444, amdgpu_sysfs_reg_state_get, NULL,
-	 AMDGPU_SYS_REG_STATE_END);
+static const BIN_ATTR(reg_state, 0444, amdgpu_sysfs_reg_state_get, NULL,
+		      AMDGPU_SYS_REG_STATE_END);
 
 int amdgpu_reg_state_sysfs_init(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 448f9e742983f3ef0c5fccc18d85f0c2449aa08e..cda25174730a6852bcb6e01aeec858faad172b19 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3969,7 +3969,7 @@ int is_psp_fw_valid(struct psp_bin_desc bin)
 }
 
 static ssize_t amdgpu_psp_vbflash_write(struct file *filp, struct kobject *kobj,
-					struct bin_attribute *bin_attr,
+					const struct bin_attribute *bin_attr,
 					char *buffer, loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -4005,7 +4005,7 @@ static ssize_t amdgpu_psp_vbflash_write(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t amdgpu_psp_vbflash_read(struct file *filp, struct kobject *kobj,
-				       struct bin_attribute *bin_attr, char *buffer,
+				       const struct bin_attribute *bin_attr, char *buffer,
 				       loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -4057,11 +4057,11 @@ static ssize_t amdgpu_psp_vbflash_read(struct file *filp, struct kobject *kobj,
  * Writing to this file will stage an IFWI for update. Reading from this file
  * will trigger the update process.
  */
-static struct bin_attribute psp_vbflash_bin_attr = {
+static const struct bin_attribute psp_vbflash_bin_attr = {
 	.attr = {.name = "psp_vbflash", .mode = 0660},
 	.size = 0,
-	.write = amdgpu_psp_vbflash_write,
-	.read = amdgpu_psp_vbflash_read,
+	.write_new = amdgpu_psp_vbflash_write,
+	.read_new = amdgpu_psp_vbflash_read,
 };
 
 /**
@@ -4088,7 +4088,7 @@ static ssize_t amdgpu_psp_vbflash_status(struct device *dev,
 }
 static DEVICE_ATTR(psp_vbflash_status, 0440, amdgpu_psp_vbflash_status, NULL);
 
-static struct bin_attribute *bin_flash_attrs[] = {
+static const struct bin_attribute *const bin_flash_attrs[] = {
 	&psp_vbflash_bin_attr,
 	NULL
 };
@@ -4124,7 +4124,7 @@ static umode_t amdgpu_bin_flash_attr_is_visible(struct kobject *kobj,
 
 const struct attribute_group amdgpu_flash_attr_group = {
 	.attrs = flash_attrs,
-	.bin_attrs = bin_flash_attrs,
+	.bin_attrs_new = bin_flash_attrs,
 	.is_bin_visible = amdgpu_bin_flash_attr_is_visible,
 	.is_visible = amdgpu_flash_attr_is_visible,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 4c9fa24dd9726a405935907524ed7bf7862779d1..2991e0967b5bfc848328aaa59ddfb9a8f202bae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1732,7 +1732,7 @@ static char *amdgpu_ras_badpage_flags_str(unsigned int flags)
  */
 
 static ssize_t amdgpu_ras_sysfs_badpages_read(struct file *f,
-		struct kobject *kobj, struct bin_attribute *attr,
+		struct kobject *kobj, const struct bin_attribute *attr,
 		char *buf, loff_t ppos, size_t count)
 {
 	struct amdgpu_ras *con =
@@ -2063,8 +2063,8 @@ void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)
 /* debugfs end */
 
 /* ras fs */
-static BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
-		amdgpu_ras_sysfs_badpages_read, NULL, 0);
+static const BIN_ATTR(gpu_vram_bad_pages, S_IRUGO,
+		      amdgpu_ras_sysfs_badpages_read, NULL, 0);
 static DEVICE_ATTR(features, S_IRUGO,
 		amdgpu_ras_sysfs_features_read, NULL);
 static DEVICE_ATTR(version, 0444,
@@ -2086,7 +2086,7 @@ static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
 		&con->event_state_attr.attr,
 		NULL
 	};
-	struct bin_attribute *bin_attrs[] = {
+	const struct bin_attribute *bin_attrs[] = {
 		NULL,
 		NULL,
 	};
@@ -2112,11 +2112,10 @@ static int amdgpu_ras_fs_init(struct amdgpu_device *adev)
 
 	if (amdgpu_bad_page_threshold != 0) {
 		/* add bad_page_features entry */
-		bin_attr_gpu_vram_bad_pages.private = NULL;
 		con->badpages_attr = bin_attr_gpu_vram_bad_pages;
+		sysfs_bin_attr_init(&con->badpages_attr);
 		bin_attrs[0] = &con->badpages_attr;
-		group.bin_attrs = bin_attrs;
-		sysfs_bin_attr_init(bin_attrs[0]);
+		group.bin_attrs_new = bin_attrs;
 	}
 
 	r = sysfs_create_group(&adev->dev->kobj, &group);

-- 
2.47.1

