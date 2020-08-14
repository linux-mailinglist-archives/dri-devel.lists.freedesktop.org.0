Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD92244326
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5876EAD2;
	Fri, 14 Aug 2020 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4136EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:27 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id u10so3519937plr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WkQfAjQhLkRFNoZRUSV9JQCgvycIf9GmZWID8Dn4lzY=;
 b=GZAocgtf8H+l9mG/KG2VR+A8fnbKPDfDCAXk0dtTGFe8m7YIxPGaUYz8bOAyOEKeXa
 NXbCVxk4W+1vJ+lRL2/+zSVHO23ODl9G2uMHs6yOvZxeH18EUFA5UDTQxTjVdbHvH4qD
 Tj9Zg4qfJG0Me5SNwzDOVgftr57XiHzopzIsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkQfAjQhLkRFNoZRUSV9JQCgvycIf9GmZWID8Dn4lzY=;
 b=dn6WHfbhfQ68hSx8XEIx9noijL4x2gd6N/oIA0X7envvJiw6pvL862pzJdBvCmd1Ip
 IAXbbmBgsEyIW5w/QcJbvrQNF2A7L2ruRiM0EDIz1ydvmqeqI9SSf0u8pquYs9SyQqed
 3MXEYNvMh+tXAHcOWYAOvKEBAQlovbpj7fJG8UmjQqH2kwArN5e6QuyMhWlR3kbfrDpF
 XPC5/+Sgvv1eH3XzoHyzNkzc05e1+WbMNGWQMvrBEMACqPGB/t/z103YfP9cFEUEx1zp
 WT3TynpFDRQ3XgHynn3qNKF5GGKM6DKeRdaH5TnVBkuE7EsyImfDEUEPUGQl3hKxmpsY
 Fb6A==
X-Gm-Message-State: AOAM532R5OZITtTlPcjjZxwf4/TZxTQytxmUfTznORLn5SuxjjHhGIN3
 M1S0IE8xjU26WVe8uSeRfZ5vKo+wor0=
X-Google-Smtp-Source: ABdhPJyUShIQ4t/DYilWrLyShTwHHz4cWierjco6bF/XO3WS1YWjKP2ifpJNTVgbgl+WXZ2+DpGabQ==
X-Received: by 2002:a17:90a:80c4:: with SMTP id
 k4mr511069pjw.222.1597372826600; 
 Thu, 13 Aug 2020 19:40:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:25 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 19/24] drm/virtio: implement blob resources: blob display
 integration
Date: Thu, 13 Aug 2020 19:39:55 -0700
Message-Id: <20200814024000.2485-20-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
index 52d24179bcec..1e0754e77723 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -172,12 +172,23 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
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
+			virtio_gpu_cmd_set_scanout_blob(
+						vgdev, output->index, bo,
+						plane->state->fb,
+						plane->state->src_w >> 16,
+						plane->state->src_h >> 16,
+						plane->state->src_x >> 16,
+						plane->state->src_y >> 16);
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
