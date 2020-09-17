Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B026CFC3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CE36EB4D;
	Thu, 17 Sep 2020 00:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611AC6EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:48 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id e4so130449pln.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HqROGzlbToaRzBVid4qBojAP/QMcbnLz/KvrDQUDCZk=;
 b=ez20IhEcUSLjXdrIgPynHmB4aQQSYwbzKCtfooSXO/SuLI5RdKCLugtmG8Ehha2ztR
 GKKBmJtxvupbe4bUUK6OlIY6hd63zSsc4D9Mq7MD2vg/e/jQDfxBuQrhzL6Flv3uWZl4
 TRPJDEuHhGdQGsgTrDnUsINQZUhVxZTVIPH6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HqROGzlbToaRzBVid4qBojAP/QMcbnLz/KvrDQUDCZk=;
 b=i2BzY17JgCDsGfGkx3CiuF/1iCZrXKRK9q+kHE1UuHTq20Akl1ywbM6Xs2x/BoxcGD
 6f+2i6TeYTBPGKJdZTaVnS3rkgS1MI4Us+fziCNlc7kw8iNUW7LvAblvHDNq9i+ivboE
 3TJM/XYOXzwqM8tzix3yQYOUWugA3LsiapvC6F/mYGvxlDIOVl1qLR4RwTeI64dCSNs7
 tHjYwl8kAfv/Pao2Uj2bYsIK8od6jwn5kPoYAq+1caALlJGfofjT8sBT3seAkTi4O8w4
 I39mdbvfbT8QbnvRdQGE/PrxgyGZ6sFntTWZ73fiR36Ym6L6oHzMb1W1tRNj9/P9NZJI
 QILw==
X-Gm-Message-State: AOAM530kLslha4msN7n7CSCW7WJi8JsiU3YgOx8H7X+b0ulVewJM4jLD
 cB4t3t6qIzZEEOF/09wi9W69bMkWeS2WsQ==
X-Google-Smtp-Source: ABdhPJwBap8xT2GWdgEjUwzAMubPrhIw32WNepQ/4iTnWBqH97myo0NPJJfJih29sLsI7yAWcpUUPQ==
X-Received: by 2002:a17:90b:1741:: with SMTP id
 jf1mr5935995pjb.164.1600301327735; 
 Wed, 16 Sep 2020 17:08:47 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:47 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/19] drm/virtgpu api: cross-device feature
Date: Wed, 16 Sep 2020 17:08:26 -0700
Message-Id: <20200917000838.735-7-gurchetansingh@chromium.org>
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

This feature was recently added to virtio-gpu, lets make
it userspace queryable. It's an error to use
BLOB_FLAG_USE_CROSS_DEVICE when this feature is not present.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 include/uapi/drm/virtgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index e1b1518f9acc5..b9ec26e9c6463 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -74,6 +74,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
+#define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
