Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C76474FC0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A6210E140;
	Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACA710E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJpjtumWdUbVBjBY4BM1leidlI8M/LKSk6OTs3RZ9AU=;
 b=HhISJ+HB4Yr5gDvey0g2H98cdLwKIt/Qu7wD8gMLDwvcu7el1kKPwVikUHz7gEmEIlbilv
 qKvusmUKaR2oXk9OfozryFGlLm/nEMY46KNRbdbrRDZSYHc/27HWGDUcdx6/+UAm2iDuOj
 d11Bk03pTRfYOymUndag/jafsRDMf3Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-U2h79GeEP9ykLDhvaXasjg-1; Tue, 14 Dec 2021 20:00:55 -0500
X-MC-Unique: U2h79GeEP9ykLDhvaXasjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so1154501wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJpjtumWdUbVBjBY4BM1leidlI8M/LKSk6OTs3RZ9AU=;
 b=Jmwuc3ST3MepU3XBDSN8tKcTcBgUOse+NbH2i+AV0FYtgpV7bxVrmUt9emOSAU9+Xo
 MrmjWq5Hq483kplgNafudgI7LbMJOmpNzro9IvxIv/kiGDWanWFPckwbhowAxxfANhUr
 sfRYxkPn4MGyM7Q7dB+YjXf8L0yhXhGebNlJdJ88tuwAMSHDjRg8kz6t3m4qNfQRvWWH
 FvrBYBLV5GOHok+P5E09CeZPBnSELCpJgQ47P/G5+cN4wAMrj1RLozt9YAkJ9pRWHj6p
 h/2N6T/FBhC1f+Ka7VomEI8r7LHoUOUJeL5nSuyxSpM4QLKVZw+ccCrsFo6e52hxMMAx
 tMdQ==
X-Gm-Message-State: AOAM532bOQsr806UeOPczZ0oyFftSzL62hCkAAf+bsBycAcpjF0sLpYT
 hau3SriC2pw1PPePaMhW0YWkKtEvagoThRxVzffA1EPkM/1j/7F8uLcCMArXRljsCQ79LjeMBkY
 7g0wuT4e7NRjBRvWKHO7InDJbpWCI
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr2450318wmq.68.1639530054096; 
 Tue, 14 Dec 2021 17:00:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw19sHakCMRq7/L4DbYc0FVTXl+HZZmxN/MLKnD/o1EVP/xi6T4zBHdo9JAGXjXp5J4PjGlA==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr2450306wmq.68.1639530053890; 
 Tue, 14 Dec 2021 17:00:53 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:53 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/60] drm/aspeed: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:13 +0100
Message-Id: <20211215010008.2545520-6-javierm@redhat.com>
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
 Joel Stanley <joel@jms.id.au>
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

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index b53fee6f1c17..c70d8f046816 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -310,6 +310,9 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	struct aspeed_gfx *priv;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	priv = devm_drm_dev_alloc(&pdev->dev, &aspeed_gfx_driver,
 				  struct aspeed_gfx, drm);
 	if (IS_ERR(priv))
-- 
2.33.1

