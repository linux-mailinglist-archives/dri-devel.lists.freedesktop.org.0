Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925533827BC
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724C6E911;
	Mon, 17 May 2021 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFDF6E901
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:50:11 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id q2so4443954pfh.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrsrtZWINyNEWd4mAoksuRRQpNEE2ig59BXqlO+EufY=;
 b=Odzi/NnRfgtD3LhwnV11o3/h/Ek7y92D8seZwfXtScqBKLDMTlS1bYfcBYHoEIvBcx
 xOlVxzY4vLjdOjchbliWRi0QkelkHCi/sMHs2L7jJYHUt8EIWYODqY9PcpwIPtrLZBa6
 oiItcg0vyWX5r7L54o9lvGdjOrqd6qqiazTeYJ2RhOoeOK7/yvn7Kj4OhPRJxPJJqCCp
 P3353vtQXAcDaYXujWn4UJFiJmJOrzXtPMicGKYW+LGKoYkn3V+NtV/aTj7380o70rxX
 0W/o/Rm/zufPMBa8805P8Td5gaVHbOpNSquh4ygZdtgMkCwYouT/9aoiBRbE+swDB41B
 iTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrsrtZWINyNEWd4mAoksuRRQpNEE2ig59BXqlO+EufY=;
 b=CkyRBkBp0hYN47ce5WnuJ+4QRbPRmCC52/wCuGCXU4gIufYokXgpTFRsB+U8ZP9seq
 G0wqZJK8JprOCK9O6Wn9yR7P2g0ZLWp9t8MHWq4Zhxu979u+gg0JpnnII2LT7nsj3nhD
 y6z9K6gsCep6zKgABCvOjcmSYFTET1W+MxZ0Wjur6QP2Pl+w0iRsmQjw5LCYdnFoqLZ/
 OPAIh4mgdQWqBz7qCVUMujWMw4BvgS2pTR0oCh7TYkw9chwc7RXODatNgUjC5t7h2dC5
 IFnOdV+z7hQaIUQl8C3pgDf7ZKOq90z46DeD5ipV7oCDEnYrfYxXmhet3oC3jH3PbvWJ
 ObYw==
X-Gm-Message-State: AOAM531b123gtqIXAo1kc/nQVhIqBC89RC29biekAg3snvgswoB6Dd+6
 uDQBGx6e+ktMybQhPkGRksaf
X-Google-Smtp-Source: ABdhPJw1BTT8Od/byB0Qv/xIJsHlL0d8ohgo/1PNrXviuUL12D/cfXZH2EievWNGsFGK52kYS8KpRw==
X-Received: by 2002:a63:5c5e:: with SMTP id n30mr26151298pgm.87.1621241411197; 
 Mon, 17 May 2021 01:50:11 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id a18sm9691463pfn.147.2021.05.17.01.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:50:10 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: airlied@linux.ie,
	kraxel@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 3/3] drm/virtio: free virtqueues on probe failure
Date: Mon, 17 May 2021 16:49:13 +0800
Message-Id: <20210517084913.403-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517084913.403-1-xieyongji@bytedance.com>
References: <20210517084913.403-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 09:04:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should call virtio_gpu_deinit() to free virtqueues when
drm_dev_register() failed.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a21dc3ad6f88..31ba4f344ab9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -121,11 +121,13 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-		goto err_free;
+		goto err_deinit;
 
 	drm_fbdev_generic_setup(vdev->priv, 32);
 	return 0;
 
+err_deinit:
+	virtio_gpu_deinit(dev);
 err_free:
 	drm_dev_put(dev);
 	return ret;
-- 
2.11.0

