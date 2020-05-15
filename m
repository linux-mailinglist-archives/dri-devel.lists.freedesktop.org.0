Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283B1D4A0D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312FB6EC4B;
	Fri, 15 May 2020 09:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF9C6EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n5so1978537wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=838UsG6rWT4O2J3Z5jDg+ZkYllHdrsvdz2WgI2eN1dw=;
 b=ejhlZ4Tzwj/eQwh2ThnsR3P7iV6DW91Q4U9DFm0f443wzkp30sitmp5GInc8W+H2PE
 q9mMQ2zzSkVntVSQL//16wyWSpACd/GYvJsj6wxnQvdrTcy3B3bnS/DM629Ij3ejbzoD
 OD1npvRGOgrBsW7ZvuSVePuvJyjXivCyQLb5AR5fxWv1jQ+2KSPqQBzGaKy9fDd8PYOA
 7UO8OWQ+E0V9rxJ6bL6243EbgOPQFASFKUeXvy5PQYZ22GKGX6R8bbqr2qcvKO3rPnrP
 7tnDEIU5P3j4h69EyiTZgzrx3d7zmD6HqZDhP+MXOQzM+lVM98ieyIdGRoBp1SbqoT5i
 OSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=838UsG6rWT4O2J3Z5jDg+ZkYllHdrsvdz2WgI2eN1dw=;
 b=R8dMIdjhKxB1POeY82Qxq5Tkj76+abLzObbauf0uTk8i30CwhaULXsEUllEGIgyLPH
 in8l89o2ss33yfziNAicrwfddrasM3CNlVEVjvghgWd2Ao+AOUS+haqSazKuJ9GKIyOZ
 i3JWd5YiV2QNq0P32WqcVX3iQKeXkMMXKszbTGhDHTYZc85fY4Rte2rdi/grFpqQDjpR
 e6CStLej9bqoe3FG27dwIXFroLee1LWSCCqU6igBvrwdHxB1P+IcJtUBmKulqbB2d+y8
 JtrTiSzab5eYnrpzAnIujrkQ65OSu61gIyq754XbvDpmA9zuxtznik+WuEV1j5wuzVJi
 iaeQ==
X-Gm-Message-State: AOAM531MhQ6oBLpBnWOncA//ybTFCoL2J2w67BRV4sPLFdyljgRHFf9x
 1Z+afXgOJ8zVbvDlD+e5wQSmwInV
X-Google-Smtp-Source: ABdhPJwTvH2JbLpV2CFOJE8STDpZg148hb0NMZ+kVuIN6Yjrg8Pr1b5EtyYdEnHGVwBXMmIwwQ32Zg==
X-Received: by 2002:a7b:cb88:: with SMTP id m8mr3039707wmi.37.1589536474112;
 Fri, 15 May 2020 02:54:34 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:33 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 28/38] drm/qxl: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:08 +0100
Message-Id: <20200515095118.2743122-29-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 emil.l.velikov@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
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

Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/qxl/qxl_cmd.c     | 2 +-
 drivers/gpu/drm/qxl/qxl_display.c | 6 +++---
 drivers/gpu/drm/qxl/qxl_dumb.c    | 2 +-
 drivers/gpu/drm/qxl/qxl_gem.c     | 2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c   | 4 ++--
 drivers/gpu/drm/qxl/qxl_object.c  | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d1086b2a6892..3104af3d86b8 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -377,7 +377,7 @@ void qxl_io_destroy_primary(struct qxl_device *qdev)
 {
 	wait_for_io_cmd(qdev, 0, QXL_IO_DESTROY_PRIMARY_ASYNC);
 	qdev->primary_bo->is_primary = false;
-	drm_gem_object_put_unlocked(&qdev->primary_bo->tbo.base);
+	drm_gem_object_put(&qdev->primary_bo->tbo.base);
 	qdev->primary_bo = NULL;
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 1082cd5d2fd4..e403b37118d1 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -783,7 +783,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		    qdev->dumb_shadow_bo->surf.width  != surf.width ||
 		    qdev->dumb_shadow_bo->surf.height != surf.height) {
 			if (qdev->dumb_shadow_bo) {
-				drm_gem_object_put_unlocked
+				drm_gem_object_put
 					(&qdev->dumb_shadow_bo->tbo.base);
 				qdev->dumb_shadow_bo = NULL;
 			}
@@ -793,7 +793,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		}
 		if (user_bo->shadow != qdev->dumb_shadow_bo) {
 			if (user_bo->shadow) {
-				drm_gem_object_put_unlocked
+				drm_gem_object_put
 					(&user_bo->shadow->tbo.base);
 				user_bo->shadow = NULL;
 			}
@@ -828,7 +828,7 @@ static void qxl_plane_cleanup_fb(struct drm_plane *plane,
 	qxl_bo_unpin(user_bo);
 
 	if (old_state->fb != plane->state->fb && user_bo->shadow) {
-		drm_gem_object_put_unlocked(&user_bo->shadow->tbo.base);
+		drm_gem_object_put(&user_bo->shadow->tbo.base);
 		user_bo->shadow = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 24e903383aa1..c04cd5a2553c 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -83,6 +83,6 @@ int qxl_mode_dumb_mmap(struct drm_file *file_priv,
 		return -ENOENT;
 	qobj = gem_to_qxl_bo(gobj);
 	*offset_p = qxl_bo_mmap_offset(qobj);
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index 5ff6fa9b799c..48e096285b4c 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -97,7 +97,7 @@ int qxl_gem_object_create_with_handle(struct qxl_device *qdev,
 		return r;
 	/* drop reference from allocate - handle holds it now */
 	*qobj = gem_to_qxl_bo(gobj);
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index d9a583966949..5dc78990990a 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -125,7 +125,7 @@ static int qxlhw_handle_to_bo(struct drm_file *file_priv, uint64_t handle,
 	qobj = gem_to_qxl_bo(gobj);
 
 	ret = qxl_release_list_add(release, qobj);
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	if (ret)
 		return ret;
 
@@ -347,7 +347,7 @@ static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
 	qxl_bo_unreserve(qobj);
 
 out:
-	drm_gem_object_put_unlocked(gobj);
+	drm_gem_object_put(gobj);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index edc8a9916872..80e7a17aaddd 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -224,7 +224,7 @@ void qxl_bo_unref(struct qxl_bo **bo)
 	if ((*bo) == NULL)
 		return;
 
-	drm_gem_object_put_unlocked(&(*bo)->tbo.base);
+	drm_gem_object_put(&(*bo)->tbo.base);
 	*bo = NULL;
 }
 
@@ -326,7 +326,7 @@ void qxl_bo_force_delete(struct qxl_device *qdev)
 		list_del_init(&bo->list);
 		mutex_unlock(&qdev->gem.mutex);
 		/* this should unref the ttm bo */
-		drm_gem_object_put_unlocked(&bo->tbo.base);
+		drm_gem_object_put(&bo->tbo.base);
 	}
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
