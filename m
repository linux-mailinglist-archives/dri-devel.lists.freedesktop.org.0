Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016B1D4A0A
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB816EC47;
	Fri, 15 May 2020 09:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8F06EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i15so2753127wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lx4fAyASncse6GRQGzx5wh1kAFnQoIwQ5biN6ma9HAg=;
 b=s573uDUlkzT/1Ip0w5FxR+Nor4wOufYmfvCCNk+kZeAxeSyNURmm+X9qiPYb4xJ5Wq
 UvvAmSHN4YYzgW3pXGlSIaf6XGc0N6yhnr741KcmLeeKNcwkqzP1Gv52QZJVDwntfite
 5t3jZI6DqBcocNPmWyjGk4qClrtyRHNPRv1zG03XiYzVir+pWWFSoBXOPKiT2fg4Gg4p
 DZ4ipaM5susb/zQz4ANKPkC9mBsIgetVQolDub5j5wmwUbaojxKaSBk4wB/VDTulWYTA
 g5s7/xPzI9LcvA6JfAj9drDpEmizkG2SCGwXA1h1m4RhlwwbuNrFAG9nFYMSP4gvGFmM
 fYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lx4fAyASncse6GRQGzx5wh1kAFnQoIwQ5biN6ma9HAg=;
 b=Xj9ZWGqjSYMn+eHaQb27Qm/zbLoGaBwRv3nn5XKzbJ7XvZYhh5ropy9/ViUEU7XmUw
 /wXpXKs0y5ErEbmTEhu4CRf9L4QUw9g6gifTduZzCe2SpMr3okavCrsg7Kb5cwV9Q+Dn
 Z51hnem2lLPckh9dPbk5lE9RQ/veVD2OClFRRZSFiSYDxu5iLJQTv2mJZ66j/3wRNhZM
 781FNynVij1C2DqJBtCsIHwYetuuz8hSWBPlvEIWNwXT9zcjaHRoVQUV0TU7ya848iZ4
 xjHkaXlSfTqPOD+cGmlUqs59zj6Hh+jxoDElq77lDl2cwclJY5W7lOLhe7ovPSiBES74
 4S3g==
X-Gm-Message-State: AOAM532CtA+n164q9u7b1EQ2axL6lMUdG26VLeZYuXKax7/zK6t3/2bl
 pt/h6rTX5WAs0QpN3Ay+iSGL9rFA
X-Google-Smtp-Source: ABdhPJzbLxd+Gg/5qbYT6eVu2A1cBhNjjE6XZ3t+uPzricqJDhgO9oClSFjCUo8W4uQbsjMUOX5fHw==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr3268610wrv.309.1589536461156; 
 Fri, 15 May 2020 02:54:21 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:20 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/38] drm/etnaviv: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:57 +0100
Message-Id: <20200515095118.2743122-18-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 8 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 6 +++---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 27c948f5dfeb..a2b649a8248e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -289,7 +289,7 @@ static int etnaviv_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
 
 	ret = etnaviv_gem_cpu_prep(obj, args->op, &args->timeout);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -310,7 +310,7 @@ static int etnaviv_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
 
 	ret = etnaviv_gem_cpu_fini(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -330,7 +330,7 @@ static int etnaviv_ioctl_gem_info(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	ret = etnaviv_gem_mmap_offset(obj, &args->offset);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -413,7 +413,7 @@ static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
 
 	ret = etnaviv_gem_wait_bo(gpu, obj, timeout);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index dc9ef302f517..b9bfb50ce7ee 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -244,7 +244,7 @@ void etnaviv_gem_mapping_unreference(struct etnaviv_vram_mapping *mapping)
 	mapping->use -= 1;
 	mutex_unlock(&etnaviv_obj->lock);
 
-	drm_gem_object_put_unlocked(&etnaviv_obj->base);
+	drm_gem_object_put(&etnaviv_obj->base);
 }
 
 struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
@@ -633,7 +633,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 	/* drop reference from allocate - handle holds it now */
 fail:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -742,6 +742,6 @@ int etnaviv_gem_new_userptr(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_handle_create(file, &etnaviv_obj->base, handle);
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(&etnaviv_obj->base);
+	drm_gem_object_put(&etnaviv_obj->base);
 	return ret;
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index f24dd21c2363..6d9e5c3c4dd5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -136,7 +136,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	return &etnaviv_obj->base;
 
 fail:
-	drm_gem_object_put_unlocked(&etnaviv_obj->base);
+	drm_gem_object_put(&etnaviv_obj->base);
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3b0afa156d92..1b12b57d2406 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -396,7 +396,7 @@ static void submit_cleanup(struct kref *kref)
 
 		/* if the GPU submit failed, objects might still be locked */
 		submit_unlock_object(submit, i);
-		drm_gem_object_put_unlocked(&etnaviv_obj->base);
+		drm_gem_object_put(&etnaviv_obj->base);
 	}
 
 	wake_up_all(&submit->gpu->fence_event);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
