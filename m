Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AA6988EA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 00:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613B410EC90;
	Wed, 15 Feb 2023 23:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2CC10E1C2;
 Wed, 15 Feb 2023 23:50:32 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id j184so346150pfg.10;
 Wed, 15 Feb 2023 15:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zeIoX4RDWl3f+nhG+Pkar8Woaq/FoxjOB1t6jgPazJQ=;
 b=l5qD+x9Nq6Q8eFXBnLD2JP5DpZJ5D0HO0afceUtRjxa8Z+s7yb/ay9AlicklsmlEEw
 3e4Rj36HY8jLFGQGubTa5jW8tNGAI0hR46V9Chl+bP0tALpancQEy8IHLrrcSKDtjIg2
 kd6Llo+VeClFPVTTcEKTtD2bMvCfInlONN/36JtjfpQbZ7BwFlCJCIR4rPy2hYbwUsZK
 zHBOTJlZm2GcXslUCSf4XusKH4awMsXWYun5YQ8smTpEXzovscwAWdc6PYw8DLjWoLIs
 aezpJuj+RbLreYYAy63wF/LsmoxdyWkKskghzUhBMuKDs2ueRq7s1huiAayMldfdHjZw
 N9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeIoX4RDWl3f+nhG+Pkar8Woaq/FoxjOB1t6jgPazJQ=;
 b=2x4Fh4DG/ACsPLWuU5cfuTWowEwgOTZZZ/aCJgBhDswkjYlmXQXOj8XvMFstMMgIjW
 yCH9/HMURiwcSTh2ebQBAtV0kZZLiNlye50/Dq1OtNX9rDqysqCp0YLTqpULZSYKbXwj
 dfmp9KLWMTFwgbwtbag7jfgwyZrG8Ia/yzcefMPgWBdbDYWhvnGSVZGcYxu5c24GUu1e
 nb9A54BmVRXxln8zT7Oh5fwt8iZdoDzn3ef+IdaZ+I9dgHgKkAx0bJv5xD1ygA77w8hQ
 cdSpXUG+gWXKvqYdnGEoOKBbx3wWQfWl9VyR3Pdp25+NGbVvsi7yKeNl00rP16NyQJVg
 wGkw==
X-Gm-Message-State: AO0yUKVf4Pj6Au1k1NM1rGgtU49u4wtX96PveVRMFv4/q/VIiYhUgzpk
 SkCQdEN6ouMkEvliFl9srL5DPVKGGTk=
X-Google-Smtp-Source: AK7set+S1yWm3qNcB1PUzuuK7xDX0SA6y0sMOop00NqJPMGuJW2NkOnni+n/RHRe/RWoADbNnOcE1A==
X-Received: by 2002:aa7:973d:0:b0:5a8:be36:65a8 with SMTP id
 k29-20020aa7973d000000b005a8be3665a8mr3307802pfg.27.1676505031706; 
 Wed, 15 Feb 2023 15:50:31 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b0058d8db0e4adsm12628278pfa.171.2023.02.15.15.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 15:50:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix potential invalid ptr free
Date: Wed, 15 Feb 2023 15:50:48 -0800
Message-Id: <20230215235048.1166484-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The error path cleanup expects that chain and syncobj are either NULL or
valid pointers.  But post_deps was not allocated with __GFP_ZERO.

Fixes: ab723b7a992a ("drm/msm: Add syncobj support.")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6503220e5a4b..e4d13540300e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -640,8 +640,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 	int ret = 0;
 	uint32_t i, j;
 
-	post_deps = kmalloc_array(nr_syncobjs, sizeof(*post_deps),
-	                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
+			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
 	if (!post_deps)
 		return ERR_PTR(-ENOMEM);
 
@@ -656,7 +656,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 		}
 
 		post_deps[i].point = syncobj_desc.point;
-		post_deps[i].chain = NULL;
 
 		if (syncobj_desc.flags) {
 			ret = -EINVAL;
-- 
2.39.1

