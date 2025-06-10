Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06561AD3950
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4F10E564;
	Tue, 10 Jun 2025 13:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E9LWYs6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852D10E563
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749562398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AtqlHRGptORwtIvFn6KwxIkuSp1lm8xfaqwxzgijrrY=;
 b=E9LWYs6vyiyn0XxFFvQN1i0pJnFGqj7gzkfSr0OEoFtSClk4USq4J4H+VTTwfZAlcDuZWc
 ZpIEUTE4p68JAarFEhGzreFXUXY4KCwCNzE1Kap2cvApRKse6FN12TsAqmeLkXbTbiTHwM
 N2UR+z+A4kf43hkL8M6/RRUr5xfoVMs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-Na5h8VijPHmSwYsPz3oCZg-1; Tue, 10 Jun 2025 09:33:17 -0400
X-MC-Unique: Na5h8VijPHmSwYsPz3oCZg-1
X-Mimecast-MFC-AGG-ID: Na5h8VijPHmSwYsPz3oCZg_1749562396
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ade354a2f6aso266217266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749562396; x=1750167196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtqlHRGptORwtIvFn6KwxIkuSp1lm8xfaqwxzgijrrY=;
 b=SlEH9mXlGP0YeeNqESK/cA58T2lOHWjvCT1WFSTKW7mIKWKtJDRyE3XFoirkeBulh8
 1/uJaeuePrGgPOGIEV/1Kn2fLihVOQy/HxvHqg70Pb+C30K3vOvTZjl1osmdqhGazvAD
 UTGB0AqhaKVQZC0cXn5K75um+HgncWQBNuGOibX3qG6ItxqMOrMqLzy4dPgsHfMQEOHd
 h+JmGFhQasQHio/mpeTxvsrT8vUY0u1oy2bsawW1AsQTpHsIY5gSSazJH6+f0ln4duWH
 jL6uiKz0CcBJ8u9C9dESeolnb8wQ1e+cFoy3vg/IQadrnCRgP3lcYNcwQDjGT+Di+KNN
 4n7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4fSxLB7yciT5HBUCVbaW26dW0rbUzCftwNTf+I+BanSYGpyGFogcBVnQ1YNwQrOXOmJk3QzTyzSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUjag7PSGfmsS4q2a+/1MuhSFVdV4hspCbgrg18fqCrp09Vlr4
 TYNS8SankviQT5h7BkiV02llhUENeHdpeOpKRgGzyMC5Indh7qob40QDAZWZAJ4AJxwVrw50ZTn
 cbtM2yhtKmncNjE8fvD70xVLtfg1MeARRtMbobdaROJ4Gew1wsCnRWG4T1M1g6Jbg4XKcTQ==
X-Gm-Gg: ASbGncttG9aA6S/PGGEXPq3QL63o0FmCbEa3DtgLY5jY5fDfECjIhIUoWNzWqU034Da
 rcVj3MmU/yZTaQuY5OIgokaccniij9N8TEcSAXvPkuNtE3mTtmdAUM3hbRgDSeVZR54yETQbbol
 oyQd+07JcitY1WsFcIMsmwrQpXrecZ5JWyeCwujnPCtH1aISAmK1xIqHGE5BNCoBbff5KvmeBWw
 wQ9OAhz6vcr2rOElHxvTKs49MrrWYY5dElCBY2k0MwtFHyuUTWbz3RjWJCEOT/HGT43xbRzm6fT
 PS5PFxVH0ZFooiF3pI8x+e9i2ecW
X-Received: by 2002:a17:907:3f89:b0:ade:4121:8d32 with SMTP id
 a640c23a62f3a-ade4121a383mr1222161866b.3.1749562395879; 
 Tue, 10 Jun 2025 06:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCYWNhgV43RFZfnzAeG7ctwgQxrUyNw/JhykbTR3vkEQZBONy5pO/0Uf1BHdqc/iqEcYmPw==
X-Received: by 2002:a17:907:3f89:b0:ade:4121:8d32 with SMTP id
 a640c23a62f3a-ade4121a383mr1222157766b.3.1749562395268; 
 Tue, 10 Jun 2025 06:33:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc7b55bsm721616066b.160.2025.06.10.06.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:33:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:33:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] virtgpu: add virtio_gpu_fence_cleanup()
Message-ID: <4izeqsk6wgptwbk37qlbsp4fmxwgen6xyqqscrvgcejkoeh6nn@7g433deykx3x>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-2-810923da2b1e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VPSbWVPkxxX7W5Er9mIHxi12nFhQJpUTIxRZ7Ma02ik_1749562396
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

On Mon, May 05, 2025 at 11:59:15AM +0300, Manos Pitsidianakis wrote:
>When virtio_gpu_remove() is called, there might be in-flight command
>objects in the virtqueues that the VIRTIO device hasn't processed. These
>commands might use fences, which end up being leaked, as reported by
>/sys/kernel/debug/kmemleak.
>
>This commit adds a cleanup function that lowers the reference count of
>all in-flight fences, resulting in their de-allocation.
>
>Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>---
> drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
> drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++++++
> drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 +
> 3 files changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3..c94b5edb2aec42fe5cd6416e243cf40e4e2b060f 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -465,6 +465,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 			  struct virtio_gpu_fence *fence);
> void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
> 				    u64 fence_id);
>+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vdev);
>
> /* virtgpu_object.c */
> void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 44c1d8ef3c4d07881e2c4c92cc67f6aba7a5df4f..3e536d190c0464f4db8955605bbf0aa4aa3612bd 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -157,3 +157,15 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
> 	}
> 	spin_unlock_irqrestore(&drv->lock, irq_flags);
> }
>+
>+void virtio_gpu_fence_cleanup(struct virtio_gpu_device *vgdev)
>+{
>+	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
>+	struct virtio_gpu_fence *curr, *tmp;
>+
>+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {

I don't know this code, but I see that when we access `drv->fences` we 
hold `drv->lock`, should we do the same here? (or it isn't needed since 
we are in the cleaning phase?)

The rest LGTM!

Thanks,
Stefano


>+		dma_fence_signal_locked(&curr->f);
>+		list_del(&curr->node);
>+		dma_fence_put(&curr->f);
>+	}
>+}
>diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>index da70d9248072b64786a5d48b71bccaa80b8aae8f..7b3c4d314f8eee692e2842a7056d6dc64936fc2f 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
> 	flush_work(&vgdev->cursorq.dequeue_work);
> 	flush_work(&vgdev->config_changed_work);
> 	virtio_reset_device(vgdev->vdev);
>+	virtio_gpu_fence_cleanup(vgdev);
> 	virtio_gpu_queue_cleanup(vgdev);
> 	vgdev->vdev->config->del_vqs(vgdev->vdev);
> }
>
>-- 
>2.47.2
>
>

