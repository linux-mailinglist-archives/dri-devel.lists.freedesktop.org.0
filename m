Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CA227A77
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE736E504;
	Tue, 21 Jul 2020 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E169A89E36
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 14:45:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a14so9157914pfi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3fAHcvVg4jnZtoaiivjfSSE8o0hNzpTD9CyVyYtzCQ=;
 b=sOlzDOWuF+3RlEwNt2F5CrcNZqj5ddpZi3faZ9Bj9LGVNS+/HCg4ITjur/s9KGE8Um
 EErcgyT0YlA/Vt27osM+RlWCRgnYCvOrQ4GBds6LxWSoJswfyVQlYLuQQF68Dnlzhh/N
 R5CGaKX23fe1yNWLrh5YvObKYO5WeaPhCwMYmozzfak8l+EpGDYvzvQuF63JZrikisuH
 t2WnZ2wHL5+DY+e3BM/WH3zvaVAgJ9zjG/bN4CyIVFyvC8agiGULf1HyIpIdADzX9Ynj
 DqpxiUkonBkuuVA5KnJj8zC2eJ2/k5gQw5WXImWBYghWgRi1nRfPXZ1n3fOvYnehUEz7
 56BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3fAHcvVg4jnZtoaiivjfSSE8o0hNzpTD9CyVyYtzCQ=;
 b=dz8gqeBAhmvwOPN0uM9ib2qmqkwDXHAg2i0QReFKrzJo6e9bEgzk3OV1Ao5VYI/HFT
 txFVivrwb5fQlsq6JSql5wFsQc354H3/HluvnLAgX+eiqGioSHXjQHD+had1FPhwpakQ
 UWlbG6PECQ1mdwn9525/O0G8QdyzcwVa9gr4T8VGUcy5CnWalX0VkqdSW2jLGlS9RhjS
 f8iJtOF+z/AE8LhEEs+CIMbSmCA8yet//e/0A/cP4YopTWWIhRMzzngyms6K53HlHq0Z
 487EXCHAFfn/Osjqb5fDCdhVzCR4nI5z1tBVKVYDPbeBNFpXjhkvl59GKECobosG1Y2C
 Wshw==
X-Gm-Message-State: AOAM53041lAI0I2SExZhcpoAmKyUJhyR762do4AgJ+1SSwZoedHfF57Z
 eY6ZuwPmyS5ZVmgHVa5HP29enY2iPsuXb+xQ
X-Google-Smtp-Source: ABdhPJwRAonkAHS7pUDdFtQUFZnVnmqFela2Z+QxFm1cKeXlzbDX3rdGvU5oZ7BhRlEbOXhoueAOmA==
X-Received: by 2002:a63:7e55:: with SMTP id o21mr19414072pgn.263.1595256305771; 
 Mon, 20 Jul 2020 07:45:05 -0700 (PDT)
Received: from localhost.localdomain ([103.136.221.73])
 by smtp.gmail.com with ESMTPSA id t13sm11951338pjs.17.2020.07.20.07.45.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 07:45:04 -0700 (PDT)
From: hexin <hexin.op@bytedance.com>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 christian.koenig@amd.com, daniel@ffwll.ch, airlied@linux.ie,
 kraxel@redhat.com, Markus.Elfring@web.de, sumit.semwal@linaro.org
Subject: [PATCH v2] drm/virtio: fixed memory leak in
 virtio_gpu_execbuffer_ioctl()
Date: Mon, 20 Jul 2020 22:44:07 +0800
Message-Id: <20200720144407.13706-1-hexin.op@bytedance.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: Liu Qi <liuqi.16@bytedance.com>, linux-kernel@vger.kernel.org,
 hexin <hexin.op@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 2cd7b6f08bc4 ("drm/virtio: add in/out fence support
for explicit synchronization") deleted dma_fence_put(),
which will cause the memory leak. To balance the reference
count initialized when allocating fence, dma_fence_put()
should not be deleted.

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Signed-off-by: Liu Qi <liuqi.16@bytedance.com>
Signed-off-by: hexin <hexin.op@bytedance.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5df722072ba0..19c5bc01eb79 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -179,6 +179,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
 			      vfpriv->ctx_id, buflist, out_fence);
+	dma_fence_put(&out_fence->f);
 	virtio_gpu_notify(vgdev);
 	return 0;
 
-- 
2.21.1 (Apple Git-122.3)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
