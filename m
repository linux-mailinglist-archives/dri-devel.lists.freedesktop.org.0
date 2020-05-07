Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BEE1C93FB
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612056EA03;
	Thu,  7 May 2020 15:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73246EA02
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 188so6947796wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qeEtK76mdQj/o364toUgRIZtpzWa0VKo0FVagvnyaqY=;
 b=YGk/0HFmIHMEyiSJRGoKcTmt0WbjT0s9FsDb6prQCVg+Wgt6zoqM0+wah2noP+UEuN
 womwpa7iKJ8TeExJr34Q8gtMTrl/ZIJ9wpbukcc+RN3fteq2nuOhgteLnjsQ/TV3fYEy
 P9PBP0Vz4W+zKGcgDYXLkE8LUVbTtEUEtxxrVJWjyHLdoPC3xwna4Uriesg3927RimHb
 JVc6BT298PbEp72B0oa3VqkPbqoiRun3gp/HHosMKLRNeUPVXdjJHbSRrZZhu/05jdYv
 fPe01Ne3x0V7qPP3KyV5XbFLwewxyxc0h1pfG56DzOXqtPtzT82dKnZROIJzdGc1KiFB
 JhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qeEtK76mdQj/o364toUgRIZtpzWa0VKo0FVagvnyaqY=;
 b=ZuUGoaUs3+pJmPp4If1X2MtibF8nptvOJKkQOI43oGF+J7Z/fif+AUQPWShGmxm2cs
 psFO+usO1M+o0UmPOINvnB6BeBPXF8f/ePSY/L5uRk5n2k6qAq+k3XiDc1O/Auu7pMtL
 8V1GyT/dLAVFmKYy9QO6QU9mUMQ3EzKhBXqnWO/Kb80FFlGgrbaZX7I9Y12nfeyv793n
 4br3q7Ll3e0bmnYLKzGcRLCKsM18jhfrRtrfle9eL8hz3UlOl6CVp3XuoIppquc9RTLk
 ickhe2MpusomcGegTZ+ibL6wlGtlavVCSH59GE7Qtdmsu7G7Sp3riUyNVjQMj5HHRDVv
 mc9w==
X-Gm-Message-State: AGi0PubBms59HQbKDcNIz+4kmlUsoW+eWMxtDI/ClK8di1f2gqRD9ZlX
 UaxGzvk4uALCCjx+Z7EAYLoE6j7Z
X-Google-Smtp-Source: APiQypLkGL90shBVkNN6glzKBlg0sJMDoLCQ8sVSly59REtBlXrGT2yavhHGcYnc6G4K7cm/VxgfeA==
X-Received: by 2002:a1c:8148:: with SMTP id c69mr794633wmd.144.1588864270318; 
 Thu, 07 May 2020 08:11:10 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:09 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/36] drm/arm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:07:59 +0100
Message-Id: <20200507150822.114464-14-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 emil.l.velikov@gmail.com
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 6 +++---
 drivers/gpu/drm/arm/malidp_drv.c                        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 1b01a625f40e..170f9dc8ec19 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -19,7 +19,7 @@ static void komeda_fb_destroy(struct drm_framebuffer *fb)
 	u32 i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(kfb);
@@ -103,7 +103,7 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
 	return 0;
 
 check_failed:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return -EINVAL;
 }
 
@@ -199,7 +199,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 err_cleanup:
 	for (i = 0; i < kfb->base.format->num_planes; i++)
-		drm_gem_object_put_unlocked(kfb->base.obj[i]);
+		drm_gem_object_put(kfb->base.obj[i]);
 
 	kfree(kfb);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index def8c9ffafca..c2507b7d8512 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -349,11 +349,11 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 	if (objs->size < afbc_size) {
 		DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
 			      objs->size, afbc_size);
-		drm_gem_object_put_unlocked(objs);
+		drm_gem_object_put(objs);
 		return false;
 	}
 
-	drm_gem_object_put_unlocked(objs);
+	drm_gem_object_put(objs);
 
 	return true;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
