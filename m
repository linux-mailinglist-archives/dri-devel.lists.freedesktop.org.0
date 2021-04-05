Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD4354639
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602F89F0A;
	Mon,  5 Apr 2021 17:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16C389F47;
 Mon,  5 Apr 2021 17:42:19 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id s21so6448300pjq.1;
 Mon, 05 Apr 2021 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lNUTj4cH2m+cKbQ1c8oBegHz15SkUdeTuXeC8QriD2w=;
 b=FYbnGNI+71Ugjz8aN913ncSWFoObUE+d7Ay9FWTkF4UYUw7/NkIgMd4KpR/ccYHhxM
 GxqwieReZYObur7q27lHWLPL2G9aaxsK1rehNeGDK1/d/JpamGzTu9gcgWL8F2vajDIY
 XRiponVvQngtXWAbtodxFlMPMnKEkLeBHiuiPa/h6ao34MVE/ml9ZTCGy22IkSmigeSb
 Huzyk7xgj5ADAU3WoXzIkc68tX7UUMgTCoE0ffi7aWb/i4g865LwbTCZlJdjGHQA7UPm
 b4aov0nhZAAasvRCk81CiEEMUcFlVh3atghT3b10VAe1gD4ORUOHVxzJLLVJZHOIk9CB
 mHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNUTj4cH2m+cKbQ1c8oBegHz15SkUdeTuXeC8QriD2w=;
 b=n97CZREWPqRs2amTv+HfELkhyb9DJxaqyK0GSf6+RBx5NQvEOD2baCak7sFARhryc/
 Ge0UQ2iNeBRMC1+eeXDvObaFbGOe2OjnSbguGBAP/TwUDCJYJ5tV6SRRp3mhefVlIBij
 CMCS/lh9cGtLOjNE4W3sPugbp2/TPq2X+TFXn1gXpyolZ6DDa2g6GRub40FLE38ekAze
 IsYeDsHlX/N7+VmQILXnKSWrQ4kpO91DiSdebaImUCxryI6kwxva7z+lNMwc19+8XuQm
 pYblI7BoZ/C8cRoFoXLtluvlGR6/5fBkQxcYVYpw0gvgr6kBjWvSC9mvUIirQnp/WHfz
 wREg==
X-Gm-Message-State: AOAM533lm9Wd76ef4/PC5KpcpIOEbn4mg7BT03Ia1cWDhc8GNCR5l3u5
 tTEvnHBq8qQ+/ZyoFn+KREv1UWne+IS1mg==
X-Google-Smtp-Source: ABdhPJxdRO85RG3m2k3YtzCW0Xv3vu3+xlX8l5aNSXS4owe3vLWNMG9v/9vzzZfQ/AsXSkrK6IUCzw==
X-Received: by 2002:a17:903:31ca:b029:e6:65f:ca87 with SMTP id
 v10-20020a17090331cab02900e6065fca87mr24984947ple.85.1617644538682; 
 Mon, 05 Apr 2021 10:42:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l25sm17411896pgu.72.2021.04.05.10.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/msm: Small msm_gem_purge() fix
Date: Mon,  5 Apr 2021 10:45:30 -0700
Message-Id: <20210405174532.1441497-8-robdclark@gmail.com>
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

Shoot down any mmap's *first* before put_pages().  Also add a WARN_ON
that the object is locked (to make it clear that this doesn't race with
msm_gem_fault()) and remove a redundant WARN_ON (since is_purgable()
already covers that case).

Fixes: 68209390f116 ("drm/msm: shrinker support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9ac89951080c..163a1d30b5c9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -729,14 +729,16 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(!is_purgeable(msm_obj));
-	GEM_WARN_ON(obj->import_attach);
 
 	/* Get rid of any iommu mapping(s): */
 	put_iova_spaces(obj, true);
 
 	msm_gem_vunmap(obj);
 
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
 	put_pages(obj);
 
 	put_iova_vmas(obj);
@@ -744,7 +746,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	msm_obj->madv = __MSM_MADV_PURGED;
 	update_inactive(msm_obj);
 
-	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
 
 	/* Our goal here is to return as much of the memory as
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
