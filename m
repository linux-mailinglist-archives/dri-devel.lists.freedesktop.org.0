Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7217EDB1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8F6E7D3;
	Tue, 10 Mar 2020 01:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0B66E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:32 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z12so5523696pgl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpDaE/upXkkrWrhg687reoO9l+UQdJsrn5UcDOmkcwA=;
 b=BNNE+H+Wj/jTFIYiL3VcCo4YN+abIKzEUC85aKZvlH9M+R9E/s3C9tXLpEebuRNvd9
 Bjqe4GebYjPhsAddtCiEQQIZhwpfdGmWgSOswdGBnEX7XbRaRIUjAV4KekU6+3yF3KzU
 2pvHkUF7VsIwrUnkuNAjoSbjt2ZL3yBhBYXUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpDaE/upXkkrWrhg687reoO9l+UQdJsrn5UcDOmkcwA=;
 b=t2d2vKtG1i3lOL0AWsoED0WzKJW6+nkrY4cPvPmBw2SzuB9pQ5rKd4dvYk1HpiQi1V
 Yp+FfaoLuZB1AipSu1oglJ3Nmva1gi7rM/Lx0gZ4zJAslq6FzmysQbMldp4ab7tkUxUZ
 p37DQd8W07Yu3ZANFFHpnUq7dHf/uYai4Hj8QaE/G6oVnO73ZtUljUt6tsgI7yOFqWYn
 hMx0PfUwRHDdj5ISowRQP12eH9O3e5zdjL9mgwZ4y4xboa7GA6aDyvOvC4fP1AEvVwTA
 In2cbo9k6xQmE9It3tTDuN1YADcuKXaGNP93xN1ZDshnLZG3yI0VPbpX3BDyV+WAxabd
 0y1A==
X-Gm-Message-State: ANhLgQ1uIVT7nEAqacUruabyo9V+VIloCO1q1doTEK9jSqvLvOkutGeZ
 eTN66jcAaVgJKI2Cg5T+wIEVXz8/xaY=
X-Google-Smtp-Source: ADFU+vuenTcrZ+DYd0PSV7P7dSLWbA0t3Uargzl1sdBGADPwpOlfnPX1cFSZsbW0hk8D9hd1aPJksQ==
X-Received: by 2002:a63:c507:: with SMTP id f7mr18140532pgd.278.1583802512043; 
 Mon, 09 Mar 2020 18:08:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/8] drm/virtio: track fence_id in virtio_gpu_fence
Date: Mon,  9 Mar 2020 18:08:15 -0700
Message-Id: <20200310010818.569-6-gurchetansingh@chromium.org>
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

Each fence should be associated with a [fence ID, context ID,
seqno].

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_fence.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7d96d0fdcbac..e98d1a4cbda9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -107,6 +107,7 @@ struct virtio_gpu_fence_driver {
 
 struct virtio_gpu_fence {
 	struct dma_fence f;
+	uint64_t fence_id;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 0c32f3f72737..d63848178a58 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -102,7 +102,8 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	fence->f.seqno = ++drv->current_fence_id;
+	fence->fence_id = ++drv->current_fence_id;
+	fence->f.seqno = fence->fence_id;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
@@ -110,7 +111,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	trace_dma_fence_emit(&fence->f);
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
-	cmd_hdr->fence_id = cpu_to_le64(fence->f.seqno);
+	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
