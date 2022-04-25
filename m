Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58750F172
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 08:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD011217A;
	Tue, 26 Apr 2022 06:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C343810E01F;
 Mon, 25 Apr 2022 08:36:56 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id u7so10059334plg.13;
 Mon, 25 Apr 2022 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H6a9DJnLZoyjSQqOJbXpXtPYv+DY5RZMT8ENRg4/RRI=;
 b=g5zrZirvfr2sxgv+XDrJRRRSZcWaqfvFpzLqxrmEp7xkC39qL/RVOOXr69CMvQCGeV
 /gIrCbN+uEgn37C7qiUE3SHKxyg+dJk9odyEDO/Lakj7Pveh9RzJuNqUnzg/wQxFDw6E
 uaY6v7d9oJ+k3czUhRDUAGkU18PJd2xrPWA4gzHMn1zxjBdoiHDtfO3Up8fcpBGQhrlj
 tD2XyqZW1SiX90hLF/xqG9Rwgc8BZbPTaNGdtMAgkOoBzD+ug/+7AyZhStq7X6BE5Y0C
 klb7pyBiFLprePXeABQy1IT53YaY+r9Xqr2g1xCWAy3+eT8SHStdUuA6dzu0dcc1WG/L
 LFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H6a9DJnLZoyjSQqOJbXpXtPYv+DY5RZMT8ENRg4/RRI=;
 b=B1Tj2d0d992Gs1edXwYGAsiBJjIypl0532e+hus5524W+KscS/6IS60pWvyRmg312d
 72fG9kAiS1Ap3EexGgoL1seeiY0c9cYZCY1Pb4/q0e/O+JiWC340M2aKNpo0SdIYScDp
 LY/gsBUaGHqIkys2kGTbFk6veiTOj4vN9cmSFB6IHfqDqz9wuje9Yp7A2Mxv20Te8ggF
 YaCf8rwWdlof9CRtZCOlvzrZow0EeEzS56GsJwu8hnfzEePTShEIzwKGfAu0HmQ2Svs7
 JC3SOZ2D9WRoBXyZD+DFUhkrnjBz5pVROJPC6EjEwfX8EaY9VdlePs6DipTUYA/UUdlf
 Wzsw==
X-Gm-Message-State: AOAM530QwRq3yG1tRMN3obZDF3zUeIPyxXtinB/HJCj6kHQBbowir/6q
 +ChEGle+wFhINUEityZH+NY=
X-Google-Smtp-Source: ABdhPJxghzCfW0thhWYjfw24Amn1z8l+dauqX8/znkFHaiZCi6E5K5+kGscszYD9cjDbVz42ddGOVA==
X-Received: by 2002:a17:902:7d83:b0:158:c7e9:1ff3 with SMTP id
 a3-20020a1709027d8300b00158c7e91ff3mr17117826plm.55.1650875816320; 
 Mon, 25 Apr 2022 01:36:56 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056a00114700b004f7be3231d6sm10826176pfm.7.2022.04.25.01.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:36:55 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 andrey.grodzovsky@amd.com
Subject: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Date: Mon, 25 Apr 2022 16:36:45 +0800
Message-Id: <20220425083645.25922-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 06:46:27 +0000
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
Cc: Hangyu Hua <hbh25y@gmail.com>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When drm_sched_job_add_dependency() fails, dma_fence_put() will be called
internally. Calling it again after drm_sched_job_add_dependency() finishes
may result in a dangling pointer.

Fix this by removing redundant dma_fence_put().

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/lima/lima_gem.c        | 1 -
 drivers/gpu/drm/scheduler/sched_main.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 55bb1ec3c4f7..99c8e7f6bb1c 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 
 		err = drm_sched_job_add_dependency(&submit->task->base, fence);
 		if (err) {
-			dma_fence_put(fence);
 			return err;
 		}
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b81fceb0b8a2..ebab9eca37a8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -708,7 +708,6 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 		dma_fence_get(fence);
 		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret) {
-			dma_fence_put(fence);
 			return ret;
 		}
 	}
-- 
2.25.1

