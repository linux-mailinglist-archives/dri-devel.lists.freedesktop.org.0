Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A7906C7F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B17910EA4A;
	Thu, 13 Jun 2024 11:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eU5zdaEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8210EA4E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WQJKGGQ63IpYpwAqks0j3zwgngy8EFW/hBQkkDLpOw=;
 b=eU5zdaEJq3+BjLa2UOeorqTv3qLvZAJss4wuA380L93MtsnVTMzMD/nxgiYDjR6Yp7wYXT
 QMVg65UD2P1103H8osUslVaWLFQ+HD94Xv/FM7TEWilkTdnN/RiiCPvlWieY5UV1TT7A6u
 pZXz6fFkpr0FWpSWIECXlOprl9SG29k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-yQgUy_iGMNiOAMFtNtkS9A-1; Thu, 13 Jun 2024 07:51:00 -0400
X-MC-Unique: yQgUy_iGMNiOAMFtNtkS9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35f184b67ceso79925f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279459; x=1718884259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9WQJKGGQ63IpYpwAqks0j3zwgngy8EFW/hBQkkDLpOw=;
 b=UVdAckhsw1TeEx/QU+zQpINLKrrcvJ5dHVQfDab+v9GeaWrIw96YlYw1sSJQCAxVML
 yp9KvsmmezoSbDLWrVqSM9fuSwewJtrhlrCOsF6JuFUODVhAGf5PQp7sZom94vXI8GZK
 sI+KyosL9rHzvE0jDP86ywuTpUV7AMFufFZSKIz3pIBSFOtFr5df9bd1SKoOOz+B6Dxb
 ckUV9ZKLf5L6NbItS7Ft4ymwgR2FR9yQ2y3+FUrlZUtqG8sSFkwjp6zdMwTpPdfrqMe7
 ae+Recr3xUPFZhJNoZAcDHNyymIFdjOxjOZtwJY5ZTDpRAvPLnOA6zMekuLZQdyX8yJW
 BhIg==
X-Gm-Message-State: AOJu0YyfaRO76hk1nBehvHEmmBMeZYdjJLLQ8iZNk9S3FA1o+DqhAhYO
 CL4X+fzpujUgQri9egQPoqYcDfmEocWl+KOulNc+zMSrXW96gUXZz7sl1P90Pip2xxkz4ZQv+WC
 xppiqFUddrh5TvYVbTul9b7Hto7KGhnz4nwLpF9VdgcsOXy4FK9PdimHJKh108krcZA==
X-Received: by 2002:a5d:6da4:0:b0:35f:2584:7714 with SMTP id
 ffacd0b85a97d-36079a55d96mr164406f8f.5.1718279459403; 
 Thu, 13 Jun 2024 04:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElWKl4RSn/FE/WxBDl2/l3vU5Ab6FM43jl4nz2rwpq5A2nGMHBM+4ko0mCUeuR7gvoXMoyQA==
X-Received: by 2002:a5d:6da4:0:b0:35f:2584:7714 with SMTP id
 ffacd0b85a97d-36079a55d96mr164394f8f.5.1718279459138; 
 Thu, 13 Jun 2024 04:50:59 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:58 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 13/13] drm/vboxvideo: fix mapping leaks
Date: Thu, 13 Jun 2024 13:50:26 +0200
Message-ID: <20240613115032.29098-14-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240613115032.29098-1-pstanner@redhat.com>
References: <20240613115032.29098-1-pstanner@redhat.com>
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

