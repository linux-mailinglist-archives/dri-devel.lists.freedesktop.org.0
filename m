Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50745A560
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8596E848;
	Tue, 23 Nov 2021 14:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526156E573
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so2094694wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=oh/rTKJa7q7MBdD7KnRP/2E+q5ITp3UVnwYEL/Dc366iJpn5w7ze/43jJgObxeontv
 TV1Lder2M71UqpmBR2g8Y3nr4BhGjDgeG4Fh/ydEb35zsctop+uR8aGNgnDzLAiU8eUP
 G3wLUW7E2+1iF1gUzgSAEHQrv8rEoOgwyLUyAAX0kXEXyeB8OH+LsU+K7Lltnu6WjRVu
 jS14Dh80rYQmWn7yFmdRXIvX53ACxrdgZoD+HtEdVTNs5QhJO4lR0WY0wrgfBg+PAwS7
 qObzEDAw+32Hs/DW3RAl3MW4PaVR6MfmbqYtDzo3MZfDmWspVRdmUlfaY+uKcAAPC0Xa
 0iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=iVnE0viQcxKi2nmMrLuQn8ZmCTRkSxcn2badu5nRi3ik5+DPypDqUQ2PqRFqCyhkSD
 azYej9LH+dmoGq5aLKny83nCeOA19zORR+6g4wfyZdziJ42vYyicgtGpcAWxo6X6KdJJ
 rphCNAXdHeJLSwJJgBLNXGjRe1EpXCiH8XVnm+rgnI4sAZdClVmBvxBPDcXxMSdgHp8K
 0ADgpWYuxwcn8NCKvkoFyH0OLTJIZ49F8lIjZFJXHmerhFhpWsroH7HgicQtmDgNm5kJ
 KruDpzXWcwyiqM6Q2XCEpeg0yOKcWo9C5JXkfHW9eMM4ZTsOIHbKjjR0pBQNdX3zyzvo
 jTig==
X-Gm-Message-State: AOAM533fOu7DdGAsGKOaJ/ESlH6g76CK54pi544+J0IyqEiE7wlnlcfz
 YWm27nps8xhv5t0QT63zJII=
X-Google-Smtp-Source: ABdhPJxZNYWUTmSHRmW1N2dM7XUNic0YwGfB5C5dAoDF90ZbMxwVuVGVxS/MWIjJMy1ULKsssYTcfA==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr3470222wmi.167.1637677294799; 
 Tue, 23 Nov 2021 06:21:34 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 11/26] drm/nouveau: stop using dma_resv_excl_fence
Date: Tue, 23 Nov 2021 15:20:56 +0100
Message-Id: <20211123142111.3885-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..74f8652d2bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
+	struct dma_fence *fence;
+	int ret;
+
+	/* TODO: This is actually a memory management dependency */
+	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	if (ret)
+		dma_resv_wait_timeout(bo->base.resv, false, false,
+				      MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
-- 
2.25.1

