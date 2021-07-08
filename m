Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F43C186F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB7D6E95E;
	Thu,  8 Jul 2021 17:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C01A6E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f9so2862723wrq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Neep/k8O4rPFqvb2LyTtHB7zNIqSQStnKQ4ditqwKXE=;
 b=QHEatNCQ3lh7lP5sAUpGkKHp+kq4kV2ALQZa6ff1DLZg0AFRaqu94D8mweMPD8o+SL
 VDNETuNiFNKR1Is7BdH9++y+E5hLlm6ZTgaqi9NdA6GsSqSSMhWKvKMq0SjvOCMH7WgZ
 jQIn8hJScysXor+bQ4ZVvRuQ8qSSSZRNX+IHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Neep/k8O4rPFqvb2LyTtHB7zNIqSQStnKQ4ditqwKXE=;
 b=bNkfSJASC6aCoWUMYtVkKCxyD8+V97LQoqA9qXYYgN61LQZLWRTRiFJDhfzL1QUP4h
 vyh7AyB5m6xMianhKWk5aBdMWf2nsls+AeaDy0LGTkvoWiJ6j9u1f8JsOjRvg3tpu5TM
 qcMrr5VqojXfwA3dkBEUzrZvtbVSJq/Tq4jBaXL3l4NkYagnIMxa0cqc1SSHurV8sH+0
 stCznXtYoHGEO1EVbgwDFszOnPbO4MfZjHtQoNlOgA4PeuQRUfGFV82UqW4TltCBedku
 5a6PhKoDV2tJcEbsaO+nWlv0/x73jjGHPMARV4rkaOiQWqCerZf/DILiolaEvk6AN37Q
 VOdQ==
X-Gm-Message-State: AOAM532wg9s5qMCaKPnMc1t/6WKPNo9cX8lP7Z0ZRVxm6CZGN1B/eFHZ
 M/VLwKCjz8WhFBhLK4NrvHQPK/LS2OfsUw==
X-Google-Smtp-Source: ABdhPJwtwvrObnGsaYKi8d7l2en5+rAga6UTNLIcFUfFXEOyUekIOws2dG7pT/j8eOB2YPGJlurJjw==
X-Received: by 2002:adf:fc83:: with SMTP id g3mr36877023wrr.154.1625765901207; 
 Thu, 08 Jul 2021 10:38:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 13/20] drm/sched: Don't store self-dependencies
Date: Thu,  8 Jul 2021 19:37:47 +0200
Message-Id: <20210708173754.3877540-14-daniel.vetter@ffwll.ch>
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
index ad62f1d2991c..db326a1ebf3c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -654,6 +654,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
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

