Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45727651C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262A66EA1F;
	Thu, 24 Sep 2020 00:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDB56EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id o20so730079pfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iGaee43EXlPWhgdf9Gnv3QJC5jb1e3zTIJUwX52KPp4=;
 b=L4fjyUAHDHSMY/yuD8q2gKyVZKmUTZz9F9q77YpzOGksqwaCHfRbYRit5Qg6LKnaNt
 036jEKpolYpZFsKubZlrm5EKeVkL6ZmT8Y8VbNTig59tgYOO5KrcITwmxXPxFGxBREPf
 UiMPpc3rC6cQ9ZKBtoWlYCjUeUFLqFGH/BSjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGaee43EXlPWhgdf9Gnv3QJC5jb1e3zTIJUwX52KPp4=;
 b=sJ6X9D5CXU/keaof40fTG+BGuhLL8vYoULP2dy9CYTVYTA6slcwlECELTeFjHXedIT
 ebIE/pyyiDTNJ+o9zjZyTHvCtk+yzAVR5vl6FowbHIt9BXhFrOLzYH9I269qhgq+y8Z8
 21SCNBEUFLLB2A84QrhAgcoyF00+VzUdkv9U+m6zh8zjFgxJCw1vSWT3k7cyNzpduUta
 WCbM5gBV8hJWBLn9Komio8OunPGDTYfJ+4xAD/jKzoAJAf3pgW1g7VYr0OeYtYflXHVu
 XikLQFOGikqlkr2QQ/zkojKsCTlwkgFQwbnE4h8n15xp8VjOhPFjuYkj6HZ/x3YULhB7
 2VMg==
X-Gm-Message-State: AOAM533v9WSAcx7TUjyCT7Yjsq2+A8vrQSwNicCkKxAoN970QGCvrE+u
 crC7FmIXI+lbgJtwsDvFXyGge0pUKZwa6g==
X-Google-Smtp-Source: ABdhPJxwpOkMwwn2YXhRUm1ZOWqkqrsCtWHrCy2B84AhOZhnU4ayb2FoPjG8kLEgFYcJAHubERbrEw==
X-Received: by 2002:aa7:9518:0:b029:142:2501:35e3 with SMTP id
 b24-20020aa795180000b0290142250135e3mr2106763pfp.67.1600907547542; 
 Wed, 23 Sep 2020 17:32:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/19] drm/virtio: implement blob resources: add new fields
 to internal structs
Date: Wed, 23 Sep 2020 17:32:06 -0700
Message-Id: <20200924003214.662-11-gurchetansingh@chromium.org>
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

Useful for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 674a525df9bcc..bddf06b8fb684 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -54,13 +54,16 @@
 #define STATE_ERR 2
 
 struct virtio_gpu_object_params {
-	uint32_t format;
-	uint32_t width;
-	uint32_t height;
 	unsigned long size;
 	bool dumb;
 	/* 3d */
 	bool virgl;
+	bool blob;
+
+	/* classic resources only */
+	uint32_t format;
+	uint32_t width;
+	uint32_t height;
 	uint32_t target;
 	uint32_t bind;
 	uint32_t depth;
@@ -68,6 +71,12 @@ struct virtio_gpu_object_params {
 	uint32_t last_level;
 	uint32_t nr_samples;
 	uint32_t flags;
+
+	/* blob resources only */
+	uint32_t ctx_id;
+	uint32_t blob_mem;
+	uint32_t blob_flags;
+	uint64_t blob_id;
 };
 
 struct virtio_gpu_object {
@@ -75,6 +84,8 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool host3d_blob, guest_blob;
+	uint32_t blob_mem, blob_flags;
 
 	int uuid_state;
 	uuid_t uuid;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
