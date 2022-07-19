Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F357A4D4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B1E90F74;
	Tue, 19 Jul 2022 17:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231490F26;
 Tue, 19 Jul 2022 17:18:41 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 17so3822359pfy.0;
 Tue, 19 Jul 2022 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=d84EtypEw3YOZPEj14Cy+1tsV890PI9GGysEyTiDevcf/6y9pLX+Tmvpsgqu5AW/tD
 qUDeeVgSBoYVbPh3CWfZKO4OgqcjG6RSiUlTuTtOFVJebfp5S8fdU00WUVwe4fCg3Ifu
 wEGveVZ9GNW56fW9MSs1WoMboIXkYzOfeT7x9GvipJ/BzCWYqMU/4N5At7FcYUPpHd8a
 o8d16yIryXMO3irpgmqMxpnkThB+LVwWueaxLNt9aoFu/Iyr5IWOZOSfWN7HcxaT3/rz
 /y3hsp8rF/ZQc5PQanfKzP6fMdbhUfU9UwzQJ6+7v6x7CxIiphESGfclC17n8EoKEtM6
 WbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=zCRn7TjyOt/QJx+sWb8EfOJQXMBw0ZvMZgOt2M+sq11hqHphQbLfk4BOwbMsXuluCi
 lDUKOWHkyfVkhr/Joch6kwDl1RKftgC8VpbYKcA0mHUvZkvabhjch4Tv9BJJYcLJHYxD
 cg7DwcjuTUDDyt50ldxrruRyvMf0gREF5JpSy9eWJPX2/J4EFwfLyYFv27ObJA/+ydyY
 B48XT4DkmthbzhMjisyPavDsJ76YaDorPdMjb6zkZP7h9WuiXs3kT8bohIcxO0OaPW94
 WBgPXSKh7neNfj+BmKbLySog0qUVWTBnNAH8dwcjPAyLqqZXccG4r4n0cbKbd2+b8Qjo
 /Sww==
X-Gm-Message-State: AJIora8CPsLDF74324UuJqoLfAC0RKRg3Nlik8ouV6LhOpM14tabp9LN
 J3F7PDvro0umDduICY2TAjimLdjsMDI=
X-Google-Smtp-Source: AGRyM1ua7TCIedMtFkEXgDnLA/rlwx26jhGhXrgdrpp2JJPABfQTwGlNH6fuH4j9MWpjRTpFMF5ESg==
X-Received: by 2002:a63:5620:0:b0:41a:4c1e:a821 with SMTP id
 k32-20020a635620000000b0041a4c1ea821mr3591003pgb.611.1658251120965; 
 Tue, 19 Jul 2022 10:18:40 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w65-20020a626244000000b0050dc762816dsm11702733pfb.71.2022.07.19.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/13] drm/msm: Reorder lock vs submit alloc
Date: Tue, 19 Jul 2022 10:18:45 -0700
Message-Id: <20220719171900.289265-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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

This lets us drop the NORETRY.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c9e4aeb14f4a..b7c61a99d274 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,7 +36,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (sz > SIZE_MAX)
 		return ERR_PTR(-ENOMEM);
 
-	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL);
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
@@ -771,25 +771,21 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&queue->lock);
-	if (ret)
-		goto out_post_unlock;
-
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
-			goto out_unlock;
+			return ret;
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos,
-		args->nr_cmds);
-	if (IS_ERR(submit)) {
-		ret = PTR_ERR(submit);
-		submit = NULL;
-		goto out_unlock;
-	}
+	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
+	if (IS_ERR(submit))
+		return PTR_ERR(submit);
+
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		goto out_post_unlock;
 
 	submit->pid = pid;
 	submit->ident = submitid;
@@ -965,9 +961,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
+out_post_unlock:
 	if (submit)
 		msm_gem_submit_put(submit);
-out_post_unlock:
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
-- 
2.36.1

