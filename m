Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7E3C649A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555FB89E32;
	Mon, 12 Jul 2021 20:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759789E06
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t5so13410828wrw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezhaA8hTBUICMyc9KfH8N0Ki2qpVtTK3oPL1/iX+DhE=;
 b=WvivAdaKsVfa79rAQx/9iAZ2ztB0DCmwcyARgn/20xmhYqF4sqZA7xQ1e3vLrWAbir
 675MS66KN4C77TJVv66ZnEkHCn6nIX/Y4WBG0hIAlozl+vkh+eL07Olf7MELbvxedSaK
 LInOPpE+XOQwc5/ldMFb4xJEnWkmkipU9Yv1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezhaA8hTBUICMyc9KfH8N0Ki2qpVtTK3oPL1/iX+DhE=;
 b=JL7iieCkxLZoMSEY46N9cxFIibOYBHN4oh0tTnRGRTw9ANjsyvRviq1s1ZGI5PX1NL
 5FRieECzRyWx3CYNG5dLvJNPmklyo4BkKiuSrFNAjLgn0SGUflt4orQ6UvAstGcjCrZE
 A1zxhMTf6PbYPtEisN1RCLT7vC4hO0jYJslWssxU5QWZaGIofoU7TwYaTCGFogdXsxna
 kw5IhjNvxwwSyGiVsx+CfByqWKWZGeHAMG0os2JLN6iHP98HmkCtPFjhFaxWW0gXAmWI
 XczBrDwaLLWmnLCw0Myc7DwYkYIIV+FMUX/NxgwANHFeZAniWp/Ig61WeidQ7c6diLEc
 0Nig==
X-Gm-Message-State: AOAM532PhGrDDtJwdgxSrd2ib130qAg1gJ6JZxqhkUEddtvbdaEmyjrP
 9aetm6tc1Fb4ox/c2nRStikqucPuHYtLzA==
X-Google-Smtp-Source: ABdhPJzz6Ty+0HbQQD5KqOZq4W2JOaXsv4E/IUMIyzLnldbgzh6U9YV/u0HOsJaD5B3+exw82XQkag==
X-Received: by 2002:adf:de84:: with SMTP id w4mr885712wrl.104.1626120129933;
 Mon, 12 Jul 2021 13:02:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 12/18] drm/sched: Don't store self-dependencies
Date: Mon, 12 Jul 2021 19:53:46 +0200
Message-Id: <20210712175352.802687-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is essentially part of drm_sched_dependency_optimized(), which
only amdgpu seems to make use of. Use it a bit more.

This would mean that as-is amdgpu can't use the dependency helpers, at
least not with the current approach amdgpu has for deciding whether a
vm_flush is needed. Since amdgpu also has very special rules around
implicit fencing it can't use those helpers either, and adding a
drm_sched_job_await_fence_always or similar for amdgpu wouldn't be too
onerous. That way the special case handling for amdgpu sticks even
more out and we have higher chances that reviewers that go across all
drivers wont miss it.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 84c30badb78e..fd52db906b90 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -660,6 +660,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
 	if (!fence)
 		return 0;
 
+	/* if it's a fence from us it's guaranteed to be earlier */
+	if (fence->context == job->entity->fence_context ||
+	    fence->context == job->entity->fence_context + 1) {
+		dma_fence_put(fence);
+		return 0;
+	}
+
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
-- 
2.32.0

