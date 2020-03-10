Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32017EDB2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B126E7D4;
	Tue, 10 Mar 2020 01:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA16E7D4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:35 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id l41so694002pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9rXj+bE+f/lEJO54QQ+k2mkuMCg4xvTuIP4J9XcSu4=;
 b=FmMcxGRiRX8z+EbrFgcmKx6u+/TelIT6ES3xNNcduHNU9rKLqU+MLSqrjAKbOqEUVe
 vMVTWHsV5Iq27jMg3n4bRnu7OQeCpP9vriL/TupESKWn6DYFUphQrA1FM3VMFmfumIkU
 z+Q8xlMJDki41ESEFdzIyQ3cC+d8H4CTC9Bok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9rXj+bE+f/lEJO54QQ+k2mkuMCg4xvTuIP4J9XcSu4=;
 b=QzveWDxT5FioHFHLd0jXxO7OCX8Hwd4hWfPuF2leWiWQViBIj7mHvOSRANh/PkYqNS
 8CTW5Dx5RAR/lk3Ayk642cXWwyUkKZEX8qDgczibs0oLmFLRIENICHOGAWMMADRgpLu2
 iPPjVaDkgjMoAGtMBc0R39+rZ9O0VOuNhW9NbfUl/2QMdX8r1TElLiglWpmlVXwn8pav
 yG2IrxPV2fdSxJb/V3g3B1gPDgXMMH7qynFRx7izT45jjvUgA0Lab7Aa38DZuIbgNMCi
 J+pcIHaRxcE2SZM2h5R5FDJRIYvYlyHu+/EB7aYcTNyvq+gXQs8pMd4vpspfOi1wuRpC
 jwEA==
X-Gm-Message-State: ANhLgQ3CYdHc3v6aHECg+K/YILd/DCHcq2x3h2ZVGovx2b9TUzw1U83W
 cFAcLfwTYVd7jEdnsMqYjw4YtDdlXcw=
X-Google-Smtp-Source: ADFU+vuZTdkwzipvb5CxKDY+0QhNKXCXyznjC5UmV4yYHEwrjoUorRrAXjF1TesgkdwGvP9RhOjysQ==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
 i7mr17702074plt.314.1583802515166; 
 Mon, 09 Mar 2020 18:08:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:34 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 7/8] drm/virtio: check context when signaling
Date: Mon,  9 Mar 2020 18:08:17 -0700
Message-Id: <20200310010818.569-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310010818.569-1-gurchetansingh@chromium.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
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
Cc: chadversary@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change:
	- Lookups virtgpu_fence given a fence_id
	- Signals all prior fences in a given context
	- Signals current fence

No functional changes yet, since all fences are initialized from
context 0.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 27 ++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index a63a383347c4..a6c6f498e79e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -115,17 +115,32 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 				    u64 fence_id)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
-	struct virtio_gpu_fence *fence, *tmp;
+	struct virtio_gpu_fence *signaled, *curr, *tmp;
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
 	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
-	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
-		if (fence_id < fence->f.seqno)
+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+		if (fence_id != curr->fence_id)
 			continue;
-		dma_fence_signal_locked(&fence->f);
-		list_del(&fence->node);
-		dma_fence_put(&fence->f);
+
+		signaled = curr;
+		list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+			if (signaled->f.context != curr->f.context)
+				continue;
+
+			if (!dma_fence_is_later(&signaled->f, &curr->f))
+				continue;
+
+			dma_fence_signal_locked(&curr->f);
+			list_del(&curr->node);
+			dma_fence_put(&curr->f);
+		}
+
+		dma_fence_signal_locked(&signaled->f);
+		list_del(&signaled->node);
+		dma_fence_put(&signaled->f);
+		break;
 	}
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 }
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
