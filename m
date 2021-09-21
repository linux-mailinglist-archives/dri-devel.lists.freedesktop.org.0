Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB841389F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3D6E9CB;
	Tue, 21 Sep 2021 17:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C06E9E2;
 Tue, 21 Sep 2021 17:37:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w17so33491526wrv.10;
 Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=OdZW+PfRzgrlxVjfo5TXSSRU1Vzc9VwZlZNm7YtMibzcCGVVUiDh/LcmC8BAepp/dm
 0zBTdmPx4VlEALJ+59YfuNyzGSk9qvfJ/TqXtqaUzBuxW6aRAsCH8OtpOc5U3RoIlK3W
 gT4BwoDzEK8RTeeLeAWRw6QjBeo0kYar1bLUErNG469+db/uhmhLGFPJF3rubMnui1tB
 9ZQ1kaDms1SL/x3gwuZhh769t+9nZiJz5j9eRGaRnLwEYNJ/PchAgIVGNHbUMmuY1XkY
 Jm4LA5+Mr6Vp6H0G0ore7LEqnZfi8LqxpWtCNbk5EhCLUj5FbNCFP8ho/xYQRU83Aw2Q
 KtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=vOGpmtVHVgfqUbiYg5sDw8DAD94na1k4SegoZW1RWNiORxwKZ5IkGAHb6mXMOiPWeS
 HnsBLw4kSvQ6TRBs11ZqYhEx+IdHaUyGMIgEhNXq8GpX3yNaPBPJ+GGKU7HP5Aa5vP5Q
 5X9zqiWjemum8RJWf5+AYzoZX+doJOzQ4mA9ta862w+tEZRv3P0/96QrEfnyP1Hgru5i
 zTCHgpSs3871xmAKuRIq6CS3632vOUArVupMtWKpqz+hjcy4WpFn/FlHay46YnSXcEcI
 a/r+OPcjWWapCbTC64woo9ROQTLJtJxwnKtfatpU42EsnsXC+Uxp7wrHVhvhtoOktED9
 d/8w==
X-Gm-Message-State: AOAM532IMNJigKl8CpEz3lcm3rmyzT3PiIaovpYngDwufIRkhBoQ8f61
 rXU/Usst67VJxvZuvcfpT+E=
X-Google-Smtp-Source: ABdhPJzfEkVN1WbVC0V7qUCQDGsZ5/tjLsAvTQKDIeoLa33W3vnBvshbSRqX9qiMyIQ/Bbv2k9e+rg==
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr36265877wrx.413.1632245841278; 
 Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
Date: Tue, 21 Sep 2021 19:36:53 +0200
Message-Id: <20210921173659.246165-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

