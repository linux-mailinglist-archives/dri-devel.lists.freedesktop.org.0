Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC117EDAE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4506E7D1;
	Tue, 10 Mar 2020 01:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4E6E7D1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:28 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id y7so661347pjn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2zPpKA6jW8XOsAaloXfV8S1Q8UJisRuIlG8LKUxrM0w=;
 b=SwJcU+Sm546IxqIjiVERcpXxzkev+wu4LZxOzFWTZQFoWj7Va6pEVainAntCBIBGbH
 gHZqxKC1EGsRHIsgcrRePvIZitMW/K02b9PrFTySqRLjcd35zUy9D3UnuvMY+6GAf4yE
 xE4V1WCfn/cHfO4y/jkr7CuHNi++2bUzn37MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2zPpKA6jW8XOsAaloXfV8S1Q8UJisRuIlG8LKUxrM0w=;
 b=KpFLJmWyOvWYIpMIltzaZiYgjNgiPNAzEalnqtGFMvuAHkCtv05LyXuYrSD4B2+QMb
 zR9lz0twdHAF6Uq2mETkRBZUGSMxD+rkRpzpR76TkM/75UZ7Joz5U3nHYe06RlMGy63d
 yIpnmoJKYJOwpGh0CV9BScSl8o/5IyW2erqPJ7xNL0sU9p1JB+ong4z21nkuX1Lk1NWu
 wZO5Kj2nqILva8OHJxLy2FwFicPQTYSMwbGDhb471pN+Zlvyi+fA2vi2O+pv415h6LN3
 JlpspgRVOupYhhmoKoWDM+c2uOhhsJo5qxg0tW5vZihdczc5sWjNzTQaJxJAfae2Txp3
 F3SA==
X-Gm-Message-State: ANhLgQ1XAb3KOdTl8bInVShI2ETiqGunHtntkV8AN+JBHFAe4ZbiX6X4
 h7HyVcQ1Iw3s5IkT88ZVWiqmOD3q+3o=
X-Google-Smtp-Source: ADFU+vs/b0czPK2Dl6i8gUbedmLYhTobuGGguh8x/mCMmw8BFc6YLcrzMW6O8c7NBu4mqcH4vzldtQ==
X-Received: by 2002:a17:902:8608:: with SMTP id
 f8mr18371785plo.110.1583802507498; 
 Mon, 09 Mar 2020 18:08:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/8] drm/virtio: allocate a fence context for every 3D
 context
Date: Mon,  9 Mar 2020 18:08:12 -0700
Message-Id: <20200310010818.569-3-gurchetansingh@chromium.org>
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

We don't want fences from different 3D contexts (GL, VK) to
be on the same timeline.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9627cd08f5be..b4f85c5fedb9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -215,6 +215,7 @@ struct virtio_gpu_device {
 struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
 	bool context_created;
+	uint64_t fence_context;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 023a030ca7b9..76b0f18e6691 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -267,6 +267,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	vfpriv->ctx_id = handle + 1;
+	vfpriv->fence_context = dma_fence_context_alloc(1);
 	file->driver_priv = vfpriv;
 	return 0;
 }
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
