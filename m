Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A525B5A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CF36E956;
	Wed,  2 Sep 2020 21:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA9D6E956
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:13 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id d19so316940pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boWtQszoLChkFowVy3vVSoz5f9TMX1ALmSZ31thta+I=;
 b=oRKGZuNrgMDswBIApOlMvhYUcBEx0KqvliNWVZHyYkrhxrSf4Ksu7jcMk4zkkIuWU6
 sw/Ibqptn8efazlK50oHExFoBDc97yXnbNsENmWmRUhsh2RId0sRpXt8yT9bVCxDyVr4
 JrRDzSbu/QqFElwq+6K4j9x8tBv7qCNwqt5bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boWtQszoLChkFowVy3vVSoz5f9TMX1ALmSZ31thta+I=;
 b=SzImf8odLeWyV9WvRZr569mUlJ3JN6NZ9qIN2JYFiCC8O7Gnkrd+is4W+1n6USfFz9
 IRjrgPHb5t9nax/MMLtcDKXQQ+LJdoIH1zjcRCrWqTfYrun3C7aTO0rKagCnmBqOkd21
 jIbXNB9gIC3EdFHoAiR74BSEo7ZPw848vlixeroBzfs0/mp6AXNaMrega/X2HmN/vNcC
 nZ+okhQPUpr8XodNailZKQBpJi1whCW7KIRp/i1fnwgZopQc1sqrNRefv4ICDcZZFXgL
 8PKOXCeYeGA5xcCuYmuEhNaNwqW6FkzJLLlxBEdA+I/vF5IFu97Mg+WE8E/5ntFQSjY4
 aC8A==
X-Gm-Message-State: AOAM53040XjHA6/9CHuoedRZJdbq34C/oYBnNYlXYZdRp+1d7p6rRbSg
 2tnkaDpBqRjXCmn4Rpk9ZPUEHysl+X6fYw==
X-Google-Smtp-Source: ABdhPJxYutISj7S/xlz1kb7RTpAcjZbtbAip8kOdLa1efS9Q90OfdzzPX1pyEJQtHu719j6MaAWAFA==
X-Received: by 2002:a62:4dc4:: with SMTP id a187mr268812pfb.265.1599080952261; 
 Wed, 02 Sep 2020 14:09:12 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:11 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 15/23] drm/virtio: implement blob resources: add new fields
 to internal structs
Date: Wed,  2 Sep 2020 14:08:39 -0700
Message-Id: <20200902210847.2689-16-gurchetansingh@chromium.org>
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

Useful for upcoming blob resources.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bddc071c20bf5..6d8c624515cd5 100644
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
