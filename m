Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9338967AF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0AD11257F;
	Wed,  3 Apr 2024 08:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E0dV1fiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1D41127A3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712131660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiRLnMbkdq0ZK3iF1Wz+eyDORzRxcdv33M/2a8lgeaY=;
 b=E0dV1fiFMc3fa+z78TpHKQQ0D95CNKe0dHbcvala6CLr00sAKYUW2GT1DVZwNhw7M07lR+
 6Wxroaj9oiIIo7/7k4WyD5c5pCsHH0bXO2McjjyjOnkpWQH9Ak9hmX8cC5zbmOJ4xU0U4m
 cAiuZOpGuYGSgC2qqWwtAU9QaQAWor8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-klfiFR6HPbeHIZf5ReBfrg-1; Wed, 03 Apr 2024 04:07:38 -0400
X-MC-Unique: klfiFR6HPbeHIZf5ReBfrg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-343740ca794so324883f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 01:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712131657; x=1712736457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eiRLnMbkdq0ZK3iF1Wz+eyDORzRxcdv33M/2a8lgeaY=;
 b=OxGhPMWBhvr56P7Nj4vFbRVUTSiNWcryEwVsrnLBkz26Y3ytYzzfBEPQhjsqoldhf2
 fJ+eZF4c3xXJ/Ey9rEOppds2/BFLabPHvdE3hFfexV1LHUPkcP0IJrirGeNck+c0dPIp
 qmkgbQasH7ibEPTGenVL1dutOxjhwifp5OJiNlyxVhpiGKREegrEf4FPJGFCSVe/YB18
 k67q53k5YQlH7ek+R/npSjx7REp3ONfvJRUGwgibgIqcdvtpVkllH7++Fbu8uHc1ZXmh
 qXosLxWvJteAYwsyau4jBJTlfu4uuoMD9PI3Eo3MI6xEOa84dxDTCcKrlewY+uLUPUIc
 SU1A==
X-Gm-Message-State: AOJu0Yz8AOL94Fm14d5rQS0ydSx9gYWQfInMEY6ApCK5JrOw+gN1setV
 mQlAYJyl28IusD9dTv0rIqBwlnPpDUsoyti98qbOqh0d7vTb4z7vXR3dHuMS07/1hkM3ulkJPYS
 SfMeMDC/8wBPZCkv/VdlY8AVXh6jmYg7pzus8lXqV1bSzzdC9sZccVhdSDDQ62fsrsg==
X-Received: by 2002:a05:600c:1d24:b0:415:6725:f9b0 with SMTP id
 l36-20020a05600c1d2400b004156725f9b0mr5651480wms.2.1712131657598; 
 Wed, 03 Apr 2024 01:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEV4CULLDHixjQ5GOzJ41zlIKQYkOtpxOte+Iv6GRLF0JbLuFFpysICEch8WGgEL0sf/Gcg==
X-Received: by 2002:a05:600c:1d24:b0:415:6725:f9b0 with SMTP id
 l36-20020a05600c1d2400b004156725f9b0mr5651466wms.2.1712131657356; 
 Wed, 03 Apr 2024 01:07:37 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm5504535wmb.6.2024.04.03.01.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:07:37 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v5 10/10] drm/vboxvideo: fix mapping leaks
Date: Wed,  3 Apr 2024 10:07:11 +0200
Message-ID: <20240403080712.13986-13-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403080712.13986-2-pstanner@redhat.com>
References: <20240403080712.13986-2-pstanner@redhat.com>
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
2.44.0

