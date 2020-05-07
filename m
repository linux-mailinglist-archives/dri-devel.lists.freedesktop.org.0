Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBC1C9407
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628356EA09;
	Thu,  7 May 2020 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B06EA09
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 188so6948286wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y/XzwrpZNzVtDARamN6aQnTzgW7+xM5qu1tN1utrlFc=;
 b=Enx9+npu+DOxpfz9UZkZbnODq9Hiv600aOheMz1Cgezqx4RHiHs9N0X/ijNmJbHj41
 B/njwtCuADs6Up1l71k0NRHYe5m5XThcp1OW5yCgCX4skjN/W7lYffLOqs01BYTPPsTQ
 F6fLWDW5dhxZTJ6fZx4Li3aev0Z8gjGH7JBOHs3temfVBWBy5QzPkuvOhH22rmHqiWmt
 yr9RwCK7ja2VPUNLpyh3lsk/ArwgKX7NfgkGs1z/1jTbHNYIr8ABxSYKfchUdyzjI5yv
 L+c2SQE97UeNyt25fG/EJAv2ghmTl1byD/Xr5PGo5fI7gDNcEY6DpSCxjntKI2nGZrX9
 fu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/XzwrpZNzVtDARamN6aQnTzgW7+xM5qu1tN1utrlFc=;
 b=JT7nRxflIyemYefKWTo17nPuURzqnExys6CVvrygNBODmGH3vO2WAn3P5qPY0UDoc3
 6/75ksAbYOVT7sSyJNdq704DpZyeROaVQZUrTH3IGcyU9bKSXebis379msoGH+WUo4Gw
 oVaP84tKq+iEa6f147s87jQ5LNAxhn92upaG3xlECCwFLcfYGLL2HEc+rH753qw8kQJu
 XYGrFYujMQ1EQdJclN/v/7h4CcsKoZ4UtSbZPkeeIjCGW1yH2/CqepX20DZw99qagYIB
 4lA7mfaSZz7panAW/aA5D2LrYfS/bt9USUGxFVuy4s6CaFvZfpeej9wYC1RRNcN3FEhX
 DKzA==
X-Gm-Message-State: AGi0PuaFws0Yfy4XD7jDBtlqZnUUurA1GJqUBGQ5oTJkisHckX28MXi5
 edTeg9sKBPEx0pgmACKhmf8dtzwe
X-Google-Smtp-Source: APiQypJVdYQ9qS013CpkuvBWVhaNLA+ih0eTM6F4GstyHgjgkxrluvCPQBajGDOkxztmocFWz9lUQQ==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr10923039wma.170.1588864278608; 
 Thu, 07 May 2020 08:11:18 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:17 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/36] drm/lima: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:05 +0100
Message-Id: <20200507150822.114464-20-emil.l.velikov@gmail.com>
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
