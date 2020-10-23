Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A32974F2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD916F8EE;
	Fri, 23 Oct 2020 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665076F8EC;
 Fri, 23 Oct 2020 16:50:22 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 19so1672272pge.12;
 Fri, 23 Oct 2020 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQsd8hTmdHRzfZ5R+TDzPM5mnO3yOLJdR6nT0gp28Sg=;
 b=fzzN6gcPILZEBwjxOYq7s69EeTbni/0MSPbPWnfvls29qMtx/Lnd2NmpMAxbPbx/tF
 Ob61dDQ4wEyqwAyKj7V0IXPm+/EdSK+uOMjibgnfTKySSAh4nUW3I+RhhJWzwoNepoLY
 sciXQpSowo+iWYkJJsJeRKeR+F7hKFHFlnx3bNpKCrGHM8w2rR2/k34bjOw7hdGTeji3
 Y5BxENPy4o+n0KgBZHS3zmCZOQFC7MBdt6+MqE2veOfm3Ktr5HcnuJwwdUR+kcXZW9Xr
 TQ1IC4mh/4jufuwqhu4TtWen8hI5EQJERyPfI1JyGh9Ks3A88lnUadfXRPOENzghmNu5
 nlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQsd8hTmdHRzfZ5R+TDzPM5mnO3yOLJdR6nT0gp28Sg=;
 b=XZZSR9A6MGfLjr9u2iPv3cRSpnVl40OsyamuVQk7rqJesSODXwCVf0C+aY62yBx12c
 kY6qvp0sxZKt0Eb48SvN/eranwTTlxKpL0Ub/43deDCBkGlYjbq54RQSZc2Hhv/nLUmR
 srLLFv2/+F+3tJdMUSetxIuN2JqLttfBQvtuDfa4Dk8TAshFh6zqRxC9y9nuqoORy5ly
 J+n5Pz52uXbDnImQx5XmoV6G6iicMefGKi/NkXkDIkLrQ0V1kJPE5TOb4ODu0dAAtBd3
 mHQJycduNoILZPzR+w6qVfJLS93VMQPQiM2hfnuhGdtpTCYcRkovumiSx83fGvsoRUgf
 2CuQ==
X-Gm-Message-State: AOAM530n2dzH0JI2Lm2ceqHKkL5vMoQvZ+cVXUe/T1JxlGnG5+PLSplS
 VaZWGxynZK+QuPShbXtRALaMaA6D5R7nbA==
X-Google-Smtp-Source: ABdhPJw30Dv1hjuiRzG11GMPDznX7yCamst62qVCxMvq2UhnlEWCjOaIDV1PZqfgJ/8m8+hrf1wUlg==
X-Received: by 2002:a65:478a:: with SMTP id e10mr2865562pgs.365.1603471821327; 
 Fri, 23 Oct 2020 09:50:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 x29sm2717526pfp.152.2020.10.23.09.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/23] drm/msm/gem: Add some _locked() helpers
Date: Fri, 23 Oct 2020 09:51:06 -0700
Message-Id: <20201023165136.561680-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When we cut-over to using dma_resv_lock/etc instead of msm_obj->lock,
we'll need these for the submit path (where resv->lock is already held).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 89 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h |  6 +++
 2 files changed, 75 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index dec89fe79025..e0d8d739b068 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -435,18 +435,14 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 			msm_obj->sgt, obj->size >> PAGE_SHIFT);
 }
 
-/*
- * get iova and pin it. Should have a matching put
- * limits iova to specified range (in pages)
- */
-int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
 	u64 local;
 	int ret;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
 
 	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
@@ -457,10 +453,32 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 	if (!ret)
 		*iova = local;
 
+	return ret;
+}
+
+/*
+ * get iova and pin it. Should have a matching put
+ * limits iova to specified range (in pages)
+ */
+int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova,
+		u64 range_start, u64 range_end)
+{
+	int ret;
+
+	msm_gem_lock(obj);
+	ret = get_and_pin_iova_range_locked(obj, aspace, iova, range_start, range_end);
 	msm_gem_unlock(obj);
+
 	return ret;
 }
 
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova)
+{
+	return get_and_pin_iova_range_locked(obj, aspace, iova, 0, U64_MAX);
+}
+
 /* get iova and pin it. Should have a matching put */
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova)
@@ -501,21 +519,31 @@ uint64_t msm_gem_iova(struct drm_gem_object *obj,
 }
 
 /*
- * Unpin a iova by updating the reference counts. The memory isn't actually
- * purged until something else (shrinker, mm_notifier, destroy, etc) decides
- * to get rid of it
+ * Locked variant of msm_gem_unpin_iova()
  */
-void msm_gem_unpin_iova(struct drm_gem_object *obj,
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace)
 {
 	struct msm_gem_vma *vma;
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	vma = lookup_vma(obj, aspace);
 
 	if (!WARN_ON(!vma))
 		msm_gem_unmap_vma(aspace, vma);
+}
 
+/*
+ * Unpin a iova by updating the reference counts. The memory isn't actually
+ * purged until something else (shrinker, mm_notifier, destroy, etc) decides
+ * to get rid of it
+ */
+void msm_gem_unpin_iova(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace)
+{
+	msm_gem_lock(obj);
+	msm_gem_unpin_iova_locked(obj, aspace);
 	msm_gem_unlock(obj);
 }
 
@@ -554,15 +582,14 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	msm_gem_lock(obj);
-
 	if (WARN_ON(msm_obj->madv > madv)) {
 		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
 			msm_obj->madv, madv);
-		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
@@ -588,20 +615,29 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 		}
 	}
 
-	msm_gem_unlock(obj);
 	return msm_obj->vaddr;
 
 fail:
 	msm_obj->vmap_count--;
-	msm_gem_unlock(obj);
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_get_vaddr(struct drm_gem_object *obj)
+void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 {
 	return get_vaddr(obj, MSM_MADV_WILLNEED);
 }
 
+void *msm_gem_get_vaddr(struct drm_gem_object *obj)
+{
+	void *ret;
+
+	msm_gem_lock(obj);
+	ret = msm_gem_get_vaddr_locked(obj);
+	msm_gem_unlock(obj);
+
+	return ret;
+}
+
 /*
  * Don't use this!  It is for the very special case of dumping
  * submits from GPU hangs or faults, were the bo may already
@@ -610,16 +646,29 @@ void *msm_gem_get_vaddr(struct drm_gem_object *obj)
  */
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj)
 {
-	return get_vaddr(obj, __MSM_MADV_PURGED);
+	void *ret;
+
+	msm_gem_lock(obj);
+	ret = get_vaddr(obj, __MSM_MADV_PURGED);
+	msm_gem_unlock(obj);
+
+	return ret;
 }
 
-void msm_gem_put_vaddr(struct drm_gem_object *obj)
+void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
+	WARN_ON(!msm_gem_is_locked(obj));
 	WARN_ON(msm_obj->vmap_count < 1);
+
 	msm_obj->vmap_count--;
+}
+
+void msm_gem_put_vaddr(struct drm_gem_object *obj)
+{
+	msm_gem_lock(obj);
+	msm_gem_put_vaddr_locked(obj);
 	msm_gem_unlock(obj);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index fbad08badf43..d55d5401a2d2 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -103,10 +103,14 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end);
+int msm_gem_get_and_pin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace, uint64_t *iova);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 uint64_t msm_gem_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
+void msm_gem_unpin_iova_locked(struct drm_gem_object *obj,
+		struct msm_gem_address_space *aspace);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
 struct page **msm_gem_get_pages(struct drm_gem_object *obj);
@@ -115,8 +119,10 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 		uint32_t handle, uint64_t *offset);
+void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
+void msm_gem_put_vaddr_locked(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 int msm_gem_sync_object(struct drm_gem_object *obj,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
