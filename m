Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23725B59D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5006E50D;
	Wed,  2 Sep 2020 21:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0076E50B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id v15so328396pgh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uz4gbsIOVcrSj38X4khXE2ZpHDrEniQCIX3T8li7Kzk=;
 b=lPCdN5Dg4JVsIrUK4dWGbfd/7TMkNKjkED9x1r0aAug6zj47nogB2brReg7mmoxPec
 VC7mnPVQfCbG8v7ReB7Vve89T30AwB428Z57JqEXSFffLPsFkR80nGHpAE57usdY2Vnn
 ctViI1s0tUNPhY+eeJDrmnt0fWgz0ac92X71o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uz4gbsIOVcrSj38X4khXE2ZpHDrEniQCIX3T8li7Kzk=;
 b=meMes7gVI8eTAc6opgxsbc7P/YfJbbac4sv6hMZPADMWmF57pa2REF7MNSY1AjEq3q
 OAgUaYF79wWFzpbyI1v28Ohpm02N7xwF2NceKXEEDMurSEy4hK7nhHHRNyxLcizyRprR
 Y++X82N9wL8sexkbtL9EfEQ5G2mmGzej74HKJHHe3o2xfhHqF3iF9gzitilRltlGwKUX
 ZrklVmhyl2pzkFDmvPk22+x/NvgETwfTQns2C0jq3aKDtAZLuzOZT38cGorHoXGjJo+A
 FrPi+kD678xQ61KznLiEa0Hosbb6G23vXEzCMlSki3y9bMfBTKaLKFrcF8CS0IU200Bx
 dNnQ==
X-Gm-Message-State: AOAM531qL3sKfklVgi4LhWlEtOuH20S/xM+EwoWlGn+VdgaV8+VVQGEi
 ZgyP5aN9y5RxTetPAuQwI0ojrPfm7JXZ6w==
X-Google-Smtp-Source: ABdhPJzxe0Y470MJyR1VcNWFkn+iRnPThV/NXDMqF0YNfET77viYt+5lsZ4/8zxDOzckSJd7DdYOaw==
X-Received: by 2002:a63:8448:: with SMTP id k69mr3231261pgd.285.1599080933284; 
 Wed, 02 Sep 2020 14:08:53 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:52 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 02/23] drm/virtio: fix uninitialized variable
Date: Wed,  2 Sep 2020 14:08:26 -0700
Message-Id: <20200902210847.2689-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reported this with the blob series:

drivers/gpu/drm/virtio/virtgpu_kms.c:227 virtio_gpu_init()
error: uninitialized symbol 'ret'.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5ba389e0a02fb..06af537b0091d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -105,7 +105,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	/* this will expand later */
 	struct virtqueue *vqs[2];
 	u32 num_scanouts, num_capsets;
-	int ret;
+	int ret = 0;
 
 	if (!virtio_has_feature(dev_to_virtio(dev->dev), VIRTIO_F_VERSION_1))
 		return -ENODEV;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
