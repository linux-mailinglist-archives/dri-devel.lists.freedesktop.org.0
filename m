Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCE4ECE35
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95D10E93E;
	Wed, 30 Mar 2022 20:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9510E928;
 Wed, 30 Mar 2022 20:48:01 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id y16so9142468pju.4;
 Wed, 30 Mar 2022 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=DSd0Nzz9hIrhZxIZfNCcmrP6ngFJEnXjmtoQvedf5AXNAco5uLpIdKfMnlFhduseHm
 ghdLVjUhcyu+e1ldHlAqMbqU+D/xstz3gB16jtbSryEdaXLNy44Aud1Uyr8hUDLIvxKJ
 bKZ+rbXZt2JSjOCWFu1wfmmUopJu7uW8SicjmuK+3Z1G3CAxIwxGJiUp+EHDrmZxC8LZ
 BFc7YfLczqNkUfPtfqyMxkf7GqmUzMt+rUYEp7+0jJ6gmOUEQuo2Ra8qRrc8eKo5Nida
 ll7sQlqQ0Hz8mi6RrtbNn8Xdw69ESHzWNJCkWHvxeS7upUM1aD9ca9AjgLm/ZnIPlnJm
 ydXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGa5BVmzMUOjfF5fklYjMnwty8EXXy2NltxcnqNLnSI=;
 b=lfvHWyI9/JEaeqhuxQuqJPeY/0wgW3i4h2R6yA3HGaCBT8K3WXe15F23GaciNY63Zo
 qxAYh8zqQAcxT22vijCAmQoGd0h7JloqgXUJT5nu9nRyFlYZ3mgQT/+LrspPdnl+TfSI
 Myhl39wMlq2wgZk5jd4xczG4pndPDm6ZBDq+dfLIxRRJCbS+qdjxR0v8DKSGTnJlovIs
 21TKImLNP4Eb8l8n9MZZrP68KaPwnb+wwe+6ePkQC96gtUScxwW8ZP6DivczWcKwKnKX
 EA7km8KPCoLh+KXgBqDtst5UZ6QAHtXom3Gj7d/d6s2R3Bp1x+yi0+LSdRrdFOKNFQaN
 +PGg==
X-Gm-Message-State: AOAM531c0xvWAZ3cOHxgmzpas59W+LQfCYXDdJjgn2EpfJMllBtBiXnO
 LVXtognVOq9m8aJogpc7bxNmyoZ4KwM=
X-Google-Smtp-Source: ABdhPJz4skMp1REpP6c7Chg16yU1uOCWTgymMz/5cLiay5QYtR+SyDD1L5Qm4FsQDK0GEkCXZL4plw==
X-Received: by 2002:a17:902:d4c1:b0:153:d493:3f1 with SMTP id
 o1-20020a170902d4c100b00153d49303f1mr1601609plg.102.1648673280201; 
 Wed, 30 Mar 2022 13:48:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056a00180900b004faa45a2230sm25216397pfa.210.2022.03.30.13.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:47:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/10] drm/msm/gem: Convert some missed GEM_WARN_ON()s
Date: Wed, 30 Mar 2022 13:47:48 -0700
Message-Id: <20220330204804.660819-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330204804.660819-1-robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
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

