Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42C17EDAD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309066E7D0;
	Tue, 10 Mar 2020 01:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4A6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:26 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w12so4713087pll.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGF/x2kq35mc+6Al+T72cYBqq4y8uuP+kdcqS6HEcAY=;
 b=L7xf6UDPFRssDQQAU6C24Z+U31oIxPNIA1xTGNbk1PotdKB5V+jET1VfpZQDJ6UTcR
 /Ifp8iExsL2ZQxsOTIlbBO0oa751rkT8MVryibMYas7dY7QBbQ7+LYScIWgp3DJIm63w
 FSVDO+ysT3cqLkICLuMhH+CoibQuwEakR4OIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGF/x2kq35mc+6Al+T72cYBqq4y8uuP+kdcqS6HEcAY=;
 b=TrW+koCUV3HT8NYylIL9CONHXcVp8cMmpLxDnt+ES1wOwX+WblDfW97vLZLExPRcJU
 TmXldhiFzDOiRkVjrKk4z7dkA3WWtGi1q4nQ4OPmfj8jzsYD3sYB7lP/dDBcvOsydPpD
 AMh1z9uXCbUmUQ4hlRlWe5tneNOsMva457/fqCj1zg0KH+3ZWxvNCK6kcHd7kDIrNyfv
 GmuwKa53qCrdxUsJW7IhinzUpKE4pu/hTCKsBy6T2jG3QYcTEFIk1B9VT/wYjDE1FID3
 3NpB4VW5OUb/WVcfDGpjAcaWrKctSs6etng14loH9vRPcREGnbQXaLPDZvMgRuDF4Xcg
 xuqw==
X-Gm-Message-State: ANhLgQ1XAEkOSR5iFG99MlQKxdrr1T0Owi4n+sz6QsGJYG7lQoYNLFEO
 3R7+bZ2bo/WPliQGEgZWjPSXPRIS0Rg=
X-Google-Smtp-Source: ADFU+vtYRXtxWkjCoINR/dNKphl59J7VAPRHXGR9+PjOHxzqENKi1lx2ejJCbOnvK6S10dzf8ZrVmQ==
X-Received: by 2002:a17:90a:1b6c:: with SMTP id
 q99mr2149830pjq.115.1583802505522; 
 Mon, 09 Mar 2020 18:08:25 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:25 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/8] drm/virtio: use fence_id when processing fences
Date: Mon,  9 Mar 2020 18:08:11 -0700
Message-Id: <20200310010818.569-2-gurchetansingh@chromium.org>
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

Currently, the fence ID, which can be used to identify a
virtgpu fence, is the same as the fence sequence number.

They could be the same, but not necessarily so. Let's differentiate
them.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
 drivers/gpu/drm/virtio/virtgpu_fence.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index c1824bdf2418..9627cd08f5be 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -360,7 +360,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
-				    u64 last_seq);
+				    u64 fence_id);
 
 /* virtio_gpu_object */
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 5b2a4146c5bd..2fe9c7ebcbd4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -112,16 +112,16 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
-				    u64 last_seq)
+				    u64 fence_id)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence, *tmp;
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	atomic64_set(&vgdev->fence_drv.last_seq, last_seq);
+	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
-		if (last_seq < fence->f.seqno)
+		if (fence_id < fence->f.seqno)
 			continue;
 		dma_fence_signal_locked(&fence->f);
 		list_del(&fence->node);
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
