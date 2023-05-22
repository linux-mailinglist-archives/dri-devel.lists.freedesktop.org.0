Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4170B610
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1F010E24F;
	Mon, 22 May 2023 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id F381310E234
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:32:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 16BFC1800B7C44; 
 Mon, 22 May 2023 09:32:24 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Remove unnecessary (void*) conversions
Date: Mon, 22 May 2023 09:32:13 +0800
Message-Id: <20230522013213.25876-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 May 2023 07:13:28 +0000
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
Cc: Su Hui <suhui@nfschina.com>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer variables of (void*) type do not require type cast.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 2 +-
 drivers/gpu/drm/msm/msm_debugfs.c         | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 6bd397a85834..169b8fe688f8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -69,7 +69,7 @@ static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 
 static int show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_printer p = drm_seq_file_printer(m);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index cc66ddffe672..6e684a7b49a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1392,7 +1392,7 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
 
 static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 {
-	struct drm_crtc *crtc = (struct drm_crtc *) s->private;
+	struct drm_crtc *crtc = s->private;
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 
 	seq_printf(s, "client type: %d\n", dpu_crtc_get_client_type(crtc));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..3b307ce637a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -57,8 +57,8 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 static int _dpu_danger_signal_status(struct seq_file *s,
 		bool danger_status)
 {
-	struct dpu_kms *kms = (struct dpu_kms *)s->private;
 	struct dpu_danger_safe_status status;
+	struct dpu_kms *kms = s->private;
 	int i;
 
 	if (!kms->hw_mdp) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 29ae5c9613f3..323079cfd698 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -229,7 +229,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 #ifdef CONFIG_DEBUG_FS
 static int smp_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 9c0e633a3a61..a0a936f80ae3 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -211,7 +211,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
 
 static int msm_gem_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
@@ -229,7 +229,7 @@ static int msm_gem_show(struct seq_file *m, void *arg)
 
 static int msm_mm_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -240,7 +240,7 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 
 static int msm_fb_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
-- 
2.30.2

