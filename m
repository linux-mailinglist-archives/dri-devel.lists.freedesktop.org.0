Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DEA838AA3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859210E736;
	Tue, 23 Jan 2024 09:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080DB10E736
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWMdjy11RuBqd4YsQRKnY1KCsHHpGsFFOhcTWKEv36g=;
 b=EJsTF98n7KDjHTmLOs1rffxLpvW2Qc16teNyEkTQWwP6grnSdttrjqZtOCvK1pMQXmkeoi
 CBcW2Y9gmFZK96jDS+jrFLoS0Wm7B+xngEIy82QhQ8smfF0+VPB2sfHwIx8QHmsJ/Lxo+w
 Tmy+XPcYbhwMyw/VY7rZ66eeqsa4Kjc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-rIAq9HSuMhisRrZsKF8JcQ-1; Tue, 23 Jan 2024 04:45:08 -0500
X-MC-Unique: rIAq9HSuMhisRrZsKF8JcQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4299dfcdc0fso12229381cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003107; x=1706607907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWMdjy11RuBqd4YsQRKnY1KCsHHpGsFFOhcTWKEv36g=;
 b=SewfgwQSiehcZ3Sqb/1TVoaLeYftbme1zt6VnryoUOtQiBi4dhs5veC5bwvObFtVRk
 2tMiiM+riyxMZMuZ+7xk1Nsyzec3XqirraA8xQL4qsGjPLqMqlWSyoHdRl6thqtgZv73
 bIJdCpHJ7Ogr1r5YIy4+H22mmHuEAi9b2OtFOWS+jFw4EXhoWiUBdF7JMTlvfWH41LWT
 LIWnsktJXcMBKq/wkQrhFxAYH+jwMBTUvMy8wVxpnKFhfZ/Tc6BSnw8PdKE5uazkKQn5
 rlgkN+DqOX+iLC1Lfej8y9RZRoJX8Pm/uv18gVh3HUkINrr34YST9sMd7wGK/T8v7xRU
 p90g==
X-Gm-Message-State: AOJu0YxFpUeWgGDQ+e9uk/iFbFbQLR+6YEew4B8J0UalcjWdmYK6CmJ9
 D0Kh1iApjSo5W0lKVY6aps40Z3NPzEqXvvyqNKrrzCLs6EyHPOQU1B0MIaQuetIEX+XGG0fFR9C
 IVtYBUGFdM/OQAizH54P38rEOoiIpYmDJN/JZCk8pPDga3A4S7glLikiUIMUc2oQb8w==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id
 d5-20020a05621421c500b00686944387b1mr4377402qvh.2.1706003107752; 
 Tue, 23 Jan 2024 01:45:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFss4rceMk+iJ1mHCcS+hUWfR7kWRFY2O8zC9T9j0KLwTPnx3az+4pz7feAJyO8Yaas1sCjsw==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id
 d5-20020a05621421c500b00686944387b1mr4377391qvh.2.1706003107503; 
 Tue, 23 Jan 2024 01:45:07 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:45:07 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 10/10] drm/vboxvideo: fix mapping leaks
Date: Tue, 23 Jan 2024 10:43:07 +0100
Message-ID: <20240123094317.15958-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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

When the PCI devres API was introduced to this driver, it was wrongly
assumed that initializing the device with pcim_enable_device() instead
of pci_enable_device() will make all PCI functions managed.

This is wrong and was caused by the quite confusing devres API for PCI
in which some, but not all, functions become managed that way.

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

