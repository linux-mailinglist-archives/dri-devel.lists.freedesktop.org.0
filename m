Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F31D4A13
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3626EC52;
	Fri, 15 May 2020 09:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24576EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i15so2754189wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g0LkSFX4xUa/Now8wz5B/tkjASecL8HvKLerInAze+A=;
 b=Zb4jWxySF4pdXNARSWgKEpxkFyhzJiFj8kHxjCOkN4pkixCiU7SB2sw92t4p4Fv/eP
 yGEqxiBQBy0vMVrkHpdTkMf1Eqh+dZxsratPx1fL14QTp6MBezhmr8t+ZWKmYHFrAYAs
 VPmnDRaMnPxHSKBKPFzpvtQ7AYQ1MQwGsqp7VLCg7COFWd06yemBz7aB4s0QpXK0I/L0
 lha7mmNkcfdSXqz4geArXSDwaiDM75EdNSEdqeHxTagzpbyZpdCFdW9tlD9TS2FoA9wR
 5gbZZu+4nt3wkCAICOtmV1RPt25viSYFV/sCJ37kYWuVRlQCD37yx5cKMv7DvQQPIx+7
 aG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g0LkSFX4xUa/Now8wz5B/tkjASecL8HvKLerInAze+A=;
 b=TeYUrSc/vuX7v5Wme2/zac72URqVQcOlCsokueQf2X/jvAoqtJgK6/048sgapt9/Y/
 2ceIEVWS9Su8LeObddrObq6FXkBY63Hr7w4QQ/vXm+Aksg9zc4iHNB8jvm30mnr0zHW/
 uySL+H+08qNZeFmJv4w5xIOyr80Fgja5Fg6H1r3l0gCoYsgUfn92XFvV0YLyNywQTTEz
 5RqF1XSK9GV5jZtPrRr4WEGXYHYdRNgElhy1JebX2xO9Zc6/IKHASvLEmSLqKFzX+kKT
 F/iuErKcXUeovmcoxf0mRTg4qweeWY0psvLIVLfa7/RD1XNILNr04q6vgSC1Q2jwQci5
 bocg==
X-Gm-Message-State: AOAM533Gf8vi6AA1lIei7/KPcwcWxLc6pI1iye+Lji/6sAs9+xPZZw7p
 naQZ2t1uHRyBdx09ED7B1t/dJ9yJ
X-Google-Smtp-Source: ABdhPJyLrUkyx/VB4wWSMSumlZusI3pZa4BvePH45InOCtZTXXG1jqNN78FWChV9yWlVJv7de2rHow==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr3295060wrr.259.1589536479112; 
 Fri, 15 May 2020 02:54:39 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:38 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 32/38] drm/v3d: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:12 +0100
Message-Id: <20200515095118.2743122-33-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
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

Cc: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 6 +++---
 drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
 drivers/gpu/drm/v3d/v3d_irq.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index edd299ab53d8..8b52cb25877c 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -185,7 +185,7 @@ int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 	args->offset = bo->node.start << PAGE_SHIFT;
 
 	ret = drm_gem_handle_create(file_priv, &bo->base.base, &args->handle);
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 
 	return ret;
 }
@@ -208,7 +208,7 @@ int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return 0;
 }
@@ -229,6 +229,6 @@ int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
 
 	args->offset = bo->node.start << PAGE_SHIFT;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return 0;
 }
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 09a7639cf161..915f8bfdb58c 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -358,7 +358,7 @@ v3d_job_free(struct kref *ref)
 
 	for (i = 0; i < job->bo_count; i++) {
 		if (job->bo[i])
-			drm_gem_object_put_unlocked(job->bo[i]);
+			drm_gem_object_put(job->bo[i]);
 	}
 	kvfree(job->bo);
 
@@ -384,7 +384,7 @@ v3d_render_job_free(struct kref *ref)
 	struct v3d_bo *bo, *save;
 
 	list_for_each_entry_safe(bo, save, &job->unref_list, unref_head) {
-		drm_gem_object_put_unlocked(&bo->base.base);
+		drm_gem_object_put(&bo->base.base);
 	}
 
 	v3d_job_free(ref);
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 51b65263c657..c88686489b88 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -72,7 +72,7 @@ v3d_overflow_mem_work(struct work_struct *work)
 	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
 
 out:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 }
 
 static irqreturn_t
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
