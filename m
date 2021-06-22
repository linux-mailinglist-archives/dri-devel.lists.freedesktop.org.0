Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360223B0ACE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417B46E7E6;
	Tue, 22 Jun 2021 16:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BE66E7D1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso2230522wmg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OXrHD46fP9K29x4w61hf4id+nsmWIFVqtCbldJLJdpU=;
 b=FJVvddinjdql031++AM/hwkThjKVlpFdW4VuJVSGZYiF1nPj0yjLN3bxyVOb7GpuKA
 pyaJEsQLlnX8IKTKZa8RbnBDW8M9oxH83krLSASRYLX/e2teihLRtkWYN4AdERd78hI3
 Ht6LAEmguqCFuWZFcBQklyS3iQCgWk/F3Iw0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OXrHD46fP9K29x4w61hf4id+nsmWIFVqtCbldJLJdpU=;
 b=iTtE5VSOB9gMiohUCaZ2qARlU+PZlcKmXkYj0VM7x6Nkyws0W0oY3aujGJlPL5XrY5
 3LN9PoIm+txREQeO/qsWl10AryV/SIUG9WC04nw4AHoKO9+zHr8SWHRQdeIv4Qy2NeVw
 6ekZiurTvh7hOKEOaocBVhYoHvQVunFc1xhh94T3q5oy98gRd8X0BsQ8solUJJKrV/Do
 bA0fRYKwIG/DqRhmdNsUZQFFwduXxlzz0XOlDvYFmYdMqtL5nKtZGm0FhTsBDRrRKb0E
 /MI9hNwLpeuVQkwhzB6ePg8IS7aLhIeXckHOGM2nj3Fh7zNHd0/k7RR6QuVIrcR3P0rh
 eOEw==
X-Gm-Message-State: AOAM530POmFb1fZN1744O/jYRqjmY6q7LJc3KsAlPJpAAs3bn1SPgR6o
 87ESvmERfos75yC94e8MDLSN/vpNKvWFSw==
X-Google-Smtp-Source: ABdhPJzKFM1NWgZNzb/wcBVDpma/Yg9VhoClAJ8pyhPdsO3YtV9OUScGDWMvrawPYJLx/A+POoTgpQ==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr5838495wmi.146.1624380921583; 
 Tue, 22 Jun 2021 09:55:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/15] drm/panfrost: Shrink sched_lock
Date: Tue, 22 Jun 2021 18:55:00 +0200
Message-Id: <20210622165511.3169559-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/scheduler requires a lock between _init and _push_job, but the
reservation lock dance doesn't. So shrink the critical section a
notch.

v2: Lucas pointed out how this should really work, I got it all wrong
in v1.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 2df3e999a38d..38f8580c19f1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -224,14 +224,13 @@ int panfrost_job_push(struct panfrost_job *job)
 	struct ww_acquire_ctx acquire_ctx;
 	int ret = 0;
 
-	mutex_lock(&pfdev->sched_lock);
 
 	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
 					    &acquire_ctx);
-	if (ret) {
-		mutex_unlock(&pfdev->sched_lock);
+	if (ret)
 		return ret;
-	}
+
+	mutex_lock(&pfdev->sched_lock);
 
 	ret = drm_sched_job_init(&job->base, entity, NULL);
 	if (ret) {
-- 
2.32.0.rc2

