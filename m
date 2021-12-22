Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8647CD82
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 08:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73DC10E984;
	Wed, 22 Dec 2021 07:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC2A10E984
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 07:26:56 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id v13so1595052pfi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 23:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=YfoMqAE8tP1PVqVojIPRAkfs6QhYxWvNRbwDdCnoJaE=;
 b=bk1AcE8D6fHgrh2xY/U8jJNak+zHpXEpWoas09GyMYrFfw+XUnlPhnbUcrkOs5HDo/
 VA8YI8vRoBvlXeWl2euYPl/9BfANeHecDBIdstogljKz1jCApdQ8M929xjckdI1BvJ81
 ShI1dxmrflyrOyEStgmLNOOPgHZF1gyrtDavPyX7vUH0Y4NChIoHc+yPvcja+BQa8zm5
 16nStKO65JWu0TQ0OElai0FymdxcfFQ9T8ciNd8ppAjBr57gWy6Bt0PFg5NKEyH/ev3K
 uSP0BGVyhjlhbpFlO/4MdnFHHPh24tQO+0TYvY+yYneOSxn+yGexLShE5wl5E0Ib1h6l
 Zn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YfoMqAE8tP1PVqVojIPRAkfs6QhYxWvNRbwDdCnoJaE=;
 b=4cPeePAIHShsRKGXdiYwLhdujY6R9i5dJ2jWX5ksJmkSS16Ce3CCzk+J7/14+uccUn
 nR6248UApU5/3OSrjHC21obO22qEwGXCJh0D1kjsaMjlY35GR6/485o4brZ7Zb32jeVe
 3gn7HNB6y1KJdMJk6uHtIS7Fr6Ib25UYRMItOLpGHQad9Ne+Yb6g+wk7gs1TOXmD/tZk
 KolTyfQ4zA3i1GL/yEWWV6G9Nfxa2n+bfefO6DcUg61vT379Rq3d00bMKZrWzQlr/b+A
 hWnEtGda84mRN1oG3392v7776r+3Plp+HS0VISQpbLiz+TJ3FcXJTg7HFhjZ6iUvGZ4d
 dVjg==
X-Gm-Message-State: AOAM532ftAZrKTMgz9o7/z3apEjJmV5nEcip9+s2OrdCQTRNgtuByLGP
 j7LVDZviUQmCb9Cg2ZFPclo=
X-Google-Smtp-Source: ABdhPJzgxQitXRab/a18M4bP9QRCqfcG0/B+iALRX+rSqC0szzStk4z7s29LgNoaWILlDlz6pngOeQ==
X-Received: by 2002:a62:c103:0:b0:4ba:75b8:cf69 with SMTP id
 i3-20020a62c103000000b004ba75b8cf69mr2026651pfg.64.1640158016496; 
 Tue, 21 Dec 2021 23:26:56 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id q19sm1463187pfk.83.2021.12.21.23.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 23:26:56 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/virtio: Fix NULL vs IS_ERR checking in
 virtio_gpu_object_shmem_init
Date: Wed, 22 Dec 2021 07:26:49 +0000
Message-Id: <20211222072649.18169-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since drm_prime_pages_to_sg() function return error pointers.
The drm_gem_shmem_get_sg_table() function returns error pointers too.
Using IS_ERR() to check the return value to fix this.

Fixes: f651c8b05542("drm/virtio: factor out the sg_table from virtio_gpu_object")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..8bb80289672c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	 * since virtio_gpu doesn't support dma-buf import from other devices.
 	 */
 	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
-	if (!shmem->pages) {
+	if (IS_ERR(shmem->pages)) {
 		drm_gem_shmem_unpin(&bo->base.base);
-		return -EINVAL;
+		return PTR_ERR(shmem->pages);
 	}
 
 	if (use_dma_api) {
-- 
2.17.1

