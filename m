Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E8438C2BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B516F5F8;
	Fri, 21 May 2021 09:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782856F5F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so6746630wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HABPMdXSrKsW4uEw0rscNeUzj5fp9ApU11szDLOfF2g=;
 b=fXNUkTfQQylHve4e5q7hej2PfB3CsxTiwKvzcCa0DmQnFmgJgOxLi3L3xKRECoS9nf
 8asDsKAzfQXRUIArgbk0BFuIwPtkPX0uk4ZgG0KeL0UFd364oeAvvFjkw9q6URsV7GNa
 i467cpK5nxrW+8LWbSddPOQS5DUODHlMEhX8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HABPMdXSrKsW4uEw0rscNeUzj5fp9ApU11szDLOfF2g=;
 b=fMnLdcnbPOK624kYs3uXEsG3hA+w6CqDJn77TyRZPNfx7TtFL+nksnuEXY9J/8Dykz
 iw22vM2ZOJWhqG2xdMibEQiSw4q8O1RXy+EeI0uWU6EAzygpneazmBVLC4q/iQeV8oJa
 +vshkjtRnUmYP0PbWYHYj2q4jEVcT8D0vgUAlkGqS3uLPdSbtfO3LggPZelfU/kN1Xcq
 ipATf9Aldxa64heXk2kJg00t0mvUctBy9jpJBJpwkEb/e8u0n8wH/p0VqPqk70cCXRBK
 4tNjEaOTyuTVaIiwQWo/JSBfKfWY4IVXpwHbG0kIBxFYItzpE8NRo9847vMTaz+Q6KSy
 Q9oQ==
X-Gm-Message-State: AOAM53193YFzf0yRUkZpXuA2YQ3iNV+O+VliQRyievv2k/c9NIbRZxGz
 QkvhhC2pNt0VBXTQgaE340IAWrDeDWdW7Q==
X-Google-Smtp-Source: ABdhPJy4AppsKMSYrINJJ5HHtcoyKQ5HCs+pp50JtN605hKrw5dYRryDwHmn4jAzZiOvi2dJ36vjOw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr7986141wmj.48.1621588208292;
 Fri, 21 May 2021 02:10:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/11] drm/panfrost: Fix implicit sync
Date: Fri, 21 May 2021 11:09:52 +0200
Message-Id: <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
index 707d912ff64a..619d6104040c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	int i, ret;
 
 	for (i = 0; i < bo_count; i++) {
-		struct dma_fence *fence = dma_resv_get_excl_rcu(bos[i]->resv);
-
-		ret = drm_gem_fence_array_add(deps, fence);
+		/* panfrost always uses write mode in its current uapi */
+		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
 		if (ret)
 			return ret;
 	}
-- 
2.31.0

