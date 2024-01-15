Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758A82DBB5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6D10E2F8;
	Mon, 15 Jan 2024 14:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1710E307
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705330063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIzHvpzkkigfxw83x1LWeciN350K4+qfOeyYElcXkdQ=;
 b=NBBlxOGKiAetLYdZkf0QQ2gR5ATofUQ02dpmCDMdRyQEJej9snWEfYiauf7qDBeKpSF5Rm
 fBrxNICmFy3vZSkKwYSE0LW00g1KHnKdDkRRirn6lu5v8whDrY3qTwfBu4VN7VVCB2cFKt
 kUE0q+DDKzbeFBsrXL2AgDN6569X20I=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-EvOWgl6eMIO28-7GrZZwgw-1; Mon, 15 Jan 2024 09:47:37 -0500
X-MC-Unique: EvOWgl6eMIO28-7GrZZwgw-1
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-594cafcc66aso1838910eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330056; x=1705934856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIzHvpzkkigfxw83x1LWeciN350K4+qfOeyYElcXkdQ=;
 b=vQUV2t7e+XMy7Bc2uSgHGXU3iflycqsXcboCITEAGnZkZpgJhAE8FM1Ozd0C1lTkgh
 OmLDrOT+5IZ0yGG+pLkWUTV4ZA9pcTq4Qz7/wtMimPyC0dEInvT4+zfYkS2JcaHd7qyk
 5dpdZZOZXtBdH+nmGgbBLEzNqC2HJdJoQ1+Ark/BsZUdCr+1RB7Uw/JTjjNKP7FxOFYI
 mqC86sFefuvDRp4fj9oY5HJViCq6F9VAINcyGEVMIrHIqo9Qe+ugvcMn/XBPzz3IBHg/
 UH/Z3mwZXep65DIykA5b5JqUGxyl9SRNBGp7K+HcDZpS0A5nXR94URmHZ/R63KzG3JJu
 +IIQ==
X-Gm-Message-State: AOJu0YzuFQuWKiPKF464OzaPyzATj9PZvgr8ToksnQkeYQiPhCSvd/ia
 OWXhWYkX7fPQkNzjNO6yFs7QvOA2INcheA2Pq97i9skOgd4Y6MIFqDvIuPz597KDBi8PFx/aY9E
 oprIKmTsn2t/Yhwosi1avWPpWZ16Nk5rh18ZU
X-Received: by 2002:a4a:dd8f:0:b0:598:b2d7:2499 with SMTP id
 h15-20020a4add8f000000b00598b2d72499mr7707356oov.0.1705330056486; 
 Mon, 15 Jan 2024 06:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi7+XsSK011xhs3AvyU5Z7vMLQIc2V6iqOiH+OrjwaSbXs/XiSSr4Ft9JY9kxXHF9woE1zRQ==
X-Received: by 2002:a4a:dd8f:0:b0:598:b2d7:2499 with SMTP id
 h15-20020a4add8f000000b00598b2d72499mr7707328oov.0.1705330056145; 
 Mon, 15 Jan 2024 06:47:36 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ne13-20020a056214424d00b006815cf9a644sm1020720qvb.55.2024.01.15.06.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 06:47:35 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH 10/10] drm/vboxvideo: fix mapping leaks
Date: Mon, 15 Jan 2024 15:46:21 +0100
Message-ID: <20240115144655.32046-12-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
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
Cc: linux-pci@vger.kernel.org, stable@kernel.vger.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the managed PCI-API was introduced to this driver, it was falsly
assumed that initializing the device with pcim_enable_device() instead
of pci_enable_device() will make all PCI functions managed.

This is wrong and was caused by the quite confusing devres API for PCI:
The function pci_iomap_range() is never managed.

Replace pci_iomap_range() with the actually managed function
pcim_iomap_range().

Additionally, add a call to pcim_request_region() to ensure exclusive
access to BAR 0.

CC: <stable@kernel.vger.org> # v5.10+
Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 42c2d8a99509..7f686a0190e6 100644
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
@@ -115,12 +114,15 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
 
+	ret = pcim_request_region(pdev, 0, "vboxvideo");
+	if (ret)
+		return ret;
+
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
2.43.0

