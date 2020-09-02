Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E825B5AC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56676E959;
	Wed,  2 Sep 2020 21:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2DB6E959
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:17 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id m8so393002pfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=WQa3oTXmrRWndbVgJ3ByrlGj0YmL9qh2RpBphNvyz8ofphis6VCmvSQ+1ff3cOegSx
 MqJE/+p+Ed9ggqJRJ8mX5+iamWGMrOTVUy6KC6e0ov6JjOaRpcWwZgZzKKlhbtdz/De+
 cOSicC2eG3uMhE1fEHHm7e9yi3aTUaJKkfSus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=NdsUt6Z9Zy9yeTbrG4bzPYLyAyuXhnJyBjFtV+32iqmNDtFjHcFC/5DJ1MdVN1PbcR
 ewYMDSFs5cc8Zjcr4QkN2eLIeg1vnFYhy1IP4iRNPRi6clU8BMoukeoGe0CIzDfNTTzE
 +wXMpra0pust1xFKzQLlXE/6MuKLvcfTPOJID1Z8X4EFHSufydzIh+Pu4hR/UMKpEW/L
 oNRR3ddMwQ09d3Uhr6edTzpdmfkVXJLtJgdq/6yuzHOPQeR26X5OVHbrc34S+HA2nhW2
 VUdu9WktfDdHo3xpTKjxCREUWCJapYZdVMKQEEwAmVmDVTLZgJpKKIhHpioyZ6D3Dx1B
 2hkg==
X-Gm-Message-State: AOAM533iXLl2XnBpveuuOObPqfsuKQW3BlQ6du8C6jkY09LGHKJf4out
 rTafzo8PPs/HL5wqDIV472x4qPU7P6ulwg==
X-Google-Smtp-Source: ABdhPJy2Cp13g2MzUXOgHefrKWTAJFpkLvUmerIsnaQLVQMfpt63PVcWT120g0g6FoXwerwwBU6+mA==
X-Received: by 2002:a63:e010:: with SMTP id e16mr3248792pgh.202.1599080956859; 
 Wed, 02 Sep 2020 14:09:16 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:16 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 18/23] drm/virtio: implement blob resources: blob display
 integration
Date: Wed,  2 Sep 2020 14:08:42 -0700
Message-Id: <20200902210847.2689-19-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
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
