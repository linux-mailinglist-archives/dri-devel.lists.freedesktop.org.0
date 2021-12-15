Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1FC474FDC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0110E15E;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1DE10E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gTwIkh2ZuZS1nX/41ZAGZ6k/Lw+a1aTbRjkqw0aNCs=;
 b=OncHta2xqfMw0WVNrRgbhuajugJkEe+yHqrAS2sf7zn6RSiSFJYw9nidKA7BnqnAB+pGmi
 Fma5IK4IyQzg9hv99wrPL9yQhAPPOrvkUR20vAZ32XJ6A780QYjl8ijBFA/CmqdUEIPofk
 HkbWXpjg5cDgVFZQXjXVod1DR+49RJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-k3tBEjtiMV2pymywRxhB-Q-1; Tue, 14 Dec 2021 20:01:16 -0500
X-MC-Unique: k3tBEjtiMV2pymywRxhB-Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so5368443wro.18
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6gTwIkh2ZuZS1nX/41ZAGZ6k/Lw+a1aTbRjkqw0aNCs=;
 b=izYNCA1A1oO+TEqd51hOui0bcwoCiVpRj9/laYMUiQ709l0ws3xjsvz5px5rWezLpu
 4Q0F/aQwjRnDNatzZKarsdUItyJMT88aZQPuSft38BQ33PLBEYsaSFT3qcdtWOn3l3F8
 u8z5YpwMp31xm+Qq3qoo3CG8yWa5VJsXNVvAatgNONIBTkqZOh3ebOl2E7EBAf/iWcT8
 XT6d8OIlvlh3qU69AuoNdbPVqbBJFhrYTB7GWn7QozppYQfq/oJYUFOPngAhlGy0tBii
 jN0tF1tlPdaAI6jxC3huc7FsA2XCEPasgkG5mTdDuVvr1yZOaIL0wiWWJBuNEHaPuu8f
 zDlA==
X-Gm-Message-State: AOAM533je5bOf56nBsIsIM5UXrdYnG/mVblipVRxnylsEAfKXOj9CSmu
 /jwZtMYSpuEk+mwrVPeh3C+GDuDJAnMtwhJWA+hoM/tkz4QmSIX38zBELnvuCCiylz5OjSMW7iJ
 Pm4YbUM9QVBgpr6iTg5geoRUoyh0K
X-Received: by 2002:adf:90e3:: with SMTP id i90mr2176163wri.538.1639530075150; 
 Tue, 14 Dec 2021 17:01:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNT4JHrGcYWKcPf6mie4fxx896i0OJDy7gnUPceKUoQdhHkSfafwi8ej3qiKkMZPyDBBLopg==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr2176156wri.538.1639530074981; 
 Tue, 14 Dec 2021 17:01:14 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/60] drm/panfrost: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:37 +0100
Message-Id: <20211215010008.2545520-30-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96bb5a465627..6effe1fdc893 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -547,6 +547,9 @@ static int panfrost_probe(struct platform_device *pdev)
 	struct drm_device *ddev;
 	int err;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	pfdev = devm_kzalloc(&pdev->dev, sizeof(*pfdev), GFP_KERNEL);
 	if (!pfdev)
 		return -ENOMEM;
-- 
2.33.1

