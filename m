Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B951D4634
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F1F6EBD1;
	Fri, 15 May 2020 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B52F6EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:42:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i15so20440339wrx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t15tjq6+BhxBQN0F/MuG55FDoBQH9+TEC4ypwZsHps0=;
 b=R3H0lXMUZlsGnXzQ/7L1r/QG6QMp8omk5uLolDDWM9VA8qtJwO/NnsHBfMYB/FrAR/
 Rr8cTd8hiimf0K0srZem2lk3gftiRN68qaGSBRX+ujnpsFx4tM7/NwpLEEG4f1WiDosP
 k5u/KFokB8aolIvvv6iyJ4Ich9kkOKT1PRSrbXoxS2PzfIHUxVXC4PEfagSUzUfIqkU8
 cMJ1GG+2wCNSLmOb3h11GD4htqKjhio6GoWEzsylf5aBrF25HxAjDwyD9weJDlHusZq8
 g15X+TIvXW6gLGjbgZpKjpCf3zyjGRPuwfGq33jWNPKZSqoJZMS2yJJwWTB4alUsAi/0
 XKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t15tjq6+BhxBQN0F/MuG55FDoBQH9+TEC4ypwZsHps0=;
 b=XcJcw8yrkoruQbikdkzBDzS6Lyl+8Vmtl49v2ekJBQj3WVfIB21/RgkHbzKy/HQpB4
 PVwC7YJfVtqVe2JDb9gCOneMz558cyGPzSFsqx9K0M3+Bj1BPJdW9qqOTzix67J23Fqi
 r3ZovH6s8LYaJ9dBqO21X+bV741ve2y7X2Yvf6bAi282J+eqQ7osANCIw7WfPmvCl8AW
 xqZmT/Jrd/Mcs4iRhBvCiLlfq/WVWX4ZZ/00G4j5PPPDaxgKxIuWJI1yS4KC27s+hsZr
 h3KSRNYD8ripwYSY5DHDGsClVjvLJImdsTrEMVrLGeEtyW3I9MdPLcDg63wXtbzAYnCP
 irtQ==
X-Gm-Message-State: AGi0PuYdV3UQbMake7iyZL/Q5Cc/GJ4g+K594hYlHb66HH7H28X/wJAQ
 fNtqTEj/xDtfeh1hnuLh7+M=
X-Google-Smtp-Source: APiQypKk4oe7T8k37TGyO1auKrxf7o46nnLqxrPAbyehTziduZJ8zjbkZl0KU2TkSBAuaW0rH/d8KQ==
X-Received: by 2002:adf:e752:: with SMTP id c18mr13622679wrn.353.1589370161693; 
 Wed, 13 May 2020 04:42:41 -0700 (PDT)
Received: from wambui.zuku.co.ke ([197.237.182.195])
 by smtp.googlemail.com with ESMTPSA id j2sm27484540wrp.47.2020.05.13.04.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:42:41 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH 2/3] drm/vc4: use new debugfs functions for file creation.
Date: Wed, 13 May 2020 14:41:28 +0300
Message-Id: <20200513114130.28641-3-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513114130.28641-1-wambui.karugax@gmail.com>
References: <20200513114130.28641-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, vc4 delays adding of debugfs files until drm_dev_register()
calls vc4_debugfs_init() on each registered minor.

This change removes this infrastructure and uses the new
drm_debugfs_add_file() function and drm_device->debugfs_list to track
debugfs files which are added at drm_dev_register() time on each minor.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c      |  4 ++--
 drivers/gpu/drm/vc4/vc4_debugfs.c | 38 +++++++------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  4 ++--
 drivers/gpu/drm/vc4/vc4_hvs.c     |  4 ++--
 drivers/gpu/drm/vc4/vc4_v3d.c     |  4 ++--
 5 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 72d30d90b856..ff332bac25d1 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -65,8 +65,8 @@ static void vc4_bo_stats_print(struct drm_printer *p, struct vc4_dev *vc4)
 
 static int vc4_bo_stats_debugfs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 4fbbf980a299..e31e400c8cfc 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -11,10 +11,6 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
-struct vc4_debugfs_info_entry {
-	struct list_head link;
-	struct drm_info_list info;
-};
 
 /**
  * Called at drm_dev_register() time on each of the minors registered
@@ -24,21 +20,15 @@ void
 vc4_debugfs_init(struct drm_minor *minor)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
-	struct vc4_debugfs_info_entry *entry;
 
 	debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
 			    minor->debugfs_root, &vc4->load_tracker_enabled);
-
-	list_for_each_entry(entry, &vc4->debugfs_list, link) {
-		drm_debugfs_create_files(&entry->info, 1,
-					 minor->debugfs_root, minor);
-	}
 }
 
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct debugfs_regset32 *regset = node->info_ent->data;
+	struct drm_simple_info_entry *entry = m->private;
+	struct debugfs_regset32 *regset = entry->file.data;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_print_regset32(&p, regset);
@@ -49,30 +39,18 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 /**
  * Registers a debugfs file with a callback function for a vc4 component.
  *
- * This is like drm_debugfs_create_files(), but that can only be
- * called a given DRM minor, while the various VC4 components want to
- * register their debugfs files during the component bind process.  We
- * track the request and delay it to be called on each minor during
- * vc4_debugfs_init().
+ * Various VC4 functions will register their debugfs files during the
+ * component bind process using drm_debugfs_add_file().
+ * These requests are tracked and delayed until their called on each
+ * minor during drm_dev_register().
+ *
  */
 void vc4_debugfs_add_file(struct drm_device *dev,
 			  const char *name,
 			  int (*show)(struct seq_file*, void*),
 			  void *data)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	struct vc4_debugfs_info_entry *entry =
-		devm_kzalloc(dev->dev, sizeof(*entry), GFP_KERNEL);
-
-	if (!entry)
-		return;
-
-	entry->info.name = name;
-	entry->info.show = show;
-	entry->info.data = data;
-
-	list_add(&entry->link, &vc4->debugfs_list);
+	drm_debugfs_add_file(dev, name, show, data);
 }
 
 void vc4_debugfs_add_regset32(struct drm_device *drm,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 625bfcf52dc4..05b2a3161148 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -182,8 +182,8 @@ static const struct debugfs_reg32 hd_regs[] = {
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hdmi *hdmi = vc4->hdmi;
 	struct drm_printer p = drm_seq_file_printer(m);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5a43659da319..4c254c027649 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -82,8 +82,8 @@ void vc4_hvs_dump_state(struct drm_device *dev)
 
 static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index cea77a21b205..cdef61666c42 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -98,8 +98,8 @@ static const struct debugfs_reg32 v3d_regs[] = {
 
 static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret = vc4_v3d_pm_get(vc4);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
