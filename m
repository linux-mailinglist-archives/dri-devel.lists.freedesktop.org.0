Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9241C9401
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7856EA07;
	Thu,  7 May 2020 15:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7416EA07
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r26so7254662wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmZePMPbECHg8I2+A+T7Siz0d6i4d8HPch6Ah5GHNYE=;
 b=Q8ToakZEBZXtDL3+L7GWQeRnbp1IZlmsYK/ZBX7iNOOXNujIBgryPkFMnVfiu8pSAW
 gKJzIa3v9995nEqwLdJlwGLnM/8Qft1WpWgZuKEkDHaR57SoTundU2h2hMPTWu6XxeX1
 juuWnT9zecv0+hOdJsC3/LWuUJuIZRjf+mw6hEHVGNlObsQW0/eFf6UMU5rs3JRg7tXu
 u6oz3cBlK21Lsg3uRssqGyI8n8hbrJm7AS8hZ0nsWe4FJTqXfK1bazl9iQHlj6WLFEqm
 XSwpePcGKtj8S3HkvdTYAa29eIxPcPlZ6nr0hF0eQa2DU2cb6yOPNfYWksPbgMH+tbCV
 GFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmZePMPbECHg8I2+A+T7Siz0d6i4d8HPch6Ah5GHNYE=;
 b=lxRIOMLtdIwOzUfhXA+rLYputRm3Io/7cqFOClGMgHAoTg+g7HO0hsNTSR3mgqJ5kf
 gTbpDMFP++i9jvGc0kqJjwChEgms/DqnZ5RZIctjTvhK92QfoKhOPpGSESf4FlqqsKWr
 kI1msP1uxg0kOuulklyrfYBXcJ+OnP9wNtPzK6XDAg6rByZdlg4i0Njn86zkHq5T1wme
 CvqV7Tq2UoJ2TTK3f/U+ULBfxB+kl4PizWr0JjOhR5dmQ5y1VAA3NYC8vIoubrKrcB1w
 aZ8sIjmR7++4cesZrBHc3sCfwfgA2o87oZnCA99PZpuGetC0NmvI2aLCGesjzbcPbSBE
 txgg==
X-Gm-Message-State: AGi0PuaTo5HEFCd5U0k+VzqPWHQ0YkNIa2Y+onaThuLTkLqEq4bw6aG8
 GcQTHq/i+bXO6tno23+IGlFn6sy/
X-Google-Smtp-Source: APiQypIS2KPPUoVzSPLLV2UIClpSPbn/orrpLt6XZT5Guk+Rf0Bq3I/gHVi/5Pagh/+fdWD8RwKb7g==
X-Received: by 2002:a1c:e087:: with SMTP id
 x129mr11322170wmg.127.1588864272996; 
 Thu, 07 May 2020 08:11:12 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:12 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/36] drm/etnaviv: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:01 +0100
Message-Id: <20200507150822.114464-16-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
