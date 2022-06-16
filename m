Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6454DCDB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05210E00B;
	Thu, 16 Jun 2022 08:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818CB10E1EE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:28:59 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so1054495fac.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0AalHbH5lNk201mZ98hB412vqqVqDD6OSz4kp0XaI6E=;
 b=DORHNi2iEHtlclkLAQZX/cSf3ItqnU9R+RT+8QZHLTApDHQO4QLd84/xxSUCpCqNuR
 9Rr6ePdkSrdUxed7grdE8AYhIWbYwkXrhfUVeXfM11odlC+BXoAjqSTyn+1KfNf52kis
 DAvOMzPboaHtVXDC2uLwsKeWcEhnRpMSWSNqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0AalHbH5lNk201mZ98hB412vqqVqDD6OSz4kp0XaI6E=;
 b=xyYvmtlh45yB9HevuSuLsT5pZsUFI4lmd62lKlCW/NyvB+lQGSNSN66wUZ/kpfZBdl
 FfJuPcoG5645EtnzubVxMKbIIwi1KmG2FVzjKUiMQ7n5j5ZXKrEh1yU836QO2ILOJPe0
 U1UPtOXkBkA3j/YUdKsqdQWcod8CkcqSD4QjEhhSmgvL0Ua0lI82Q3vofkgqs6eOXP25
 t/5D/Is6778ccLwDW74mD1Zem2iFHSqXpif/km0j+Cxj3VtAK4ilvWMPYK67F2isIA75
 9ewX2dwf0d6qNsnWhtHcckex9UQKkUGhEHzWzeg0bprPwrZa3KdBELngmpTD9D+U2q8l
 kqNA==
X-Gm-Message-State: AJIora+25+5ROBNt9o/xEsCxAIC7cQpGc/67EQbv7l8q+74++23G/KZA
 INPcjHMNGYQ4uM7ieDl1kxNOQWkwSGeIst/Gga02aw==
X-Google-Smtp-Source: AGRyM1uXgNqoIVp4zh6blYrU2GpEEzoJ+XSdI2WTm44if1kvy/PfW44B2udC0Qj+WYiDz6t6gB3iSjNtvCg+Mvyc1Gc=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr1935706oap.193.1655368138768; Thu, 16
 Jun 2022 01:28:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 01:28:58 -0700
MIME-Version: 1.0
In-Reply-To: <20220613205032.2652374-1-robdclark@gmail.com>
References: <20220613205032.2652374-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 01:28:58 -0700
Message-ID: <CAE-0n51ADDijFnPwAQNwYE=62Rj4ZeQ38G7D=Xx3s5x7MRm18A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Drop obj lock in msm_gem_free_object()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-06-13 13:50:32)
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index d608339c1643..432032ad4aed 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -229,7 +229,19 @@ msm_gem_unlock(struct drm_gem_object *obj)
>  static inline bool
>  msm_gem_is_locked(struct drm_gem_object *obj)
>  {
> -       return dma_resv_is_locked(obj->resv);
> +       /*
> +        * Destroying the object is a special case.. msm_gem_free_object()
> +        * calls many things that WARN_ON if the obj lock is not held.  But
> +        * acquiring the obj lock in msm_gem_free_object() can cause a
> +        * locking order inversion between reservation_ww_class_mutex and
> +        * fs_reclaim.
> +        *
> +        * This deadlock is not actually possible, because no one should
> +        * be already holding the lock when msm_gem_free_object() is called.
> +        * Unfortunately lockdep is not aware of this detail.  So when the
> +        * refcount drops to zero, we pretend it is already locked.
> +        */
> +       return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);

Instead of modifying this function can we push down the fact that this
function is being called from the free path and skip checking this
condition in that case? Or add some "_locked/free_path" wrappers that
skip the lock assertion? That would make it clearer to understand while
reading the code that it is locked when it is asserted to be locked, and
that we don't care when we're freeing because all references to the
object are gone.

Here's a totally untested patch to show the idea. The comment about
pretending the lock is held can be put in msm_gem_free_object() to
clarify why it's OK to call the locked variants of the functions.

---8<---
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 97d5b4d8b9b0..01f19d37bfb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -346,13 +346,11 @@ static void del_vma(struct msm_gem_vma *vma)
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, bool close)
+put_iova_spaces_locked(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;

-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
 			msm_gem_purge_vma(vma->aspace, vma);
@@ -362,18 +360,28 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 	}
 }

-/* Called with msm_obj locked */
+static void put_iova_spaces(struct drm_gem_object *obj, bool close)
+{
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	put_iova_spaces_locked(obj, close);
+}
+
+/* Called with msm_obj locked or on the free path */
 static void
-put_iova_vmas(struct drm_gem_object *obj)
+put_iova_vmas_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma, *tmp;

-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list)
 		del_vma(vma);
-	}
+}
+
+static void
+put_iova_vmas(struct drm_gem_object *obj)
+{
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	put_iova_vmas_locked(obj);
 }

 static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
@@ -795,12 +803,10 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	update_inactive(msm_obj);
 }

-void msm_gem_vunmap(struct drm_gem_object *obj)
+static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);

-	GEM_WARN_ON(!msm_gem_is_locked(obj));
-
 	if (!msm_obj->vaddr || GEM_WARN_ON(!is_vunmapable(msm_obj)))
 		return;

@@ -808,6 +814,12 @@ void msm_gem_vunmap(struct drm_gem_object *obj)
 	msm_obj->vaddr = NULL;
 }

+void msm_gem_vunmap(struct drm_gem_object *obj)
+{
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	msm_gem_vunmap_locked(obj);
+}
+
 void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -1021,12 +1033,11 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->mm_list);
 	mutex_unlock(&priv->mm_lock);

-	msm_gem_lock(obj);
-
 	/* object should not be on active list: */
 	GEM_WARN_ON(is_active(msm_obj));

-	put_iova_spaces(obj, true);
+	put_iova_spaces_locked(obj, true);
+

 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
@@ -1036,19 +1047,13 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);

-		put_iova_vmas(obj);
-
-		/* dma_buf_detach() grabs resv lock, so we need to unlock
-		 * prior to drm_prime_gem_destroy
-		 */
-		msm_gem_unlock(obj);
+		put_iova_vmas_locked(obj);

 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
-		msm_gem_vunmap(obj);
+		msm_gem_vunmap_locked(obj);
 		put_pages(obj);
-		put_iova_vmas(obj);
-		msm_gem_unlock(obj);
+		put_iova_vmas_locked(obj);
 	}

 	drm_gem_object_release(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c75d3b879a53..b2998a074de7 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -253,7 +253,6 @@ static inline bool is_purgeable(struct
msm_gem_object *msm_obj)

 static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
 {
-	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
 }

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c
b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 086dacf2f26a..afff3a79e925 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -175,6 +175,7 @@ static const int vmap_shrink_limit = 15;
 static bool
 vmap_shrink(struct msm_gem_object *msm_obj)
 {
+	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 	if (!is_vunmapable(msm_obj))
 		return false;
