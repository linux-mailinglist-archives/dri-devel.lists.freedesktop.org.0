Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1938276525
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2226EA2B;
	Thu, 24 Sep 2020 00:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB296EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:31 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id k13so769980pfg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=T+iWSrNpZNCPbnf8bYXa8BmegptrRExKOUJ3xlsbarjYY4+Q6DBbJ7eux+zX8+tC4b
 8JTIDo2VeSRm2tYdKvFdhqhOdeVH1AHDoFUSSaMR26QU4VZOEgKdSETWEq0fROepZDa/
 Ew7SHvZM9y/kYapomaIPLA2H7mXP7wYnmaXQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=dXjm2UO9zAFKUlO4LZAGyZqS/IL01APRSqAX2dDr9FvQox349fWwU3bvNz/2Am1+0u
 bHvWHH9g5cYmdzxPYsiTAx5VkyWswtF4rkOzWXCvFYute9yjem9spyP5Nle71hddA1lB
 wgnmsgtgtCedgiSZxGW544yKXjxBssVYFR6jFdhpJfSh3O+vTmcoOTa57ZhCoYYK+5ZT
 bFFhI99u2vFUSgg/76cBJ5+6F7UILET80xPc4natAuUGuiRcMIXizd4xfdJDRCC+JJ+L
 IPwVFbRlAjRKnrzPoKCzy0JyTTYK9a8GJHoy1eMriTV2Lq8W2LJzwAZPXWFvivG/od5g
 1+Ig==
X-Gm-Message-State: AOAM532QbT0SG8+M/z/XtKKtC+F98N9FpiEPBQ82g/1D35O6AdsMmrFl
 bd7K2aM/DvIKDyxXyN8kqgIvYnchuDNe5A==
X-Google-Smtp-Source: ABdhPJw7kCf4V3Tml2u0/P4O5C+uM+g+r0TzgarxZuPE/YJAm3SNAFKqNoCykMd2n5XWNVaR5Lr5xg==
X-Received: by 2002:a05:6a00:792:b029:13c:1611:652d with SMTP id
 g18-20020a056a000792b029013c1611652dmr2076098pfu.13.1600907550570; 
 Wed, 23 Sep 2020 17:32:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 14/19] drm/virtio: implement blob resources: blob display
 integration
Date: Wed, 23 Sep 2020 17:32:09 -0700
Message-Id: <20200924003214.662-14-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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

SCANOUT_BLOB forwards the DRM framebuffer metadata to the host. The
modifier is intentionally left out -- it may be possible to query
the host for that.

We also assume one blob resource per DRM framebuffer.  That too is
an intentional simplification.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6a311cd934403..42ac08ed1442e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -174,12 +174,23 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			  plane->state->src_h >> 16,
 			  plane->state->src_x >> 16,
 			  plane->state->src_y >> 16);
-		virtio_gpu_cmd_set_scanout(vgdev, output->index,
-					   bo->hw_res_handle,
-					   plane->state->src_w >> 16,
-					   plane->state->src_h >> 16,
-					   plane->state->src_x >> 16,
-					   plane->state->src_y >> 16);
+
+		if (bo->host3d_blob || bo->guest_blob) {
+			virtio_gpu_cmd_set_scanout_blob
+						(vgdev, output->index, bo,
+						 plane->state->fb,
+						 plane->state->src_w >> 16,
+						 plane->state->src_h >> 16,
+						 plane->state->src_x >> 16,
+						 plane->state->src_y >> 16);
+		} else {
+			virtio_gpu_cmd_set_scanout(vgdev, output->index,
+						   bo->hw_res_handle,
+						   plane->state->src_w >> 16,
+						   plane->state->src_h >> 16,
+						   plane->state->src_x >> 16,
+						   plane->state->src_y >> 16);
+		}
 	}
 
 	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
