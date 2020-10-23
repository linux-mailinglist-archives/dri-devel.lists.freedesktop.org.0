Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94769297529
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0916F8F6;
	Fri, 23 Oct 2020 16:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850C6F8E6;
 Fri, 23 Oct 2020 16:51:04 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 1so1222187ple.2;
 Fri, 23 Oct 2020 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sfqxF9mk3Lc51iY+H1cSzrjPU+7CCgm4eEof0V4Vlw=;
 b=d7ZrPrRwGpKkt+z7k4ZEXHpsy9Z5QSGLOfa5ygon/JcL0Ctxqj15MGvdmRnYZGZA1v
 e6jYLqNgKMjJLSiPfZfpjxrAnKM2YlQ5eEP7z1JYjUVpwHxZ9b+LRUQzUpkn/orihx6R
 XQpnlJz6OVr1LDAvbDOfrZ8y1AP6MHrXzqo+/c4uG2OqB2akmssxlReze2seZiC3EAAR
 l/VNy0/G75zBLIqvJz3+i112P4jKWvLKBFadZ1QsNRMm6rs6Mw+n2883wpSR+iuCkDIv
 n5+TLfJnT6rpmz13kWVMZHYDaz4m/L0cz6JzM5nvA2A2OpEcacpaLliUonvaA4NEnKLW
 tzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sfqxF9mk3Lc51iY+H1cSzrjPU+7CCgm4eEof0V4Vlw=;
 b=QvYLE/zRT+AOybkGUlXeXBy0LAZraK3QaN6rKkSlQ/66ibmy9+K5Gq5VE3a4Go1UGj
 FRakv3eDYLM3fRjffWjaHOVRfSI6Ubykz4/HD9F8MS0XzqmdTr1LFZZ1K/Kz5/aQm/+v
 6ys+uSJGrhr4aFJgxTuzMjE+VepAyOKip/xhdOG9W1Jp4ROF+gApm1HVp7KWFv5q9yJK
 D48ojVWHxQcO+HuIZQIdQdbYq0NDKF7gkmxJX6nowCloEuovASovPeqqRlu384i8DsP2
 5IOpKkJ36bS7+FwukMrOKw1QreQ4z+IVLSd3O1ZosE0qhVSoxctO7DIR7GCMiakr01/L
 mVGg==
X-Gm-Message-State: AOAM5318Xz9VOAGaG62wBULqjfVAVFSy9Oiwjz7Vwp1xTQii5NNAXjcK
 g9JpCsJYBlpkQeC3cd7w43PL/LXev6+V/g==
X-Google-Smtp-Source: ABdhPJzb6WAjkYuIX030962Q3iyTELJ0B0vy/zbByHllvY0Q2Vr/alj/EQmOhN0lsrhZMtghqKvLeg==
X-Received: by 2002:a17:902:a612:b029:d6:6ae:4d47 with SMTP id
 u18-20020a170902a612b02900d606ae4d47mr17667plq.50.1603471863282; 
 Fri, 23 Oct 2020 09:51:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i17sm2618735pfa.183.2020.10.23.09.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:51:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 21/23] drm/msm: Drop struct_mutex in madvise path
Date: Fri, 23 Oct 2020 09:51:22 -0700
Message-Id: <20201023165136.561680-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The obj->lock is sufficient for what we need.

This *does* have the implication that userspace can try to shoot
themselves in the foot by racing madvise(DONTNEED) with submit.  But
the result will be about the same if they did madvise(DONTNEED) before
the submit ioctl, ie. they might not get want they want if they race
with shrinker.  But iova fault handling is robust enough, and userspace
is only shooting it's own foot.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 ++---------
 drivers/gpu/drm/msm/msm_gem.c |  4 +---
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49e6daf30b42..f2d58fe25497 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -912,14 +912,9 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
-	if (ret)
-		return ret;
-
 	obj = drm_gem_object_lookup(file, args->handle);
 	if (!obj) {
-		ret = -ENOENT;
-		goto unlock;
+		return -ENOENT;
 	}
 
 	ret = msm_gem_madvise(obj, args->madv);
@@ -928,10 +923,8 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		ret = 0;
 	}
 
-	drm_gem_object_put_locked(obj);
+	drm_gem_object_put(obj);
 
-unlock:
-	mutex_unlock(&dev->struct_mutex);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 00b4788366c5..7f24a58c0390 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -673,8 +673,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 
 	msm_gem_lock(obj);
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
 
@@ -691,7 +689,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(!is_purgeable(msm_obj));
 	WARN_ON(obj->import_attach);
 
@@ -771,6 +768,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 
 	might_sleep();
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
 
 	if (!atomic_fetch_inc(&msm_obj->active_count)) {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ffa2130ee97d..d79e7019cc88 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -190,8 +190,6 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
 {
-	WARN_ON(!msm_gem_is_locked(&msm_obj->base));
-	WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
 	return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
 			!msm_obj->base.dma_buf && !msm_obj->base.import_attach;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
