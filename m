Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B369B77B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 02:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B410F108;
	Sat, 18 Feb 2023 01:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBF910F0F5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 01:25:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p19so3662511lfr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 17:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBTbzbVOUqYQofnWyPH8cCYJy+e3PlNvbe64Pd9nXxM=;
 b=XixVrrqnxl4aBbKUU527cQfk+YZHN27UkIXQdorFvfOMX+sc8j2xK051sAJmnngCmO
 5sxWEeZkwu7mD2s4eWhT57GxxvVpf8ESWCWHkM6aJZ7L8RAQHcjIhkhDYIwcCJZqWfN9
 NqdNaLuC/Q6cT0YSLZI+kNTadDl1uMIoibgegK+0VQBo0tYbqiMnfUsJzq0x35wXt+rE
 6sGS9z36oZ2esfHZzzH16TLWua9tYTmuknOrqgNaUPHqN+mBnOIvXph7AUrFN3D5wbx9
 EU5gdFf7yzXm5/0VbSjvraiwQDYJEIGBmB0sxeKU3JGdqvypFk8DLtlAdx62QPVlVwqP
 6a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBTbzbVOUqYQofnWyPH8cCYJy+e3PlNvbe64Pd9nXxM=;
 b=pL21JtGXLn+xRUkoYetZpY5/l6McobIst4OqgqNkfIk5zdrlNkNhhAfu6DW9kf7eLZ
 alG+0F42EMXm2/6YJWJuyslPi1n6qjFcHH/HYtY5m7QFVGjqTVr4NWA13n7NW1YjNIJA
 A1BxJkcP629mPdKiAUIhKsQbVthrC0sL+gjaZ4fbAYudIhX8y8mby4niP84Fhat/0FDO
 IlB/WBEoPH9lH4xIOThQhWtuDsg4/+7t6DsGHNr5RTDMjzZ1nP2Bq51x66h+/LIJIBKA
 cVL1bmQRpRvRbJH3dWLRTfcrr0zhmIvZIGZ3dg6jscp8w4K1DNfUBnZ+7vqlLR9+AbvL
 T6tA==
X-Gm-Message-State: AO0yUKUONUGTpH0d6nbtMH9XZwcRi0YiuM12wHkKSXapPib5bAfqrYPc
 klmaIoX1cqB1b6JwwOOrNIKdbg==
X-Google-Smtp-Source: AK7set+b7/3DtCVoBQmtej3h+VpybWv/zNE0+pjBMwDKDJflxlaFXz1qoImo83u8/PG0yJAWxb46wQ==
X-Received: by 2002:a05:6512:3911:b0:4db:3a70:e9f3 with SMTP id
 a17-20020a056512391100b004db3a70e9f3mr456279lfu.69.1676683548802; 
 Fri, 17 Feb 2023 17:25:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j11-20020a19f50b000000b004d85f2acd8esm826414lfb.295.2023.02.17.17.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 17:25:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm: drop unused ring variable in
 msm_ioctl_gem_submit()
Date: Sat, 18 Feb 2023 03:25:45 +0200
Message-Id: <20230218012546.3655999-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
References: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
 drivers/gpu/drm/msm/msm_gpu_trace.h  | 10 ++++------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ac8ed731f76d..a539eb31042f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
                                            uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride,
-                                           struct msm_ringbuffer *ring)
+                                           size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -722,7 +721,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
-	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	int out_fence_fd = -1;
@@ -760,8 +758,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ring = gpu->rb[queue->ring_nr];
-
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
@@ -774,7 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (IS_ERR(submit))
 		return PTR_ERR(submit);
 
-	trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
+	trace_msm_gpu_submit(pid_nr(submit->pid), submit->ident,
 		args->nr_bos, args->nr_cmds);
 
 	ret = mutex_lock_interruptible(&queue->lock);
@@ -803,7 +799,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index ac40d857bc45..12ef10f1de4c 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -9,24 +9,22 @@
 #define TRACE_INCLUDE_FILE msm_gpu_trace
 
 TRACE_EVENT(msm_gpu_submit,
-	    TP_PROTO(pid_t pid, u32 ringid, u32 id, u32 nr_bos, u32 nr_cmds),
-	    TP_ARGS(pid, ringid, id, nr_bos, nr_cmds),
+	    TP_PROTO(pid_t pid, u32 id, u32 nr_bos, u32 nr_cmds),
+	    TP_ARGS(pid, id, nr_bos, nr_cmds),
 	    TP_STRUCT__entry(
 		    __field(pid_t, pid)
 		    __field(u32, id)
-		    __field(u32, ringid)
 		    __field(u32, nr_cmds)
 		    __field(u32, nr_bos)
 		    ),
 	    TP_fast_assign(
 		    __entry->pid = pid;
 		    __entry->id = id;
-		    __entry->ringid = ringid;
 		    __entry->nr_bos = nr_bos;
 		    __entry->nr_cmds = nr_cmds
 		    ),
-	    TP_printk("id=%d pid=%d ring=%d bos=%d cmds=%d",
-		    __entry->id, __entry->pid, __entry->ringid,
+	    TP_printk("id=%d pid=%d bos=%d cmds=%d",
+		    __entry->id, __entry->pid,
 		    __entry->nr_bos, __entry->nr_cmds)
 );
 
-- 
2.39.1

