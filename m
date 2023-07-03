Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659EC746603
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE38E10E24A;
	Mon,  3 Jul 2023 23:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6063F10E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKwSmrhTaDUuj6nOeH5v86nAPSbYWAm2divbLmIUh94=;
 b=dVjLTn4u/ptMooh+xwPdWt3iupkQ82yV3cfTZ97YqYLQ9k0nMKUKd+yasVL1y+PgQb0q5A
 +ewVV2xOi8AI+/aVhRuoVv8nmuMt3CRrRJJgRL8YUQYIaUJUBYPni35kQ6N/1ljYKyl61U
 IBz17jOIY8MDu00cbiAncFTJJtL7nPg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-yXEVQX3cNmmUKVTK-pGFvg-1; Mon, 03 Jul 2023 19:05:46 -0400
X-MC-Unique: yXEVQX3cNmmUKVTK-pGFvg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3141a98a29aso2124845f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425545; x=1691017545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKwSmrhTaDUuj6nOeH5v86nAPSbYWAm2divbLmIUh94=;
 b=Nji7G/HLHboJv1cSIIZZWg84x3VHmFafZBW/LQNSaPIt0Cfelj0wll5xifW8yTxPwb
 S043qjix7I0dToVqMgkkO6g4IQUxo9qoM1qyHLg/6JQ2s3TRpMsNVgp3XjnSe0gvLiUn
 K1KbOB08pj7cuspZdvBCzRwSr9VWnqJBgVz/WORVAuaxVWUZAJBRE3JWMqbNcEcpfUBX
 vyj/CHr9e/oJ2UyZ+lqY88X60evv2v5KcJhJllw2ya2D9SK75omq8kzUZqA+pT/8724Y
 HeMDx7oeFH3lFwRmh76utwq5RIXR1JwH44tYrXMSavAsQlD0S6dUWT3OzP92JMgO9K/3
 f1pA==
X-Gm-Message-State: ABy/qLY3ZombajLbpWWBAD2exOQs3gIJiNZKePFgMu7qiIeGoKJhqw+W
 TGjk05vza4ShLy9kD6uS2gK2ISoGjPvP2uWciUmWdOqv2nF279OF/QC+hi9HkUDKW7dbjN8iL6h
 8QrOKvoYnGC3O4dcBBPgl3GsJZ3xF
X-Received: by 2002:adf:f8c8:0:b0:314:23e:c8fc with SMTP id
 f8-20020adff8c8000000b00314023ec8fcmr9734650wrq.33.1688425545206; 
 Mon, 03 Jul 2023 16:05:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGm9A12oMGIbB0eiER252jgpMh8fddozs5Y4ECUnCr8I5AQbLu2lRDz7vnx11yA2VHlZ5L4zQ==
X-Received: by 2002:adf:f8c8:0:b0:314:23e:c8fc with SMTP id
 f8-20020adff8c8000000b00314023ec8fcmr9734638wrq.33.1688425545007; 
 Mon, 03 Jul 2023 16:05:45 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/arm: Make ARM devices menu depend on DRM
Date: Tue,  4 Jul 2023 01:05:27 +0200
Message-ID: <20230703230534.997525-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703230534.997525-1-javierm@redhat.com>
References: <20230703230534.997525-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise if CONFIG_DRM is disabled, menuconfig will show an empty menu.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index c1b89274d2a4..ddf20708370f 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menu "ARM devices"
+	depends on DRM
 
 config DRM_HDLCD
 	tristate "ARM HDLCD"
-- 
2.41.0

