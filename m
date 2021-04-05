Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98569354624
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1013989EB1;
	Mon,  5 Apr 2021 17:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA0389EAE;
 Mon,  5 Apr 2021 17:42:12 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x26so1886419pfn.0;
 Mon, 05 Apr 2021 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hft/qShxHo0bK33jERj2ZhfMZ7O/VHjF9RLnRkSOuTI=;
 b=c/hVy6Rjga0/F4Ynn4GXA9wFndHn3akAXUMMcmBNsZpKtr6LAj3nHXVoeFvS69vkWO
 5UiVrkG9JCNVpzh7PWcbbOCWfqF8K1h484iNhoageOyvJvQ8Wla3cFCPyuhtlkVxRCKY
 jkqm+gQ0ttd3i2jG6+4syBmu6mxKbE0XmoQawe4hLcyt50Zzg1t8DmjtBRcLyEsY5uvQ
 cH+Jsb78Eh6yC/rTCy90iDi/rxacodWfYInSYvply95Jjopy8ExZeUXtvfzBt2fiSjT2
 1xaoIJhGH2of4TJTmlcGhiUDo3/DWLCMPDDMpGFaLTv+5YJwFtRvBIzWtS38D6pHctWW
 TMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hft/qShxHo0bK33jERj2ZhfMZ7O/VHjF9RLnRkSOuTI=;
 b=WZk8lPpVuM4JIM7yTOz0enGE37MAjcdc/eAl2VEZPCSra7nHHXtCKhbdlyOFXpfuP4
 Dpir2dLThZgd+hKDa3iNEEWrvEuqvvLmQ+VJHyKessOFZRrs7EVHxONw4V5DKyf+dOxb
 kNekPIQSc3leVF7JxcaQrbQFwTj9CLDAF58yJNY8XrOEbalSNbVRG55/SQM5mttvlC8K
 dwRvxWBPc73S1gSBudn41QpK/pZDyHYNYCAaWAPGH0l9Ev1a/4MT8zVv7yEMYQlPW2a5
 VbiI1iDADkve0yefEJiOQ5lvvur+GgNti00U/HGFLQp8M35bfTLOLtFbvhdMd7Wwqxts
 eY2g==
X-Gm-Message-State: AOAM533vnVX6qEIR3vVozRTUHIxBYWWVt6AdnqA+gA81QBMaSmSw3okl
 BNgMmGeN4afTMCJ28Xbs8PopK87WK3a/ig==
X-Google-Smtp-Source: ABdhPJzmZZbLJeQ4J4wHDZid4oFT6Yl/7zQkym+z79mPochrvWMslUalo4Qv8GYrkFzvSmdKAPe0Ow==
X-Received: by 2002:a63:ff4d:: with SMTP id s13mr23749361pgk.310.1617644531620; 
 Mon, 05 Apr 2021 10:42:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l25sm17411741pgu.72.2021.04.05.10.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/msm: Split iova purge and close
Date: Mon,  5 Apr 2021 10:45:27 -0700
Message-Id: <20210405174532.1441497-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently these always go together, either when we purge MADV_WONTNEED
objects or when the object is freed.  But for unpin, we want to be able
to purge (unmap from iommu) the vma, while keeping the iova range
allocated (so we can remap back to the same GPU virtual address when the
object is re-pinned.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 71530a89b675..5f0647adc29d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -357,9 +357,14 @@ static void del_vma(struct msm_gem_vma *vma)
 	kfree(vma);
 }
 
-/* Called with msm_obj locked */
+/**
+ * If close is true, this also closes the VMA (releasing the allocated
+ * iova range) in addition to removing the iommu mapping.  In the eviction
+ * case (!close), we keep the iova allocated, but only remove the iommu
+ * mapping.
+ */
 static void
-put_iova_spaces(struct drm_gem_object *obj)
+put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
@@ -369,7 +374,8 @@ put_iova_spaces(struct drm_gem_object *obj)
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
 			msm_gem_purge_vma(vma->aspace, vma);
-			msm_gem_close_vma(vma->aspace, vma);
+			if (close)
+				msm_gem_close_vma(vma->aspace, vma);
 		}
 	}
 }
@@ -711,7 +717,8 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 	GEM_WARN_ON(obj->import_attach);
 
-	put_iova_spaces(obj);
+	/* Get rid of any iommu mapping(s): */
+	put_iova_spaces(obj, true);
 
 	msm_gem_vunmap(obj);
 
@@ -1013,7 +1020,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	/* object should not be on active list: */
 	GEM_WARN_ON(is_active(msm_obj));
 
-	put_iova_spaces(obj);
+	put_iova_spaces(obj, true);
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
