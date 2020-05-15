Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A491D4A16
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594326EC53;
	Fri, 15 May 2020 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91986EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z72so1962497wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfCroSTVpF6iqsTWX85rQcAiNx8SYDcdR9BmtPebrZ8=;
 b=Iar7vmcLsp3Ud6DAHBtaU4TNh6tCTDxA8DxHBo5FkECpHsFOq7A/LPLzkEqopFvfxM
 Qz8aalPTj3llvvINZ10D0gpai1EqVJD62eQkWLoDaLvUfaLr5gnEE9bbvk3+PP0+GjzU
 83ZUkUqgiSMyHaD95Q+UtcxbPkzvgIVpwOYBhhCBGdpMC3eAnrhyEcg597HlHStApnKR
 d4qJlFF8LsY/A7/ahCsLuVReYoHbxok1C+WdFrs3A1Omx3/la0kiPc6V/+zgYDIRRXJM
 fFVBo44Lmfqp9hKfZKL4e4kw850j5/kQj63iQSbea9E7Zo28ZIcSAJNHZLQk5fgT9/x2
 AXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfCroSTVpF6iqsTWX85rQcAiNx8SYDcdR9BmtPebrZ8=;
 b=gT6xKfnhGVoDFPPdY2e+MPfkH8rk0f/Yq9+nVj1gmTFKna5kWe3iE4/CvoBpeUWw3j
 eeT3XA4/ZfJlf3KIOV24eYWeDi2sH8/X2zGHTqR37whymdGmWLhu7vmKn3Q+/AVau+oN
 55SJ34sQCO5+VPqJJOJdjGO6dnzzy8SRZQdF8i/qWACNCAWsBJARoS8FKm9LZ6oUHqeu
 xJuFZG6LRmSNjvpBb3p3MJgHg4aMI2v3utwlBwIxxUgqgBy1u17HEGIItm6eVk3J8yc2
 Tp+TwbLEsd50ez3gpVmdtEFAAmb9K/iaSkcMRBd0k1hW24z6Hg8ChNbtcIf9VgAb8RCw
 iECg==
X-Gm-Message-State: AOAM530QZBHLlg62YKVtUK+KQQ4iRBYGlwr3+B0s5wsXSjPSz+Av0djH
 YmY/zq96l4PQX+GmlN5wkUtwJPJ/
X-Google-Smtp-Source: ABdhPJzBnBflI4imsb/dxI/8Jyb+MtUgW/Cg08yY9OTWBmYMLlWrODw9qT/jlDqJTxlD9bKjDWZdmg==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr3157316wmi.170.1589536480120; 
 Fri, 15 May 2020 02:54:40 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:39 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 33/38] drm/vc4: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:13 +0100
Message-Id: <20200515095118.2743122-34-emil.l.velikov@gmail.com>
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
