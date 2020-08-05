Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6FD23CB3B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 15:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD16E7D2;
	Wed,  5 Aug 2020 13:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DCC6E7D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6OJqxU8Sp5UYmolvKk955VfeDV9wjAzILoG6EGszAQ=;
 b=RPxfHWUZXBAKDCfl9zwQSb9YbnYY8vjYenaVj5rYzwYkptKy7b2Ncs28Ne67LO2vsK3VR+
 tx/q9fkzEUxrIKrPCMm9Cm9U71kbU956r78OXnR1f9OJi/8gSIWAZ0Ams9GeTRRhPj570t
 rNIpdJHHrwviDSGnypQ18hfzYpkNj9s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-g7BnX5UOPiibZ5uGqVxOsg-1; Wed, 05 Aug 2020 09:44:53 -0400
X-MC-Unique: g7BnX5UOPiibZ5uGqVxOsg-1
Received: by mail-wm1-f71.google.com with SMTP id t26so2743051wmn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 06:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q6OJqxU8Sp5UYmolvKk955VfeDV9wjAzILoG6EGszAQ=;
 b=DjaHOEs89sWNrURLdj/KrJ4ZAQo5OHGKNKhGTVBFBaR+nBqFU3dcgCjintVE8p2VCl
 4UbBprdcZSuysKTH1FaMcRg6CGCB24+KUtiqEooYSVx9OwHucwfLblS42zeKDt/KwrV6
 Npsfi1ioKdq5r3RsETC8I+VXv2flvwJYwQCYpcz9Wqg366Iu2ZW6UO4aucHnNnk+e+Ij
 gRtJQNQdk4pgiDvETKQIin3PAKc82tzjR0lUnYinlBg3xYFf6v9Pt7A6WXRYbi75bjP4
 hUXNqnIq8rt7RCpxDTBC7C1VBhq7YDws2N3fQ4vNA0Ly/iemYOuPLRBVx/jXOpRjB2g7
 bqnA==
X-Gm-Message-State: AOAM5318DpMRkLbz2Qrqfn1Y+5Y/Wi05scMHUbbobBB9LWJxRIAoc3x5
 s/wKWLwtl1WUdAilGijKoArr0ILTkKC405V2FTsujYOu+12EeT4ySdaKT2xLwYbwqPxkp7kU7Qn
 AqDHibPGvYYT5M6WCNelqAkXoRCMY
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr3637832wmj.128.1596635091102; 
 Wed, 05 Aug 2020 06:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIP5APlUbJFDt9cc/+rC2+q+FdTyHsKg7qMGdbwa6FJ2pprZGU/KyCZL+3OX8oaPf4PHL5Hg==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr3637816wmj.128.1596635090938; 
 Wed, 05 Aug 2020 06:44:50 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 x4sm3352368wru.81.2020.08.05.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:44:50 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:44:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 34/38] drm/virtio: convert to LE accessors
Message-ID: <20200805134226.1106164-35-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Virtgpu is modern-only. Use LE accessors for config space.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 0a5c8cf409fb..4d944a0dff3e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -39,8 +39,8 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 	u32 events_read, events_clear = 0;
 
 	/* read the config space */
-	virtio_cread(vgdev->vdev, struct virtio_gpu_config,
-		     events_read, &events_read);
+	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+			events_read, &events_read);
 	if (events_read & VIRTIO_GPU_EVENT_DISPLAY) {
 		if (vgdev->has_edid)
 			virtio_gpu_cmd_get_edids(vgdev);
@@ -49,8 +49,8 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(vgdev->ddev);
 		events_clear |= VIRTIO_GPU_EVENT_DISPLAY;
 	}
-	virtio_cwrite(vgdev->vdev, struct virtio_gpu_config,
-		      events_clear, &events_clear);
+	virtio_cwrite_le(vgdev->vdev, struct virtio_gpu_config,
+			 events_clear, &events_clear);
 }
 
 static void virtio_gpu_init_vq(struct virtio_gpu_queue *vgvq,
@@ -165,8 +165,8 @@ int virtio_gpu_init(struct drm_device *dev)
 	}
 
 	/* get display info */
-	virtio_cread(vgdev->vdev, struct virtio_gpu_config,
-		     num_scanouts, &num_scanouts);
+	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+			num_scanouts, &num_scanouts);
 	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
 				    VIRTIO_GPU_MAX_SCANOUTS);
 	if (!vgdev->num_scanouts) {
@@ -176,8 +176,8 @@ int virtio_gpu_init(struct drm_device *dev)
 	}
 	DRM_INFO("number of scanouts: %d\n", num_scanouts);
 
-	virtio_cread(vgdev->vdev, struct virtio_gpu_config,
-		     num_capsets, &num_capsets);
+	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+			num_capsets, &num_capsets);
 	DRM_INFO("number of cap sets: %d\n", num_capsets);
 
 	virtio_gpu_modeset_init(vgdev);
-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
