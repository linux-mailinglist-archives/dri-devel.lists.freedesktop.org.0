Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57659474FF9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2088C10E1D3;
	Wed, 15 Dec 2021 01:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47110E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmzxQsYusvcUk2QF1uoXFK3UYSPveOrXaut2p31GcTU=;
 b=fKQEuo3gGzZvCGd1ajTEDvsoB3HcutLeEhAJ/9eTWn6g8OCJ/fuNzrIl8UcT4Kwh9HZF3o
 JuoIbC7R+zUL7CuMKJpb+6RTvZpi2bfdH7qrY/E8d+tYyYCId2dOnSxBo6vvTRKMe4/Kcu
 GedBreo9oO5k93qwVCw8O3itVxqHSSE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-Ik5oxJEPP62wWQ-lUtNpmg-1; Tue, 14 Dec 2021 20:01:23 -0500
X-MC-Unique: Ik5oxJEPP62wWQ-lUtNpmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13883875wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmzxQsYusvcUk2QF1uoXFK3UYSPveOrXaut2p31GcTU=;
 b=zf4niMxQu1/FHZq6rzTkyLX8JVONZSjTHsGOl/KdMY62AXo7e7pacbgn1dLUqGqRQL
 RyP2cbcubLfRnxP3purHmNp6PO6fcbNMqzO829y1rIDtLO+oHt4GwTjrdvRPom74mrYE
 jwUgLrOr2P/DT0rCwNGwa/DUGd0hOYCAWMxDr/ubRs/rHVYIUOv86kQ/iH7hQ0oCDDyK
 CMLPsmmlSDfFkwqzfH8YPrf54p0JHZ4Z/c7eISfxDGtrjmVVnWm15sC14wLCJHJ8VdDs
 ivC4Q2XXFZHVqKHJEbM9ZxssVYBp4WFVUd31WmO/64HS3b0xklpu4zSmst9SpjZe9dTM
 FBnQ==
X-Gm-Message-State: AOAM530hE8pk5bZ6TtnX7+kwCDhVNm4VzF3jVnV+SaVY4NkQXOVhqAt0
 Z8PtLy90SFQMUKoO//ntHhfAlBSc0uoloXo0YUHPAiVK+74UpUcwOxQ2bC0I0P/YmJmT9y/2BwE
 F6wIfqxyjbwax6+/UBg7+ao/cYnqy
X-Received: by 2002:adf:ea51:: with SMTP id j17mr2155351wrn.421.1639530081872; 
 Tue, 14 Dec 2021 17:01:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMiMKZ+qKZg7zwxbLxevSi3s2DzFDWSa7D2MkJcQiC4wd6pda23MO7PbLjrqadFQauIEizFA==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr2155335wrn.421.1639530081646; 
 Tue, 14 Dec 2021 17:01:21 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 36/60] drm/sis: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:44 +0100
Message-Id: <20211215010008.2545520-37-javierm@redhat.com>
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

 drivers/gpu/drm/sis/sis_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
index e35e719cf315..d592af70e8be 100644
--- a/drivers/gpu/drm/sis/sis_drv.c
+++ b/drivers/gpu/drm/sis/sis_drv.c
@@ -126,6 +126,9 @@ static struct pci_driver sis_pci_driver = {
 
 static int __init sis_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	driver.num_ioctls = sis_max_ioctl;
 	return drm_legacy_pci_init(&driver, &sis_pci_driver);
 }
-- 
2.33.1

