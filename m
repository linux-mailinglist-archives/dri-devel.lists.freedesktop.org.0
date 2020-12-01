Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872D72C9514
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 03:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AAC89E8C;
	Tue,  1 Dec 2020 02:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92089E86
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 02:16:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id bj5so252099plb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dRR9ddosSqzXzJRHs86UU8/P1ioiMh0OI7yOvImB2w=;
 b=a9Cxkv/2C9/GGe+/AlLwP2rKtwmiaeHMBsIgnKedPUMe3u3zdfctAf/ISuPlAo8J/C
 R8ufUT5IxhAEn7LgpXKiIlR+ro3Y2xdA2yXpkfWJ3WvvlSwe/BQbYTmOXAc1tSHRlN9a
 Eiz6KLVlSQCtWOjhhtLlC2gYMA8PODp13Ru+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dRR9ddosSqzXzJRHs86UU8/P1ioiMh0OI7yOvImB2w=;
 b=N+Il9LdBJuqqR8TE+2ZziakihCZTtJy1KQLJMFPo0ammihmhgtRxpubT9CTClynslZ
 xq0xA1WiVUhE+sqtm99SNtOrestLaFFgPbNmR38P3YBMECqfKoZJiTHH1VP1B21xhSLM
 94Vm2M+he0fqsTfEmikzxpKAAv3WVisi/7ETpl86J2mQbTAVPOpX0dAVN7f7tZjQ3KaQ
 5rjWHsipvsosaI8SSUCn8mPhNWNYSHYQxXqJ8RRSboeANxZtawOtN/2+pxzz4tZWGj7Y
 LWk7kCV6A1zt60aDjQhkQw4JkxrLvJRDXRzRtJW+Kj5C+5VCZvpyw3cBIyc6AJ/2e0mg
 bpDA==
X-Gm-Message-State: AOAM531HnGHbKDULfLRRp4u7OrF2br34aIewzhy3PygBMTYsQ890Qza3
 qdl3O/VXtEHR5h1jEWo4z5mBf+8i/7BAcw==
X-Google-Smtp-Source: ABdhPJzxr14MiYS/jPjbVOfGSxq1JBZ/M4yCXjzwCBipQ6S3gXV2BfJeTlAKKwc5lBGHgrpqsav92w==
X-Received: by 2002:a17:90b:943:: with SMTP id dw3mr341761pjb.97.1606788987703; 
 Mon, 30 Nov 2020 18:16:27 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id a5sm313308pfr.199.2020.11.30.18.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:16:27 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/virtio: rework virtio_fence_signaled
Date: Mon, 30 Nov 2020 18:16:22 -0800
Message-Id: <20201201021623.619-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201021623.619-1-gurchetansingh@chromium.org>
References: <20201201021623.619-1-gurchetansingh@chromium.org>
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

virtio_gpu_fence_event_process sets the last_fence_id and
subsequently calls dma_fence_signal_locked(..).

dma_fence_signal_locked(..) sets DMA_FENCE_FLAG_SIGNALED_BIT,
which is actually checked before &dma_fence_ops.(*signaled) is
called.

The check for last_fence_id is therefore a bit redundant, and
it will not be sufficient to check the last_fence_id for multiple
synchronization timelines.  Remove it.

v3: add r-b tags

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 586034c90587..b35fcd1d02d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -42,14 +42,10 @@ static const char *virtio_gpu_get_timeline_name(struct dma_fence *f)
 
 static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 {
-	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
-
-	if (WARN_ON_ONCE(fence->f.seqno == 0))
-		/* leaked fence outside driver before completing
-		 * initialization with virtio_gpu_fence_emit */
-		return false;
-	if (atomic64_read(&fence->drv->last_fence_id) >= fence->f.seqno)
-		return true;
+	/* leaked fence outside driver before completing
+	 * initialization with virtio_gpu_fence_emit.
+	 */
+	WARN_ON_ONCE(f->seqno == 0);
 	return false;
 }
 
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
