Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6E23D8520
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028E56EC31;
	Wed, 28 Jul 2021 01:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DCD6EC1D;
 Wed, 28 Jul 2021 01:02:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so7515866pjb.0; 
 Tue, 27 Jul 2021 18:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=mKsL6bQdL5LxaaCFnf0O4WfONIQ8TCt4jpcZUmVWJ/LrvH+HSsEuvpQWzOTXQQBAgP
 YJgnR9KJ/Zw0toXptUtcS0T+FQEIzkSr6dQkIeoG7qloDVKNer1AjElHpghoOFol96HM
 tzVi5MOCkQ0047mzoiN9FmwgLOPTsX1/dVmtf0fJl6hCUT1Ikzvz7HApAkNh6KvGOy1t
 22L633eR/RKJbSlJroMlFxN1ytNvPdzNKD/jS1vjk26MQKRQGdOPvFZBlq4UcBY28jCq
 1HwAlhh39lkiY7wtLrwER5lbHZqJJMrDrAFx0ji4PNbAv5KwEWt5djAR1TBthI3KNJxA
 mu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=KqQXKskSjBz/XWIfmCsw3Uu10asG37bdZkfh3siFDhQVWWGc7CTBWzRddZDGG0Clxe
 R471YfRUtB+Vu859Epe6CbMdD5pIgYJ+5n3t8OoByXEDcOB4jqGczAyyWEakbHKxp7dS
 8PQ88qOrIFcO1YhaV8m2NHnbmKsZRZIGq+wBtVVv9ocUt22KkDGkiDHy2UM+++t7kaCk
 XSUdNbnOzomXzlFaQrhCoFepDLZrRdzjd5UTLAXPdjx6g2PUnEvSDJwDW77TBJh9fJBQ
 n/KojxeQCrs0Wyu/8GPpk2ZvB77kBLJ3urRWYToISPYRNXQ6yegxuiM9rXHYmgNkxXZN
 mbIA==
X-Gm-Message-State: AOAM531WTqGzygPsOGEkGXnE0/nOBwEhUER8ypEfUM91Xw1vYWTIIvmI
 UUiZtTfe58uFXMDt6laGm6a/DZvyOKMm0Q==
X-Google-Smtp-Source: ABdhPJwyyI6l0r5SszrnRnJ+PmeqwvWRyFs2gHZiaNFXqCHoj3lXlSdMxUwHFEqWpRPgVqJO/wn5YQ==
X-Received: by 2002:a62:8407:0:b029:39a:59dc:a237 with SMTP id
 k7-20020a6284070000b029039a59dca237mr11938158pfd.30.1627434172947; 
 Tue, 27 Jul 2021 18:02:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y2sm4987021pfe.146.2021.07.27.18.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/13] drm/msm: Return ERR_PTR() from submit_create()
Date: Tue, 27 Jul 2021 18:06:13 -0700
Message-Id: <20210728010632.2633470-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the next patch, we start having more than a single potential failure
reason.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f6f595aae2c5..f570155bc086 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -32,30 +32,27 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = struct_size(submit, bos, nr_bos) +
-				  ((u64)nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz;
+
+	sz = struct_size(submit, bos, nr_bos) +
+			((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
-	submit = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
 	if (!submit)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
-	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
 	submit->fault_dumped = false;
 
-	/* initially, until copy_from_user() and bo lookup succeeds: */
-	submit->nr_bos = 0;
-	submit->nr_cmds = 0;
-
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
 
@@ -799,8 +796,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
-	if (!submit) {
-		ret = -ENOMEM;
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
 		goto out_unlock;
 	}
 
-- 
2.31.1

