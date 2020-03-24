Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C141916BC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 17:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28EA6E4B0;
	Tue, 24 Mar 2020 16:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D686E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 16:44:15 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id ck23so1700438pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eg4XvnurfKea5GX77QQ71fckF/Az34wo278B1POrTo=;
 b=W02Guy7iO38srVnJO5rMmJhZU2ZFP+JJMq8uABueEYxx2IXhBIEuJmp55dr5I/BM2c
 thkWdxFvz1p9t3phtjU8M0rBRvg+S0A8ViFVg6Eo/87xxlURAMZbaF85SVgDXER+qLR0
 UZq1iU5njRfUsRVltzj7YEjMOPZ6+I1LMwRco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eg4XvnurfKea5GX77QQ71fckF/Az34wo278B1POrTo=;
 b=fa4BPhvUnrI3kG5ACcNIAm/CSd9zmXPoSwche4Ch6Cmzmx2pW3oWCdj3YgNQUo5mHS
 q985q24ttPltUXCwrQ1DZ9ynMxkwCJdf3/AMAlHB/hN+z9PXGVUd/RW539V28+IuF+hm
 4dbCvZwpj9KVEgRIlEDBiEAvH0j1yV0b79t4x9eiZKYLNo/DHeOAj4MQL84bbFgK24iG
 6LD15fBek0snXqshxr3cPIPgHPpdGgz3E24odVNAstMlsNHeVl7GJNpWW4I2eKfiuMVq
 eGyTCMI2cyqn9nHoR6kH6I1yQMUR+St938haLCWqO+8yPf3W6kxPXgRBTIDYmrd2nd+e
 2wTQ==
X-Gm-Message-State: ANhLgQ3Q17Xk5bbrQMFjnLMKLjcZXNP1L0JUmUR3SvtWPZIt7fkoMZjN
 197ddFMD7wo4M6U7a9lx5JWpZJ113vc=
X-Google-Smtp-Source: ADFU+vtzz+t253zm0QuF4s06wo6xC2lsLSHCQqGTNzWa2Dl8TtoSo5mINQQosDjJ1I0a2S9S0d10+Q==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id
 kb16mr5818646pjb.97.1585068254376; 
 Tue, 24 Mar 2020 09:44:14 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z6sm16316621pfn.212.2020.03.24.09.44.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Mar 2020 09:44:13 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: delete notify in virtio_gpu_object_create
Date: Tue, 24 Mar 2020 09:44:00 -0700
Message-Id: <20200324164400.30013-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324164400.30013-1-gurchetansingh@chromium.org>
References: <20200324164400.30013-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- For dumb buffers, virtio_gpu_gem_create can notify.
- For 3D buffers, virtio_gpu_gem_object_open can notify.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 90c0a8ea1708..aa14dd12928e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -49,6 +49,7 @@ static int virtio_gpu_gem_create(struct drm_file *file,
 		return ret;
 	}
 
+	virtio_gpu_notify(vgdev);
 	*obj_p = &obj->base.base;
 
 	/* drop reference from allocate - handle holds it now */
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d9039bb7c5e3..51a8da7d5ef3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -241,7 +241,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	virtio_gpu_notify(vgdev);
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.25.1.696.g5e7596f4ac-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
