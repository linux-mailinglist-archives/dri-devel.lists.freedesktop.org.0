Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EFF413899
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B76E9D5;
	Tue, 21 Sep 2021 17:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B836E9BD;
 Tue, 21 Sep 2021 17:37:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w17so33490316wrv.10;
 Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=cDp4X8nEmxvJiGYdGuWZzu8D1TLfgJyLtBQE2jZxeRe5vgCyvEk0LBVxllfDfy39wi
 iqugiMSc9ZfU+mS0MAdxOpTwrE7/cRbkNMWZN20OuQvOB7+unzYuuE0FhY2H7Lg5/guh
 7u6O8TMtWlOqqkWD6pd3r8yA2oRmlDwah0lUM/Q4kBAgRkGD+d5vtv14LtFJgAFqEfDa
 WpFM+ClJZbKdGevGrhvsCriciOhGaN7Pd4EUpYikZR8Yg8BDmSw/9iHIoEdSnnxzDJBo
 E0qfxDgFHtC6LYBDS5i4ryTI/rHlHMT6zo7rju2Vxy5eiC6CdzPnIUVhBAjEjdAGJPTL
 E1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=HR5B8XCFUtMD2P0iUq6OR9jU5IkFGNrvE98NgJH49ioE05joYLm/Y7BVu4l1WjoN8o
 OzAB9VX4SvhfWU/Tje1DqXPR1OysFNfUZnLKwfk75ryjQWE8w8oZ9yVexrNG64rQD5bX
 zo/Hf4VHJgoYv+hJwAGBuV3cUncsY1KGlxdST6oaGs2U6GYIGEUDMcPAmDkGGs2Llqdd
 VFUn40BL9T0XeMNkG7vdP4nUm1RHmm39mKbT0Hr/Cj3zjlbQbMSAV+ynFlOWmh0OIiL3
 PY3hSBqcpMO95HU1J1ooHdA2wKnCMCt/kk86f28PxKfAMExhdk7wZeFR+HWnyVKNoBsm
 l22Q==
X-Gm-Message-State: AOAM530eMBGXlk6FLVXY0tG8DJyIj4U3Q7T1P78hnPgfYlCiJLwyiRCs
 qAfJcVxqOEuVLyplu5cUlo0=
X-Google-Smtp-Source: ABdhPJw/F52P2/JZ97k5+Q1iHrdLYrh6e95FiQ1py0vN9kS3NvlA3/pP1bkc0d6Bi2jIpnxKyrZ+WA==
X-Received: by 2002:a05:6000:1207:: with SMTP id
 e7mr35843869wrx.170.1632245833656; 
 Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Date: Tue, 21 Sep 2021 19:36:45 +0200
Message-Id: <20210921173659.246165-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifying the code a bit.

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 042c16b5d54a..5bc5f775abe1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
-			break;
+			return ret;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
-- 
2.25.1

