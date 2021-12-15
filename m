Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADF474FEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C7310E17C;
	Wed, 15 Dec 2021 01:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4446789DCF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOuukOAYo/9Fq5Zf9aKVAFzejCB/DyaHkq29KfK2LNA=;
 b=FaaVbqN4fIvy5zkcoUxEMqmdW3YUGmmG4dRohJCArphtMm1nCpxsJeZh5Hw+cPTOzf2mCx
 5ZHYcE2u0iROvzM8Www8AlYVC+lfZT/i2fVuuLdjhI1TpD3Cq7EprU/T136tmRJUUcyvBQ
 B95EYsdD0+3ciM2yVy4MS/6PIctEfuU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-fVEm6Y-WMR2B4tvgaXjbew-1; Tue, 14 Dec 2021 20:01:32 -0500
X-MC-Unique: fVEm6Y-WMR2B4tvgaXjbew-1
Received: by mail-wm1-f72.google.com with SMTP id
 j23-20020a05600c1c1700b0033283ea5facso264327wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOuukOAYo/9Fq5Zf9aKVAFzejCB/DyaHkq29KfK2LNA=;
 b=vv/DUyOAU6vNpUXBNbFDdDynHWvRL0fWoGsOFbuR6Xji20Q/PEjdeOVFquRZL+VChL
 6Aq1nCNZ7+w5f6hP4GLs7wKkM2bYEPnZHIigFpAUeZASGB0FdSEkiHvJ2pt3wDHeZctY
 TZk6GxrS+feRKonZ/E35UVvmIAKxFGeSfpSlzwJmafJMTzai80trEJqc6PwURWNXaaS8
 1V6c+3ARF4fdHw3RtHFf4H0DqqKH+11fukV/ANz+7mFhhaJpB8C1pAFP55GB9rnfh3Ed
 EbB6BgivLa+gtHfoqS1fyRSd5VWCj1nhNqNV3qMHIazIAG3crmmY0oS0A6nwdDEor46s
 iqoA==
X-Gm-Message-State: AOAM5317BrGLl8s/FiRiCFHxNIXaK83Y41LjorptCcuumZ1IVXP6NOHc
 s+2F5d/DjsH377i5IOHPA6x6Cbg+xhBZyAeYmn+yxxoWX5rbKjkQ2tViUPNxPS0XE39zLNwQYQF
 8Jf+0cdfYPQO4zoIW3StF/Vti96qL
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2199052wrd.114.1639530091099; 
 Tue, 14 Dec 2021 17:01:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1wKaiOdPNLNK0v10PP7r3KQYSTvMZUUy+yrt6yG7y1500iVykBIHnCKM9OMeKD7ixr4ck5A==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2199046wrd.114.1639530090970; 
 Tue, 14 Dec 2021 17:01:30 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 47/60] drm/hx8357d: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:55 +0100
Message-Id: <20211215010008.2545520-48-javierm@redhat.com>
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
 Emma Anholt <emma@anholt.net>
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

 drivers/gpu/drm/tiny/hx8357d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 9b33c05732aa..fd788d36efdd 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -225,6 +225,9 @@ static int hx8357d_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &hx8357d_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

