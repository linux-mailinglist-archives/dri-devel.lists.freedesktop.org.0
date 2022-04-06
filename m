Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AFE4F6D36
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F3D10E60B;
	Wed,  6 Apr 2022 21:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239F10E61E;
 Wed,  6 Apr 2022 21:46:34 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 i10-20020a17090a2aca00b001ca56c9ab16so4824485pjg.1; 
 Wed, 06 Apr 2022 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=MvEz2sRys8Cf+kjOTGfK5cpnMa8Cz8YyPjD5o0PIpnAh+WViNlKo1cpH4q/b9Vn17R
 eghzzzCphg03L7+nsjGEU4xuGShLQ/s37990xC/QepF5g/UtHsNjyx7JdVdM/qJ/3vTv
 SwNys3fitq9ckBboY4fplKs+Pbq58I4ZqngUloTpcSdc5eN20XvVEQtzHAMSIZy0y4rb
 HaFFITbgHCz/snKItOzrurDcri37NSNRY1y08Ioi9IlZezhRH4G52RqA0Jd7VoEDY98I
 cwC9bC0aZqXsFHGRpHWlrgl4w+J3xHJIkwn3b8h/ZWD8foE3ojkIs6i2/rZfUU4+Oun5
 J9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=L6ycCSebcKIeykTot/QqOXnQmDf0nYSjq2UeB28A3UDaRNivH9zQvlLAWPyy/3G142
 tLGbFPz1ULKbX3Reyn69WmzirqMB6RNmUJjlI2/iAueVQeH+DEZuXF7qZsgy4O+Qnu57
 DjDtgwXZI4BrD33VlOLfsU/+jvk8nDNrVblVSlU3DN9sh/tZ8xtIGfbTsCqhBa5i8KaS
 Gqyt8ny5s6WddIAZhOwskB1lCyHe5YxLhtPh2TrunVmrxoXer7P86hC4jWFhr3uysWcf
 zEm8piU2YkoTCnrc5k6nJn/XiVVtAFBJCdlCm2vnfRNJ0cchaVZhVUxh+h11N+bwgmvR
 L4jA==
X-Gm-Message-State: AOAM530gWTO9NaasKrcGHfb66tV6WKRzBB02gKLMmN8ah30i2HDyCKTR
 mkY8iZVRILF+AT1EEwH4GhELkHe34Us=
X-Google-Smtp-Source: ABdhPJznLjxldtpJNTkYDLuyaByw5EOTGFDXgk+G2XgzI4IV923npb5/84RhqLsmH8lqMsfjZysuqg==
X-Received: by 2002:a17:90b:3652:b0:1ca:b7d1:16b3 with SMTP id
 nh18-20020a17090b365200b001cab7d116b3mr12389271pjb.34.1649281593606; 
 Wed, 06 Apr 2022 14:46:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm6642463pjm.13.2022.04.06.14.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:46:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/10] drm/msm/gem: Convert some missed GEM_WARN_ON()s
Date: Wed,  6 Apr 2022 14:46:19 -0700
Message-Id: <20220406214636.1156978-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406214636.1156978-1-robdclark@gmail.com>
References: <20220406214636.1156978-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f914ddbaea89..64906594fc65 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -44,7 +44,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size << PAGE_SHIFT;
 
 	/* Print a message if we try to purge a vma in use */
-	if (WARN_ON(vma->inuse > 0))
+	if (GEM_WARN_ON(vma->inuse > 0))
 		return;
 
 	/* Don't do anything if the memory isn't mapped */
@@ -61,7 +61,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (!WARN_ON(!vma->iova))
+	if (!GEM_WARN_ON(!vma->iova))
 		vma->inuse--;
 }
 
@@ -73,7 +73,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 	unsigned size = npages << PAGE_SHIFT;
 	int ret = 0;
 
-	if (WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->iova))
 		return -EINVAL;
 
 	/* Increase the usage counter */
@@ -100,7 +100,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (WARN_ON(vma->inuse > 0 || vma->mapped))
+	if (GEM_WARN_ON(vma->inuse > 0 || vma->mapped))
 		return;
 
 	spin_lock(&aspace->lock);
@@ -120,7 +120,7 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 {
 	int ret;
 
-	if (WARN_ON(vma->iova))
+	if (GEM_WARN_ON(vma->iova))
 		return -EBUSY;
 
 	spin_lock(&aspace->lock);
-- 
2.35.1

