Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6D270BFF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099476E1BC;
	Sat, 19 Sep 2020 08:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095966EDC0;
 Sat, 19 Sep 2020 02:51:41 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BBB30DF5AD78B628E014;
 Sat, 19 Sep 2020 10:51:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 10:51:26 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next v2] drm/msm/dpu: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 19 Sep 2020 10:51:58 +0800
Message-ID: <20200919025158.17264-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Qinglang
 Miao <miaoqinglang@huawei.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 15 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c     | 29 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c  | 15 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 17 ++----------
 4 files changed, 8 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index f1bc6a1af..84ea09d96 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -288,19 +288,6 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 }
 
 #ifdef CONFIG_DEBUG_FS
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)				\
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read = seq_read,						\
-	.llseek = seq_lseek,						\
-}
-
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
 	struct dpu_irq *irq_obj = s->private;
@@ -328,7 +315,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	return 0;
 }
 
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_core_irq);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
 
 void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6169148b3..f56414a06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1177,23 +1177,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int _dpu_debugfs_status_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, _dpu_debugfs_status_show, inode->i_private);
-}
-
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)                          \
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read = seq_read,						\
-	.llseek = seq_lseek,						\
-}
+DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
 
 static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 {
@@ -1210,25 +1194,18 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 
 	return 0;
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_crtc_debugfs_state);
+DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 
-	static const struct file_operations debugfs_status_fops = {
-		.open =		_dpu_debugfs_status_open,
-		.read =		seq_read,
-		.llseek =	seq_lseek,
-		.release =	single_release,
-	};
-
 	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
 			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
 			dpu_crtc->debugfs_root,
-			dpu_crtc, &debugfs_status_fops);
+			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
 			dpu_crtc->debugfs_root,
 			&dpu_crtc->base,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd6def436..da192e275 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1880,24 +1880,13 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int _dpu_encoder_debugfs_status_open(struct inode *inode,
-		struct file *file)
-{
-	return single_open(file, _dpu_encoder_status_show, inode->i_private);
-}
+DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i;
 
-	static const struct file_operations debugfs_status_fops = {
-		.open =		_dpu_encoder_debugfs_status_open,
-		.read =		seq_read,
-		.llseek =	seq_lseek,
-		.release =	single_release,
-	};
-
 	char name[DPU_NAME_SIZE];
 
 	if (!drm_enc->dev) {
@@ -1913,7 +1902,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
-		dpu_enc->debugfs_root, dpu_enc, &debugfs_status_fops);
+		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++)
 		if (dpu_enc->phys_encs[i]->ops.late_register)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5abf0047c..0649d1dee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -85,30 +85,17 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	return 0;
 }
 
-#define DEFINE_DPU_DEBUGFS_SEQ_FOPS(__prefix)				\
-static int __prefix ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __prefix ## _show, inode->i_private);	\
-}									\
-static const struct file_operations __prefix ## _fops = {		\
-	.owner = THIS_MODULE,						\
-	.open = __prefix ## _open,					\
-	.release = single_release,					\
-	.read = seq_read,						\
-	.llseek = seq_lseek,						\
-}
-
 static int dpu_debugfs_danger_stats_show(struct seq_file *s, void *v)
 {
 	return _dpu_danger_signal_status(s, true);
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_danger_stats);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_danger_stats);
 
 static int dpu_debugfs_safe_stats_show(struct seq_file *s, void *v)
 {
 	return _dpu_danger_signal_status(s, false);
 }
-DEFINE_DPU_DEBUGFS_SEQ_FOPS(dpu_debugfs_safe_stats);
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_safe_stats);
 
 static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
