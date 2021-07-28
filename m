Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBB3D8E7E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBE56E1BB;
	Wed, 28 Jul 2021 13:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3456EA9C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:05:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r2so2483423wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQ87wOwH9xOd6jFHhuQOQ/bBNNUz8U9SO0pUyg9uERw=;
 b=HycY6YxL7pJbO4B32kkg0MzBpOkzrIOW7tbPHNC5G3auVNWVa5rrvq26syPqFgi6lK
 btdgpkHoDGxFe8ayZy2fMnIJCRTxH5B0FzYOmnu1VG4T888iJzxQzr7HBZqDB4kV1ArM
 OFoZ0zgRzlJn4xPdPp4S+jcmR+3npE7B+XKc/LWgq9Ug8/bPLcI8wREkvueOV4Soo/ey
 RdPr5a98udfh5RC6LKVi4CfP1uf28/KedHpl88bSAYEujy8ttUbC+d1Bdr7UdtZntaHi
 9jr6PfbO6X9hO+k0wwGmBYmPkCa0CWI1QVqXfDYeTSPCbIdwdh5YX4EHP38wF/yJ6PYX
 EOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQ87wOwH9xOd6jFHhuQOQ/bBNNUz8U9SO0pUyg9uERw=;
 b=IKRg6W6edBcSKLkKtvwPrsSK+KyC8lcZjJsk2Ka/Apd6ZQUjNl0br8LL9lGP+0p0Ji
 341euMSjGE/fdEC0dEPQHOcp0Puql0rbgCQVKsgbxDt9ljQNax+9TesuKkK8S34swDg7
 VQgjCvglb5VNxFJiWWzux8QTWw8nO7JLNGgnCwPsJkls79ZFpoqMnneMEzVBEO9mH+L9
 ZHOAWcijntgmL8t45yDGE6t7If8ZBLBE37FAFGp6LGmmFuxYClz4ReA+P7d0CMwbjpL7
 s9r9ZM+9kA1tpPYB/XBr2ewR5MUQBCsJNRiatKRxlQj5nZetQPk2mSCjNp07AVOHMHvd
 LWew==
X-Gm-Message-State: AOAM532xH00AIcbhiMTXLwYWDy3xeJPECA+iqFVM1zkm0kAGo/rqTc5N
 rM8LUOviMTQYp8+2uDmOMXA=
X-Google-Smtp-Source: ABdhPJy7O3O8jpBtZUn0T3+7TbLUAXd/Q1DGYj3KXBh1JfaJn3jdsb4+KJGQlZM0kP2pxyZ1yFdfhQ==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr30715894wrq.170.1627477553636; 
 Wed, 28 Jul 2021 06:05:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a03:ba57:3127:59bd])
 by smtp.gmail.com with ESMTPSA id o17sm5867374wmp.31.2021.07.28.06.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:05:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Date: Wed, 28 Jul 2021 15:05:48 +0200
Message-Id: <20210728130552.2074-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing this in vmw_ttm_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index b0973c27e774..904031d03dbe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
 
-	vmw_ttm_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
 	vmw_ttm_unmap_dma(vmw_be);
-	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
-		ttm_tt_fini(&vmw_be->dma_ttm);
-	else
-		ttm_tt_fini(ttm);
-
+	ttm_tt_fini(ttm);
 	if (vmw_be->mob)
 		vmw_mob_destroy(vmw_be->mob);
 
@@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
 						 dma_ttm);
 	unsigned int i;
 
+	vmw_ttm_unbind(bdev, ttm);
+
 	if (vmw_tt->mob) {
 		vmw_mob_destroy(vmw_tt->mob);
 		vmw_tt->mob = NULL;
-- 
2.25.1

