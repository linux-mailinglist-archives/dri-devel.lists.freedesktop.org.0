Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9C3E133A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB4E6E982;
	Thu,  5 Aug 2021 10:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FFD6E99A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id x11so8793458ejj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atjioHvLQRKknYmCGJ4eBGUqx5TO0gjlW2lZ+WMiMlA=;
 b=GA6EI7Msn6oW/vaJ8BL9d1KpmQ/F8Tu+cQ5S5rJ2ahWIG0oUKBHfJXFPp+Q+V1Es8r
 Zh/GqTqVIs/obQHAdk/l4zl+pL6+gaqELu+kvgI/7zSHS4lLbg/lCHQbGxr3MHSk0EtW
 S4Uxx3romwWVZ+eaIIogeRJub8KhZejUR8afc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atjioHvLQRKknYmCGJ4eBGUqx5TO0gjlW2lZ+WMiMlA=;
 b=Pk4xQ6S9PTYj0fGYKpu0Nq3OHXcU6jK+NFuB6V5ZluZ1pwiM7jlmVer2fYL7kFqLZD
 G5BCMftBvXaqsx3wuHguIfP/o/m9Nx7MZ2By73+Maztl5Gz/1O5MlW47yPy+nCOokKOo
 7FirV+vzGHyDbpHgSqsCJAAqoBl9U/s4B/4sQBY62fgR6BBogzrTrLH/K+1MP+LdsvGR
 9dIQHuJZFr1WXIuCY0jgde80iP35lPYhZtcuJ0sNpPV0C0Y5EsfLeATgRXvcVa20a5OA
 +kXoT1c3iJWcKuUnOoKBKNccB6pJvCkOkfI+9BeBC2HQkOWLs6HVL1wAdqupzgj+Fkz6
 O42g==
X-Gm-Message-State: AOAM533iJr4YuUoK3bEFAc2l7HT29kkzJDTey92ortHuTGD3EBUJbJRC
 lVp8qLHxwVo3SAeyq7WVlHUZUS0TBYH4Cg==
X-Google-Smtp-Source: ABdhPJwh1gwy3gDUyVvHxv2Pb9bLD8NKlQeFntVNfpvwaexXBBVHmZGrt0E8EcVv2+YqzYfycv1fhg==
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr4118057ejd.241.1628160444981; 
 Thu, 05 Aug 2021 03:47:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5 15/20] drm/sched: Check locking in
 drm_sched_job_await_implicit
Date: Thu,  5 Aug 2021 12:47:00 +0200
Message-Id: <20210805104705.862416-16-daniel.vetter@ffwll.ch>
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

You really need to hold the reservation here or all kinds of funny
things can happen between grabbing the dependencies and inserting the
new fences.

Acked-by: Melissa Wen <mwen@igalia.com>
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
index 49e507f91ec0..1abb40b07324 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -715,6 +715,8 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	struct dma_fence **fences;
 	unsigned int i, fence_count;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!write) {
 		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-- 
2.32.0

