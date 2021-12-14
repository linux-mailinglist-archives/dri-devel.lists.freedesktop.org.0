Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF67474987
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF3D10E1FB;
	Tue, 14 Dec 2021 17:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF210E1EA;
 Tue, 14 Dec 2021 17:34:15 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id a23so13280407pgm.4;
 Tue, 14 Dec 2021 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGWQoMYzhBAB2IQM3xcDS7ekxQKFM3AGil27CIrS8Io=;
 b=kpOVXTp9O8u083FN0cDMv8QEMx6qzsDj6dhRCQ/hhAFstQHJz+m13Py9LbAYcWOiJ2
 Jb10Xbw3L64I2D5Mc6rCmDww4uuiEbqqLKjGomPdT8eU9aWjqThycArxhL8p0FpFGnxj
 7TeuJXz2xtmgM92cEOJpuTsZGAd5gaxpDgDAQmUr5iYPW2tPvkuofMtHCmKNl/A4uVYm
 0RygnF9/Idj3dNJ/o7DQIYDalTQVLM3R9magmlOc7M4nhp98HCs0+8UXUVS3WxvGfiFm
 v9SPZSqXk43i/19vMwrF/7iBM8TT3ef746SOVAn3YBnvf/0azyoON3+gSZVlajKZd5CI
 uxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGWQoMYzhBAB2IQM3xcDS7ekxQKFM3AGil27CIrS8Io=;
 b=OPejDpVTtdZLRCyh41z+Xwr/ej+7VYqBHgAf7rEDoN6347E3jIv7GgarHU+1ldnE9n
 Z67g4cttRh0ZmAWMLp8g1h1kA7r8s84vTrXc7SXwJxRKmvBAGtgum10/Waf+NlQ7OM4A
 WdOGXfB2uDCyLQ3xfMbJ/WD0IDeVPR3+0I9BaC0bU/PnlNTEDqM8UYmDC+U2VmBapFPg
 mOtVj7N3iOKr//0uMqUQGEuhPOW8hTxVVgWIIKlOENWPxvqwAiiY1AJN/Etf1zvx8gL5
 9ILZOTmteEuEoJjVG0zp/GPCkst4qeb3w/MPK5ewV3zolQJMeOJzKC5+dlcBitryrHSV
 dUSw==
X-Gm-Message-State: AOAM531TtUgmUx3ewJ1wwU6Hp5gH4vrJP59QLsX+n6t5S5ucPsEQG2OF
 Cs6ZSmpHpBo9nS8KT3xpJAMlqcXvY64=
X-Google-Smtp-Source: ABdhPJxM83Psw3lwIth4QeOPBbLdhAmJzqzCXZCXy1ejGpDzB8vLX8oSXAQcnAmfPI6/Pk6VfdW1cQ==
X-Received: by 2002:aa7:93ce:0:b0:4a8:19fc:f024 with SMTP id
 y14-20020aa793ce000000b004a819fcf024mr5328681pff.10.1639503253926; 
 Tue, 14 Dec 2021 09:34:13 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y65sm310696pgd.79.2021.12.14.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:34:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/debugfs: Add display/kms state snapshot
Date: Tue, 14 Dec 2021 09:39:01 -0800
Message-Id: <20211214173917.1496290-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214173917.1496290-1-robdclark@gmail.com>
References: <20211214173917.1496290-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 90 +++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 956b1efc3721..088f1160c892 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -15,6 +15,11 @@
 #include "msm_gpu.h"
 #include "msm_kms.h"
 #include "msm_debugfs.h"
+#include "disp/msm_disp_snapshot.h"
+
+/*
+ * GPU Snapshot:
+ */
 
 struct msm_gpu_show_priv {
 	struct msm_gpu_state *state;
@@ -109,6 +114,88 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+/*
+ * Display Snapshot:
+ */
+
+struct msm_kms_show_priv {
+	struct msm_disp_state *state;
+	struct drm_device *dev;
+};
+
+static int msm_kms_show(struct seq_file *m, void *arg)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct msm_kms_show_priv *show_priv = m->private;
+
+	msm_disp_state_print(show_priv->state, &p);
+
+	return 0;
+}
+
+static int msm_kms_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct msm_kms_show_priv *show_priv = m->private;
+
+	msm_disp_state_free(show_priv->state);
+	kfree(show_priv);
+
+	return single_release(inode, file);
+}
+
+static int msm_kms_open(struct inode *inode, struct file *file)
+{
+	struct drm_device *dev = inode->i_private;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms_show_priv *show_priv;
+	int ret;
+
+	if (!priv->kms)
+		return -ENODEV;
+
+	show_priv = kmalloc(sizeof(*show_priv), GFP_KERNEL);
+	if (!show_priv)
+		return -ENOMEM;
+
+	ret = mutex_lock_interruptible(&priv->kms->dump_mutex);
+	if (ret)
+		goto free_priv;
+
+	show_priv->state = msm_disp_snapshot_state_sync(priv->kms);
+
+	mutex_unlock(&priv->kms->dump_mutex);
+
+	if (IS_ERR(show_priv->state)) {
+		ret = PTR_ERR(show_priv->state);
+		goto free_priv;
+	}
+
+	show_priv->dev = dev;
+
+	ret = single_open(file, msm_kms_show, show_priv);
+	if (ret)
+		goto free_priv;
+
+	return 0;
+
+free_priv:
+	kfree(show_priv);
+	return ret;
+}
+
+static const struct file_operations msm_kms_fops = {
+	.owner = THIS_MODULE,
+	.open = msm_kms_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = msm_kms_release,
+};
+
+/*
+ * Other debugfs:
+ */
+
 static unsigned long last_shrink_freed;
 
 static int
@@ -239,6 +326,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
+	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+		dev, &msm_kms_fops);
+
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
-- 
2.33.1

