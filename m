Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94984781A9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FEC10E272;
	Fri, 17 Dec 2021 00:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585FF10E306
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeORZoSkcXdXVuQBcvALim4uY06DBkHzDclu3qUpHK4=;
 b=SCW6nt59HF3oWPB5TS53diCruTq7NXM1Tb+a4vF7zpTUHalg6Co55WoS+RIdQKF+hQ1yNg
 d3uE3rpaYFsqQbrel7qnAJp1OR+qBo9/SC5tSVHb/IKSHAnxDmfG8t5tvvertEPzcWCUoD
 y9rXPjrZ0EMY27qJc2GRdX+8ARcwI24=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-h-QP96isO1iw67QO4eEpUA-1; Thu, 16 Dec 2021 19:38:32 -0500
X-MC-Unique: h-QP96isO1iw67QO4eEpUA-1
Received: by mail-wr1-f69.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so144665wrr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CeORZoSkcXdXVuQBcvALim4uY06DBkHzDclu3qUpHK4=;
 b=b9HlVNtBAiLlVXqoFwiyd8e4ubHy9ONF3BX/FL9/3IsAgp7em8rjTqzhDoK8BoS58/
 lXJuxOwhiGXfo5xtviLv8KjyfKM2GGy+38/incx6olgqr86tUKWyrYrNZ2vWY1Tm+TyU
 Q2KgY1+akgDFNDJPTiOfLE9zt98K8NomdVwMSWhDv57n4PYA21EhqxLY+oeL2kkfuUyg
 ZJ1b+u6yqE6L4Wxs0CZCAsnxOYGcJ9QnPZ2IzQ2NB3C3RYlt49PBAk+EO655WfBkByQJ
 VAEgncXBVTiVOhOSDfOMdjvAw4YdGJH03pRbZaoJOFHIWv3I6zax/gT9yxLEMLtt8U2j
 ZJCw==
X-Gm-Message-State: AOAM532HjBejgcr38L6GvBj5TT+SF0IlNiPQ0aDH0KnULdIj02+t0oIr
 fLm1Rs1O0nX/2/icP4WvqUhUZzmtBbDIu7rmEd901XIm/rKtowhKTNUlb675j5rwRb/LPIzTTJo
 SZS9HLOIRh6i2s8BL7WFLzSUZqTe6
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr368449wri.376.1639701510864; 
 Thu, 16 Dec 2021 16:38:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1D7RXo46td0Fd0a+v7nDkc7NgSxUNrUxkXHkGgjRPzYWa/gOoBKI1QdjR+VcxaqotcSiL3A==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr368442wri.376.1639701510619; 
 Thu, 16 Dec 2021 16:38:30 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 34/37] drm/sti: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:49 +0100
Message-Id: <20211217003752.3946210-35-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/sti/sti_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index c7efb43b83ee..860b2230aa08 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -287,6 +287,9 @@ static struct platform_driver * const drivers[] = {
 
 static int sti_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 module_init(sti_drm_init);
-- 
2.33.1

