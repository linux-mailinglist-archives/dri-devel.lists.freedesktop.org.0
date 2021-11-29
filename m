Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C5461496
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651976FA64;
	Mon, 29 Nov 2021 12:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1EE6FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j3so36293352wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=VtBjAPe9K43fAJMf6bGEWuAz94uvhQvclA4cRn60BcpnZ4v/mL3osWyzE1Ayj0EB7X
 zjwGsRpYqwem20cQrLRWzEPlvn59bRYgbfRVnix7qnv0LTDP0TNUB/S+T7g85toEmirE
 yBvhLP4Hmi/LosJofo4Ofe+6N8wk5qNyS/HFp9g7G7kvkokcK6p12vMoV17+j5Vvol6g
 yzZombhcNMvOcS6kWfJc5zVQAjdd/7f6GqYmDLkeYVBImgycny4hQk+f7CvAEWdqRB2e
 DOWmFcRLaS9mqaPjOIg4PFCYNtCMPzfi3eHn+2mwKpkOoU2I8jBaah8vQzMTmKXazrVI
 oHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLhcJ6c+gStaRG1gv+P6ttqcHjmkscgCl8MWmUQCq2k=;
 b=CSUjzJjKkAuq6xkbedZL++qr1DcDH1X87JqJnwLC8yFcS8S4P4om7IwQahG7RopVpy
 mpSkgh5caBb+ji+ebPQCN6JJYYvSEYuGKHszOpn5faYs+WuqPwGN2dUqjPzaIs53Th7u
 /z+HLYgWKyHD6nmWKGrhCzkhsvhop/x1BZrvnBF12Ny5a8YV3OmmhjeNSFZIawLB41ut
 6jOa84qjAtirnD81P78tGxpDdDUq2trghgz0ngwRIFzhJeJLj7Z6aNzMY2Ko00GlSoz4
 yA8fg284blH7bWPQwi0dq8ie9ko0xxx1c0P25yrfGpTedI8EITlplwohL/wbDdpHsCzh
 vWYQ==
X-Gm-Message-State: AOAM532ZO1WdGl0ZtgGlOf7yogZpdUcrDfNz/R9RnX3thBPoT4TTEkJm
 OYlBohViaMBB3EBtLXaaWok=
X-Google-Smtp-Source: ABdhPJyuChUJ4YecssetUAuuwF7pVzUNY5Ixq3BjLc+KhWYFiFkYOJ71iuilY6estwP8RlwDu3Oe7w==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr32861049wrw.591.1638187634459; 
 Mon, 29 Nov 2021 04:07:14 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 11/28] drm/nouveau: stop using dma_resv_excl_fence
Date: Mon, 29 Nov 2021 13:06:42 +0100
Message-Id: <20211129120659.1815-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

