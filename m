Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08423AC3C43
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0010E2C5;
	Mon, 26 May 2025 09:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ddvCPK3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E741D10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748250120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BhiDXyikhO1cftzHYfIEafnStrf4kEMf7dwcV0MPQY=;
 b=ddvCPK3lb+fuZLOt+MZl6Bug3uZTg+pY8OnhrYcapE7NJalGpBn5EqfEPaJVoYTBvbBO/L
 MjN1oYXm/EbJpRq9M/sp+0rF6b4RU3lEAKdqZ6CuNkt/uMrkxIwyE53FAnOzyYmdiA6huk
 7J80HLQbINVztJJsYBENL7oZOW8tWOY=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-cbxdHt6-MQuB-BLpFfbdWw-1; Mon, 26 May 2025 05:01:58 -0400
X-MC-Unique: cbxdHt6-MQuB-BLpFfbdWw-1
X-Mimecast-MFC-AGG-ID: cbxdHt6-MQuB-BLpFfbdWw_1748250117
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-73e0094706bso2778050b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748250117; x=1748854917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BhiDXyikhO1cftzHYfIEafnStrf4kEMf7dwcV0MPQY=;
 b=ZODjS0YBTk1FJuBj3QJdbMWARs1Us7lbTOx7akJNu35rE/TRo2WVykoxsIH3fU3q6K
 DDtAhrTluHM59LNpe8VFzXBN87S2HLM8PDgZyHYQbs/TMAigdAFLFgTDWPLdNamHsolR
 oipeYoi8QX/U3qC+kTehA/MRQ0+wKcEW829xErv3Md471t+mN9EWD9JKWaoLH685ZBNt
 2BPshX8+jL3NkyuhsWndGKIEmrv7nYcNXvjyTd1ZLTEXvqPKNci43B1zcy9W5RFH5zKp
 FiRRxyaSRHGbQpjPhuKDin/6mzgXWxWi7JM1KhCb4BHPTLkF5NdzBwUXeCqhrWP6RJq1
 /Wkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMlNxdgAVwGqlD5p5S6pSSgfLNSQYw+budOjjb703zwWoG4vJucNzTy6NoXtmaL+ERmV1+68JbzDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcsy2UNPfwJ/krn6smdOEM5CdD2mJ4c2fFOrCHxBnlrf/8SPve
 lU66jR3mbHFnTVYBGTE50V5ImsKC7W+WU24+uHdSI69GBM01RsgJq7dkvOKPLlSFdOn5U9uIS9e
 OETWyetO72GnM6xYVQCnTbt97P9Z5yU9sYmKv6HSPxvjNJELZnSQCQQun2tnmMnJQ+sy/qA==
X-Gm-Gg: ASbGnctGFp8/wCOqFEagP8TSnh7DbKEfJ99boFFuzF1d+hDDln7+So9Ktofd+X/dA1c
 dYV/BxUXWdSr752ZgNt2+hvPqD4zWk68sKJHn1+Xi9dBicUh25APGm9FbCAhVDH3zXR0KLWm0X2
 fHcg9CQq2EJgazPgtjX+1r+V2WsEC+cg5ZfYqNYPOOL5pKOb87LnZ9TZzxotSPBPE7YLeH67won
 vrmEv0qO2KICvjh/WQaKolar7OrUAaGIyg8/M0WmrWARmq/8vBy8RN9F2qFnmG8Tp449vJ60X6r
 JMyr+MiuloSM
X-Received: by 2002:a05:6a00:21c2:b0:73e:5aa:4f64 with SMTP id
 d2e1a72fcca58-745fde9f3b7mr12076481b3a.10.1748250117050; 
 Mon, 26 May 2025 02:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFODFO9ppwsV5E+FFuQuGGeBW483IYeVBee2OXT2Zb9+eI8FLSHDED6cuwUZJgQFPu/emkBcQ==
X-Received: by 2002:a05:6a00:21c2:b0:73e:5aa:4f64 with SMTP id
 d2e1a72fcca58-745fde9f3b7mr12076460b3a.10.1748250116707; 
 Mon, 26 May 2025 02:01:56 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9878b53sm16575092b3a.152.2025.05.26.02.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:01:56 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH RFC drm-misc-next v2 1/1] drm/hyperv: Add support for drm_panic
Date: Mon, 26 May 2025 18:01:05 +0900
Message-ID: <20250526090117.80593-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526090117.80593-1-ryasuoka@redhat.com>
References: <20250526090117.80593-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FqTukMNC7ym6lUD7WWb7LVUHtdwqh99kdonl33eOTWY_1748250117
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic module for hyperv drm so that panic screen can be
displayed on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index f7d2e973f79e..945b9482bcb3 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
 
 #include "hyperv_drm.h"
@@ -181,10 +182,45 @@ static void hyperv_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
+static int hyperv_plane_get_scanout_buffer(struct drm_plane *plane,
+					   struct drm_scanout_buffer *sb)
+{
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
+
+	if (plane->state && plane->state->fb) {
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch[0] = plane->state->fb->pitches[0];
+		sb->map[0] = map;
+		return 0;
+	}
+	return -ENODEV;
+}
+
+static void hyperv_plane_panic_flush(struct drm_plane *plane)
+{
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
+	struct drm_rect rect;
+
+	if (!plane->state || !plane->state->fb)
+		return;
+
+	rect.x1 = 0;
+	rect.y1 = 0;
+	rect.x2 = plane->state->fb->width;
+	rect.y2 = plane->state->fb->height;
+
+	hyperv_update_dirt(hv->hdev, &rect);
+}
+
 static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = hyperv_plane_atomic_check,
 	.atomic_update = hyperv_plane_atomic_update,
+	.get_scanout_buffer = hyperv_plane_get_scanout_buffer,
+	.panic_flush = hyperv_plane_panic_flush,
 };
 
 static const struct drm_plane_funcs hyperv_plane_funcs = {
-- 
2.49.0

