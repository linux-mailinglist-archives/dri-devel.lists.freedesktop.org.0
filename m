Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FA887493
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 22:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9533910E037;
	Fri, 22 Mar 2024 21:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DE+xW5fL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22D510E037
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 21:48:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1dee5daa236so18764195ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711144102; x=1711748902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQK5tb3Nw1ZoxZ8aMrSXrErJ9rtnHZb1a9z7kXmUAAI=;
 b=DE+xW5fLpGHfYjFEbgPvw+N/nF5Vfm63anXFjzw1nFoY9MH1psshD2EWtfR3LKk2Fn
 SvhX6Heg2WrStJpOSFEJuovNe9U5d3eU7eZqfAMPujhnWrgFuL41+ZwMyPqUzMMnZ1Zl
 OFnsO8DC74sMNObkVWRmzCbKUaT4+gnkgR/MqtvzJvBpl37F45xNmsbWzipdiQTgS+qe
 bHL9hLhfKL2yFnTtrcUR0R9ubCUHPeike2dI9QGFMt9RIJHwVj1gHzUOSsW6VIxbtpz9
 C9bQpnz7H7VYImRRJ4bX3iw7t1nLeobmGJtHTwai0+KJZlhtCI7AZpE20q0bywuM7pgC
 Rheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711144102; x=1711748902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQK5tb3Nw1ZoxZ8aMrSXrErJ9rtnHZb1a9z7kXmUAAI=;
 b=e8JKUfwVFGLtPMY6Isybb7ZriYpyQnnkvIYL0YwkDdsB95yxyOtMdnFXGx7OLLafNf
 tgbWDJO8+0Be3bUAxmvFEtazVtETwp1MDTnusk/99xCLL30zBXDrORfYGSV7fa6ADviE
 ECkG7g+pj7PXZpKr5ixFCMSSuQfqWXzBEqKQDyFIyJ0P3uq4EAowskCOaldtq3qJJfjL
 E0zuzw76AbOVYpr05vN2+WdKqblmTJ0aki0JG5PTYmgfkrUFf9ysCwz1479FFwi9V4ZL
 1uwFixmX+j0EVePBCr4qK5BSTCGsItt9WFicprn1fFKcNME+1KWqpWw1v0sE1/DO6d44
 NByw==
X-Gm-Message-State: AOJu0Yx8mmTF1TcewFxiMUjuj8P8rEOFa62BckTmXBIG/yZUBhFFpatU
 Vh14o3Mqs7vBercr+/esNxlWyk2+34hk2E4L431EEnRCxdZxg7sead8tqyvB
X-Google-Smtp-Source: AGHT+IFu6vLzMaYsKuds4uUemNeUEL9Iv5gz6ZsPkXFYKeQTEq4g7nV6vk/JeeIFbxe7CJ53DpsPaA==
X-Received: by 2002:a17:903:944:b0:1e0:84b5:d76 with SMTP id
 ma4-20020a170903094400b001e084b50d76mr1175359plb.52.1711144101986; 
 Fri, 22 Mar 2024 14:48:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b001dee4bd73e0sm226385plg.59.2024.03.22.14.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 14:48:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>, linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
Date: Fri, 22 Mar 2024 14:48:01 -0700
Message-ID: <20240322214801.319975-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
they also don't use drm_gem_map_dma_buf().  In fact they may not even
have guest visible pages.  But it is perfectly fine to export and share
with other virtual devices.

Reported-by: Dominik Behr <dbehr@chromium.org>
Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_table is missing")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 7352bde299d5..64dd6276e828 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	if (!obj->funcs->get_sg_table)
+	/*
+	 * drm_gem_map_dma_buf() requires obj->get_sg_table(), but drivers
+	 * that implement their own ->map_dma_buf() do not.
+	 */
+	if ((dma_buf->ops->map_dma_buf == drm_gem_map_dma_buf) &&
+	    !obj->funcs->get_sg_table)
 		return -ENOSYS;
 
 	return drm_gem_pin(obj);
-- 
2.44.0

