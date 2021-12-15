Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B64474FD7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B010E16D;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5010E184
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlXhVbsfFFxgoHg3qvWCKHkfx1XeF32ozdnXauwSHqw=;
 b=cw5gwDPw0NkNXOa2wPIMPrvR04wCasGfuGAWm1DSq9AiJbhM6k1CH6VNIB21uMFOVTBhCc
 mWJhF01MIJAfHsjUGMEZtEB/i/BuMVXCeBt/AUdc1nflr0tNlnbJIIIXVagRI5iciOWudC
 C9NaEGha8YLusnOmUnenCsqoqXob5dA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-d-6lovxiMZatGekl9Q7W4g-1; Tue, 14 Dec 2021 20:01:18 -0500
X-MC-Unique: d-6lovxiMZatGekl9Q7W4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13857743wme.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlXhVbsfFFxgoHg3qvWCKHkfx1XeF32ozdnXauwSHqw=;
 b=M6qFsRfmU6UKH4wXUXSqrOdrGCzGtlIwnDkszTXOCi3Et8s32Jma2uQUn4uhAuGXLv
 2/BqSlXLgL0Xp7Tgw+S6A3z9ClhSUb/SBrO2WpXzNc65g6qj+w792ZtW8F6x3GaWMj2b
 tmIUc4XtmTe4MI6ulHm31oGF8TYrgHFOX5rV7vVZ13MikU7EogEJRYhRuzpTLXN3g+lh
 6outQbgEhRJx0xFqpLgL/ZIgQHJniqMhlzXVM5jC6oxvUjiiGeyWp3TKTym44TmTN3Yd
 CGfouQprqLiABrrjt66AouDPru7n5dvmj8uu+VnNlyHFUTpzxckyAyabkSjVggnwwiZU
 NG8w==
X-Gm-Message-State: AOAM5315b12NsqFtTENe+blEV6Yv/Qcq2ve6TQ18sOBf7NjnFPOupO1D
 TkM4JgdIk1JGzcNGN3On1ujzgvHOULuIT1L9mGLQdbRYYYvnjSf15shYHsdoHIc1Pd7HPLC/o7N
 o0Ne+EVJ1C1/WdZesFe2+VzRCzaA4
X-Received: by 2002:a5d:4690:: with SMTP id u16mr2172716wrq.321.1639530077177; 
 Tue, 14 Dec 2021 17:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2IKpNthIDTb/vshueDRQ12ykgOf/dujkn+q+fTdpsbe6EplDJChKvNt9qYLcnXQr1MXPhhg==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr2172699wrq.321.1639530076970; 
 Tue, 14 Dec 2021 17:01:16 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 31/60] drm/r128: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:39 +0100
Message-Id: <20211215010008.2545520-32-javierm@redhat.com>
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

 drivers/gpu/drm/r128/r128_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r128_drv.c
index e35a3a1449bd..e49db9692df9 100644
--- a/drivers/gpu/drm/r128/r128_drv.c
+++ b/drivers/gpu/drm/r128/r128_drv.c
@@ -98,6 +98,9 @@ static struct pci_driver r128_pci_driver = {
 
 static int __init r128_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	driver.num_ioctls = r128_max_ioctl;
 
 	return drm_legacy_pci_init(&driver, &r128_pci_driver);
-- 
2.33.1

