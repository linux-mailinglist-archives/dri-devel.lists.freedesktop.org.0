Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9E5E67E9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F097310EC50;
	Thu, 22 Sep 2022 16:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2F010E36A;
 Thu, 22 Sep 2022 13:48:18 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYGj05XQWzlWvP;
 Thu, 22 Sep 2022 21:44:04 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:48:13 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:48:12 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/dpu: use DEFINE_SHOW_ATTRIBUTE to simplify
 dpu_regset32
Date: Thu, 22 Sep 2022 22:21:47 +0800
Message-ID: <20220922142147.3246649-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5e6e2626151e..f3660cd14f4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -194,7 +194,7 @@ struct dpu_debugfs_regset32 {
 	struct dpu_kms *dpu_kms;
 };
 
-static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
+static int dpu_regset32_show(struct seq_file *s, void *data)
 {
 	struct dpu_debugfs_regset32 *regset = s->private;
 	struct dpu_kms *dpu_kms = regset->dpu_kms;
@@ -227,19 +227,7 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
 
 	return 0;
 }
-
-static int dpu_debugfs_open_regset32(struct inode *inode,
-		struct file *file)
-{
-	return single_open(file, _dpu_debugfs_show_regset32, inode->i_private);
-}
-
-static const struct file_operations dpu_fops_regset32 = {
-	.open =		dpu_debugfs_open_regset32,
-	.read =		seq_read,
-	.llseek =	seq_lseek,
-	.release =	single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(dpu_regset32);
 
 void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 		void *parent,
@@ -259,7 +247,7 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	regset->blk_len = length;
 	regset->dpu_kms = dpu_kms;
 
-	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
+	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
 }
 
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
-- 
2.25.1

