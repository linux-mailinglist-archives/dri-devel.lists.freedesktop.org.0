Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE286746F1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E62B10E28D;
	Thu, 19 Jan 2023 23:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D6C10E28D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:12:51 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 78so2819898pgb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2RYDaQakvnKQMHYWcGZyFzWZGbJWcAlfnMO9tuHV3GY=;
 b=epTqo8/GH4R2BQ1E41zW0K2lvL4E85jVpNh1kazLjYlZomZHpWFKvEFc4KP/4voUKd
 oDhHR+qTm44ZJMscqbp0SfNGv8dpLTjJrGf6zc9u+k8MfUxoYkzAysCdAXkEfhNF6cvx
 Yusdvp/Sk+TielCZ2tVy0bscV2eA4K9apqu6MUQS/L9VxcZM8E/baAL3equmOEof5AQ4
 saznbLELNR8lgHkg19njvaR0GnJTyBSF7VdEizP2eN9BDYX6R/hrdTgzNMstSSK+Lf4d
 V/yV6c4o9Bi6TZf5W4nbd+Ypxyd1T+J47XylPXDPYDy4kBBagHLd6Vc5ULBejQ4lDZQw
 rPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2RYDaQakvnKQMHYWcGZyFzWZGbJWcAlfnMO9tuHV3GY=;
 b=gSJFs6ON1cWKAtMHKi8CtrAJ5omRa2jwVi2Tntot0JAevsYz6N2MGH+UJ3LNbfATn+
 t2OpVkrh5Z3O+OzRMkm6YbYTn7EkL2bFnav2GNm4dFh6dLRI4mE6WCHe1WtdUZlZs0wi
 CpyCZdzZXhK91XVJa4fnUGyn7qOuBfxt2Scf81fQFxRVP7/v5I5OYfCr0LKcBV6ftRnp
 do9t89VGw4rQPJ3mZ5jdm7J12onbBgjNDBZJKd2ZSHsrvU9GWCDSQg9RTz2VDEPO+GWu
 J0aMLKpwZggmyyIo2XxJNUsSA8vKW8UGYPQ1cGNbbb/AFXTFqx16+vynT8HwQQj/zc8B
 rlEg==
X-Gm-Message-State: AFqh2krl3D612rZVJSTIcmtTRVm1A3MbJ/a+uXP/qZI2A4WtqzvDBayv
 uo4zVyBuMdBuHAvAKB87RxPQVI1Cj0E=
X-Google-Smtp-Source: AMrXdXtKgRFPXBVj7R54nnGbw4vB8/Vr/7TKyDxmjIzRogqEFN1wo2iKN7Ikw9yCjJDzqEPqZPq7ZA==
X-Received: by 2002:a05:6a00:1d23:b0:58d:a91d:e9f8 with SMTP id
 a35-20020a056a001d2300b0058da91de9f8mr11154285pfx.18.1674169970704; 
 Thu, 19 Jan 2023 15:12:50 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z189-20020a6233c6000000b0058de3516c3esm4241259pfz.142.2023.01.19.15.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 15:12:50 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Drop unbalanced obj unref
Date: Thu, 19 Jan 2023 15:12:55 -0800
Message-Id: <20230119231255.2883365-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>,
 Mao Huang <littlecvr@chromium.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the error path, mtk_drm_gem_object_mmap() is dropping an obj
reference that it doesn't own.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9b3d15d3a983..f961c7c7456b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -169,8 +169,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 
 	ret = dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
 			     mtk_gem->dma_addr, obj->size, mtk_gem->dma_attrs);
-	if (ret)
-		drm_gem_vm_close(vma);
 
 	return ret;
 }
-- 
2.38.1

