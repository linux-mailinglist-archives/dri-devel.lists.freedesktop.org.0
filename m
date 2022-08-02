Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F1587F62
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F4A904A5;
	Tue,  2 Aug 2022 15:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE2A9049A;
 Tue,  2 Aug 2022 15:51:37 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 130so6117902pfv.13;
 Tue, 02 Aug 2022 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=BoCEnVzSBi7RAIzSPvWu1Dvtj8JjCONeM/LqyJBSilhAbjziNWpZAwTchX2ZR8ZiDl
 4wVEJGxjI0oMdrAoAVmNDiKqKWp34jLzZGHz53YcrQgAkT3efp2mNUK2jXutL9fskOJp
 bhr528oiHsnAwhtqEx2f9ZGY8lFl9K876+DzX+e6F9xJpjz8WsAde4ikphP+JohNbOtO
 /ox2q+RvnzA9tcWwlJaiDlYoeaQpH2rvcvkd7jF2OVfBLSazlc4J3YSBF0pueFMSmGjH
 yHzndD6KRy9zu/X+UMSDSrsyuoUFv8zd5XBAr5fE8PFRT6SlKALwRjIU3szAUegzLGl3
 zD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=T7qNwACNUCal4+e/RV2vr21BJuN3l0dQCajmR8drV8gsAU4w/lBhnDpuhiUKWoaI9R
 5ypu0J/nC7tsuwkMyLN3h2cb4ajkgW82NO/Y9ur2IHREkODCzBO7N22P/yUtq7y1itqz
 h5Mn8nlWyR23qDV1JuD+QQSBD88ajU/JtL7pNyTclYqh+l4bf/Lks5GfetNBAYH9tLB5
 GVu39Fzts+8wA9ji2ixf26GtxdkT+oA+zsaOgVt6Kujnxpj9Go3Fah8jOGxGJZwenZwV
 ZpVE/XXzybj9NDXSbubxF8wrruzUh6A5eUKvqBxuIAmMfuUd/XZRFwxHddjTaitsDupl
 NeCg==
X-Gm-Message-State: AJIora+0sIrkK6ODp0QC16SwTbiJ5aGiwfe0wONBhmxwu/3i8zvN5ehb
 fB0aYrYHSuMNk1qMBdHxZWlkuNusdzw=
X-Google-Smtp-Source: AGRyM1suvrACZI+8um7dDawoDINq49y8ixC51+7RqQbVR7tOyRb4TqHa90P8pk/gPS8JWY8Y7cVpeA==
X-Received: by 2002:a05:6a00:b4c:b0:52a:f6e7:818b with SMTP id
 p12-20020a056a000b4c00b0052af6e7818bmr21411240pfo.26.1659455496396; 
 Tue, 02 Aug 2022 08:51:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ck16-20020a17090afe1000b001f209699d89sm11202793pjb.18.2022.08.02.08.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/15] drm/msm/gem: Consolidate pin/unpin paths
Date: Tue,  2 Aug 2022 08:51:40 -0700
Message-Id: <20220802155152.1727594-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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

