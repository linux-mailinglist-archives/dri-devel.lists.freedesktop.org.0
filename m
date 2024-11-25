Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201569D8742
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC4B10E3C5;
	Mon, 25 Nov 2024 14:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EkZbbzvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33BA10E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732543383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FDC6pto2u5wQTWJgEumgXmAUimdPOWzrNSwboQGTueY=;
 b=EkZbbzvnN5DeLa9hwgdgQBlzrTlxrKR0Kqlz0yTQO4UhR+iTUbFp3NH/Ep2MvkK7box+Jb
 cAD484+N4ejmie4uZa+YWZXoEurR37nSBasOon289t0ftaQqRipSiUe1cIdkbBKl50GCf4
 WJrygp6yysxqQgEHa5JpLkiZfDu6k1M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-zb2MRf1CMw-MA_7y3YTuqg-1; Mon, 25 Nov 2024 09:03:01 -0500
X-MC-Unique: zb2MRf1CMw-MA_7y3YTuqg-1
X-Mimecast-MFC-AGG-ID: zb2MRf1CMw-MA_7y3YTuqg
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa530a61803so137123566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 06:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543380; x=1733148180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDC6pto2u5wQTWJgEumgXmAUimdPOWzrNSwboQGTueY=;
 b=HrTj4ZzrcOJSKY525lVWTCMBkXceSSJ36nIvKQ4lfTOGBU5IvQegu+TG38+DprbLSS
 UWD9Fhoyid9WcvtrHJQb9lVY5Vb78+FXSeM9SnB4HXvoB4ft8/biaWVtVg3/nnqArA31
 fZpS3c1QsxVcT8ptbpO76xDZ0PkJeIq6ju4Ztaouh1r1zIVPqpY1mHdkb9MjimI4CFOX
 +L0NrNP5h9f4+v27/4/Rx/7B5BxaAAZrMNykjkKOfV+Vrs5fivetDq8GZpTsGSMdgSou
 bnTSku7VkX/YyxdzlT5a6FHW9mnBbxi3EFl2jE4F52lKBBTkjZ7sH9eBP0glcqMD//2h
 AanQ==
X-Gm-Message-State: AOJu0YypO/7j8Yi2toLOci8rv7JD7xLLcaI0/bPjdNN0OdHTxAaGGT2i
 TeiYcyW80nIF5kls5Dfj607SUXPnpdyJLpxHFdJhgFfGoVXwtT9wBPTTf3NC6ZABSgoa8FBOhZF
 yr8MV6b4V2s3L1dfo+nfLQauSX/xpn8No2L61H9+nOSaNsUQXOHfu3QgI5xG6rVUWvw==
X-Gm-Gg: ASbGncuad7Me9ZKnhb673QpxxOaQXOGNRKJ7MPTJZyAx6kzmG2lJ1PzaB/iVHUjNMDh
 /ab+9cw16MU8BXQq7jg2OJI4Z2+rrPqUoPUv4YzTz2rvBVw9FVQH17Bx3uMhkJ58iW0jlFmh1RW
 3rBsKtbNIMS/wXHEMmGqMzeRbWp32BbcYkIt4fGwHI4L0BV5149ob3JKEYCJ6Nb8lGHwmgQR0WR
 Y0Ooq/3NyamGS9QIVBjIn8jNBnLv98twd8h8U8GiMfxG4B6Ngsu7cgZm3JWFJt2
X-Received: by 2002:a17:906:328b:b0:aa5:31f5:922a with SMTP id
 a640c23a62f3a-aa531f5930emr659886166b.19.1732543380209; 
 Mon, 25 Nov 2024 06:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDiCZ6k982ag4d6O8/RFD5z8+azZRqNsYYVGtgwxLY+Jn66AWlV3rufysIZ2OmCphBjOoqqQ==
X-Received: by 2002:a17:906:328b:b0:aa5:31f5:922a with SMTP id
 a640c23a62f3a-aa531f5930emr659853666b.19.1732543375954; 
 Mon, 25 Nov 2024 06:02:55 -0800 (PST)
Received: from eisenberg.fritz.box ([2001:16b8:3d40:1c00:e57a:25ed:3c10:67c4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fa36sm473635466b.122.2024.11.25.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 06:02:55 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2] drm/lsdc: Request PCI BAR
Date: Mon, 25 Nov 2024 15:02:29 +0100
Message-ID: <20241125140228.58492-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mk7p1vkFAabEsEYAQaJxSjkMaTxDngxHW7TEf05Fbe8_1732543380
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
Changes in v2:
  - Add Sui's RB
---
 drivers/gpu/drm/loongson/lsdc_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index b350bdcf1645..d373c13a007d 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -232,9 +232,9 @@ lsdc_create_device(struct pci_dev *pdev,
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

