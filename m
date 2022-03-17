Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FA84DBBC5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0747010EAC4;
	Thu, 17 Mar 2022 00:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE22310EAC7;
 Thu, 17 Mar 2022 00:29:15 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so4054107pjb.1; 
 Wed, 16 Mar 2022 17:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZWZ7JEAL1DE1LvgRX3uWuLKQwPRiB58gmhQLlKG1GL0=;
 b=hQEZ3z2zvW6LDZb1FOtcB/Z5Ml8F/MMBihCYO7JC4NqXWVdgMI4YYRWpGo4MuOcEkT
 5wBBk9O0n/yPi8OCM5GrZ1YE3w/bSaxI7CJDYVUnOaoSt0+HUa0ftK/pvhJ1TkIJMDGa
 s5lZ68P5qzgHJ7KsAPP6+BHHKJzIkZu00nu6sYsx9esjYnQ9mOTEz8umK2g6GDgA2Mgx
 NlLS642gdGy9ih9gf/sG9rwk/HeLSyexsqLUqUycz3mQDjUtKeE6sFJq35cEvsknuj5a
 QO+BBHVyPUuI4lUS6DsH9rFY+vENdP7uSK6JOFbpTxDXH/8z0ODAl/RF7plJtyQTVFKp
 b7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZWZ7JEAL1DE1LvgRX3uWuLKQwPRiB58gmhQLlKG1GL0=;
 b=U6fgeyUHbgv+bFjTirpaIX9KK4f2u57Jl63as6Z/ZpVhr9SSF3OGms0kXKwtlV0Pk1
 hjt6SgLVWA9Pl/fVN2mA72inBCl96S5ZfaJPHReSCjF6GCxUFRw8ND+rT3q5Mfz4jrja
 dGnkJmtQYE1uf4s8ZttVQNNCmOTic8YgINh9gPo/7bIcGzUipgSew3CefrGhrpUPK5fm
 0yQJ6ajervmFnMW1dFDoTXN5n5eMJzk69ogtgXjRNh3tSS2F5UUR6JqW1j98FNQ9gtYG
 vLnP/p2WupVz+f5eZxQpkwBziB2/q5PKbFztBwJzHfmdZ6gZbQNHuVDkYhdHTN+iH2J8
 mJmg==
X-Gm-Message-State: AOAM532IgD02GQ41SUmz7IyaHCfbZKExzshhkmGOV9PLt5mIm5xVBBud
 GlLAh96hzAID357rgNbaE6CGqc8FYao=
X-Google-Smtp-Source: ABdhPJyqVMjKPtyWbcZMNiGxIdqe6xlBdoDkqLHl3sBZooawf6OQo1w2RitJWq1Br+5vDBkCvEo2gw==
X-Received: by 2002:a17:90b:4b8a:b0:1c6:33b2:9d6a with SMTP id
 lr10-20020a17090b4b8a00b001c633b29d6amr2363205pjb.225.1647476954684; 
 Wed, 16 Mar 2022 17:29:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 bh6-20020a056a00308600b004f6aa0367f6sm3744636pfb.118.2022.03.16.17.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 17:29:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm: Add a way to override processes comm/cmdline
Date: Wed, 16 Mar 2022 17:29:45 -0700
Message-Id: <20220317002950.193449-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317002950.193449-1-robdclark@gmail.com>
References: <20220317002950.193449-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the cause of using the GPU via virtgpu, the host side process is
really a sort of proxy, and not terribly interesting from the PoV of
crash/fault logging.  Add a way to override these per process so that
we can see the guest process's name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 40 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c           | 11 +++++--
 drivers/gpu/drm/msm/msm_gpu.h           |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c   |  2 ++
 include/uapi/drm/msm_drm.h              |  2 ++
 5 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3d307b34854d..c68dc9c722c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -290,11 +290,45 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
-	/* No pointer params yet */
-	if (len != 0)
-		return -EINVAL;
+	switch (param) {
+	case MSM_PARAM_COMM:
+	case MSM_PARAM_CMDLINE:
+		/* kstrdup_quotable_cmdline() limits to PAGE_SIZE, so
+		 * that should be a reasonable upper bound
+		 */
+		if (len > PAGE_SIZE)
+			return -EINVAL;
+		break;
+	default:
+		if (len != 0)
+			return -EINVAL;
+	}
 
 	switch (param) {
+	case MSM_PARAM_COMM:
+	case MSM_PARAM_CMDLINE: {
+		char *str, **paramp;
+
+		str = kmalloc(len + 1, GFP_KERNEL);
+		if (copy_from_user(str, u64_to_user_ptr(value), len)) {
+			kfree(str);
+			return -EFAULT;
+		}
+
+		/* Ensure string is null terminated: */
+		str[len] = '\0';
+
+		if (param == MSM_PARAM_COMM) {
+			paramp = &ctx->comm;
+		} else {
+			paramp = &ctx->cmdline;
+		}
+
+		kfree(*paramp);
+		*paramp = str;
+
+		return 0;
+	}
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4ec62b601adc..68f3f8ade76d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -364,14 +364,21 @@ static void retire_submits(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
+	struct msm_file_private *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
+	*comm = kstrdup(ctx->comm, GFP_KERNEL);
+	*cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
+
 	task = get_pid_task(submit->pid, PIDTYPE_PID);
 	if (!task)
 		return;
 
-	*comm = kstrdup(task->comm, GFP_KERNEL);
-	*cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+	if (!*comm)
+		*comm = kstrdup(task->comm, GFP_KERNEL);
+
+	if (!*cmd)
+		*cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
 
 	put_task_struct(task);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index c28c2ad9f52e..2c0203fd6ce3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -355,6 +355,12 @@ struct msm_file_private {
 	 */
 	int sysprof;
 
+	/** comm: Overridden task comm, see MSM_PARAM_COMM */
+	char *comm;
+
+	/** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
+	char *cmdline;
+
 	/**
 	 * elapsed:
 	 *
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 79b6ccd6ce64..f486a3cd4e55 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -61,6 +61,8 @@ void __msm_file_private_destroy(struct kref *kref)
 	}
 
 	msm_gem_address_space_put(ctx->aspace);
+	kfree(ctx->comm);
+	kfree(ctx->cmdline);
 	kfree(ctx);
 }
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0aa1a8cb4e0d..794ad1948497 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -82,6 +82,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_FAULTS     0x09  /* RO */
 #define MSM_PARAM_SUSPENDS   0x0a  /* RO */
 #define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
+#define MSM_PARAM_COMM       0x0c  /* WO: override for task->comm */
+#define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.35.1

