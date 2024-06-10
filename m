Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87001901E44
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3A910E3FA;
	Mon, 10 Jun 2024 09:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H1kmtXUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E190110E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WQJKGGQ63IpYpwAqks0j3zwgngy8EFW/hBQkkDLpOw=;
 b=H1kmtXUPcNhIQHaBoIoR9nZn4eKJBNgU4KRqMhYqx6q/2Eyl0yhOeoIQQf33QGj/vfNY3G
 P99cgK2nPcwdqpkoiWRfYTpe6EPowVjDO88JtW2ezlEXfed/Z7xz4J3q0sHSp4vxC1ycFE
 btxwU8JEBHUwvJ/xxowP2OQanXC83D8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-XeQTFt90Mq6q_61AHQqT0w-1; Mon, 10 Jun 2024 05:32:14 -0400
X-MC-Unique: XeQTFt90Mq6q_61AHQqT0w-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2eaebc5da8aso3006621fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011933; x=1718616733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9WQJKGGQ63IpYpwAqks0j3zwgngy8EFW/hBQkkDLpOw=;
 b=XyQBXsYO34tGJduIlsODf7LpGLujdjCu+jrpgedJ8LUTYeI6rWzqUBOYVZ9/lbk4lB
 HiADaKQEkCkhdPXs9zRcWgM58sDTghLU9HG5q1CrhWzWwX8CpxFB9ZMANs7nFh7Loqlj
 hqLeIXq7Eiv6/MFC2BIf9OM+McuYrqzr92nBHQ+OlDDUnt6pnPVEikQgfxdksmp7sTxV
 wWCEUSK+A+vPK7vgEJU5/QXYR7UyOAWQdXey9wnHxjdJnsIZFeE4138XGLZWC9SKpOiX
 921wDgHp+k/I4uGgJ1HmGaGYYdAoPAwZKk8AdlRHVcVVLPyL7Nt3QjMRzb0ya/87lJEx
 Ny/Q==
X-Gm-Message-State: AOJu0YwotAx3l9uutgi3NrYo96otQwsirGrxiHBXxm4q8trHLbG2mLwv
 yeiuxn6+5VyP/XxCJmc5UzgXPCKSRz6vIqX5C8SA94iF9D09pueDsfVKV2dPFejzWeQG5pNIN5M
 3qzRdn3l6BW0n87WfmQ9DpAcl+NS+I8xTFX0goPyHCJPNVqI8r5gxH5snn66VS7gzSg==
X-Received: by 2002:a19:2d0d:0:b0:52c:8857:7631 with SMTP id
 2adb3069b0e04-52c88577793mr2123926e87.1.1718011933081; 
 Mon, 10 Jun 2024 02:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfUeStS0N5eJVU1XtsiGlp2iqafq61SQZHkJWQKYKYv8JTZLy1IaAESVE2BsaioUjz+IfNVg==
X-Received: by 2002:a19:2d0d:0:b0:52c:8857:7631 with SMTP id
 2adb3069b0e04-52c88577793mr2123916e87.1.1718011932865; 
 Mon, 10 Jun 2024 02:32:12 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:12 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 13/13] drm/vboxvideo: fix mapping leaks
Date: Mon, 10 Jun 2024 11:31:35 +0200
Message-ID: <20240610093149.20640-14-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240610093149.20640-1-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

When the PCI devres API was introduced to this driver, it was wrongly
assumed that initializing the device with pcim_enable_device() instead
of pci_enable_device() will make all PCI functions managed.

This is wrong and was caused by the quite confusing PCI devres API in
which some, but not all, functions become managed that way.

The function pci_iomap_range() is never managed.

Replace pci_iomap_range() with the actually managed function
pcim_iomap_range().

Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 42c2d8a99509..d4ade9325401 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -42,12 +42,11 @@ static int vbox_accel_init(struct vbox_private *vbox)
 	/* Take a command buffer for each screen from the end of usable VRAM. */
 	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
 
-	vbox->vbva_buffers = pci_iomap_range(pdev, 0,
-					     vbox->available_vram_size,
-					     vbox->num_crtcs *
-					     VBVA_MIN_BUFFER_SIZE);
-	if (!vbox->vbva_buffers)
-		return -ENOMEM;
+	vbox->vbva_buffers = pcim_iomap_range(
+			pdev, 0, vbox->available_vram_size,
+			vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE);
+	if (IS_ERR(vbox->vbva_buffers))
+		return PTR_ERR(vbox->vbva_buffers);
 
 	for (i = 0; i < vbox->num_crtcs; ++i) {
 		vbva_setup_buffer_context(&vbox->vbva_info[i],
@@ -116,11 +115,10 @@ int vbox_hw_init(struct vbox_private *vbox)
 	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
 
 	/* Map guest-heap at end of vram */
-	vbox->guest_heap =
-	    pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
-			    GUEST_HEAP_SIZE);
-	if (!vbox->guest_heap)
-		return -ENOMEM;
+	vbox->guest_heap = pcim_iomap_range(pdev, 0,
+			GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
+	if (IS_ERR(vbox->guest_heap))
+		return PTR_ERR(vbox->guest_heap);
 
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
-- 
2.45.0

