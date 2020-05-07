Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418B1C9414
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFDC6EA1A;
	Thu,  7 May 2020 15:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4A16EA1A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k12so6932754wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJjzDu0q3DFSPn25TFNgyCdT8lAy2XidhMZEPrYS96o=;
 b=rthhGKDphraIV+/wJ7zdyhtTbcDjvZ0XdjMLnimpdzcZoBSzz0VtUOS5bZ8S5cHi0P
 lhhurF5vwh/T1YLgEpgssTZ1gjLspsK8Tg5ttoMeKsJd2/H7tTNF0TBDuxSO+tF0ligq
 brIyD9J39QfQ2vXpvAakpNWeWFhPs7Gy19lSMK4F2KYZBeRHlLwiRT24Lm9+5oFZ7iAh
 k9mclihPFM3twCIATTzl6BcrJVeAHbW++Cz8Z4/W3ZBkPIrebeMpvH0LKMITKU15erjl
 UvVBvI9Iygon2CbJ+wQBwuGeIm/rHFYGHE1i3OH2rkoPPDojmp1xiFxMfvYuH4iXb4DR
 yTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJjzDu0q3DFSPn25TFNgyCdT8lAy2XidhMZEPrYS96o=;
 b=jyQTYRw1s9NeNk+CvuYNkbbtFOX/dUq+4lBq00zSGF+Jkxr1yGkvnL8iOK0z0rCSmQ
 ND0AnH4KL3Z8NcVLUzfsdUuY79yt+uKdDoYw5vT8U2YSSXctZZTji9hnEcaieQRPQq4J
 //Y3gUo6Qa22BlbThVEYmvvVcLtXHUvRglds+7xAiqOaj8WUymqnqv69T6QI3xO9ILsk
 /1HARhPshaGT+oLApAjmnRsPpiu1XScmyOz/KqflmQ8h73lg0EvwtlC9AR0EQKr/qdNP
 vNjRMglG5Xo/PtfXTIL7vERyhRoaO06Jug0ITY1X/469SnxDJ69AlWQ1HE7T5KV2IzMU
 GDcw==
X-Gm-Message-State: AGi0PuaFvNh7OF/15dabI5kUaxulny7aGOtISKMApMilomLo2NkvkPSj
 Y3oj3Wf1eRQrpMA6ViuzUnn7c64g
X-Google-Smtp-Source: APiQypImuyXAg6IWHv6Hz+A9k7EZL8ABZepvZvzQtJb5pGSxwlNl8P1DQb8qc5vTcPNY/8TE/nS+kA==
X-Received: by 2002:a1c:44b:: with SMTP id 72mr10743073wme.58.1588864293926;
 Thu, 07 May 2020 08:11:33 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:33 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 31/36] drm/vc4: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:17 +0100
Message-Id: <20200507150822.114464-32-emil.l.velikov@gmail.com>
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
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 14 +++++++-------
 drivers/gpu/drm/vc4/vc4_gem.c | 14 +++++++-------
 drivers/gpu/drm/vc4/vc4_kms.c |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c |  4 ++--
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 72d30d90b856..74ceebd62fbc 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -490,7 +490,7 @@ int vc4_dumb_create(struct drm_file *file_priv,
 	bo->madv = VC4_MADV_WILLNEED;
 
 	ret = drm_gem_handle_create(file_priv, &bo->base.base, &args->handle);
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 
 	return ret;
 }
@@ -834,7 +834,7 @@ int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
 	bo->madv = VC4_MADV_WILLNEED;
 
 	ret = drm_gem_handle_create(file_priv, &bo->base.base, &args->handle);
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 
 	return ret;
 }
@@ -854,7 +854,7 @@ int vc4_mmap_bo_ioctl(struct drm_device *dev, void *data,
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return 0;
 }
 
@@ -918,7 +918,7 @@ vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
 	ret = drm_gem_handle_create(file_priv, &bo->base.base, &args->handle);
 
 fail:
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 
 	return ret;
 }
@@ -965,7 +965,7 @@ int vc4_set_tiling_ioctl(struct drm_device *dev, void *data,
 	bo = to_vc4_bo(gem_obj);
 	bo->t_format = t_format;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return 0;
 }
@@ -1000,7 +1000,7 @@ int vc4_get_tiling_ioctl(struct drm_device *dev, void *data,
 	else
 		args->modifier = DRM_FORMAT_MOD_NONE;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return 0;
 }
@@ -1091,7 +1091,7 @@ int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 		ret = -ENOMEM;
 	mutex_unlock(&vc4->bo_lock);
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index e1cfc3ccd05a..9f01ddd5b932 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -58,7 +58,7 @@ vc4_free_hang_state(struct drm_device *dev, struct vc4_hang_state *state)
 	unsigned int i;
 
 	for (i = 0; i < state->user_state.bo_count; i++)
-		drm_gem_object_put_unlocked(state->bo[i]);
+		drm_gem_object_put(state->bo[i]);
 
 	kfree(state);
 }
@@ -808,7 +808,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 fail_put_bo:
 	/* Release any reference to acquired objects. */
 	for (i = 0; i < exec->bo_count && exec->bo[i]; i++)
-		drm_gem_object_put_unlocked(&exec->bo[i]->base);
+		drm_gem_object_put(&exec->bo[i]->base);
 
 fail:
 	kvfree(handles);
@@ -957,7 +957,7 @@ vc4_complete_exec(struct drm_device *dev, struct vc4_exec_info *exec)
 			struct vc4_bo *bo = to_vc4_bo(&exec->bo[i]->base);
 
 			vc4_bo_dec_usecnt(bo);
-			drm_gem_object_put_unlocked(&exec->bo[i]->base);
+			drm_gem_object_put(&exec->bo[i]->base);
 		}
 		kvfree(exec->bo);
 	}
@@ -966,7 +966,7 @@ vc4_complete_exec(struct drm_device *dev, struct vc4_exec_info *exec)
 		struct vc4_bo *bo = list_first_entry(&exec->unref_list,
 						     struct vc4_bo, unref_head);
 		list_del(&bo->unref_head);
-		drm_gem_object_put_unlocked(&bo->base.base);
+		drm_gem_object_put(&bo->base.base);
 	}
 
 	/* Free up the allocation of any bin slots we used. */
@@ -1107,7 +1107,7 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 	ret = vc4_wait_for_seqno_ioctl_helper(dev, bo->seqno,
 					      &args->timeout_ns);
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return ret;
 }
 
@@ -1301,7 +1301,7 @@ vc4_gem_destroy(struct drm_device *dev)
 	 * the overflow allocation registers.  Now free the object.
 	 */
 	if (vc4->bin_bo) {
-		drm_gem_object_put_unlocked(&vc4->bin_bo->base.base);
+		drm_gem_object_put(&vc4->bin_bo->base.base);
 		vc4->bin_bo = NULL;
 	}
 
@@ -1382,7 +1382,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	ret = 0;
 
 out_put_gem:
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 78d4fb0499e3..08318e69061b 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -330,7 +330,7 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 			mode_cmd_local.modifier[0] = DRM_FORMAT_MOD_NONE;
 		}
 
-		drm_gem_object_put_unlocked(gem_obj);
+		drm_gem_object_put(gem_obj);
 
 		mode_cmd = &mode_cmd_local;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index cea77a21b205..f7ab979721b3 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -308,7 +308,7 @@ static int bin_bo_alloc(struct vc4_dev *vc4)
 						    struct vc4_bo, unref_head);
 
 		list_del(&bo->unref_head);
-		drm_gem_object_put_unlocked(&bo->base.base);
+		drm_gem_object_put(&bo->base.base);
 	}
 
 	return ret;
@@ -344,7 +344,7 @@ static void bin_bo_release(struct kref *ref)
 	if (WARN_ON_ONCE(!vc4->bin_bo))
 		return;
 
-	drm_gem_object_put_unlocked(&vc4->bin_bo->base.base);
+	drm_gem_object_put(&vc4->bin_bo->base.base);
 	vc4->bin_bo = NULL;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
