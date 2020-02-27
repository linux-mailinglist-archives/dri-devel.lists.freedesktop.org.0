Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CDE170D25
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5196E34B;
	Thu, 27 Feb 2020 00:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09CA6E483
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 15so219115pfo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UTI9eWd6mkMFrDfjU07JVyhb05rE11i4KDIk9WaxkqU=;
 b=Izx5b+HNjRgzvsUlk6kjfVrKyYu73xf1wor9KKHa+hsGE7ANJedM9xrd9Nf9xGkNxb
 lCT2pAJtNkM8DWgceRSsuL4PyJHYbBe2UIg6/6CyZeOH0fBWLk8KpRy4bj+aXaTW+Tn8
 /uSnQJCnr5ciiyY6pKyUpue/j3ibgtpkiIKmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTI9eWd6mkMFrDfjU07JVyhb05rE11i4KDIk9WaxkqU=;
 b=cBgBBBpwF9YEVq38an5cg7kDJwwxOK1gVz8BfirhNhgdND9udGxkftROakN4voPahH
 Zf/nAWwX7V96kTTUDGUZFh9hklvvIUvixF40tbB544aaNj/CmEdBgAS+B147Gz466hzq
 6rkdltfMpSYkB9i7tXN7JB+DS1MTvP/KhvQ+LsffaRBQVeoX/sHt6XTl8fSptbzJi6Re
 IFRCOZU5AtcDakpGvPIjomVIVb/uoHsPj5TosShHzAklLYYiM8wE177mX/NDExGGeOcQ
 MxokuPpMqKUFlaYXOuUpxGiCuptT2H3w24lUTTudF2oinqCNlQHvKiAOzyjXdP1OilmQ
 +eCw==
X-Gm-Message-State: APjAAAV7i0f0fDFozBZD0O7RJpuyYlCKTX+QdqEy6go3EThXIYJ7+Pc6
 Feqa0VkhXUvKq0jcek1fRM/2Yl7ZPiA=
X-Google-Smtp-Source: APXvYqxd97UcE2oEOO1cZGRP+GJCGCsCJe4/lgtB50NI9rUxGGnp1otAyeHjWrdbISvpuM1nY7M81A==
X-Received: by 2002:a63:b48:: with SMTP id a8mr1004067pgl.73.1582763168196;
 Wed, 26 Feb 2020 16:26:08 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:07 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/8] drm/virtio: make mmap callback consistent with
 callbacks
Date: Wed, 26 Feb 2020 16:25:54 -0800
Message-Id: <20200227002601.745-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a very, very minor cleanup.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 3d2a6d489bfc..07de3260118a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -106,7 +106,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.get_sg_table = drm_gem_shmem_get_sg_table,
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = &drm_gem_shmem_mmap,
+	.mmap = drm_gem_shmem_mmap,
 };
 
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
