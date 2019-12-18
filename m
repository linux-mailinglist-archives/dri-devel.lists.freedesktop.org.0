Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34229123C26
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92F6E202;
	Wed, 18 Dec 2019 01:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CCE6E204
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:00:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b9so253950pgk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7MMnTK7WdH1cHIRULp8Rnd1QWMIByP2H3zvTLcqfB8=;
 b=SrpMYNWUCu8D6TFPTSl5VuzRKcZ0LUOrObIBpIslwlpZfeXXebfB/DceDmrAxV9o75
 4bVGNUfbb+5AieYR45FYPq35+CJOFJqspphwkF9ok60nx1vCpVvpwY3ues6j6BVuBC0P
 7FEIHWpfCFXl5BmKIjmxjLuQXYg/4wp/0Tz0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7MMnTK7WdH1cHIRULp8Rnd1QWMIByP2H3zvTLcqfB8=;
 b=ORpLyj4wK9pwNFpMA+lUYbT9kFdMrDo9i8Gxl225kvkSZRfMdaKYW6XJGgvj++5+kB
 4/XvZmgpKR05dFbwIYDXTZ+Op5MX49XO2YjMiFT3PXecEP+49sBe4UCIW0AGvMSSzlSf
 Qs6hPo1sq60vgqhFNx/X+O5EHF/UQJi6BlnJ/xF8hPuWPQ+wu22QKz+2sppbii003WrE
 sRu33x2zoZvz/2y5Auxsw0STvK671J7goZJwNME6jiYEcuvpGK1/1P224xmpe5vDo1s+
 ncy/0Fe12Ag9s3UNEXlu1rc532Oh1p89uz3rS/rvyShfatgRvtlP10XkGq2EL5/82nAM
 +yOA==
X-Gm-Message-State: APjAAAU3YS9hYbfFjqGCLLuqcX6rFIJP4wEpPXK1XJBaGg1BJKLkwogZ
 7zAN0NMbM2lENcsrWMOBQfamTKxIZSk=
X-Google-Smtp-Source: APXvYqxMXTStAMNaWIvYCJnp9oJm+iqRG0vAToyXtYgXHD0OxprRGB2fiKSALjtqSOLi96fR7S5TmQ==
X-Received: by 2002:a63:d041:: with SMTP id s1mr306587pgi.363.1576630800717;
 Tue, 17 Dec 2019 17:00:00 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 17:00:00 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/virtio: move to_virtio_fence inside virtgpu_fence
Date: Tue, 17 Dec 2019 16:59:26 -0800
Message-Id: <20191218005929.6709-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's the only file that uses it.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 --
 drivers/gpu/drm/virtio/virtgpu_fence.c | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 77f446608ca9..4ec80563d1ca 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -103,8 +103,6 @@ struct virtio_gpu_fence {
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
-#define to_virtio_fence(x) \
-	container_of(x, struct virtio_gpu_fence, f)
 
 struct virtio_gpu_vbuffer {
 	char *buf;
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 5466aab7d39a..5b2a4146c5bd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -27,6 +27,9 @@
 
 #include "virtgpu_drv.h"
 
+#define to_virtio_fence(x) \
+	container_of(x, struct virtio_gpu_fence, f)
+
 static const char *virtio_get_driver_name(struct dma_fence *f)
 {
 	return "virtio_gpu";
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
