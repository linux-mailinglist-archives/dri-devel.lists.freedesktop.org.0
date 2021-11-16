Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2845365E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 16:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FF06ECF9;
	Tue, 16 Nov 2021 15:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F386ECAF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 15:50:39 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s138so9963498pgs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtfEqCr30iA7CSbncggiXye/6RodNxBCEnJUOFYB8K0=;
 b=IM7wabwBiOjulh9VwKrHrDiT65SYc++4r2UMHoBHenax/cb57+ZyKJ0jpw/vIrb2ul
 sEAjDmUHi6px5Ooh2jrzHV6NZpj5PMn8Dulz55oeggjfz4Lvye+crp4pRyBrW1KywGUI
 E7+M0EwhSiON5RuzR74bf14Ufj0qTTkHbQOyle2L1qakbABY3B6jP8v7MnsJ5gnslNl2
 XWdUTFCmpOqtiXeFB2lcM+nzUxVRydpAsYh9rZ7LhD0h8xbfFdT1Eu8pG7D9A/ITuLVW
 Z8+4EEHmpeVSvySbdcQvGWOz8HJWTtt+OqDOZN2hzE0K4YfxVWXDfpiifeKzuLtPYrMZ
 T1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KtfEqCr30iA7CSbncggiXye/6RodNxBCEnJUOFYB8K0=;
 b=JZWOBL+ztfV+ZFHXnTtzsRgRHzZGYVo30OeKfTkMwKfpr2oBRn9veM19vSpO92Z5lg
 t0vH3L/Mf6rWxoFn0bEi6INKp+WlTfMI6HabzCj8Bs+JZUPiKQcxAco97pGvLdaPK+j1
 xr6/m9YB2F007Zx+gFfizKNhADhuN2O1FxP1yrE7cBQWdmZmPy+q4jhz9RBSK3wdPJLn
 vJu5RUWNNGy/AUmJC5tnMnCd92Zv+zDy9G1TC7ZkcYN5y3ebhU07dhajWY1GFuBW/AUv
 gbl/a8FYa+M0Hj/DMPL+TSqCkO5wDz85U9Z/NrBML/9FIiQChPpektcwqUbqm/UpELSx
 o2gw==
X-Gm-Message-State: AOAM5322Op365UruJORotfScvRoouqjyOhtYi6kBZm+bCq244hlosuAV
 qx4wrOr+bzIVZ0CsPL9ne2QQJs/02Ns=
X-Google-Smtp-Source: ABdhPJw74w48ZhhsMARMJaXax3jPMXN0iCXXUdMoqDID4avl3jcfqFCetqPHCPQl5OnAwnF8tBJlSQ==
X-Received: by 2002:a63:e614:: with SMTP id g20mr5304045pgh.159.1637077838713; 
 Tue, 16 Nov 2021 07:50:38 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id lx12sm3054318pjb.5.2021.11.16.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:50:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
 harder
Date: Tue, 16 Nov 2021 07:55:45 -0800
Message-Id: <20211116155545.473311-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

drm_sched_job_add_dependency() could drop the last ref, so we need to do
the dma_fence_get() first.

Cc: Christian König <christian.koenig@amd.com>
Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Applies on top of "drm/scheduler: fix drm_sched_job_add_implicit_dependencies"
but I don't think that has a stable commit sha yet.

 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 94fe51b3caa2..f91fb31ab7a7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -704,12 +704,13 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	int ret;
 
 	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
-		ret = drm_sched_job_add_dependency(job, fence);
-		if (ret)
-			return ret;
-
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
+		ret = drm_sched_job_add_dependency(job, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			return ret;
+		}
 	}
 	return 0;
 }
-- 
2.33.1

