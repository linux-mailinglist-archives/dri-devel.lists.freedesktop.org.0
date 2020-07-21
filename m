Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CB3227E84
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 13:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A886E4B7;
	Tue, 21 Jul 2020 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7BF6E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 10:17:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w17so10045068ply.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+q+SwIxmtmY9Sx81EleZKhYAND9OH1kntiZdkYfvU0=;
 b=qWUN5QA1aFxfB2DjiMqONNST2jbTf6OJYJuEncUgJ0vCiHbJxunBCOUDrf4lekJ8ha
 xuuUm8Cl2v7EumQrQheCESumNpdnZvcS/90E63isULze+vaWc8aZYciRvxhmhyyP0TSf
 Fx5i/21HwbbQOGJLhczghtvtyGJAlsTYvRpp+0AqdPzgsjBVROzbARZ5qgx2026dMlub
 TArir1DbUviFSysJwu5HANPdXBogPkA0ZUAF5zTOKrPGXo9tLNFEoeCG8VQ3YO8q5LMj
 G/H0qmzRixx5hp8uXhDFskCspzBv5cfBU+5AglKLR3sVFp2gP3rGCESR0X453einKieP
 5v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o+q+SwIxmtmY9Sx81EleZKhYAND9OH1kntiZdkYfvU0=;
 b=ti6cF2LkIVw7kV2zff9rFFle1Wb+QVZmQ2EvWqlxgDntuN+xOQ1Se2+sQshoj93Ymo
 pK7FZrFRQzJ5+1hLiqi1IXcOlTRxcivrpfnovR3Xe4J9W9HajfqxVFPeTgxrCvBXxzNg
 rNeGMrzZWWJIzec28W2vbU5n0MJLdcMf8j3WpK1scEuzR9r/+3YnebWfC27sW/Yj05zX
 UItNb3KGtqDMzdabb/EgCAXh6522Itak5rqzO9o+YRTED5H5MoOcrpDht9Fx8ysNIGa1
 n4D/nhiG0sazcqLaP8v8MnM7v0mHyN6I12aoioFqVOLSAzVlWvALmUfXBh+wCcTe9W+W
 vgig==
X-Gm-Message-State: AOAM533FHDLWFKLmWDYl7cK1f8llu4mpcEkJwlqgSxMZhdNymBSLULhV
 SGICGBOztFMgVeNVsB0Um4wfSg==
X-Google-Smtp-Source: ABdhPJzcHPIg+Zax6xdjIuD6JIMyV7+jwiFE6h9cpHXvzWvIdo5+AtqiMlB4S1ecvEas79S1d9KNiA==
X-Received: by 2002:a17:90a:f68c:: with SMTP id
 cl12mr3570326pjb.116.1595326647639; 
 Tue, 21 Jul 2020 03:17:27 -0700 (PDT)
Received: from C02ZK051LVCK.local.net ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id e195sm19694815pfh.218.2020.07.21.03.17.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:17:26 -0700 (PDT)
From: Xin He <hexin.op@bytedance.com>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 sumit.semwal@linaro.org
Subject: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Date: Tue, 21 Jul 2020 18:16:47 +0800
Message-Id: <20200721101647.42653-1-hexin.op@bytedance.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 11:16:25 +0000
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
Cc: Xin He <hexin.op@bytedance.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, Muchun Song <songmuchun@bytedance.com>,
 linux-media@vger.kernel.org, Qi Liu <liuqi.16@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qi Liu <liuqi.16@bytedance.com>

We should put the reference count of the fence after calling
virtio_gpu_cmd_submit(). So add the missing dma_fence_put().

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Co-developed-by: Xin He <hexin.op@bytedance.com>
Signed-off-by: Xin He <hexin.op@bytedance.com>
Signed-off-by: Qi Liu <liuqi.16@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---

changelog in v3:
1) Change the subject from "drm/virtio: fixed memory leak in virtio_gpu_execbuffer_ioctl()" to 
   "drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()"
2) Rework the commit log

changelog in v2:
1) Add a change description 

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
