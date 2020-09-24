Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A584276523
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D9E6EA26;
	Thu, 24 Sep 2020 00:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452B46EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:34 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d9so761392pfd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=inq5VPAbGj55lVsEfqOots0UsyGc9IzMu7tBnt2vhjs=;
 b=SD5l2SueYF2dya0c8P5SH/msAUiz3HNEkTxjZgoSVFFm2/Z9PFJRvioIzWzU1OSw0D
 dlIAA63y0/OtgUDGn1QRm2zs0LoGRrn9W1in4C7ZeDMujVyWfbkCMy+qImJsL6wbtygx
 5XBuJNM49usbAQAOsWNAgqdx6UD1ygqItiW34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inq5VPAbGj55lVsEfqOots0UsyGc9IzMu7tBnt2vhjs=;
 b=NdZIxide5nhU3THlHnQUcGxfcwI3xuRGD1Enj+I+AI20qag4ichKNaz9sVwRofLDMd
 e/zYBpTloQrd6mUroJVa3uTO3Ql+ZUS9Ol860lZqCjGw2Xz9ZPmu2yNI+stC/JMC/rtM
 1Al+LLPkhlSI21i6EAlv3FFSVCGhtXLh/Rz0tGSowKIUqHDcTd4u42EZP35Pxhwd3Fb5
 Y5Taa2zpk4p6YyCjYagCN91SR90tn7K07FaHyk8xC9kyUQq+1WN6Lq6T6PH8sSvICUYI
 rCGts/dDSU5WsEFTM9iCiVqizeYELgg1nztzBr1m+lZ541mTobCeXqyjSD3Yqc1edbnU
 V5pg==
X-Gm-Message-State: AOAM5311qbsw2/93BqYVYUyobrrwInjSVDdc2tr6bi4DxZhxTwms6esu
 vmWj0xn310g8/H+BuI6r3ApvC1w58QKWNA==
X-Google-Smtp-Source: ABdhPJxKhEfZSeocV9so28xsUmX5ApZsLGhQtfYLSC8chXRa4h3d9UdLjJ/IPqbV2N1viARzZHB0tA==
X-Received: by 2002:a63:2547:: with SMTP id l68mr1790275pgl.241.1600907553659; 
 Wed, 23 Sep 2020 17:32:33 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:32 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 17/19] drm/virtio: implement blob resources: report blob
 mem to userspace
Date: Wed, 23 Sep 2020 17:32:12 -0700
Message-Id: <20200924003214.662-17-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stride field has never been used, so repurpose it to be
"blob_mem". This way, userspace can know the memory properties
of the blob if it's passed between userspace processes and
no suitable userspace API exists to transmit that knowledge.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0bf789f2bfdec..b0c9dd171ad8a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -301,6 +301,9 @@ static int virtio_gpu_resource_info_ioctl(struct drm_device *dev, void *data,
 
 	ri->size = qobj->base.base.size;
 	ri->res_handle = qobj->hw_res_handle;
+	if (qobj->host3d_blob || qobj->guest_blob)
+		ri->blob_mem = qobj->blob_mem;
+
 	drm_gem_object_put(gobj);
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
