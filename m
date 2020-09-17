Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E426CFC9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2877D6EB55;
	Thu, 17 Sep 2020 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF36EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:55 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id kk9so297045pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=fOx/D8GcJQeLwKd3lPJ9kuxzOoKMnUtNb6b7PjeY2VXGdaswqVCVAmFo9+MPaSYwDS
 qtdJ2BpvV3UbcFFJZdR6zi0Df8xDF3mMta9/7ZueOJd1AGgUMGhUSy/kNdvI1hGuEA/5
 GkKF7lYFAslYy/skPHZ96hZ4GyssHN2vkPHic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOXDdY1Dj7RStxqOavoh+pSLQdK+vdGARXnQxUkS1Tk=;
 b=NIfKiQZXcI7GSfURrLZ6sIUWAFvuAeDgTkxQIbw/ja9AZ5ecTda0pW+CdvowkCsw+0
 V7dUYwNab6pSzO/gWzR6+/YVG7VAzWpUX9G1PFnb0dPcSwjgBjwYT7AVd8XxeFEhrIYk
 +RyKEIa3vtKwHkVGaTJpxsiaNi3qUA4bZIqLCtF/B9KFBwkfBLXsZvhVTcnY36XjZJxc
 qxKBz4ZhC2Klbv2/rtaGJ0KRHYJe823M557/jrMnThLmU3IXz13CL0z9zIHRhLs+mSUT
 lYYp/74/Vs3i3DyHqB5YWNG5zFihyC5xr7i/YW+/Zi4t4JItr1/CbjGnc0UPvJtER8uQ
 LNBQ==
X-Gm-Message-State: AOAM532BGpQKdQRs0s66Zd1MlNVoXsUro0gvcStBDSxlWv8D94zPvD44
 ABIXhtfjaXa+6Jf+0BD8wwQLojuwj+j9vg==
X-Google-Smtp-Source: ABdhPJw51MmCZ4o0IjucDDV2/Wb/cEmHMO3L8auVAuH51oqTeAM9tTlBhBcaIYg4HQZxrb00eOmG3w==
X-Received: by 2002:a17:90b:f0b:: with SMTP id
 br11mr6342565pjb.191.1600301334795; 
 Wed, 16 Sep 2020 17:08:54 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:54 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 14/19] drm/virtio: implement blob resources: blob display
 integration
Date: Wed, 16 Sep 2020 17:08:33 -0700
Message-Id: <20200917000838.735-14-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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
