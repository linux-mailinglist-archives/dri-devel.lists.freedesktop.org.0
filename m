Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DA3BA52E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 23:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4167F6E207;
	Fri,  2 Jul 2021 21:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743289D99
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 21:38:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t15so10689849wry.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aq+Ijv7C9daTM0EcdaIv+YFfJaleCeNjPIDM8wzQUzw=;
 b=bdsHBFt3k8J1Ekh/NG+ZDU3xpSBfmJZMPPhLZfa2j1RfyCTK7Wz5wPh4gOtDUOfz98
 uZ5ZzWkC92p58XPqfc0am7gV3wxzePWZKFsXk0JZWyQA9gfKfHwufkmszOYY45oLHl9b
 MiG710cjuojzM9353TyLcds9KZAFhlG5hhTU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aq+Ijv7C9daTM0EcdaIv+YFfJaleCeNjPIDM8wzQUzw=;
 b=svhUxW8BPbhey8huaXFI0PvCJEgUdOKHFrIYGa+WmNR17ibGGd5tWbLfwEmTMoah48
 fRU0uZfelVpLH8RtX/9T7L7FB3NMTDxKkuxGoOANB3m5q2lfsJTeGp15ZsTsCpRB29pe
 MJ5VPGTLZK1MjmnjjRJ8WK5W+iEU0vwnhasokdt0PQMrDkTWAqAy9EkyoFqI/OtUiCgN
 XHY6ubC2W9pgsWjOB87Hn55klxa56MrKJU02AaiDh3xzCnywmQvEFdLhtQY1Thftx5Fw
 Gl6+RwXAg6poYofOCJRD2Bua1J4eqkHOuQezNy3Nknm6/q6nEkdNAzl/Yzhv3hwIEdLF
 a2VQ==
X-Gm-Message-State: AOAM531Lpz4uXTc2PuowIeZYASHjucXE9Z8XW90usGPq/TJBZlH78L2z
 XcLRseiifNMhAFMXr4eTA8M2mM+Mk+VpYg==
X-Google-Smtp-Source: ABdhPJxpsnuRlF+5B04GUwH21HSjlFZq4zFTfo2fhrdll6/AtzLsLMtuM4/pYdiKgNq0RDOsrudNgQ==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr1790677wru.227.1625261910814; 
 Fri, 02 Jul 2021 14:38:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n19sm4007222wms.4.2021.07.02.14.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:38:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 10/11] drm/sched: Don't store self-dependencies
Date: Fri,  2 Jul 2021 23:38:14 +0200
Message-Id: <20210702213815.2249499-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
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
index 12d533486518..de76f7e14e0d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -651,6 +651,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
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
2.32.0.rc2

