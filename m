Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1600474FE6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EEB10E17F;
	Wed, 15 Dec 2021 01:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A310E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPkpzdLGHFuwSmlCqreinOa0NMKpEirlVUjYsF2sEmI=;
 b=iYRtxLyFMXmE7vMrnH25BwR9+MpvTegu5eKy8K0fsJhroiLFb71Kx/ca2iS1MqKPM1EwEK
 68Gt5gng5vB6l+D9rxbUZh7iKKjDnH4k9f5qnUnmWFMWyQH+UO4mLN6r5Hhuec1MjOykyM
 TburELQ1Rk74LT+qs02LnRvgT1zP5Ao=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-f9BOsyiwPHCuB_EoI4YdfA-1; Tue, 14 Dec 2021 20:01:34 -0500
X-MC-Unique: f9BOsyiwPHCuB_EoI4YdfA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2589534wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPkpzdLGHFuwSmlCqreinOa0NMKpEirlVUjYsF2sEmI=;
 b=QHJSNuNsKZX6NYddPOkcimdPp8lo2+D87j+BILlolswKh7Cf1T7IYxp8xjaHAQJZ6G
 lEk7GqpmOFHqghtcd62iYxSjIucvOfb4CpXqkLwudbEonrF3vNaWdOMNM0pjRUCNu0bl
 rkJC2UOUfhcyny2KD+JG69qUgesypBwS498hXVARR5cCwxvtuMexiFXp8j9BCmx/xD6g
 A5l8OyZwX2zViBwKHMowyMvm5tMQwyhb82rhqlwcajyNNmAZkxra7yuzTTBrxisSiWeg
 duak4/R2XKbWfe8a80gG765qdMXjvySTTdRuRyGxr2ZxthMIjVKmoH6nSENQwl3/6rJk
 DDrw==
X-Gm-Message-State: AOAM533lu7CezB8AnF0JWNxnkaJZ4/SqoHilfBaZ06XlL5zvzR+2HWNo
 7AynpqCVJIPmMYmveLYjubSLfmkaa2rETWIZ3nkN6LeYgKCqbJnhHUg5RmY4V7khOwfBVEcjxGI
 4grnhrzN2XF7C+ei8aykuDN0uf7X5
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr2262416wri.8.1639530093469;
 Tue, 14 Dec 2021 17:01:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO9OzQ3IFEK6KRWAqhTd7Lh7dEalRNtkSBcpZfIM+CviSqSyK/oq21ZgWwll/ZU1mjmxEF1w==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr2262403wri.8.1639530093287;
 Tue, 14 Dec 2021 17:01:33 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 50/60] drm/ili9341: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:58 +0100
Message-Id: <20211215010008.2545520-51-javierm@redhat.com>
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

 drivers/gpu/drm/tiny/ili9341.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 37e0c33399c8..5226b768c550 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -182,6 +182,9 @@ static int ili9341_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &ili9341_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

