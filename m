Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2D7430BC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 00:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A4F10E0BD;
	Thu, 29 Jun 2023 22:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5399C10E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 22:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688079084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2j2ItE1hrzXRdyDj1d7Zvc9rzISUnAdMoZSXdbcCVc=;
 b=DM2Nj4xm5yKg+xSU81R0JWsBgSm2hbKEgMa4fW+q3SW9uK3ELYQS1NBm3wmVi0m6VzPflj
 Y4BFjqB1V877V1UNj/YZrnhSN6dji3aMk0Gs/jD4k40PfIwtntdcLFd2DUZDZ0PmxTr9xi
 Nu/1g9JFreHEUExl9UiHeEtQxjDkB5s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-CJbga1WUOWSOH118I0KlVQ-1; Thu, 29 Jun 2023 18:51:23 -0400
X-MC-Unique: CJbga1WUOWSOH118I0KlVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-313f2430134so597029f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 15:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688079082; x=1690671082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2j2ItE1hrzXRdyDj1d7Zvc9rzISUnAdMoZSXdbcCVc=;
 b=EE20MY4tFw8YthKiZU4dtd16vAG3wb9NLo6494W8o1VzdFDjeeqVF+FFz/p9luUa4i
 E4PX6b6gRjMmHOfV7X77Dvouasl/u0rrmljvra3+S351sWNg2+bimq2xJTKvbLqK+mUs
 58JILBNkBqg6H9BB/Tr3xNtZp3AV7wmzCtPcW9/3b4GSugmYpQNgaK7zLbaTUJtB9YWK
 +4C3YtPBpwJCufDihO8fqPkmJH3WywfwpMWTeB3LAxL4kAIAHMHKdk5Oco4VvWd9urEB
 /yuiUWCB6EWsJCNR31MaYdFCDLdHfOy17nDh36rtvgu+vU5ijqC/7eQXAQihqtdcdwLH
 fobQ==
X-Gm-Message-State: ABy/qLZ7u5oKmNX5BZnyl8CQW3DFcI2mWN/dhyO7R8L28WSLM/firsjs
 pYx3xiOuUTasHmQBRh1TIM8PuusYiGy5b4WXHhXnHB1jRx2bo8sg8DRfBF3qAnCSIFYQ3zM7xG2
 wvEJOxl1rgANZS2A+LSKAhROxJ7uV
X-Received: by 2002:adf:e5c4:0:b0:313:f59f:986d with SMTP id
 a4-20020adfe5c4000000b00313f59f986dmr442364wrn.65.1688079082053; 
 Thu, 29 Jun 2023 15:51:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHd4GmNb5anZfo6xpKRMdPTwJkkfzyxrFg+R0KEc4n5GMsAHWEd5iM2tVUcAeQlbNqHWI4p8Q==
X-Received: by 2002:adf:e5c4:0:b0:313:f59f:986d with SMTP id
 a4-20020adfe5c4000000b00313f59f986dmr442352wrn.65.1688079081824; 
 Thu, 29 Jun 2023 15:51:21 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b00311339f5b06sm16795690wro.57.2023.06.29.15.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:51:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: Make fbdev emulation depend on FB_CORE instead of FB
Date: Fri, 30 Jun 2023 00:51:04 +0200
Message-ID: <20230629225113.297512-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629225113.297512-1-javierm@redhat.com>
References: <20230629225113.297512-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the fbdev core has been split in FB_CORE and FB, make DRM fbdev
emulation layer to just depend on the former.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable each of the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..6ecb984d213a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -132,7 +132,7 @@ config DRM_DEBUG_MODESET_LOCK
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM_KMS_HELPER
-	depends on FB=y || FB=DRM_KMS_HELPER
+	depends on FB_CORE=y || FB=DRM_KMS_HELPER
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
-- 
2.41.0

