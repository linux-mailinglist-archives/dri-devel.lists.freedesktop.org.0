Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CF86E053
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22A810ECB3;
	Fri,  1 Mar 2024 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gUBO8PN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FCE10ECB2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709292633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFTRxYvZ76dhFqAdPDH/a2zkO7llSf+/xEzdCoge4iY=;
 b=gUBO8PN8++7NqJjG2X332W3sB/L8Q1DPMu2eMeHc/xzL7tlw0ZkaQ2F1/jJNC+ewGJmpDF
 /eXhzM7j+Gs0roqONCDmp0eGY57h+HCsd5usOFjqWPdIrhrV4o2Tizcpby+jh5WnztXPM2
 +ZZm9HMED7F3/L15n87zebCUI1Wa5xQ=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-gDnUbpjcP_SCVyuRaEaREA-1; Fri, 01 Mar 2024 06:30:31 -0500
X-MC-Unique: gDnUbpjcP_SCVyuRaEaREA-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-5a0c318c056so154569eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709292631; x=1709897431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFTRxYvZ76dhFqAdPDH/a2zkO7llSf+/xEzdCoge4iY=;
 b=a9BV1PMNFxIM8WwcL2CPmtJwf/utCW4dfRJpBkYqPyQC/9ofq6soy4YE6SNPPA4lYO
 SEhLK6xrizFQPNrQ6QMxlyqJ1fDRWDG57a4AKuPnrQVFk+I17FmKgEWNvL/TCt0qs/pu
 5I2Go4Qy0bq3GZ4sd6GTb4oJL4vJjEV7yp1ABMZvUtmEz0NmyBER2YfdrLxjgbY3YnM1
 hQQOYcGncckc6wpgiZ3IVLgD9eZCgERY+hadpMw6sLNW6d8yljqJ7ibA53Sx2LCYgztV
 F9A6YxyUHFyQakQ7UlQRmOG71wyoAtoo53TzUOIaSJYHh80mYuMZ8DmbEzUxi60pv2Tn
 A+ZQ==
X-Gm-Message-State: AOJu0Yz0+EISvWT7FXLJBya7OYwz/H0uHUil6sNNjcxBJfR8ttP7HiUM
 g8ewrCBQqSpwPOlonVh2VmKjVh2u8URsdwCDDcDLvyzRfvi2/JgJtHXgDKlZEVP09xYjATyDv9e
 EAQZR6ngDQx/0YewLvhR/EV/YquV0KxjQ/5B13HHMkMYZNOJ5wEfzKFaojNhdxKA/kw==
X-Received: by 2002:a05:6358:5923:b0:178:9f1d:65e4 with SMTP id
 g35-20020a056358592300b001789f1d65e4mr1147486rwf.3.1709292631165; 
 Fri, 01 Mar 2024 03:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/dYBpHA/2LZIcNaPDDpZ49F70JHds10e81JbU90eBR8pmO8IjXPGhx9tXuvUpPM6IQ4Mw1Q==
X-Received: by 2002:a05:6358:5923:b0:178:9f1d:65e4 with SMTP id
 g35-20020a056358592300b001789f1d65e4mr1147459rwf.3.1709292630853; 
 Fri, 01 Mar 2024 03:30:30 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac86781000000b0042eb46d15bbsm1596239qtp.88.2024.03.01.03.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:30:30 -0800 (PST)
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
Subject: [PATCH v4 10/10] drm/vboxvideo: fix mapping leaks
Date: Fri,  1 Mar 2024 12:29:58 +0100
Message-ID: <20240301112959.21947-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301112959.21947-1-pstanner@redhat.com>
References: <20240301112959.21947-1-pstanner@redhat.com>
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

