Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E49A5FB9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9910E118;
	Mon, 21 Oct 2024 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aSWl6uGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC310E118
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729501885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h/cZ9ik40jZqCmA8LDM3aEei04H39Rf+nKGJ7o3V87g=;
 b=aSWl6uGpfwVHLkkdyCEzCafIi0JNqezsLGix9XwpF5R9/1eYv2syP9N2oFrbTrYvEYMqk2
 OoTvZ596p0YNBFO1I068dho18AkfUYtx4VPNyK0YIbGLte/HFUE5AW8USQUd7K0oFBXXlV
 MP7N5/ZYvSGqjLl7tHEeGy2jGLoy+oE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-XAuzdnn-NrqoFzHEWB7bhg-1; Mon, 21 Oct 2024 05:11:22 -0400
X-MC-Unique: XAuzdnn-NrqoFzHEWB7bhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso34518665e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729501881; x=1730106681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/cZ9ik40jZqCmA8LDM3aEei04H39Rf+nKGJ7o3V87g=;
 b=L2VvN60lAeRUoBczZBBbX+xYgr4UNgLnO/leM7peg6gqY54nmu8J0NKJ0DuR7oha8d
 DAYAduiWSi7HVbVmh3/44ZqKbOCKnxHiuJRitytNlMKZ7x3c0w8uoXHKmgqk9wQY4kGJ
 B+0gJBd3EzALwwoO0UkTPlCnXTFNzL4emmUw9bBlyuRtiZNugpveXYN+iMkmpqdAXQWN
 rYTy2dyFRYEZNMNfGUggQ+8ResObBftfZ9r7Lumee8O8CHX0oFdfFNC8bKKaUInFe5N/
 unF7Ax6X3hgAFTc6NX5HPVBbZaQzgUSdmC651ibq+De28YVUnA9mwB//E6eEG9Rw2hYi
 D0xw==
X-Gm-Message-State: AOJu0YzRsFTVGrjZCLlvCkc8lZyjo1OgwNwIk1KAab4mMBOmVSN/2yeG
 XEIxf27kiiXaDUWl+BcRkB/7lJ1pLA2PK9dxj8OgqG76qk9sWwUlCTiKESR46R/KhiNXoCp2d56
 eIIfyO/Zgf6QTJDERzxGZQE+7DMrlVQCcbahWhM6qN+3yBqMZMImazuEOrr+SIldq4Q==
X-Received: by 2002:a5d:5649:0:b0:37d:4cef:538b with SMTP id
 ffacd0b85a97d-37eb486aaa5mr6145651f8f.26.1729501880847; 
 Mon, 21 Oct 2024 02:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKnogqVvTQRgKVaEROMhzo1GOWp3yCyMp59Ns7uFRLsJYvM2xSpczrhdqT2HHz14fDdQIqlw==
X-Received: by 2002:a5d:5649:0:b0:37d:4cef:538b with SMTP id
 ffacd0b85a97d-37eb486aaa5mr6145636f8f.26.1729501880417; 
 Mon, 21 Oct 2024 02:11:20 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d449800aee93296d73e68da.dip.versatel-1u1.de.
 [2001:16b8:2d44:9800:aee9:3296:d73e:68da])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm3804855f8f.67.2024.10.21.02.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 02:11:20 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/lsdc: Request PCI BAR
Date: Mon, 21 Oct 2024 11:11:16 +0200
Message-ID: <20241021091116.14368-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
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

lsdc currently just ioremaps its PCI BAR with pcim_iomap(). Performing
a region regquest additionally can make the driver more robust.

Replace pcim_iomap() with the managed function pcim_iomap_region() which
performs the request and ioremaps the BAR.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/loongson/lsdc_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index adc7344d2f80..592d01b6767e 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -230,9 +230,9 @@ lsdc_create_device(struct pci_dev *pdev,
 	lsdc_gem_init(ddev);
 
 	/* Bar 0 of the DC device contains the MMIO register's base address */
-	ldev->reg_base = pcim_iomap(pdev, 0, 0);
-	if (!ldev->reg_base)
-		return ERR_PTR(-ENODEV);
+	ldev->reg_base = pcim_iomap_region(pdev, 0, "lsdc");
+	if (IS_ERR(ldev->reg_base))
+		return ldev->reg_base;
 
 	spin_lock_init(&ldev->reglock);
 
-- 
2.47.0

