Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3713C64A0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10889E35;
	Mon, 12 Jul 2021 20:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56989DD3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r11so22000052wro.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4+2/pgGBCJxzVgU/zlbGWzgj/dEC4nIap1p/ExGlZw=;
 b=XhL8QyxOXp7z6Hg6bktsegyq+iQE0VwQKJd5eOzrkBbaKaJUAXR7KUnTN/PAHylsZ/
 FtW7akJ5YjRHbXteKqQdn9KzqNO50IDz8f0DeZzhP5cNrEIML3c9tx0Z//4Gf/Y3Phyj
 IXMvzWgqPHCNq9RdnW2KRAdfdERjEKpJZo1tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4+2/pgGBCJxzVgU/zlbGWzgj/dEC4nIap1p/ExGlZw=;
 b=EKv5+FrqnKRzyubJT0G+P93EVGpBMmMSNpsoDsalMKyQdMfnl7tISf3ktqiXXPeHmT
 788YFfB5/W7yd1fFB1uiiJerhVYGbikh1Hkb6wL4Os5/AvOmi25oYSNDe4VhbxOP/gUM
 btlZszbRUE1z8+xCfhe4a+uFykTcPxkGCH35FCEUxVfyiFGCZu+NanwzjgzpPuoJSeZd
 mN8AWVHfD0fnzagh0f4Lzcl3WP+5KuLTX+cPbqs+XS8h4KNML1TuhJMJPYDwnDQUuJ9K
 nHRvcYs1psFmyxZstTige+6qYSSSwac1HDaiiuLiEsKFnLSgMiokojngM+Zr+t3rR69U
 8Rsg==
X-Gm-Message-State: AOAM530dNKCMdQB4Tr8/UXSOpjUbX/kNmFjaEU0hnBltr8o/xdx2cVZZ
 9QWeFLlurUZZ1knfgnCQh7wpehjM5I+m1g==
X-Google-Smtp-Source: ABdhPJzBZz63JTQIH2tUHA1ojZohKCYhhXtyA7mYW5eUzZDSgsXk8ZANd0/YxLZA1e1lQp5qwP+0kA==
X-Received: by 2002:adf:ef11:: with SMTP id e17mr840935wro.71.1626120130732;
 Mon, 12 Jul 2021 13:02:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 13/18] drm/sched: Check locking in
 drm_sched_job_await_implicit
Date: Mon, 12 Jul 2021 19:53:47 +0200
Message-Id: <20210712175352.802687-14-daniel.vetter@ffwll.ch>
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
index fd52db906b90..6fa6ccd30d2a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -714,6 +714,8 @@ int drm_sched_job_await_implicit(struct drm_sched_job *job,
 	struct dma_fence **fences;
 	unsigned int i, fence_count;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!write) {
 		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-- 
2.32.0

