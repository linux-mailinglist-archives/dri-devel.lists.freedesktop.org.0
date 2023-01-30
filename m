Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD4680DC2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223810E238;
	Mon, 30 Jan 2023 12:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E7010E238
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Da/cB2SJy2hJ1E+kZv+aVCcGJFLyb+BwkSOE2cv+Ns8=; b=aaTELxzCpfIL76+yBtMHQ/gDUt
 W/Sz28VZngTkqvIvlbrFjk9GlDWAQc6yzG/H2RU8LLvYsIsr7Q94Pr1JQ7EcMEClF6xKRSWcPAGI8
 vq/pjiNbkVuhi6E2MAKjns6mjqEuxNEmRHR7yXT4RBCTeD1W2qSs8EFSjstjGEKSIgrgqvOM7eo9i
 +0M+hLMb1DPLhCfQFVuT7fo7WbUy/OQ6CQrxAa1c46orltd8Ij+VsF9L4uPFTEt86BJJcIiASyq7R
 aqQhJxk0piJAsWzFl0VS5iY0Jjz/sVMeWHwv1YX3hx8FJzyIh63mAxpB2QPEoPijgyve3WidL0Euz
 DBnh/hSg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pMTMQ-004TG3-PF; Mon, 30 Jan 2023 13:34:11 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 5/6] drm/debugfs: Make the show callback pass the pointer
 to the right object
Date: Mon, 30 Jan 2023 09:30:13 -0300
Message-Id: <20230130123008.287141-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130123008.287141-1-mcanal@igalia.com>
References: <20230130123008.287141-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the drivers need to access the struct drm_debugfs_entry to
get the proper device on the show callback. There is no need for such
thing, as you can wrap the show callback in order to provide to the
driver the proper parameters: the struct seq_file, the struct drm_device
and the driver-specific data stored in the struct drm_debugfs_info.

Therefore, make the show callback pass the pointer to the right object
in the parameters, which makes the API more type-safe.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c       |  8 ++------
 drivers/gpu/drm/drm_atomic.c          |  4 +---
 drivers/gpu/drm/drm_client.c          |  5 ++---
 drivers/gpu/drm/drm_debugfs.c         | 25 ++++++++++++-------------
 drivers/gpu/drm/drm_framebuffer.c     |  4 +---
 drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
 drivers/gpu/drm/gud/gud_drv.c         |  5 ++---
 drivers/gpu/drm/v3d/v3d_debugfs.c     | 16 ++++------------
 drivers/gpu/drm/vc4/vc4_bo.c          |  4 +---
 drivers/gpu/drm/vc4/vc4_debugfs.c     |  6 ++----
 drivers/gpu/drm/vc4/vc4_hdmi.c        |  6 ++----
 drivers/gpu/drm/vc4/vc4_hvs.c         |  8 ++------
 drivers/gpu/drm/vc4/vc4_v3d.c         |  4 +---
 drivers/gpu/drm/vkms/vkms_drv.c       |  4 +---
 include/drm/drm_debugfs.h             | 14 ++++++++------
 15 files changed, 42 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e3507dd6f82a..b70bc7b11764 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -193,10 +193,8 @@ static int hdlcd_setup_mode_config(struct drm_device *drm)
 }
 
 #ifdef CONFIG_DEBUG_FS
-static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
+static int hdlcd_show_underrun_count(struct seq_file *m, struct drm_device *drm, void *arg)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
 	seq_printf(m, "underrun : %d\n", atomic_read(&hdlcd->buffer_underrun_count));
@@ -206,10 +204,8 @@ static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
 	return 0;
 }
 
-static int hdlcd_show_pxlclock(struct seq_file *m, void *arg)
+static int hdlcd_show_pxlclock(struct seq_file *m, struct drm_device *drm, void *arg)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	unsigned long clkrate = clk_get_rate(hdlcd->clk);
 	unsigned long mode_clock = hdlcd->crtc.mode.crtc_clock * 1000;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 5457c02ca1ab..38f140481fcc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1754,10 +1754,8 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
 EXPORT_SYMBOL(drm_state_dump);
 
 #ifdef CONFIG_DEBUG_FS
-static int drm_state_info(struct seq_file *m, void *data)
+static int drm_state_info(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	__drm_state_dump(dev, &p, true);
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 009e7b10455c..ec2e6bc3515d 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -488,10 +488,9 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 EXPORT_SYMBOL(drm_client_framebuffer_flush);
 
 #ifdef CONFIG_DEBUG_FS
-static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
+static int drm_client_debugfs_internal_clients(struct seq_file *m, struct drm_device *dev,
+					       void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_client_dev *client;
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b4d2e7dd87f5..21f01c7d0ab1 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -49,10 +49,8 @@
  * Initialization, etc.
  **************************************************/
 
-static int drm_name_info(struct seq_file *m, void *data)
+static int drm_name_info(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
@@ -70,10 +68,8 @@ static int drm_name_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int drm_clients_info(struct seq_file *m, void *data)
+static int drm_clients_info(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct drm_file *priv;
 	kuid_t uid;
 
@@ -122,11 +118,8 @@ static int drm_gem_one_name_info(int id, void *ptr, void *data)
 	return 0;
 }
 
-static int drm_gem_name_info(struct seq_file *m, void *data)
+static int drm_gem_name_info(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-
 	seq_printf(m, "  name     size handles refcount\n");
 
 	mutex_lock(&dev->object_name_lock);
@@ -143,6 +136,13 @@ static const struct drm_debugfs_info drm_debugfs_list[] = {
 };
 #define DRM_DEBUGFS_ENTRIES ARRAY_SIZE(drm_debugfs_list)
 
+static int drm_debugfs_dev_show(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	int (*show)(struct seq_file *, struct drm_device *, void *) = entry->file.show;
+
+	return show(m, entry->dev, entry->file.data);
+}
 
 static int drm_debugfs_open(struct inode *inode, struct file *file)
 {
@@ -154,9 +154,8 @@ static int drm_debugfs_open(struct inode *inode, struct file *file)
 static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
 {
 	struct drm_debugfs_entry *entry = inode->i_private;
-	struct drm_debugfs_info *node = &entry->file;
 
-	return single_open(file, node->show, entry);
+	return single_open(file, drm_debugfs_dev_show, entry);
 }
 
 static const struct file_operations drm_debugfs_entry_fops = {
@@ -353,7 +352,7 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
  * drm_debugfs_init.
  */
 void drm_debugfs_add_file(struct drm_device *dev, const char *name,
-			  int (*show)(struct seq_file*, void*), void *data)
+			  int (*show)(struct seq_file*, struct drm_device*, void*), void *data)
 {
 	struct drm_debugfs_entry *entry = drmm_kzalloc(dev, sizeof(*entry), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..f01b3cca9e06 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1201,10 +1201,8 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 }
 
 #ifdef CONFIG_DEBUG_FS
-static int drm_framebuffer_info(struct seq_file *m, void *data)
+static int drm_framebuffer_info(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_framebuffer *fb;
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..8ed02b5cf678 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -955,7 +955,7 @@ static struct ttm_device_funcs bo_driver = {
  * struct drm_vram_mm
  */
 
-static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
+static int drm_vram_mm_debugfs(struct seq_file *m, struct drm_device *dev, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
 	struct drm_vram_mm *vmm = entry->dev->vram_mm;
diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..cfd887de599a 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -323,10 +323,9 @@ static struct drm_gem_object *gud_gem_prime_import(struct drm_device *drm, struc
 	return drm_gem_prime_import_dev(drm, dma_buf, gdrm->dmadev);
 }
 
-static int gud_stats_debugfs(struct seq_file *m, void *data)
+static int gud_stats_debugfs(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct gud_device *gdrm = to_gud_device(entry->dev);
+	struct gud_device *gdrm = to_gud_device(dev);
 	char buf[10];
 
 	string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(buf));
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 330669f51fa7..a142615f4789 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -77,10 +77,8 @@ static const struct v3d_reg_def v3d_csd_reg_defs[] = {
 	REGDEF(V3D_CSD_CURRENT_CFG6),
 };
 
-static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
+static int v3d_v3d_debugfs_regs(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	int i, core;
 
@@ -124,10 +122,8 @@ static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
+static int v3d_v3d_debugfs_ident(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	u32 ident0, ident1, ident2, ident3, cores;
 	int core;
@@ -186,10 +182,8 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
+static int v3d_debugfs_bo_stats(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 
 	mutex_lock(&v3d->bo_lock);
@@ -202,10 +196,8 @@ static int v3d_debugfs_bo_stats(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static int v3d_measure_clock(struct seq_file *m, void *unused)
+static int v3d_measure_clock(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	uint32_t cycles;
 	int core = 0;
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index c2b7573bd92b..9083b0184c0f 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -67,10 +67,8 @@ static void vc4_bo_stats_print(struct drm_printer *p, struct vc4_dev *vc4)
 	mutex_unlock(&vc4->purgeable.lock);
 }
 
-static int vc4_bo_stats_debugfs(struct seq_file *m, void *unused)
+static int vc4_bo_stats_debugfs(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index fac624a663ea..42c5d3c95a3f 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -32,11 +32,9 @@ vc4_debugfs_init(struct drm_minor *minor)
 	}
 }
 
-static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
+static int vc4_debugfs_regset32(struct seq_file *m, struct drm_device *drm, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *drm = entry->dev;
-	struct debugfs_regset32 *regset = entry->file.data;
+	struct debugfs_regset32 *regset = data;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 14628864487a..5e1e1edc55db 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -158,11 +158,9 @@ static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
 }
 
-static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
+static int vc4_hdmi_debugfs_regs(struct seq_file *m, struct drm_device *drm, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct vc4_hdmi *vc4_hdmi = entry->file.data;
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct vc4_hdmi *vc4_hdmi = data;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4da66ef96783..8c37b5c3cb05 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -91,10 +91,8 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 	drm_dev_exit(idx);
 }
 
-static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
+static int vc4_hvs_debugfs_underrun(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -103,10 +101,8 @@ static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
+static int vc4_hvs_debugfs_dlist(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 29a664c8bf44..49eb48a270db 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -94,10 +94,8 @@ static const struct debugfs_reg32 v3d_regs[] = {
 	VC4_REG32(V3D_ERRSTAT),
 };
 
-static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
+static int vc4_v3d_debugfs_ident(struct seq_file *m, struct drm_device *dev, void *unused)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret = vc4_v3d_pm_get(vc4);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6d3a2d57d992..dde6a500f3b1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -90,10 +90,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static int vkms_config_show(struct seq_file *m, void *data)
+static int vkms_config_show(struct seq_file *m, struct drm_device *dev, void *data)
 {
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 423aa3de506a..0fb7ad5f6893 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -36,6 +36,9 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/seq_file.h>
+
+struct drm_device;
+
 /**
  * struct drm_info_list - debugfs info list entry
  *
@@ -108,11 +111,10 @@ struct drm_debugfs_info {
 	/**
 	 * @show:
 	 *
-	 * Show callback. &seq_file->private will be set to the &struct
-	 * drm_debugfs_entry corresponding to the instance of this info
-	 * on a given &struct drm_device.
+	 * Show callback. This callback will be casted in order to provide
+	 * the &seq_file, the DRM object and the data stored in this struct.
 	 */
-	int (*show)(struct seq_file*, void*);
+	void *show;
 
 	/** @driver_features: Required driver features for this entry. */
 	u32 driver_features;
@@ -146,7 +148,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files,
 			     int count, struct drm_minor *minor);
 
 void drm_debugfs_add_file(struct drm_device *dev, const char *name,
-			  int (*show)(struct seq_file*, void*), void *data);
+			  int (*show)(struct seq_file*, struct drm_device*, void*), void *data);
 
 void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
@@ -163,7 +165,7 @@ static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
 }
 
 static inline void drm_debugfs_add_file(struct drm_device *dev, const char *name,
-					int (*show)(struct seq_file*, void*),
+					int (*show)(struct seq_file*, struct drm_device*, void*),
 					void *data)
 {}
 
-- 
2.39.1

