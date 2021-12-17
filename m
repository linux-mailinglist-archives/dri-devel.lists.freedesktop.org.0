Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188C478179
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFDF10E236;
	Fri, 17 Dec 2021 00:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B4610E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfDBXAA9BkPVham66rHOLKsVZavytvwmbodEgKt27t4=;
 b=ixAH33G4trGrrwra58LJ9htcI3qO9yr3Hwe0auSWL5JUkTjlnilqcuHAQF1XEgXa4Fx172
 z7f8gu0Esd1tUGBbhGwujjEo2fnAu7r0QfVahgnlvUzR1O4sW4oJ1TMOsgyi5QR7O5QF83
 ZXbg44ViBQmEpxgdsPIuj2HT2kpqsgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-0YbvYqnxO-OQpsGNptYrkA-1; Thu, 16 Dec 2021 19:38:05 -0500
X-MC-Unique: 0YbvYqnxO-OQpsGNptYrkA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so89357wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfDBXAA9BkPVham66rHOLKsVZavytvwmbodEgKt27t4=;
 b=vY4M9NML4hg4w5BGJkwug9iKki9/z3jhdgw4jln44AKvfWmvL8aE6ZL1RfeY+5PLN6
 jX0qhgreupYG1CssRp9cKYXwRo/OKhF5saeJX5ykIaIi2L5hFJPy45BGi9XgS19sensR
 V47lZR2TfCmKZV7Ce2LH6WGmKXS8NJjKaQdxMHzOgBq1k4uchSPZE+cCcazl9q4VaL/h
 hO2GxpsEKPs/V3SbdXIj5p0ToaRTLBaBtVGIJ2FkGYUkksUDFnhhVm3XiJhGh+y1ght7
 ENf48YQ/4oX/AAEIYsQQUyfEir1j098Kwq0Cd8C8C/L7Dgcs0JraG5POxKl4ZZbRMd0l
 zWgQ==
X-Gm-Message-State: AOAM531B6Aez1ycWcr92jeojHJxPlHDfPO/ZhukgzsCUXw3ilsr6qYY8
 y4iO4VT+QzA+S+hmPvNVSKI7SJ7BbbA9Iau8AWIICjbfvPmoyGYxwsZIt/D58jSKcuyShET0PZ2
 c8FedZ18Wa+W3T7fNf0G0tOev0+dO
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr398354wrq.176.1639701484414;
 Thu, 16 Dec 2021 16:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9fjAZ2cu0VDYOxdjOj2IqyYWM52ZCvJI5skCO4Q9msxOV8Sw0gq8g6tzBPdTpOvtW06/YXQ==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr398345wrq.176.1639701484199;
 Thu, 16 Dec 2021 16:38:04 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/37] drm/aspeed: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:21 +0100
Message-Id: <20211217003752.3946210-7-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 65f172807a0d..383799378c97 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -359,7 +359,7 @@ static struct platform_driver aspeed_gfx_platform_driver = {
 	},
 };
 
-module_platform_driver(aspeed_gfx_platform_driver);
+drm_module_platform_driver(aspeed_gfx_platform_driver);
 
 MODULE_AUTHOR("Joel Stanley <joel@jms.id.au>");
 MODULE_DESCRIPTION("ASPEED BMC DRM/KMS driver");
-- 
2.33.1

