Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E796C1527
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846210E5A9;
	Mon, 20 Mar 2023 14:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3C10E1E1;
 Mon, 20 Mar 2023 14:44:51 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d8so6728621pgm.3;
 Mon, 20 Mar 2023 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Xvkkg7F6CjyOF2RZo8Gtbu7JFTSy/bgLszOXTif/c=;
 b=pdh6pDbj0hMlQMJiqcjb8EcHHB++Bz4iZs1fWn8cufOZ+Nlx3Cw+6HTaCNHQc1riJo
 sNuYVoJZKGIWIeMkxx9NXtGIedo/FV+PKDgDHWaf9G0Teyo5+mk7ELb+tQFBYD1G0S21
 0PtNuq9gBlinRoOXPX9RrFMMstWiCfJbX6w0UiLfyeU6VyzeB4va8oEX0kp4G/PqgrZ4
 J8x7zIf81il9FWDLwkwoPzsnDUwEcI479IVGKAZjOeVZVZk4yNQNiDf7cUZrYqgllCFZ
 rRGRxpH+E0sP+A0ffVoJH4/hiO7565ux39p3UDwlawoDk1SaGvLvjUCn4t/eGacpTtyc
 c0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Xvkkg7F6CjyOF2RZo8Gtbu7JFTSy/bgLszOXTif/c=;
 b=iYDRJHh/ehlnSG1Y2gd65mQjgyzzWKaQ5L8DCFrHbUUfgGTYmFLQN3REkLk9LFfRj5
 nAEwT0R/RGTFNarDo5BAQ4gpQapVqzE+g4TbmO7Bw1gzF2jLZ5OBk7ahyqwnjA9bKHX+
 PJBH0rvQ3ZgA3VJM+Hxalz4C1dj1SLCNsBkzqgmEae9HpNCA43zoYCJAOGUgaQoQjh9m
 uX1gO7sHm5iIJ81P+5+SQlS+6btAGGE62g42G6GOkHOHl1AOpb5EQyJ3SbscPYE1pJ/c
 4f7p/WR7blgYTg6Fk+S7BQ1jnNGLSi7IwxzJ8qH+LZMpGqZwYLsDVSa/7LuRjDDuE7me
 AVKg==
X-Gm-Message-State: AO0yUKUdWHAzXLtp+0dQVadCmPHhR44kMjKX6wr/MYkz16K2rddTdyRa
 mz2+LDNw9p7qkLJvSZ6K9xcCoTwkavo=
X-Google-Smtp-Source: AK7set8KWfMWUfN/rUSfAdvgv538dmuC8YG9xJe+nc38O3y7lCz5M7md+3TF5MvUHCrG2tMwgVLAcQ==
X-Received: by 2002:aa7:9f91:0:b0:627:fc31:1de with SMTP id
 z17-20020aa79f91000000b00627fc3101demr3121841pfr.7.1679323490696; 
 Mon, 20 Mar 2023 07:44:50 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a62a516000000b0058bc7453285sm6389779pfm.217.2023.03.20.07.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/23] drm/msm: Use idr_preload()
Date: Mon, 20 Mar 2023 07:43:33 -0700
Message-Id: <20230320144356.803762-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid allocation under idr_lock, to prevent deadlock against the
job_free() path (which runs on same thread as job_run(), which makes
it also part of the fence-signaling path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b9d81e5acb42..0ab62cb4ed69 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -882,6 +882,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
+	idr_preload(GFP_KERNEL);
+
 	spin_lock(&queue->idr_lock);
 
 	/*
@@ -893,6 +895,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
 			idr_find(&queue->fence_idr, args->fence)) {
 		spin_unlock(&queue->idr_lock);
+		idr_preload_end();
 		ret = -EINVAL;
 		goto out;
 	}
@@ -910,7 +913,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		submit->fence_id = args->fence;
 		ret = idr_alloc_u32(&queue->fence_idr, submit->user_fence,
 				    &submit->fence_id, submit->fence_id,
-				    GFP_KERNEL);
+				    GFP_NOWAIT);
 		/*
 		 * We've already validated that the fence_id slot is valid,
 		 * so if idr_alloc_u32 failed, it is a kernel bug
@@ -923,10 +926,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		 */
 		submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
 						    submit->user_fence, 1,
-						    INT_MAX, GFP_KERNEL);
+						    INT_MAX, GFP_NOWAIT);
 	}
 
 	spin_unlock(&queue->idr_lock);
+	idr_preload_end();
 
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id;
-- 
2.39.2

