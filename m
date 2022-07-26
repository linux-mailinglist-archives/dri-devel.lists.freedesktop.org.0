Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E75818F8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE7510F341;
	Tue, 26 Jul 2022 17:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65895DFF;
 Tue, 26 Jul 2022 17:50:36 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s206so13768180pgs.3;
 Tue, 26 Jul 2022 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=oFM3qcef0UrtwoUQpFLwuAqGgPddV/OrqybzZuPT93TR2DT36gdpEczUOyjwvntM1w
 9GHBp0hS4jsevM/OOdFK1ksSanwvcayuLU3p1y37o1c5CqkEoIM87qXwiKQl8mc98yE5
 I/9f9rUx6tUu4B2JrwbAO9tg+7ZwXmLRssZEvhWkOGS5EEmas/iGJLnx8ZaW/DpZoGRs
 2sn0Yb+J/I0tm9IUF79FwOC+0+kT1UEkLrp668+L+Py9mxDqfRNx+EcNLydL1c1Z8KP7
 m4jSOf3FsiRsVh+cKAsxEukBSeSoyY8lFuF9Ho6YqbzRIT6XQy6zs8NOgoPIFzuFA7ET
 fkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVam+OtTXmVRJOOFcNCglGVq9lRc/LFnzlVeuJ/h90Y=;
 b=5mfYihFXIvlZvTc7EczXRhKHR/td9h8kxU2Bl8lF0KLsg90WGStUFcZpQQEbDRoWLU
 dNvRj6+1KqUZUN4GVPkpoYMdPnTq9lbX8IexSJFMrIpZDmrJOaKso44S9qNGbS+s+9l3
 ODYtpHqo32Gv/H9oE/VCKQmo4AEWr/stjxCllOihLkwUEQgAE3EpjlVCkfuDUVcO9VDt
 4J4NNSCtPpPqI6x2c0YheYIIL6sVPWQn81C4dSjsnDz3+Dqcv+KLPXvE2cgMUWdtl8gU
 XLCx33rkOHr3TYTka4Yu2WIMlXEidJgi3rgAyM4FtizDmCoJ0Vvfs2BsA7EsW17v/fSc
 RC/A==
X-Gm-Message-State: AJIora8i3z+eaPWSM0+nTlUdHn0tJ1/B8nJqExwfUsCUWquiiRroW/KC
 Uo6IPufRPf1ca0rdMerYAet8kfZhQiI=
X-Google-Smtp-Source: AGRyM1thoGmetx5EzT1Yghxen/ubJ8Ysu0MSl3NADJmMTKowzZ5lzxTdb1KgOzIFyqMqC/S5LQqzAA==
X-Received: by 2002:a63:6a89:0:b0:419:d863:321a with SMTP id
 f131-20020a636a89000000b00419d863321amr15870269pgc.9.1658857835302; 
 Tue, 26 Jul 2022 10:50:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a056a00212700b0052ab0a73752sm11989037pfj.198.2022.07.26.10.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/15] drm/msm/gem: Consolidate pin/unpin paths
Date: Tue, 26 Jul 2022 10:50:31 -0700
Message-Id: <20220726175043.1027731-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

