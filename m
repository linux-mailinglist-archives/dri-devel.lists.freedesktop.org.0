Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF758BC01
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5B10E004;
	Sun,  7 Aug 2022 17:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD710E004;
 Sun,  7 Aug 2022 17:28:21 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 73so6695976pgb.9;
 Sun, 07 Aug 2022 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZJhnbeU/GvYa0IAiEAp6tG7y6menKqdJgmF8uzlqIXg=;
 b=QJmE3T0AUf+gj4ikYTJmoZ4wqLm45pXQh4UMz4UUkXt/MHZdmNb7OwV2VnOTEmoWLt
 EUc9sGNiOEqEtuFaM+pn5T32aqC2Al7TtStQ179/gd3nc7rU5w4SqOd4kL2WcYd2Iq2L
 4pC6+Dz8iFUIL7Kl8ik7TNv8sdUVs5Eqelih54ysr6UZasi2uUgkJVZhHW/Vk7D3onzb
 2vmQKPGljSDIwF/+ZnCG4qEccuEN9xvOvWU46dGQ8hEUOZDLn236QechAHllPKf6/9Wb
 PYn3qUnigzDZ/wp53DobUCt8cNW7J273qZ4ZQo45Y04H2vEaCkZvbHIJ6SGf/X3/LQHJ
 R5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZJhnbeU/GvYa0IAiEAp6tG7y6menKqdJgmF8uzlqIXg=;
 b=WEsJzdq0LDpFVgCqk3hXeEE7IgUSgt7F7eyjqGYyAxV2s0iHYFTPKu0Fx4BSP+2nf9
 SuPGkymdKFOh+5aB7XA4QKqbGris09kX2HS2WZJJXg2zsc8/MV5gA3cynYmkHY3qFKvh
 BPsuB9de07H4gjetF/sfkdge+iHYzbQ8Ioy5L3ndguG0wTcngJU/h+xodpIcB0f31etQ
 dNv+QnwkzVlOq5jP5uPwKqL04QqyAAjX0bmgEqDRG6qOc/RIzIL7cyOA2V+m1gwTQP5Q
 CXGNhfXgc7f6qSmo+ZnoPxHwJ+MNawUrRWjF56KWX2t6aAyKHwQl0TOCO9gDySosrrSm
 4FQA==
X-Gm-Message-State: ACgBeo09PcTQj4qVSyusPvolFHLslgoo+DSOpChOkYn9jUi0Z+L0awHs
 OPqt5ZXnNrqUWtFSdpWBwlnuAUPgmIQ=
X-Google-Smtp-Source: AA6agR4wTkoPcJGp7v5ElZPSy1YnAtPx3OfKJrSsY02bNgK+zah7M12CtEsvAlutyby3I73eVXn9lg==
X-Received: by 2002:a05:6a00:244a:b0:52b:e9a8:cb14 with SMTP id
 d10-20020a056a00244a00b0052be9a8cb14mr15249067pfj.32.1659893297948; 
 Sun, 07 Aug 2022 10:28:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a626d02000000b0052c4b3e6f6asm7037208pfc.97.2022.08.07.10.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 10:28:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add fault-injection support
Date: Sun,  7 Aug 2022 10:28:48 -0700
Message-Id: <20220807172848.2432845-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Intended as a way to trigger error paths in mesa.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c |  8 ++++++++
 drivers/gpu/drm/msm/msm_drv.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h     |  7 +++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index ea2a20699cb4..a515ddcec007 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -7,6 +7,7 @@
 #ifdef CONFIG_DEBUG_FS
 
 #include <linux/debugfs.h>
+#include <linux/fault-inject.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
@@ -325,6 +326,13 @@ void msm_debugfs_init(struct drm_minor *minor)
 
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
+
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
+				  &fail_gem_alloc);
+	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
+				  &fail_gem_iova);
+#endif
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4979aa8187ec..6b1b483ddd59 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/fault-inject.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -78,6 +79,11 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+#ifdef CONFIG_FAULT_INJECTION
+DECLARE_FAULT_ATTR(fail_gem_alloc);
+DECLARE_FAULT_ATTR(fail_gem_iova);
+#endif
+
 static irqreturn_t msm_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
@@ -701,6 +707,9 @@ static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
 		flags |= MSM_BO_WC;
 	}
 
+	if (should_fail(&fail_gem_alloc, args->size))
+		return -ENOMEM;
+
 	return msm_gem_new_handle(dev, file, args->size,
 			args->flags, &args->handle, NULL);
 }
@@ -762,6 +771,9 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
 	/*
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
@@ -783,6 +795,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (priv->gpu->aspace == ctx->aspace)
 		return -EOPNOTSUPP;
 
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
 	return msm_gem_set_iova(obj, ctx->aspace, iova);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b4ace34ec889..e830f9609f2d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -34,6 +34,13 @@
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
+#ifdef CONFIG_FAULT_INJECTION
+extern struct fault_attr fail_gem_alloc;
+extern struct fault_attr fail_gem_iova;
+#else
+#  define should_fail(attr, size) 0
+#endif
+
 struct msm_kms;
 struct msm_gpu;
 struct msm_mmu;
-- 
2.36.1

