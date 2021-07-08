Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7683C1876
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADA56E973;
	Thu,  8 Jul 2021 17:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24F6E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so3042528wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiWGjZqGioMgeC4R5Oz3qY6Q7MchUqktCVNPWGTETh0=;
 b=OFUNvjX5YPx3GRgyR4RSmZIS827csWXefuMDaqK8pWehp0iq3fp9hHBZltRPpoLpix
 HmxOfxJ9J5/HoNwA0Jwm3WBMUQGR6Ho/kRLWWWFOIBQsJJAevE4sIbeBC9622i7uX/7T
 NoUhkt/WbqsqpBoSoHUx8PVhTd60hJUViyPAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiWGjZqGioMgeC4R5Oz3qY6Q7MchUqktCVNPWGTETh0=;
 b=rUkDcGooX0Ldkmn25so9VaQa6QBZ4EfhvskiIxz9+pAPDs8CEcsAEBmKwrnkBANePr
 gDTIr9nPDI3f6UD6zyfbI8ynf+jieR0b39DA6MaQLLvzAu3nF5VQABa4KOMPfIVZ4wgX
 mRvsbRXLe7QNSAYpExQz24x+HIDRcAFj3WgqGoUllX9tT/nKbbG3XYrMY4F7PXnqRHoz
 bdRH8GG6wwm86faiO5BBFv+Q3tbIr8AVOKKwBEAklNKcb+A/Xp8JutjB2jEc5YndfYgi
 jPEO+wB8Lvh93kWIf7CXbQ+e6pjnZMHA/WcR3U6L9CqOlHCl9m0M+Ne4JngUfZprWwXa
 uFsg==
X-Gm-Message-State: AOAM53381rd+35KAjf4LLddlnBp/mhd3r8jQzrXZLyAieb75b6JzQ/x+
 ISRG8pNKBXiHoi/AAlH8tFlgUpPSySIaAA==
X-Google-Smtp-Source: ABdhPJzP/u+3t5ih+KzkHOgyvK0/I1RhftwRdkBrNdVLe8hSB1jB513knF4XsmFVfudgejBSUEtkdQ==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr34365275wmq.138.1625765902176; 
 Thu, 08 Jul 2021 10:38:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 14/20] drm/sched: Check locking in
 drm_sched_job_await_implicit
Date: Thu,  8 Jul 2021 19:37:48 +0200
Message-Id: <20210708173754.3877540-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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

You really need to hold the reservation here or all kinds of funny
things can happen between grabbing the dependencies and inserting the
new fences.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index db326a1ebf3c..67eca88e070e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -708,6 +708,8 @@ int drm_sched_job_await_implicit(struct drm_sched_job *job,
 	struct dma_fence **fences;
 	unsigned int i, fence_count;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!write) {
 		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-- 
2.32.0

