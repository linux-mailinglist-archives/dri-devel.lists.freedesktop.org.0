Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685B3BC933
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865CE89E05;
	Tue,  6 Jul 2021 10:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB7899E7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 10:12:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q17so5015620wrv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=fOHKcRBrqDpQMSUxe0M4ZFMVRFmAgoabsGu0LEn0ogBsEAYugsDkEBBZRNnqSd+aQG
 ACJChm6bV1k+6vbmvnfIcpF8Pjf3RKqmW+gSJVIie27q/PSewJ5soKS3DzZMqoeR5o2o
 otxaZUkQD9LUP3qSxy7RjptNmWyhCffqskmcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=GmPvdUFe/OsNEjBNn7xtVfS/+0wtB6s/GuY2ne7HiWPIPvB0lwKZt5EKG+GDmO3w95
 wx9w5YmKBc6T9S+eE9dudhPo8JzeC7/wps5bAoSieh9Ig0fQ1KSjL2pwc4bvRN1Ico2p
 ya+c4WfmLMMIE5/457OQCF6SQpz0NTYEDX4QjnYdnjK6YPAjkvionRZQUf7rnkpun2yS
 4DtvUPTl2TRJG/arKRQy8pCYY1UIopjsKZ5eAePKZKRZw0EVXE6bBKushwqhSHp0/tO0
 3A/CtTZrWGZX7qALXKcjhEJ7w3u2XcPucUU5edhRU21LllJg5pe7/xb254lrHv9eSURi
 zU7g==
X-Gm-Message-State: AOAM532gPeR7Jv5oyuo6ZV0zTVXif5bb/StZN8RNjxFTXXIRrcMbraRa
 njkw0uq2TU3WaKy+A1pf/bfn/gwg+vv8gA==
X-Google-Smtp-Source: ABdhPJzRhuq1HqrzCBVXnJv+E7x6zUHp7tuCSXGXAIzhQ2SUN++Qu4ESB4yF70Ifgh+t7q4mP4C25w==
X-Received: by 2002:a05:6000:1b90:: with SMTP id
 r16mr12923636wru.316.1625566337206; 
 Tue, 06 Jul 2021 03:12:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:12:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/msm: always wait for the exclusive fence
Date: Tue,  6 Jul 2021 12:12:04 +0200
Message-Id: <20210706101209.3034092-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
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
Cc: freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
[danvet: Not that hard to compile-test on arm ...]
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 141178754231..d9c4f1deeafb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.32.0

