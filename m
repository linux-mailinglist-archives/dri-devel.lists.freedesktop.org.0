Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848F40F7DF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FD86EC5D;
	Fri, 17 Sep 2021 12:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7816EC46;
 Fri, 17 Sep 2021 12:35:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q26so14925529wrc.7;
 Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ia/BXArBzSo5qPiEzEa5zvEcCQIRTZj8N0lxekHwmwI=;
 b=l28NLQta/6LZmjFira6x6hBmN6dKFHo7l6S1OF757Ag7zBeYzOXOsbRDVoH9q3pmet
 GQTZnUoFNuuvtSD0iw9zqZP37/cwS3phSK+KTnF6sorAGcHMW+GndrCOAKz4cYq9X7Jf
 OeMnQqOV1SRqHKiLk0Btb1BXLMaZBUfmd4pwbtcuwnyype7KzVElH9kas883I0JAwcaP
 rVPBkUoA8qv+rfFeUjAAbfsngIphcbZjIQLcAp2+Cli24cVheLpMjfWrD5Op2CxuUTNs
 nzQKXUWRfytQFFccG1fwHnWQD3zL0fGcdMvVrxiO8iWvADAW87EQZel//vYrwzU0fLcx
 KqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ia/BXArBzSo5qPiEzEa5zvEcCQIRTZj8N0lxekHwmwI=;
 b=C8AkJHUH8ypw4UOaTtKRSZ1PsQS1YV3/nAXlcsvzQwzPyGEPLgRnRMtwxkwJNLYipT
 b2BG7j6dCX13Kq3Fgl8+k7sCgRUNAArfjaEJsJ9R3JMnkh77os9iea+T8dPvtQYbVWYo
 MuX7SKN08/Plz8j/mReXb0764IZw5tuDID2A+WC1STEI/NRCJ6hW4igDa4ok+GFAC+df
 AYyk6a6dX1hpoHPywwSykLov3+Oenwgvm87I0elEa4/Aqb02zosKxI63ENXX0uPJRWSS
 piFXkzvpJ9pkYx+B0tywQchG7pkZCDLE/4fVA3Z1ujCyI0tgJERzXdGdzdckX2Nt5/FE
 RECA==
X-Gm-Message-State: AOAM5314jKM0Ao0gPIGFCLFA6p7Hflj983BbeD/T9OKlzdexDn+ItDfN
 12xShSeVMMeFEykzR1MuxEQ=
X-Google-Smtp-Source: ABdhPJwHB/pYnsex5U2dINaNbU/mxD0mYLE7uWX0oUu8MqBCU7Lxq9wRahgOXOsody97PreA7tSz0w==
X-Received: by 2002:adf:f884:: with SMTP id u4mr11415641wrp.411.1631882122116; 
 Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Fri, 17 Sep 2021 14:34:54 +0200
Message-Id: <20210917123513.1106-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..7d804c0c69b0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,22 +269,16 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

