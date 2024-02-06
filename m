Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0B84B6A6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A17112BFB;
	Tue,  6 Feb 2024 13:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z5d9BeoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB91112BF9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFTRxYvZ76dhFqAdPDH/a2zkO7llSf+/xEzdCoge4iY=;
 b=Z5d9BeoJTLuAhghSn4uitOGY9UNzMcDT8skTM256Rv6t+APnxm7JVH9aKO6OFUXpfTjXgM
 /GlF+32EEX+Zp7EljcyBiIXn7dXglg1/ocmXuVKulrUwluP1XmYIWW5isFgnkYDg/RaBy4
 2mrMi3255V+1Xv/KwO1MyYtUlqWMT20=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-rKq6h_SmN2yLZEbv9FlnDw-1; Tue, 06 Feb 2024 08:40:59 -0500
X-MC-Unique: rKq6h_SmN2yLZEbv9FlnDw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78543d8dfd6so47980085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226859; x=1707831659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFTRxYvZ76dhFqAdPDH/a2zkO7llSf+/xEzdCoge4iY=;
 b=X3NXmC5ECj1l+4V3n/V8rzWv368oi6qYhnNt7yya8Ky6H6aDNTI3mmiq4d8Y/ELqgu
 hpHnEkxUd/Dg3kV9/sX2RGjut/joF8rNruS6KPdI3Mw9BpjwCcnIXtBb7SGUIYCR7ejx
 uI/suBWO+h45mxBfXeRM/nC/+dM0A/Z6M0igFUkRvuDTUxwnYchSSlvmQRsgBXSRurVR
 l2QW+5j5UDqfPYVirU14IMnaWAstubLuWiiygHnAuiOgPiECPFHvS9sWFwd4xTjBIBnx
 HF+fV7VmRpxWGuAgKChhJepBqsH6NyxSAqqK4TVSx64gPoHNTaY5dMkfD0F+yBx/wMuW
 SgwA==
X-Gm-Message-State: AOJu0Yz7t0FicKt3BSSaaBMax7Ie9FrN5Cihtzl4ApzMw0hEkjTEYCtJ
 0DIL5maA/afSggAaU1XiL9XNyjtWb7eRkwOlzyQk89S3Oa8FcoPbKZJ6xMW411awi+Z0l05Y665
 PHmOA8sjdGxkaHoSRj+XwcKPbXg/aXInTMp4oDEBVA8ZhVutozeLa6CEEvgcueMaCog==
X-Received: by 2002:a05:620a:458f:b0:785:8aed:219c with SMTP id
 bp15-20020a05620a458f00b007858aed219cmr2740647qkb.4.1707226858849; 
 Tue, 06 Feb 2024 05:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbUFe8rAmzdQwiOUkDOWaSU2uG39vl/g+XyIl4fyr/XwVyPG/ryyPI2bU0DdbSQp1oH7bwGw==
X-Received: by 2002:a05:620a:458f:b0:785:8aed:219c with SMTP id
 bp15-20020a05620a458f00b007858aed219cmr2740622qkb.4.1707226858478; 
 Tue, 06 Feb 2024 05:40:58 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVVeDR5b9c7g/LX4DSP+QZjXTjR4mD9i/Uh3Ezjtj2GW3JtLorKY5AblA+CjtJql2aLlNALxzV0bl4U41u/GhhZLatfz9z0bPdBgozM5EYqgeElngR5qR0Txp3/2qm26N1Ys4+/8hSBu6u0aVRfjpHdO1etZE2hVCPT0KXoSUUzd617dh59feMZZeAjbZhdv8EnSQMoiuo89rEq+BvdPIr9sAN3QLOVlkylgY3mNTLjiVFjIdPDcpIFzQC9jWFF/j85Y4fRB2DTkj/Y3sTRuTE4bDbGsJR7R5v8GBdTiU3fm3/tDc7ma55apc9cEjsouFx/iBcEiQmJasZt4DHn09OqYIwb+Wn3YbkFIprccJT/mkYLQbiwHpsE+JR6Ql4TqRJ4ZFLdqlLKi8ArBJYgqbXk+HpyMNjYOPlQc7SM
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:57 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>,
 stable@kernel.vger.org
Subject: [PATCH v3 10/10] drm/vboxvideo: fix mapping leaks
Date: Tue,  6 Feb 2024 14:39:56 +0100
Message-ID: <20240206134000.23561-12-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206134000.23561-2-pstanner@redhat.com>
References: <20240206134000.23561-2-pstanner@redhat.com>
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

CC: <stable@kernel.vger.org> # v5.10+
Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
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
2.43.0

