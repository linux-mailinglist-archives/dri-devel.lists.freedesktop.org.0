Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A890B3D7BC9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C806EC15;
	Tue, 27 Jul 2021 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45356EC14;
 Tue, 27 Jul 2021 17:08:05 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e5so14539076pld.6;
 Tue, 27 Jul 2021 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AalGnabDB7Im6YINFnvZpIxn3mHmji1LafcDFuypRwQ=;
 b=uDm2EWTAwd9cHgcgQKy0K3BTuifsmW9m0mLXFDfi0aKllsudTCbhV3JGut2kyoQxAr
 UXtqCaH0xz6D26PPhPWOkD952jdWj5Hgr68LZoZnoCKzKkXiCTUs00CJ+db4PbzUx7uA
 2XIkHd/DEIy/9K10QRUPQZPZ2R2wY/cPt9WlYlZvY5PAo4P3J4H1jLq3xT/HxglmqiVD
 eNW8jBogOgxUNfhk+J/wGprIWyHqYIPeNf8u0YiP96UZtT3tpQlEOggWmIqVcwVIuKxn
 DjO+hU/Lahoxp2m5MKE92Fn200AJIlgrJnOxytE3Ij6Zr4Az2eNQK03TZ2Ut+gNGnnes
 q/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AalGnabDB7Im6YINFnvZpIxn3mHmji1LafcDFuypRwQ=;
 b=oY+AL0lACEWN789uv1+3fBhq87jyBktoNeFtc3V4wfjH1Ue1/W25ohxAxpfmWgS8ER
 WlC5g8LVV13W2bhl68e71VkM6Pi+Sg+Btq/W1l2clcp14DWdx18ZBYuuPlz9t8Klrfwc
 kwx1ql4TmobjKbs9TOKDaXl2jTFHcpqwaR5PNoT+H+Q0vaYiGi2Yt0er8Q8MjGMiIFC1
 rahgAMjqtKPXpQBDFoxWx55+2xIVUZX6Zqw5rln4TQMph5/cPerzLouNCp8VaSuizS1D
 HCzVzfoD0jNAmXhqqXWjRXwyPszfGXh86UjE/bLjwNKAbCH4d4qXpHtGM5kVrdYYn14O
 PZtw==
X-Gm-Message-State: AOAM5329BF5Ey9MWVXinC9w/ZzsxhKK1CqZyfAfWnL7xykxT38pNXRmB
 SBeC+MkH2sIw+DJ58L8ttzcQJwCtWmRHKw==
X-Google-Smtp-Source: ABdhPJz6+MTfOl25tAEk8BZSoJ0UfdXExerN+z4hgDAnlSoKqe0E4zKzUZLC7kW3EXZm9v8ghhoJWA==
X-Received: by 2002:a65:49cf:: with SMTP id t15mr24483000pgs.109.1627405684800; 
 Tue, 27 Jul 2021 10:08:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id co13sm3422560pjb.41.2021.07.27.10.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:08:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/msm: Drop submit bo_list
Date: Tue, 27 Jul 2021 10:11:26 -0700
Message-Id: <20210727171143.2549475-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was only used to detect userspace including the same bo multiple
times in a submit.  But ww_mutex can already tell us this.

When we drop struct_mutex around the submit ioctl, we'd otherwise need
to lock the bo before adding it to the bo_list.  But since ww_mutex can
already tell us this, it is simpler just to remove the bo_list.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        |  8 --------
 drivers/gpu/drm/msm/msm_gem_submit.c | 28 +++++++++++++---------------
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a527a6b1d6ba..af199ef53d2f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1151,7 +1151,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
-	INIT_LIST_HEAD(&msm_obj->submit_entry);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a48114058ff9..f9e3ffb2309a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -88,13 +88,6 @@ struct msm_gem_object {
 	 */
 	struct list_head mm_list;
 
-	/* Transiently in the process of submit ioctl, objects associated
-	 * with the submit are on submit->bo_list.. this only lasts for
-	 * the duration of the ioctl, so one bo can never be on multiple
-	 * submit lists.
-	 */
-	struct list_head submit_entry;
-
 	struct page **pages;
 	struct sg_table *sgt;
 	void *vaddr;
@@ -316,7 +309,6 @@ struct msm_gem_submit {
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
 	struct list_head node;   /* node in ring submit list */
-	struct list_head bo_list;
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2b158433a6e5..e11e4bb63695 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->fault_dumped = false;
 
 	INIT_LIST_HEAD(&submit->node);
-	INIT_LIST_HEAD(&submit->bo_list);
 
 	return submit;
 }
@@ -143,7 +142,6 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 	for (i = 0; i < args->nr_bos; i++) {
 		struct drm_gem_object *obj;
-		struct msm_gem_object *msm_obj;
 
 		/* normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
@@ -155,20 +153,9 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 			goto out_unlock;
 		}
 
-		msm_obj = to_msm_bo(obj);
-
-		if (!list_empty(&msm_obj->submit_entry)) {
-			DRM_ERROR("handle %u at index %u already on submit list\n",
-					submit->bos[i].handle, i);
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-
 		drm_gem_object_get(obj);
 
-		submit->bos[i].obj = msm_obj;
-
-		list_add_tail(&msm_obj->submit_entry, &submit->bo_list);
+		submit->bos[i].obj = to_msm_bo(obj);
 	}
 
 out_unlock:
@@ -299,6 +286,12 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return 0;
 
 fail:
+	if (ret == -EALREADY) {
+		DRM_ERROR("handle %u at index %u already on submit list\n",
+				submit->bos[i].handle, i);
+		ret = -EINVAL;
+	}
+
 	for (; i >= 0; i--)
 		submit_unlock_unpin_bo(submit, i);
 
@@ -315,6 +308,12 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 			slow_locked = contended;
 			goto retry;
 		}
+
+		/* Not expecting -EALREADY here, if the bo was already
+		 * locked, we should have gotten -EALREADY already from
+		 * the dma_resv_lock_interruptable() call.
+		 */
+		WARN_ON_ONCE(ret == -EALREADY);
 	}
 
 	return ret;
@@ -508,7 +507,6 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
 		submit_cleanup_bo(submit, i, cleanup_flags);
-		list_del_init(&msm_obj->submit_entry);
 		if (error)
 			drm_gem_object_put(&msm_obj->base);
 	}
-- 
2.31.1

