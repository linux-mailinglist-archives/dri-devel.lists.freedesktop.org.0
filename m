Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170484EE2DF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E208B10E26D;
	Thu, 31 Mar 2022 20:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E410E36E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:46:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w21so1435347wra.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LW6g4n8GB37L9NWTJIP5opTf7+LLyPDZRyUaDrhiE0Q=;
 b=Ntd0ItoS7Yu/BnfhFj/UqD2+awvKWtsjGKlRH8R2yIpBYeI7+EAfjrS1yi9AWJltbw
 THm//5OjG1Eog/63syQBy/HL11seuJQFcVq3B6BDll5TawCJwiMvTc/WjdLVDD0XgP15
 ZEvUZICnuo7k7G2jMEYC0w8vDp5D2bSwbIUZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LW6g4n8GB37L9NWTJIP5opTf7+LLyPDZRyUaDrhiE0Q=;
 b=tk4o6SpZfUDmq3TGUeRqJ8js6I3XD6xWEo2L5RVtaILWro9IvLYL+T3B2o1xiK6EMY
 oo8vGj7TUSslTl7aBJL/Mw+MJoOZbLFTg1PM9FjG+ieNps76O1bWqXg1pcvN87MpWrlK
 mL6njbYFiVzAN1222Cegw/g6Dgun9bY7NTh+rUuAzQdmLaqlFbQy/KdpYAiHW3V4ZekU
 +vcEV30kUoYnzEMunUU8Z0QY3l2eL8rfKYipPiZW7MCyQ86yFxgd6TC0+gUJp/tWsbjZ
 KaUrw7CGxYdGvZfIGpXdgENWpHG+OUWCptftxyBPoki+FJXoF5KdHq9XfaRFaV71HMEI
 Ko0w==
X-Gm-Message-State: AOAM531LqfvTnk7IO6U8iCXLRAcpl9HA6p5ABvwVZxiPo+tUmZiMFK0G
 bMKV3PHZheYl9mJvXVzWKz8gW4ScKzSbfSoJ
X-Google-Smtp-Source: ABdhPJxMNVZUTu3EixP59Xk4/uV547BN4t1hkh5WA9U6fH7pmDkOdeZujV7X/YVJQlFUDkdQjGSFZQ==
X-Received: by 2002:adf:f102:0:b0:205:7d05:d250 with SMTP id
 r2-20020adff102000000b002057d05d250mr5409900wro.350.1648759618008; 
 Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:46:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/sched: Check locking in
 drm_sched_job_add_implicit_dependencies
Date: Thu, 31 Mar 2022 22:46:50 +0200
Message-Id: <20220331204651.2699107-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You really need to hold the reservation here or all kinds of funny
things can happen between grabbing the dependencies and inserting the
new fences.

v2: Fix commit summary (Christian)

Acked-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 157d4cf360f8..ba121f87cd2e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -708,6 +708,8 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	struct dma_fence *fence;
 	int ret;
 
+	dma_resv_assert_held(obj->resv);
+
 	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
-- 
2.34.1

