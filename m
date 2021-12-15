Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6B475FCB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5810F5A9;
	Wed, 15 Dec 2021 17:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BDC10F5A8;
 Wed, 15 Dec 2021 17:49:35 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id v16so4910046pjn.1;
 Wed, 15 Dec 2021 09:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EcfVA2uBNe/X9h6wuhZ5EuU1xWQlNWZCg+pNTH+2meY=;
 b=kIp4kYBkdDDru9e4HJrZZx1Mqq/lPJBOIQxaWAsqiDdm5RVCVoj8s/WNVOAt2apkEx
 ehoLvfo0+fBHvEsFhC0tCoKyHUtmWXT/Ecsn1nSwftN1qUFJmUuEAQZ1jKtM3Xd3WTwa
 cnM8BMDTbbYcRQt61uaFQrp/TA68fpZv5INyMdhWf5322Jf/2TfxfXaTvCdmk4gU0Jpv
 ljXrNLt8ooqMdRZS95G+BM7KKfsmaGofA29Yl+FKKidVMQNBD7a7NtwUD1ePxcgFqOm2
 0EHLFM7xvi/1la+RR5HsxUEyIY+XvK32s/BtNI7ijOH5ufs2fpUvG8OntcmSw9UURLuy
 V9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcfVA2uBNe/X9h6wuhZ5EuU1xWQlNWZCg+pNTH+2meY=;
 b=kdnvKr47MJOwAyCfSPL26olKHqcqJkKgkleo/gbka+td4h/QlkT4pm6wHaNcgrLJWX
 hhI5+27fI0OysHBW8+U+rMdJsrCG/Qaq/78/aTq0QzT9ZfLYQOYLnItwymXNXSRQvxGa
 FlQ+Ta+DSd/aHFlvqfsHxbBTTaJywm3jAX5e57t8XH0/zEJ0NWxM2NLoYpldQ2S91MWV
 0jxEIqNtYuFmssLxeQRAPa0iG0thxgBZ+L6hxA+KwYgXyTn6To+DYP3z5bRztgeC9Sb5
 fLP2FmnQVFgaXUBmJoSGycu5ZEVAPGtlDl4EXH1ro1Fekqpp3Ixm3iUXABdcSZNEPZdm
 I/AQ==
X-Gm-Message-State: AOAM530leZmq3m34Zfhl4KWkMSscofZtOBHPCAR4ke39zbDMXWLnVNz0
 ttLrJQ0V9ovEf30+JIgJVJ7KdL8cOm4=
X-Google-Smtp-Source: ABdhPJx1Bx8yaUPuKlzM1Tz2ZDpWlyHvRiqC3BiqYmeoSCToMSDaurYg6b8JjJUEdJA2daCWrJD6wQ==
X-Received: by 2002:a17:902:e54d:b0:148:a2e8:278a with SMTP id
 n13-20020a170902e54d00b00148a2e8278amr5386218plf.145.1639590574740; 
 Wed, 15 Dec 2021 09:49:34 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n3sm2976279pgc.76.2021.12.15.09.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:49:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/debugfs: Add display/kms state snapshot
Date: Wed, 15 Dec 2021 09:45:08 -0800
Message-Id: <20211215174524.1742389-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215174524.1742389-1-robdclark@gmail.com>
References: <20211215174524.1742389-1-robdclark@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Drop unneeded msm_kms_show_priv [Dmitry B]

 drivers/gpu/drm/msm/msm_debugfs.c | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 956b1efc3721..0804c31e8962 100644
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
@@ -109,6 +114,73 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+/*
+ * Display Snapshot:
+ */
+
+static int msm_kms_show(struct seq_file *m, void *arg)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct msm_disp_state *state = m->private;
+
+	msm_disp_state_print(state, &p);
+
+	return 0;
+}
+
+static int msm_kms_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct msm_disp_state *state = m->private;
+
+	msm_disp_state_free(state);
+
+	return single_release(inode, file);
+}
+
+static int msm_kms_open(struct inode *inode, struct file *file)
+{
+	struct drm_device *dev = inode->i_private;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_disp_state *state;
+	int ret;
+
+	if (!priv->kms)
+		return -ENODEV;
+
+	ret = mutex_lock_interruptible(&priv->kms->dump_mutex);
+	if (ret)
+		return ret;
+
+	state = msm_disp_snapshot_state_sync(priv->kms);
+
+	mutex_unlock(&priv->kms->dump_mutex);
+
+	if (IS_ERR(state)) {
+		return PTR_ERR(state);
+	}
+
+	ret = single_open(file, msm_kms_show, state);
+	if (ret) {
+		msm_disp_state_free(state);
+		return ret;
+	}
+
+	return 0;
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
@@ -239,6 +311,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
+	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+		dev, &msm_kms_fops);
+
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
-- 
2.33.1

