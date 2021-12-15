Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E9474FD3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27BD10E166;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED65689E5A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zIYkHiSTjfhXv2pUWjyeDGgCpLdVz7zm4+9MWiGa2k4=;
 b=iLlYVDsnmCDW/pI5OLIbS9oAIp0xQV4SlL+nVRbG1DqLqSwSrSe//rr3c33boI50LK6X/+
 C/yhwAZjgEdu2MakQrlz9OMhDKpWFpTpJPQv5d4il4DAIxxYog+dUTFKfjBsxLUw0SPfNY
 i+2Z6jZuuf2EbvoTWjCJw795bH0YPck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-1-jC-y5WNAeBVehzAzP4LQ-1; Tue, 14 Dec 2021 20:01:33 -0500
X-MC-Unique: 1-jC-y5WNAeBVehzAzP4LQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso13872479wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIYkHiSTjfhXv2pUWjyeDGgCpLdVz7zm4+9MWiGa2k4=;
 b=z4MTk3zy8Klsc2hDGwGyAzMEiYapIOGnRgvJb0gvE/Oc/+LcYbJMAGiJnGVEihz77p
 LdG2RvVn3xKe7k0Qf95W+zZTVHJfTb8GK8dbtuw1bDRcoa9tmfcISnoIUXb8U4RGIPb0
 UGkf5HUsrL3hZvsoRpgc7qwrPd0MA2gDvlLJoBm16oDDvRBezBvkR+JTr8zdNWRbNSXr
 n8mkL7zckgg8MrWHtzY+yUoLYyZOTKfvHZho95QRp0CKA4bA/dfQ+MRpzHs3AoypWCW5
 bJp8NYzHDPsw/f9iY4NYgJyZcTdtAfE25v7jPgz6ed9tLRvCRCx5JYtGHayygB3t955w
 lMPg==
X-Gm-Message-State: AOAM532aI47NIvMCV7VFUDrHXDZSgspXKAFRWlLeOV4nmhcFI1uSIPUW
 zXbRUVbHfaMXBverHPSaAR7/QZ0IjWV7wH7LgRL4/PPfjA8layCMTWLrPiqcEgzx5srnX/HGERf
 lsjGORmZ/EMp/UJxNc/f2vnlGquXK
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr2159122wri.153.1639530091973; 
 Tue, 14 Dec 2021 17:01:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy/epZ93yoUm9eoPI9zLu3yNWRqx4ws0GAVPuEp1j1Ipc62W1reNu7+9aTyjB6ATRboMKlAw==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr2159112wri.153.1639530091764; 
 Tue, 14 Dec 2021 17:01:31 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 48/60] drm/ili9163: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:56 +0100
Message-Id: <20211215010008.2545520-49-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/tiny/ili9163.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index bcc181351236..60afabc6bb35 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -146,6 +146,9 @@ static int ili9163_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &ili9163_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

