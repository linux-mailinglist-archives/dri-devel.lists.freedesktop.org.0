Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A033B0AD2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA56E7EA;
	Tue, 22 Jun 2021 16:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680776E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso2715148wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9eNpjSe5MhemdskcpozFFwFBpnPhNMmF6owEmgO3DE=;
 b=Srb9Hp0msD4/YUuX5uDCQ8UzvwxBDF7IeTFsP8q+JYF/WlHIejhwVYKRzm+E3tog0s
 NRiHl4rF87jCR5b/Rv2trZS+LyrltJVttIRR9EvrqGR3GzZpJBRnTXwVonzgYFpbsYOg
 50kavhu00kIMO3Z21/EEcEsF7LqaVnOELjBlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h9eNpjSe5MhemdskcpozFFwFBpnPhNMmF6owEmgO3DE=;
 b=f9nByuV1jthrGdDiLP5YQED1/wHvpdIWa4LNVwOdg58DY0EYvmPcq6qDyFVPALPVuk
 Gek8XMFx+8/DdzpJApskAHJgwzYqFbCQNidhVyA4GQ/dZyCrBQCo7kPH/NrlvycUm2kg
 yVblZO1RVKc/8tnfNG9tX456keIZRFTp7QXoV0ePQY+PyjY99ZPhh2L1GYtPlDLFiiyH
 6rhLIfV+e3vocGtklxB7S+3QpjHYqExSl28b/a0zDgaEZwZOf0vilgz1Y7ilh8wFNhym
 mrAy39UTCOL65gdON1yqSkWxrFEU87ljBnmfJBjYZDEUnkEdyUKh9SyAk6ZSgjhx6Gaz
 P92A==
X-Gm-Message-State: AOAM532LZwCfoVqVPnin4Cav6HXdWDvsJGstDB0qItqBTMUj2XQlI+44
 OYQSeGkcILcKYDqLvt0EKIoO7qu49rEyHA==
X-Google-Smtp-Source: ABdhPJwztqOVGeujWJdmOaCicMCajbL6crQePDnRgX5sryx49h1vuS8a7vSsRTr5VXfdshclJwcABA==
X-Received: by 2002:a7b:ce82:: with SMTP id q2mr5542089wmj.60.1624380924163;
 Tue, 22 Jun 2021 09:55:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/15] drm/panfrost: Fix implicit sync
Date: Tue, 22 Jun 2021 18:55:02 +0200
Message-Id: <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently this has no practial relevance I think because there's not
many who can pull off a setup with panfrost and another gpu in the
same system. But the rules are that if you're setting an exclusive
fence, indicating a gpu write access in the implicit fencing system,
then you need to wait for all fences, not just the previous exclusive
fence.

panfrost against itself has no problem, because it always sets the
exclusive fence (but that's probably something that will need to be
fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
Also no problem with that against display.

With the prep work done to switch over to the dependency helpers this
is now a oneliner.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 71cd43fa1b36..ef004d587dc4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
-
-		ret = drm_gem_fence_array_add(deps, fence);
+		/* panfrost always uses write mode in its current uapi */
+		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
 		if (ret)
 			return ret;
 	}
-- 
2.32.0.rc2

