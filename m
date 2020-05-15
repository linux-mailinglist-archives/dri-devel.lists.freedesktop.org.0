Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F41D4A0B
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD696EC4A;
	Fri, 15 May 2020 09:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7B6EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f13so1653882wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAIXTkR0UxzL/YJ0vaCb8ggiV3isdKW1wP+cuDhL8YY=;
 b=gpAleM7XTumyRfGNVwMWWvdeCP9nsmINXbzJvodFtBWr+9rcVpo6Q1LRIgK9/cZG0f
 hb5SfL6KC5Y//4MaFKW6w1gNBtG1yIxUcv7oJL3igK4vh/jCrG0LCEs8W0ed2/xmZYeO
 rn45EnBAawM76x2x0uCD2UjtJM2uSN9BP+wI2t5svn8I8upFfZLkuiyBwOAtPMcILRPw
 C5cr0Qkv+zb0KDUlGKpS0+K1BkDHocvgq4HbAW/oifKPn+TfHIUpItg96vm446pIUvvY
 9u4EGH76yJcBQRQGAZlhOMsyIt/Upflk4DFCPki6HbTPEiytGaERQ6hZcR1Y8S7MEy2N
 BTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAIXTkR0UxzL/YJ0vaCb8ggiV3isdKW1wP+cuDhL8YY=;
 b=cZEtBB5vELvMbAmwG+gR+fol1ahaygwwp6KSyy6rCYvzSkXH0mnt5h85G35wSmKSwg
 Mh3SP6vRcaZ+nMlE2kPGkO4Bw9dBK4Y4Ayulr+wdriCKEDtpHkY5xkHQUS4fcIYoVT2t
 gWFtS4DVBKuC0fp3hd85+4a1ahW8XFG+li/ixoNimwdrsjRdZOi/bAt8EK4mwUaMSidE
 omdg0/02Ok2TTciH2T35fjAvOlofD7uMk2uSRs12QxEkSMa4x7ckCraMjkNDhfi0shQn
 puARE7GI3MyJqija8sykAyr9uQn+bkN1bdwxvuP760Y9oilej/Y9PVpNEfEa91CM8yDl
 n46w==
X-Gm-Message-State: AOAM530t/VrSfbMfMMWn+RgA+rjYB4Wz/zoEbsHYqIrX7ru9FeDgJBJg
 stBeNIKFwQkRosPXKVC7qTwnxnL6
X-Google-Smtp-Source: ABdhPJzGRap487iObvgxfqu6wiOFrEjcFntpxKZp2MmFr1vHzqpsUaf8rQmP+SV7B3QtmXFeGkQgyQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr3030852wmj.3.1589536465619;
 Fri, 15 May 2020 02:54:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:25 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/38] drm/lima: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:01 +0100
Message-Id: <20200515095118.2743122-22-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Qiang Yu <yuq825@gmail.com>
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

Cc: Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/lima/lima_gem.c   | 10 +++++-----
 drivers/gpu/drm/lima/lima_sched.c |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 5404e0d668db..155f2b4b4030 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -134,7 +134,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 
 out:
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return err;
 }
@@ -243,7 +243,7 @@ int lima_gem_get_info(struct drm_file *file, u32 handle, u32 *va, u64 *offset)
 
 	*offset = drm_vma_node_offset_addr(&obj->vma_node);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return 0;
 }
 
@@ -323,7 +323,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		 */
 		err = lima_vm_bo_add(vm, bo, false);
 		if (err) {
-			drm_gem_object_put_unlocked(obj);
+			drm_gem_object_put(obj);
 			goto err_out0;
 		}
 
@@ -368,7 +368,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 				    submit->nr_bos, &ctx);
 
 	for (i = 0; i < submit->nr_bos; i++)
-		drm_gem_object_put_unlocked(&bos[i]->base.base);
+		drm_gem_object_put(&bos[i]->base.base);
 
 	if (out_sync) {
 		drm_syncobj_replace_fence(out_sync, fence);
@@ -389,7 +389,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		if (!bos[i])
 			break;
 		lima_vm_bo_del(vm, bos[i]);
-		drm_gem_object_put_unlocked(&bos[i]->base.base);
+		drm_gem_object_put(&bos[i]->base.base);
 	}
 	if (out_sync)
 		drm_syncobj_put(out_sync);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e6cefda00279..64ced6d0e6cf 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -151,7 +151,7 @@ void lima_sched_task_fini(struct lima_sched_task *task)
 
 	if (task->bos) {
 		for (i = 0; i < task->num_bos; i++)
-			drm_gem_object_put_unlocked(&task->bos[i]->base.base);
+			drm_gem_object_put(&task->bos[i]->base.base);
 		kfree(task->bos);
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
