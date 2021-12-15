Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF230474FE7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6350D10E1A8;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA489E5B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOtZ+bYPZ85Ndp3GY6tG92tfrUooMt4dIjEoAv+Ez9E=;
 b=KVq6Us5PE8PvhX5KpVUOtqbg/zvXq4KRLmSDOqMnD5wFNVmbJRJo3v+n/oQwyROZWSoWah
 QvgpLKMAZiyXUFgzni/EBt/cvR0DEyVqKgIIH56/g9eoOqprl692aKROJC3YFqZHUa3e0Q
 3Hhr80AvZ74IrEJgyVEFpS2IfN2E8J8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-9u66X1M0O7Cz51_jaK61Yg-1; Tue, 14 Dec 2021 20:01:33 -0500
X-MC-Unique: 9u66X1M0O7Cz51_jaK61Yg-1
Received: by mail-wr1-f69.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so5379739wro.19
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOtZ+bYPZ85Ndp3GY6tG92tfrUooMt4dIjEoAv+Ez9E=;
 b=KdfDWdE66Zq1zk5QYMKCzWY7oeczGxwlEqNDDbcM2WErGxs9f5XlBSuIu4RmJeVysz
 DbJ1RH3ge7UUJWacbxfg+9g6QAhn+ODYpRZaOarNJWsCgdADmOzqOjeiveF/Tyyh6J31
 3+62WSMk/pbsl2zFCY4wRI9gHPWIm4InpNk2KqnY2lJj6Jr0LzHFwGUpCiD9wVK05Fkq
 qlNkX1x6TroI7HF68GcfSW6+HaQyWF9jsT9cTRwWOky276DlI8pRSm1uzMIMXmzhrihT
 2gk8sbStbmNrc1iktkb8L2n+B1Lw6a7dUiiVBLeaU4u/tUDz0x7xm1eYshHhnohbaDZy
 vUoQ==
X-Gm-Message-State: AOAM530vKUaQpL8NHfxZI0TKp9dUPDZeMhOxGVE13+UL3/Y1uE6tZ33o
 6zkroYfMqKvO37cGicQRoGMPq1Daet6zBJzon+m/CoYaoUh75Ma1YJFXtNDTGFRVT0A7/lG3ELq
 HQBeMAGd8qWOlg1X9lPMSivZQTPbb
X-Received: by 2002:a1c:8015:: with SMTP id b21mr2303284wmd.161.1639530092741; 
 Tue, 14 Dec 2021 17:01:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzveMGrtxph4ddQdlxUDnyj51OmE02XvM99tsD2+tFvlfaGlDPT926wMkCcW/6wT3QYGuYXxQ==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr2303272wmd.161.1639530092549; 
 Tue, 14 Dec 2021 17:01:32 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 49/60] drm/ili9225: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:57 +0100
Message-Id: <20211215010008.2545520-50-javierm@redhat.com>
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
 David Lechner <david@lechnology.com>
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

 drivers/gpu/drm/tiny/ili9225.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 976d3209f164..1d193c534318 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -369,6 +369,9 @@ static int ili9225_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &ili9225_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

