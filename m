Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0A57A4ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DE291044;
	Tue, 19 Jul 2022 17:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3890FCC;
 Tue, 19 Jul 2022 17:18:58 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y141so14174025pfb.7;
 Tue, 19 Jul 2022 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=ZBhwD7ytYU8o+a2Bt2oJHeG9MY40h6GSVLZqXzGXTC0FFRkECyQUdR7BCabQaLBaYg
 7d0/+Arfy1ACzhn0His7fTdu34dZxSC327lOlWQq8ssDW3XXLRVK/WpBrr98LHXPvw6z
 SK4isVMaL8HQiH6CB9T3e3aBK5BX0cbpBcDImxm30hhGsSgH24tVRlpqQFqOFFLBoA0/
 hDchYdRDp5FC/mEwqjiWoEBUv83V+UHPKRsoihuk010s54MtfIITOBBLcXl3n8Wwhwyg
 9pKmGGmB5biVLhfrOKUfj4M8ZqAJBxSnynwmbr2hCUQVaAW3lJmL6hymNjcX8ukUvPly
 ceHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=ffaH4OWQ3/w/lUpgKUyqn2nUJf1+7Y+I9qABZBraaUVMXougp2ilbkQoyUvv2zKrGB
 RG31sgOusoPwea/e6tBZDj6x0D+MZkGbD9R4/nXGB6wLp90GlcA50/4z39u9Jgj0nql+
 PfRCLYBcoAIaFrAAIvXNMHsL5WyvseaJIiyIbSkHXkNTvOYCZJHQgVFu56PAPiDznCiU
 9m6bt5Jab2D0np6oW7L1XbDh/RVx6+BzsAqTBQgEg0PWsEGl4bwOBR2Ia4m1VqnvfIuk
 2GJ0ncGI7ItpS/+L0Fr8dEQEapTwtK0RC5UvJ+yVy4lQU/62wpijrHnsqZuDx7GXdrDb
 VF6A==
X-Gm-Message-State: AJIora+NEEI4Hwhz4jKhKZbGi/1AM3kwDno2ajMCvNYvQHzzRytqmPXr
 LzMqH4u5Tamfn36LJWP34WL/31DYtT8=
X-Google-Smtp-Source: AGRyM1ujYcxPDjQPBqvE6HN7KMwZ0j+SwqlhLBBk4FEbT8ggh686jbNbt4OEn2htkgDny2yEA6sthw==
X-Received: by 2002:aa7:961d:0:b0:528:ce2b:d9ce with SMTP id
 q29-20020aa7961d000000b00528ce2bd9cemr35016532pfg.83.1658251137144; 
 Tue, 19 Jul 2022 10:18:57 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1709027c1700b001696751796asm11896202pll.139.2022.07.19.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/13] drm/msm/gem: Consolidate pin/unpin paths
Date: Tue, 19 Jul 2022 10:18:51 -0700
Message-Id: <20220719171900.289265-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid having multiple spots where we increment/decrement pin_count (and
associated LRU updating)

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3da64c7f65a2..407b18a24dc4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,7 +190,7 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 
 	p = get_pages(obj);
 	if (!IS_ERR(p)) {
-		msm_obj->pin_count++;
+		to_msm_bo(obj)->pin_count++;
 		update_lru(obj);
 	}
 
@@ -213,9 +213,7 @@ void msm_gem_unpin_pages(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	msm_gem_lock(obj);
-	msm_obj->pin_count--;
-	GEM_WARN_ON(msm_obj->pin_count < 0);
-	update_lru(obj);
+	msm_gem_unpin_locked(obj);
 	msm_gem_unlock(obj);
 }
 
@@ -436,14 +434,13 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
 		return -EBUSY;
 
-	pages = get_pages(obj);
+	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
 	ret = msm_gem_map_vma(vma->aspace, vma, prot, msm_obj->sgt, obj->size);
-
-	if (!ret)
-		msm_obj->pin_count++;
+	if (ret)
+		msm_gem_unpin_locked(obj);
 
 	return ret;
 }
-- 
2.36.1

