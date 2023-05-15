Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD0702FD9
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FE410E205;
	Mon, 15 May 2023 14:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0A910E204;
 Mon, 15 May 2023 14:31:07 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so120213285ad.1; 
 Mon, 15 May 2023 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684161067; x=1686753067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqnNhChLNbHWp6ove8p/hsKGE1errQugomyUMPMw9ls=;
 b=fH6QFLL+CYHRn+8pGwUhAoac0FbnvAZdJFesFc5r8vV/i196TOHCIInwyzzyYauNDq
 acsj5AK5T1CZRbpHYwsfuCkTfEN+oIgpxQ8RdewnHOZUIJ+r3yHmsajrya34xy0OX06e
 l+8w4DjDnnOBvWQSgYKhpLRTQYpaEd4eHayyR311Sc9vdPoexzdKBDGWXCtuJN6AlBCQ
 HYGRx4Vjk94ROq8FDS5u5TiFpmmJtI84qYwe/0flN5XGuSKkPFyCXBQYGHQeSkYwRBj6
 xfYGtyRQiZh9Ca/C1AWbjcK4HYqCbmkLZSUXqst/o1nRQJ6ji5MICuEQ0c6x3S3h/eQJ
 5FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161067; x=1686753067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqnNhChLNbHWp6ove8p/hsKGE1errQugomyUMPMw9ls=;
 b=gCfFGcLE20oOaTqxBTld6mnEeTJ0c6kRk+jmDPl2oPjYvCaFhNzRhPXIPBbx1JALeH
 LJ7FrE3TKRr+KSEbMsRsubkH+9nJR0ew5bb6mDA72KdbIiu6AN9UI4g++sHPFiRhenrH
 t3PPD0sCN/ND/4WrwnlYtPsxj/hCdTLUc1gmKBiiliSXkiVt1opYIEkEigCdCluDD1k9
 wAfvNu6wE/L1CuJjkbHPE52bmYep4BqxmG1fdzqx++PicnF38ZIY0roqWA86kChsaCq7
 Yx9tDNDaQ0nlcmIWlvt+H3wmz34GjRNWh5aS2FbsvFLzMOXaa6KQMb4noiIGlcZya4bT
 TIfA==
X-Gm-Message-State: AC+VfDy0cJ5o+T0g9y/lhzdmrAAAYrWAPUXOUHR6StbkEDAKfbx5WydY
 2fxgSg7Fwn/j5mDRPu7QY8TDNiqDpXA=
X-Google-Smtp-Source: ACHHUZ45CjBOIkWOM6gt+Z5UDMQMYRnAACMza7WWCWB+vaTsz6VCtYycaRj+NUuppqX4mM9Nwmj5jA==
X-Received: by 2002:a17:902:be03:b0:1ab:797:afbe with SMTP id
 r3-20020a170902be0300b001ab0797afbemr32952864pls.8.1684161066640; 
 Mon, 15 May 2023 07:31:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1709026b8a00b001acaf7e22bdsm11708482plk.14.2023.05.15.07.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:31:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 9/9] drm/msm: Wire up comm/cmdline override for fdinfo
Date: Mon, 15 May 2023 07:30:16 -0700
Message-Id: <20230515143023.801167-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Also store the override strings in drm_file so that fdinfo can display
them.  We still need to keep our original copy as we could need these
override strings after the device file has been closed and drm_file
freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.c           |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bb38e728864d..a20c2622a61f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -9,20 +9,21 @@
 #include <linux/ascii85.h>
 #include <linux/interconnect.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/nvmem-consumer.h>
 #include <soc/qcom/ocmem.h>
+#include <drm/drm_file.h>
 #include "adreno_gpu.h"
 #include "a6xx_gpu.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
 static u64 address_space_size = 0;
 MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
 module_param(address_space_size, ullong, 0600);
 
 static bool zap_available = true;
@@ -391,47 +392,68 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			return -EINVAL;
 		break;
 	default:
 		if (len != 0)
 			return -EINVAL;
 	}
 
 	switch (param) {
 	case MSM_PARAM_COMM:
 	case MSM_PARAM_CMDLINE: {
-		char *str, **paramp;
+		char *str, *str2, **paramp;
+		struct drm_file *file = ctx->file;
 
 		str = kmalloc(len + 1, GFP_KERNEL);
 		if (!str)
 			return -ENOMEM;
 
 		if (copy_from_user(str, u64_to_user_ptr(value), len)) {
 			kfree(str);
 			return -EFAULT;
 		}
 
 		/* Ensure string is null terminated: */
 		str[len] = '\0';
 
+		/*
+		 * We need a 2nd copy for drm_file.. this copy can't replace
+		 * our internal copy in the ctx, because we may need it for
+		 * recovery/devcoredump after the file is already closed.
+		 */
+		str2 = kstrdup(str, GFP_KERNEL);
+
 		mutex_lock(&gpu->lock);
 
 		if (param == MSM_PARAM_COMM) {
 			paramp = &ctx->comm;
 		} else {
 			paramp = &ctx->cmdline;
 		}
 
 		kfree(*paramp);
 		*paramp = str;
 
 		mutex_unlock(&gpu->lock);
 
+		mutex_lock(&file->override_lock);
+
+		if (param == MSM_PARAM_COMM) {
+			paramp = &file->override_comm;
+		} else {
+			paramp = &file->override_cmdline;
+		}
+
+		kfree(*paramp);
+		*paramp = str2;
+
+		mutex_unlock(&file->override_lock);
+
 		return 0;
 	}
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
 		return msm_file_private_set_sysprof(ctx, gpu, value);
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a403aebe7f5a..6dec1a3534f2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -574,20 +574,21 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	struct msm_file_private *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
 	rwlock_init(&ctx->queuelock);
 
 	kref_init(&ctx->ref);
+	ctx->file = file;
 	msm_submitqueue_init(dev, ctx);
 
 	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
 
 	return 0;
 }
 
@@ -596,20 +597,21 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	/* For now, load gpu on open.. to avoid the requirement of having
 	 * firmware in the initrd.
 	 */
 	load_gpu(dev);
 
 	return context_init(dev, file);
 }
 
 static void context_close(struct msm_file_private *ctx)
 {
+	ctx->file = NULL;
 	msm_submitqueue_close(ctx);
 	msm_file_private_put(ctx);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a4fa1b8655b..671ce89e61b0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -352,20 +352,30 @@ struct msm_gpu_perfcntr {
  * @seqno:        unique per process seqno
  */
 struct msm_file_private {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
 	int seqno;
 
+	/**
+	 * @file: link back to the associated drm_file
+	 *
+	 * Note that msm_file_private can outlive the drm_file, ie.
+	 * after the drm_file is closed but before jobs submitted have
+	 * been cleaned up.  After the drm_file is closed this will be
+	 * NULL.
+	 */
+	struct drm_file *file;
+
 	/**
 	 * sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
 	 * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
 	 *
 	 * Setting a value of 1 will preserve performance counters across
 	 * context switches.  Setting a value of 2 will in addition
 	 * suppress suspend.  (Performance counters lose state across
-- 
2.40.1

