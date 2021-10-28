Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE343E205
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015826E980;
	Thu, 28 Oct 2021 13:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57C96E971;
 Thu, 28 Oct 2021 13:26:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so8070010wme.0; 
 Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F0uECfBAkPnxcTaaBNKjvRgDOvagF9vnqC8sbabETVI=;
 b=A/4UogMjSc8zQovGLXoblqVKJOl8bYZcitPpecVLxmxRfG6GDEgCJRCSjTFHun0aSD
 imL2m4WTdRWmc/zh0qvyk7bguneOTAGSeOUv5Y+n+gfGTApaWRHLcLy6B4uR9do15sdw
 1XA2HJxLuTMqkAtDer2bpF8IjjnFQ+zZrlxF8PT99gjhjiShO8milE1ZJmsyFXSAdDbi
 xWCD8G9t683h5Yqk1TRUp1fEeEHp3xC8fSPXFELa82La/iItpIPTCwiWtJ9JXD4DC4x5
 fvLg3mSWULqYZuCovLQyyXzVl5HAgAqNzGW374YwJmUHQu8H7Uulm2ryJGPZVoaD/M+p
 gpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F0uECfBAkPnxcTaaBNKjvRgDOvagF9vnqC8sbabETVI=;
 b=gxP7VliBoUNw9R5fUwzSuCLr5/KmR3J3SDu8pDVm84WQrLTByD9LIKPdTL8kpkfXXe
 j+GL4QdXN9n7kdPL80UOUjj3wp3bXU73PMHQSdR9DHTaYntZDMl3az/xn6FEsBJqqUz6
 0XgecXe9gGysRpS18QgkmcB/Q+RyXhuiDsxsRqA/PlxKzZeLboFq7BZyNL87YAUHlbqV
 OvF4HEQ1lY0Hv6j2jBs7/xmgNRc817+E+NpO9VA+fwAyMeZTjQbnZdF/qC5P/3AflC3r
 S1xs/SVQupzGzPND35MVihMncVwpBeFi+t5Fj9vuzLVLvD9/oEaq4HqT3ncUVnWsea3l
 2Q1A==
X-Gm-Message-State: AOAM530wkfPN6CXe3clxGveJnIFISraMMCAISiCX34NLWvOC3TXbkY0i
 qy/pl5cAKYwrsmX4+yNNTxq95zXi5nY=
X-Google-Smtp-Source: ABdhPJxxWVtcxYU9iftgYazqCFP/sUSWmT5rCt1z6ncO18Obe7fDA9DTTFpIPtN7KUSLRq3trOGntQ==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr4590744wmi.31.1635427593520; 
 Thu, 28 Oct 2021 06:26:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l11sm2935695wrt.49.2021.10.28.06.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:26:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: stop getting excl fence separately
Date: Thu, 28 Oct 2021 15:26:26 +0200
Message-Id: <20211028132630.2330-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
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

Just grab all fences for the display flip in one go.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d58e37fd01f4..4da7eb65e744 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -457,7 +457,6 @@ struct amdgpu_flip_work {
 	uint64_t			base;
 	struct drm_pending_vblank_event *event;
 	struct amdgpu_bo		*old_abo;
-	struct dma_fence		*excl;
 	unsigned			shared_count;
 	struct dma_fence		**shared;
 	struct dma_fence_cb		cb;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..68108f151dad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -83,9 +83,6 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	unsigned i;
 	int vpos, hpos;
 
-	if (amdgpu_display_flip_handle_fence(work, &work->excl))
-		return;
-
 	for (i = 0; i < work->shared_count; ++i)
 		if (amdgpu_display_flip_handle_fence(work, &work->shared[i]))
 			return;
@@ -203,7 +200,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, &work->excl,
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
 				&work->shared_count, &work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
@@ -253,7 +250,6 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 
 cleanup:
 	amdgpu_bo_unref(&work->old_abo);
-	dma_fence_put(work->excl);
 	for (i = 0; i < work->shared_count; ++i)
 		dma_fence_put(work->shared[i]);
 	kfree(work->shared);
-- 
2.25.1

