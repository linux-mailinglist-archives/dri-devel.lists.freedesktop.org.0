Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8A9F2F75
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73610E5B5;
	Mon, 16 Dec 2024 11:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="syJzmf0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FCF10E5AD;
 Mon, 16 Dec 2024 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734348890;
 bh=UcFNLmnvsYaQOHcmZvcmxzeMoweYVAEm2PgsTyadgkI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=syJzmf0d4MfCocdBz4SdwRhaTCrA7uJxy2KQkCR7vFDUozn+OrKnjr+sCP5846KEM
 pOb1SZsB+JL7/uyO0moALDM8wWobbJx88Pq57EmLv/sD7CAT4zYI681gHjAcS6phLE
 1xB6vfUEiLUnjkBkMiiTLyZs6ozj1ORaZReYlWv0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:34:49 +0100
Subject: [PATCH 3/5] drm/i915: Constify 'struct bin_attribute'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-drm-v1-3-210f2b36b9bf@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348889; l=3431;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UcFNLmnvsYaQOHcmZvcmxzeMoweYVAEm2PgsTyadgkI=;
 b=Cf8bG3lKy+H2AAGHpNlU9pJX+g0endqvP6W/4Y7M0B1o4fSNb6WQQ2Ir7gmA0kMgrqUn11+go
 eYMtY4tn9ibBNp7Y4fsPYQsbC+bjLvJlQU2xTEStr9ySkNZJezQ0n2x
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
 drivers/gpu/drm/i915/i915_gpu_error.c |  8 ++++----
 drivers/gpu/drm/i915/i915_sysfs.c     | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 71c0daef19962660086b37fe55ca2d6b01f2bb9a..a4cb4e731bdd72201c91541fb86e827e96214a8b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2491,7 +2491,7 @@ void i915_gpu_error_debugfs_register(struct drm_i915_private *i915)
 }
 
 static ssize_t error_state_read(struct file *filp, struct kobject *kobj,
-				struct bin_attribute *attr, char *buf,
+				const struct bin_attribute *attr, char *buf,
 				loff_t off, size_t count)
 {
 
@@ -2527,7 +2527,7 @@ static ssize_t error_state_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t error_state_write(struct file *file, struct kobject *kobj,
-				 struct bin_attribute *attr, char *buf,
+				 const struct bin_attribute *attr, char *buf,
 				 loff_t off, size_t count)
 {
 	struct device *kdev = kobj_to_dev(kobj);
@@ -2543,8 +2543,8 @@ static const struct bin_attribute error_state_attr = {
 	.attr.name = "error",
 	.attr.mode = S_IRUSR | S_IWUSR,
 	.size = 0,
-	.read = error_state_read,
-	.write = error_state_write,
+	.read_new = error_state_read,
+	.write_new = error_state_write,
 };
 
 void i915_gpu_error_sysfs_setup(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 8775beab9cb8438c2e8abb0f9d8104dcba7c0df3..f936e8f1f12942287a5a7d6aa7db6ed3a4c28281 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -60,7 +60,7 @@ static int l3_access_valid(struct drm_i915_private *i915, loff_t offset)
 
 static ssize_t
 i915_l3_read(struct file *filp, struct kobject *kobj,
-	     struct bin_attribute *attr, char *buf,
+	     const struct bin_attribute *attr, char *buf,
 	     loff_t offset, size_t count)
 {
 	struct device *kdev = kobj_to_dev(kobj);
@@ -88,7 +88,7 @@ i915_l3_read(struct file *filp, struct kobject *kobj,
 
 static ssize_t
 i915_l3_write(struct file *filp, struct kobject *kobj,
-	      struct bin_attribute *attr, char *buf,
+	      const struct bin_attribute *attr, char *buf,
 	      loff_t offset, size_t count)
 {
 	struct device *kdev = kobj_to_dev(kobj);
@@ -140,8 +140,8 @@ i915_l3_write(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute dpf_attrs = {
 	.attr = {.name = "l3_parity", .mode = (S_IRUSR | S_IWUSR)},
 	.size = GEN7_L3LOG_SIZE,
-	.read = i915_l3_read,
-	.write = i915_l3_write,
+	.read_new = i915_l3_read,
+	.write_new = i915_l3_write,
 	.mmap = NULL,
 	.private = (void *)0
 };
@@ -149,8 +149,8 @@ static const struct bin_attribute dpf_attrs = {
 static const struct bin_attribute dpf_attrs_1 = {
 	.attr = {.name = "l3_parity_slice_1", .mode = (S_IRUSR | S_IWUSR)},
 	.size = GEN7_L3LOG_SIZE,
-	.read = i915_l3_read,
-	.write = i915_l3_write,
+	.read_new = i915_l3_read,
+	.write_new = i915_l3_write,
 	.mmap = NULL,
 	.private = (void *)1
 };

-- 
2.47.1

