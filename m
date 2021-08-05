Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C53E133B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1689CAA;
	Thu,  5 Aug 2021 10:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9D6E9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:25 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i6so7745388edu.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrBx4CBwHL4LCxd/L17wD9kVL8jLKB/ia22GTxIDDNY=;
 b=Hy0KTKLZNoa/0p5YbWam97oduG3xEHgFvf3KJ7OW6urEcjBQEmnW47jE26EYT9tONi
 AOjmbGVjns3OczDXzOYeQAUtqcx6LrSb7skgBK/gRmxAsI+YfQ82w9eojV/S6zR13zhT
 d5sUZXwRYVbAA0ax9g/Pl0ocECKvmfP++9Eis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrBx4CBwHL4LCxd/L17wD9kVL8jLKB/ia22GTxIDDNY=;
 b=LtxGdd/ViJPdzhFP1m8nSn/Y+CwmSfPkCiIX3aL933BRMv6XqEaP89ZH/HZe7i4IoB
 gBfOrlcjVzWsMc74QCRVsAypaW9hW1QVZjDKtJ9+PNH5bW0hjEGGrRceTNMMLgUprFPA
 0lb86SgiPbI9XMpXlpSr+CdNTlGrnBX0hwhcgiQ2HzqYUbPCOQvrLTSMttWfMnoKza7S
 4s+qQCzdu4iQ2lTsG+MZ03IHwMqijmhnqIy7DP3DDGfDMxGZHRTB0F9UE3jsvbEXagQL
 SXqBzyeit26eaEXTAUkPO4D2DGxZo2ItLjqVc+sLe1Wm7zO4nUIxbvj8E1j5ByNW6/DH
 9BTQ==
X-Gm-Message-State: AOAM533v/rQ5Ob5GCVDQSbCUey7Gz1JdSar5LegVUi/l6/ri3/Uk08BH
 sKSCDZgROZ6jydEZJnEqHlqMwTO5iDOxTA==
X-Google-Smtp-Source: ABdhPJxcatNB3uMDIlS/IvkYf0eyNei/2iL2TzILdhJkT0UazEGiJemXJK1mqin9u7Tajl5QAxeK/Q==
X-Received: by 2002:a05:6402:124e:: with SMTP id
 l14mr5899834edw.356.1628160444153; 
 Thu, 05 Aug 2021 03:47:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5 14/20] drm/sched: Don't store self-dependencies
Date: Thu,  5 Aug 2021 12:46:59 +0200
Message-Id: <20210805104705.862416-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f77456929139..49e507f91ec0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -660,6 +660,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
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

