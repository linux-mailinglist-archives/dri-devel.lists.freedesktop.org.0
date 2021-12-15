Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1B474FDD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2272F10E19D;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62610E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyO2deYlr84/xlhfJ3zeY84NwsLkiGhBAaun/MQyRLQ=;
 b=W8/g6IWdefT8+6Kjtg8eCsfgjlK7yVx8N8lyQJnoU2B3wEWsMTctd2NEJot6zC/73i/6TE
 J8O2ssa/9HY7vIyYlx7DXIKYQVVVRrol1UCZcL8kmZYvHAyL9N8KGHcicSY/4hkFFIfRgi
 STL43pqGX+4Sj+a1HIGrPbOhfIxQPwA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-hZR7l90-OZarkGUPzU-eqA-1; Tue, 14 Dec 2021 20:01:39 -0500
X-MC-Unique: hZR7l90-OZarkGUPzU-eqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso13872634wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyO2deYlr84/xlhfJ3zeY84NwsLkiGhBAaun/MQyRLQ=;
 b=UZMrb6O04glSCV0MjN6eGpCyxMnkXpYDzLf2Knfcyi1GBHoAU5MEi4EF1HxOyS1WoK
 bemIzHLFuuhjraMRNisagMXC1k0o9hfCuHjugBD7ZVo8KJ+2x1RVWIvcwXSjhYWlsXsO
 R07IUcIvy0HeWttBGhOdePwBwoD0lEERQuzUODn6Kg1ihBuXyw9kROVALREeIo6sfYf4
 LBpab6oUsti75nDRvhy2nEdnp9aFanm4GMPnBAKYJ2+8var6S91TOZ/mqcewx4e06gBb
 w5RmvYGgt/wRFTZwG4cgij9b0DshCAjwbzrfTLLJcfjhV46yTKX4taooguznKe2FYYbd
 9CXg==
X-Gm-Message-State: AOAM532gOWTugRUDDNpleo5wTRdTWTEY5AlOQgS89FcVOnYDvwVCTcgO
 UD9azAsVAeamqGRdROaFtjQeSdEW1U3vXkTjiQg6y4XgVe+OyNWJT4eAyXqy4p1wo0kbVG3XiAw
 K0Nt7wO10umlrJE8/662xYbCc+LYq
X-Received: by 2002:adf:a386:: with SMTP id l6mr2089486wrb.505.1639530098419; 
 Tue, 14 Dec 2021 17:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxES78Ax9TUHORCOd1YZlDTDrPCGFO9Dsc70eF+OA8IpoHaMUvJc5rcfzjDI5GIYaEKUDAXNg==
X-Received: by 2002:adf:a386:: with SMTP id l6mr2089478wrb.505.1639530098233; 
 Tue, 14 Dec 2021 17:01:38 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 56/60] drm/tve200: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 02:00:04 +0100
Message-Id: <20211215010008.2545520-57-javierm@redhat.com>
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

 drivers/gpu/drm/tve200/tve200_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 7fa71c8bb828..afa3a2771650 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -158,6 +158,9 @@ static int tve200_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.33.1

