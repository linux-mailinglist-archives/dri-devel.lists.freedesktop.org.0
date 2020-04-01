Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A7319B86F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 00:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837E96E9B5;
	Wed,  1 Apr 2020 22:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05DB6E9B2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 22:30:45 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id fh8so691106pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKoeubHaEw5IDaekDlWwxnGlDEKb8AemSOiVG9SSdzM=;
 b=cGP+6uVmZBxE9r82Dr8+1CEhBq0o4CfabcFODfq/68NC0xeaGT7QXDwe+dA4eFf8eA
 lARpjxVAtUA078ZiPaNU0syHOekChmy82xXHVUnuGGZk6t6c16k8lQ0R1L/NcMBJNn4I
 sgTr2XbTRua5GlR4hvDso8PLACsYMpdCA2tdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKoeubHaEw5IDaekDlWwxnGlDEKb8AemSOiVG9SSdzM=;
 b=VkgMMG0E0wUhcZ88OJoGhoE0moGUPkTyGJqWMKSA/6DiGxE5wG1jrsdsRxCMYxAdk+
 J6lWnno8fPmeIstWQxSCvQY23Uk59b9gozliGTl40y/ZAHr1Mf5q3nJ4v5dkv1gMZn2W
 8Oo0zg9TkT7Bi2yGQLeqT+MueLHocr2c7ktfKZy6MXGfG7O8KF7Gsv+MA4XTPRomEREC
 GEH7H0VKtohZNFzeqRFmVW63rpzWPpb6AET6fDrWMoJPdpq/0exdUZcVsCj1LyB+UmvC
 5ezAbJE5MZwB5gY74wsuIqIyqaAULvi6YBe5VgcVg0QcTmmz/5qQO9+tVN+3+9xaRl/W
 qhog==
X-Gm-Message-State: AGi0PubPQpvbE8IrL9vR/Rhnhxc4uG/tiXLaY923FdXmE06hzEfmrZ0Y
 G1dHfXeEEZQAti2bXQObYa/RmN+1x8Q=
X-Google-Smtp-Source: APiQypLLTrLltTRyVm+eZLu40s9hHR+eoJA6AlVdujTqwqZxoutgMMjbAxhzltvLtAwV2nzG7JPaZg==
X-Received: by 2002:a17:90a:2147:: with SMTP id
 a65mr257136pje.176.1585780245265; 
 Wed, 01 Apr 2020 15:30:45 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w29sm2167311pge.25.2020.04.01.15.30.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Apr 2020 15:30:44 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/virtio: only call virtio_gpu_cmd_create_resource for
 dumb resources
Date: Wed,  1 Apr 2020 15:30:39 -0700
Message-Id: <20200401223039.2860-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200401223039.2860-1-gurchetansingh@chromium.org>
References: <20200401223039.2860-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to avoid this path for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01cd888c..82df066ac0552 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -224,7 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
-	} else {
+	} else if (params->dumb) {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
 	}
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
