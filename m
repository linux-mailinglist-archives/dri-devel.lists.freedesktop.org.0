Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25064CC67E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733EB10EBE0;
	Thu,  3 Mar 2022 19:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B9C10EB58;
 Thu,  3 Mar 2022 19:49:26 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso5517885pjq.1; 
 Thu, 03 Mar 2022 11:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xbosC4JZJNsHySQIblKAgj9XK83DOcejHR+KA5XscI=;
 b=OBYfeagLPCCAaNCFm7xS5rkAZTci03HXcvdrgG7D/lzbK7gT4SL6iac4Y7u58j6ufT
 5B1/VjkZRzmHDdqlCZDyxgagAVOkUcGLSPz8Jh7RKdyJ2I/dLMooj2H0x5P3HqNHw0+C
 X0kBHai/B+bapPHHQz1Rnjr1WXWuuvvHEBJrIeTw9CWno9aCo+aVvjT0P1a9oZ62XYvW
 tMoAISy/0n7MKIMamYnkmonYsDgOLuzMgDpivWZmgZ293OkoRXgeS8QaBvZ8h99j0c/4
 GxbQzrpAdDcrOvVuchqfBlxMPHPa+FAGe3HbYXvuym1PohGuXBrfZef63OCVHcC1jrCK
 nH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xbosC4JZJNsHySQIblKAgj9XK83DOcejHR+KA5XscI=;
 b=eqbFzHRChpnAXPwDzN+WdYBIrM/nvRTzb/gnXauKVJc555Mhwl8H3PJyorJNg8vtJr
 N3sXrOt87fDEItb4Vjb1lMQ4+tl7NvAYXAKS2PLgFLlVN0DXHf4tDoLy5NmX6zVowbPu
 Qsmd80BEwa0F+ZMrQmr//5EHbI4CYtqPh0OAVdjws51YR+/VioYkmLAy72VuSUJGGO1I
 qRLxJQyywJXx+g/BJRKt2QKdmMfjToUzYabQHbizX+UJcO2ILJ9Z1aYVHDyhf7ksVrAg
 /7FP8sBtofdBGHI9tKaNnvwr0qmQz7zlo4c5dajxrXnsPI2U7lMkkpQn+AIUjuYPMjoE
 GRPw==
X-Gm-Message-State: AOAM532AgaiCsRuLtcy9POelsTKbrQD7khIJa9iaHjh82qXk0hnGl845
 GVS95HJFq+rLcGg9WypuPubEPaLvYnI=
X-Google-Smtp-Source: ABdhPJwLVQ7E2EKws8ZPmAUdb47ybgHGmn1ojuW/ICauQefb1JhSexIQ07xa/rLIXZ9yXXSMYgxz4w==
X-Received: by 2002:a17:90b:3892:b0:1bc:fd05:6ea8 with SMTP id
 mu18-20020a17090b389200b001bcfd056ea8mr6962989pjb.85.1646336965687; 
 Thu, 03 Mar 2022 11:49:25 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 nv14-20020a17090b1b4e00b001bd36b55298sm3076906pjb.39.2022.03.03.11.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:49:24 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm: Add SYSPROF param
Date: Thu,  3 Mar 2022 11:46:47 -0800
Message-Id: <20220303194758.710358-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303194758.710358-1-robdclark@gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a SYSPROF param for system profiling tools like Mesa's pps-producer
(perfetto) to control behavior related to system-wide performance
counter collection.  In particular, for profiling, one wants to ensure
that GPU context switches do not effect perfcounter state, and might
want to suppress suspend (which would cause counters to lose state).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_drv.c           |  8 ++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 27 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c   | 34 +++++++++++++++++++++++++
 include/uapi/drm/msm_drm.h              |  1 +
 5 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6a37d409653b..c91ea363c373 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -287,6 +287,10 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t value)
 {
 	switch (param) {
+	case MSM_PARAM_SYSPROF:
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
+		return msm_file_private_set_sysprof(ctx, gpu, value);
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ca9a8a866292..780f9748aaaf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -559,8 +559,16 @@ static void context_close(struct msm_file_private *ctx)
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
+	/*
+	 * It is not possible to set sysprof param to non-zero if gpu
+	 * is not initialized:
+	 */
+	if (priv->gpu)
+		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
+
 	context_close(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index fde9a29f884e..0ba1dbd4e50f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -160,6 +160,13 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	/**
+	 * sysprof_active:
+	 *
+	 * The count of contexts that have enabled system profiling.
+	 */
+	refcount_t sysprof_active;
+
 	/**
 	 * cur_ctx_seqno:
 	 *
@@ -330,6 +337,24 @@ struct msm_file_private {
 	struct kref ref;
 	int seqno;
 
+	/**
+	 * sysprof:
+	 *
+	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
+	 * intended to be used by system profiling tools like Mesa's
+	 * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
+	 *
+	 * Setting a value of 1 will preserve performance counters across
+	 * context switches.  Setting a value of 2 will in addition
+	 * suppress suspend.  (Performance counters loose  state across
+	 * power collapse, which is undesirable for profiling in some
+	 * cases.)
+	 *
+	 * The value automatically reverts to zero when the drm device
+	 * file is closed.
+	 */
+	int sysprof;
+
 	/**
 	 * elapsed:
 	 *
@@ -545,6 +570,8 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+				 struct msm_gpu *gpu, int sysprof);
 void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7cb158bcbcf6..4179db54ac93 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,6 +7,40 @@
 
 #include "msm_gpu.h"
 
+int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+				 struct msm_gpu *gpu, int sysprof)
+{
+	/* unwind old value first: */
+	switch (ctx->sysprof) {
+	case 2:
+		pm_runtime_put_autosuspend(&gpu->pdev->dev);
+		fallthrough;
+	case 1:
+		refcount_dec(&gpu->sysprof_active);
+		fallthrough;
+	case 0:
+		break;
+	}
+
+	/* then apply new value: */
+	switch (sysprof) {
+	default:
+		return -EINVAL;
+	case 2:
+		pm_runtime_get_sync(&gpu->pdev->dev);
+		fallthrough;
+	case 1:
+		refcount_inc(&gpu->sysprof_active);
+		fallthrough;
+	case 0:
+		break;
+	}
+
+	ctx->sysprof = sysprof;
+
+	return 0;
+}
+
 void __msm_file_private_destroy(struct kref *kref)
 {
 	struct msm_file_private *ctx = container_of(kref,
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a1bb2a17a8b9..07efc8033492 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -81,6 +81,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_PP_PGTABLE 0x08  /* RO: Deprecated, always returns zero */
 #define MSM_PARAM_FAULTS     0x09  /* RO */
 #define MSM_PARAM_SUSPENDS   0x0a  /* RO */
+#define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.35.1

