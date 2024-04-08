Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CA89BA98
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304751122C2;
	Mon,  8 Apr 2024 08:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QwfhcyHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8852B1122BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712565892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnmS+ZQ70OmsHKGyqstMbXO2wKO+H5ag8eg75yEHt7A=;
 b=QwfhcyHBP9Godl1kDZ+nRv8ZPsBNIGEKVPHDSITIeXnNKA00G5TqQzh+QxB+qe21w37FgZ
 cJgXpyCsE0JTLzkwHRvrNQHF+owifn8hmPHpLgiw8+6bB9GfN0grM98/gauFe44k4mll9q
 RTCmQgOSRZZ+3UFD5vlhc4Y8I+EqDcU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-hw1nCBZrPGipAl9PnvhWng-1; Mon, 08 Apr 2024 04:44:51 -0400
X-MC-Unique: hw1nCBZrPGipAl9PnvhWng-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78a5e62931cso55282485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565891; x=1713170691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnmS+ZQ70OmsHKGyqstMbXO2wKO+H5ag8eg75yEHt7A=;
 b=A9/SCNThVto3dlJMcqY0EMfZ8qiEkqGohjHelYxTGFgoN1Bm9eNSrooSBQdoHiYRfm
 HHDI499ZW6XtomtBUI/WCJDwBrTluYmXodHw/92WINb9KWBuhE19iKc28N4S10bTLmVu
 6zS1Zd/HerV0exGK9IBkrBDwPKT6UMbInD8Dl50LhbStc/yuHmpAtyKAz+0s8ELHmNR8
 DdepIia1WXeTFifeHG8dmXHBSeLTYp+0QHLYDAIvU0Lp4fpKZv11vHxd6J4VD2gbzncU
 PPzkdEZaAR1B8enL+VmJ90uW3zlzuq9gmzwIpmYMCSLx7v2uLero//UNk6hgcwPRGiCI
 ilfQ==
X-Gm-Message-State: AOJu0YwWz69Tu3SpoFA3hL6CGS3EhIknLSnNsbs5KpDSUGNu+ef8zj8U
 /PKmKVkLs37C6Hv31z+xR8HJdm8TOv4GZq5djwF5dGOtAnbSLk0E/IYU8HDD9Y/326t4gxrKuMK
 v/l+tGzI0DssPp9KJdxlLwHrlJsR4EF5XhCFYjBGe8dFESVsF6pVQKnqij0Lp4K3UiA==
X-Received: by 2002:a05:620a:319e:b0:78d:5fd5:9254 with SMTP id
 bi30-20020a05620a319e00b0078d5fd59254mr5644010qkb.5.1712565890767; 
 Mon, 08 Apr 2024 01:44:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsVOxGIi2Iuj/AVIRSbBNaD6COng8+R3PpINEdp5/DQW+HcEotDsruGHbTospw6yxnsP+ZjA==
X-Received: by 2002:a05:620a:319e:b0:78d:5fd5:9254 with SMTP id
 bi30-20020a05620a319e00b0078d5fd59254mr5643989qkb.5.1712565890518; 
 Mon, 08 Apr 2024 01:44:50 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 oo15-20020a05620a530f00b0078d54e39f6csm2036989qkn.23.2024.04.08.01.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:44:50 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v6 10/10] drm/vboxvideo: fix mapping leaks
Date: Mon,  8 Apr 2024 10:44:22 +0200
Message-ID: <20240408084423.6697-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408084423.6697-1-pstanner@redhat.com>
References: <20240408084423.6697-1-pstanner@redhat.com>
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

