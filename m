Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B302123C20
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F69C6E1F9;
	Wed, 18 Dec 2019 00:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2106E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:45 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id r67so62267pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7qS+TQOqmuSYyY7pRPONbFeLo/ktg1P/BEGbNAEe3Q=;
 b=LUgh4d7ZpweDaTprsJm4AVAAfmTtNxkkVgToEPeM+8rrCDjtGuZcCKSHLH1bKE1yPD
 sHXidzK7qYSMSOmq8g7VgvI4shQSv65sYQII6pJSfVv6Og5RzYLaoS1K/5lWT7gYYCE5
 XN3OVzNCkpJYAZ/QrVva9JqmY7+Zqv72eIRAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j7qS+TQOqmuSYyY7pRPONbFeLo/ktg1P/BEGbNAEe3Q=;
 b=MGG5gRHSFEe+15rGjbXzMWCK/kLKQDx3nPAtUJ/mhlfxv+c0Vnpxp04ldoN4jBrQ6O
 gKjLbys3eDixtspNfGuxGgt9b//JwOh23hrDUT6+Lotft84td0INciqnWPGUZEwtT7BC
 W2q9J7x7s8nCxjEKlDpi+e7qYL4eJX9DDMtgTAd9pUM8NIkYNE150+zSU2tF1CNZGt4H
 YacWIUwxs1YBjfNmLYgswx45wFS+yMyjMwPbYBUxfF2xS5LMLWZI8XQPQLbCq0wpPSd9
 knc1HiEjEAxNLJtYHKlHpqKepK1nSB2aFLqTzBn8bfQPqFGrOPzV8fVYbnCvPv7UclQU
 ldrA==
X-Gm-Message-State: APjAAAXbdOxHLb8NYIGyi2gQ+4tk7XmwESklVNRoDx6/opNqKhbWVy+/
 wWbuqHpyO4bbB/GQb+KMOnqjDzWGQcc=
X-Google-Smtp-Source: APXvYqz9kJYeo4KrcKz9Fu/LFvcXe1/9Fiincmzi6CdJCH6mEK/uf+vtT1Ts3FAHyPkor3P3NfozHg==
X-Received: by 2002:a17:902:d883:: with SMTP id
 b3mr1020106plz.231.1576630785150; 
 Tue, 17 Dec 2019 16:59:45 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:44 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/virtio: static-ify virtio_fence_signaled
Date: Tue, 17 Dec 2019 16:59:21 -0800
Message-Id: <20191218005929.6709-2-gurchetansingh@chromium.org>
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

Not used anywhere else.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index eedae2a7b532..6b3f1551a2f1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -350,7 +350,6 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					int index);
 
 /* virtio_gpu_fence.c */
-bool virtio_fence_signaled(struct dma_fence *f);
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(
 	struct virtio_gpu_device *vgdev);
 void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index a4b9881ca1d3..5466aab7d39a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -37,7 +37,7 @@ static const char *virtio_get_timeline_name(struct dma_fence *f)
 	return "controlq";
 }
 
-bool virtio_fence_signaled(struct dma_fence *f)
+static bool virtio_fence_signaled(struct dma_fence *f)
 {
 	struct virtio_gpu_fence *fence = to_virtio_fence(f);
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
