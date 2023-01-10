Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084E664E02
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 22:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8633F10E679;
	Tue, 10 Jan 2023 21:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97D10E66F;
 Tue, 10 Jan 2023 21:29:10 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id q64so13772674pjq.4;
 Tue, 10 Jan 2023 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ww/wSmvr3k1evMYET/bp6trdFG64eYICnW875bycRj8=;
 b=CCgZWPuWSBttrXnRXZbS8iC4aN+Aau60QJBgZPiWSORv8+dEzapGDIMmiMg0TlBknL
 Al+dyjFFmkvbQ8rgPSsDtx/Vm02bYxdsPlM9Sa9gKrP1EjLefqBa4ulX/2RObwrZW7ay
 a+pYBnM5nAhKXuXGsELpeNXhU/mPabU2iEVAU5HzuT8TSVKmCGBW6q1sXxyCHEIP43GG
 fAYmkmpOvzY0aL+nzYypi5k2AfVLd6vrwSADOaqncv/imIZ/Q5SCPeGkN2xCQahFE7P4
 cq6QJfLTcvs5b/l3nglsLlXwWPDTV+r4VW5nnUqlRr7yVPoPUOQd2hexbhR2FGCAOREz
 IZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ww/wSmvr3k1evMYET/bp6trdFG64eYICnW875bycRj8=;
 b=1bEoVFlxregZJ4QW3hFgyiMbvGrcTLPv3jua3lqtH4DuzfN0pqZ2ektsmg92+V93J7
 CIQ6q6/TdwQpHir2dkOIfn0vbkAE/Vu2xYNt6xrahgCScCMXqm0vvhfdi/woPif0phZ6
 hc4Jw5DMnt5x1AK5NAINYTqpBCAAD4uWKYl/khhnkCdrqAmQTkv7E4HGSt1g+nf7lMa/
 OK6gSZVSj217PuKjlOfGvGgtH3aBf2yrw76VZ1iVraTfX5L4S6gTkK5HJr7QGcq57lIX
 rM94we+82BGitbujW77uvnBc3aBk+TcnRxW+ydcv+hEXK38mzOvpjOzW5q5G9nrWXtbZ
 qYOQ==
X-Gm-Message-State: AFqh2kotEhHQ7UdzvNKsaOFVW31t3SmcDNw7fuWh5geRModCF4LXcFms
 8XOMLc/Vx2z0/uplUHqXQ9kDKkLYfwE=
X-Google-Smtp-Source: AMrXdXvkRSXydWegDtiIcTPIVygJ7XqwuvTRfFb3Q/Yts4DuDVkJxsJ0AWg0r/ZcAz2R8ccvVQ0eyQ==
X-Received: by 2002:a17:902:8c89:b0:193:62a:80c8 with SMTP id
 t9-20020a1709028c8900b00193062a80c8mr17111420plo.45.1673386149390; 
 Tue, 10 Jan 2023 13:29:09 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 jd6-20020a170903260600b001897de9bae3sm8568294plb.204.2023.01.10.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 13:29:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Fix potential double-free
Date: Tue, 10 Jan 2023 13:28:59 -0800
Message-Id: <20230110212903.1925878-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If userspace was calling the MSM_SET_PARAM ioctl on multiple threads to
set the COMM or CMDLINE param, it could trigger a race causing the
previous value to be kfree'd multiple times.  Fix this by serializing on
the gpu lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++++
 drivers/gpu/drm/msm/msm_gpu.c           |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 57586c794b84..3605f095b2de 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -352,6 +352,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		/* Ensure string is null terminated: */
 		str[len] = '\0';
 
+		mutex_lock(&gpu->lock);
+
 		if (param == MSM_PARAM_COMM) {
 			paramp = &ctx->comm;
 		} else {
@@ -361,6 +363,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		kfree(*paramp);
 		*paramp = str;
 
+		mutex_unlock(&gpu->lock);
+
 		return 0;
 	}
 	case MSM_PARAM_SYSPROF:
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index bfef659d3a5c..7537e7b3a452 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -336,6 +336,8 @@ static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **
 	struct msm_file_private *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
+	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
+
 	/* Note that kstrdup will return NULL if argument is NULL: */
 	*comm = kstrdup(ctx->comm, GFP_KERNEL);
 	*cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a771f56ed70f..fc1c0d8611a8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -375,10 +375,18 @@ struct msm_file_private {
 	 */
 	int sysprof;
 
-	/** comm: Overridden task comm, see MSM_PARAM_COMM */
+	/**
+	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 *
+	 * Accessed under msm_gpu::lock
+	 */
 	char *comm;
 
-	/** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
+	/**
+	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 *
+	 * Accessed under msm_gpu::lock
+	 */
 	char *cmdline;
 
 	/**
-- 
2.38.1

