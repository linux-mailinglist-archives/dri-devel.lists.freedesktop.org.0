Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F3474FF4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE8B10E1BA;
	Wed, 15 Dec 2021 01:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE21C89FAC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaOcQFceqoFhjW3mPUFT3x9iy33WyNhYEbrViQakyfg=;
 b=OYjxs/U9zu0pOZ35Ju4RO9TNGygfFRtp2HtR3sL9LISpyDefyisXz9f2CR7dcqk8I8OfA1
 L0D4n/MhiFDVF9CHFm4QssGbU0EU7DFFht2vfHyp0L8br7hYoCKhDIDg+m7vC0AN0r5A/L
 PNVmSau+v5gJs6Dpy4UTnH163CehttU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-fOZKaGZ0O_ypGR4CknaIuQ-1; Tue, 14 Dec 2021 20:01:35 -0500
X-MC-Unique: fOZKaGZ0O_ypGR4CknaIuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13858071wme.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaOcQFceqoFhjW3mPUFT3x9iy33WyNhYEbrViQakyfg=;
 b=yZYG14PPdD4m0SJ7x8AYqQ4GjB2tWka6C7sWZk+o47OkCMFxoLSYC60OEuBOeEn7Zn
 +mqeTQG2vjhyoa9JZzeuPtoio3nVZ8ltNv6uE54jnEhklMs+D+wfyBE1JXkz4bKRf3hK
 shD0Qb/uQVWTbTCeVWE/dS9L7G1CWe9ut8H80psA39SJCs6kJ/LQC2W43oDvCXXCHXUs
 eV9pf2h5u10jpob3cCw/Xil87WC6iLe3pdeWFdFvklR1yY/4oAiiRGdmXzyz55Bfq75N
 Gkv5bgKbdCKVqG4Wuz/mPhsfXmCcG9I/4y62PKykNINHUgJuiLUSvLVxarwCw12vE4wF
 LxtQ==
X-Gm-Message-State: AOAM53245qweI3EdtEj+myfFflZcUAFGz0F8I35bKw8zVaYHPQG+6Z5o
 l3GhLcIWBzzmTAyx5ktfmSEf1JdbCh90VQUcgxLdtcio+ZOP7dpXGm5L8NKpVA0KuKSZS0nBHX+
 TAolvlmD40kAEySMbXon5QY3tM0jj
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr2042856wrw.591.1639530094342; 
 Tue, 14 Dec 2021 17:01:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi4UYgQtki5bNwT8+AkNXkDy6aOra2gVR5vfoINAlB7OnscPSeivm7KWqYB6rmeeIF4sb06g==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr2042852wrw.591.1639530094176; 
 Tue, 14 Dec 2021 17:01:34 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 51/60] drm/ili9486: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:59 +0100
Message-Id: <20211215010008.2545520-52-javierm@redhat.com>
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/tiny/ili9486.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index e9a63f4b2993..8e46420e1a87 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -196,6 +196,9 @@ static int ili9486_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &ili9486_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

