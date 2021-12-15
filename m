Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2E474FCF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF4E10E14A;
	Wed, 15 Dec 2021 01:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905EF10E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSF+bUA3xEcjh8nPd72L5+uQRin3zrf91XKxVnjhqv4=;
 b=Lf19z///37FKWeuTjGuBjX4PLD3fdt5DMf6VtWnZ6C0wMMwnx2nDPSQYNMMLfmr+SBxqLg
 L9/ea9r51Z6AyPQQnO0V+mh8vNLGu1la8KOlJxX+mcn1Q87FOVGp7WntEN0kavjb9miNJX
 9FUofKG0LVN9YQaJ5mqeRkB2mmWjtKE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-2dEJ803NMcW1nTDvVxcHIA-1; Tue, 14 Dec 2021 20:01:09 -0500
X-MC-Unique: 2dEJ803NMcW1nTDvVxcHIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13857619wme.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSF+bUA3xEcjh8nPd72L5+uQRin3zrf91XKxVnjhqv4=;
 b=OLbHt5W8SE7TwxaIdfOGdyPmNP4YumCpdso17vEXfHq69nCq+zRSLVwprFZZlqcMet
 CDNNI1hrcjrFEszHFGIc0f/RgBa+pv0VBlEdNRVtZ4b3f+V3YY/C032+G7phWFsnGvQ5
 WLgCvYzFjsdhc1rIsyOtE1Jd7gy+a9Sm/X8GxNVBZsy/FY6FS1f3tFlJDRRMWzGXvywi
 QYJAbXA2CI4Yq5kHIEWEt78ai9H1AW3mJdO9CgcIMHa77g4wBxo+cSntEBkAW9vszrHM
 ytbU28o2tP2bt5Q+tYHs2Gdy9MN9yN8LHxPj+qLdYKz/6LgUn80LzbPN7z8/R6C7cBKd
 r+sw==
X-Gm-Message-State: AOAM533WNUtLy68akYzMCOs4rwybMZ9u/e3b71Gn0+NE9jqK3XqpboA4
 khYuzyR257VVV87eLo251RDDabBepHk88fwyt3so+48GCKZCsetMHGvNwvnmqFjTyPWQWdKIKEX
 FblFGcrKvvLLeZXcYUF/WNfBPVgNe
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2231144wrs.108.1639530068493; 
 Tue, 14 Dec 2021 17:01:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQfTCAIZvlx0CmQk3/dYaY5cX1Eaezs09nRWU5iMWZDaBP6F2SM5tcdm4Jsn+zp6nQUJC+Qw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2231132wrs.108.1639530068266; 
 Tue, 14 Dec 2021 17:01:08 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/60] drm/mcde: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:29 +0100
Message-Id: <20211215010008.2545520-22-javierm@redhat.com>
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

 drivers/gpu/drm/mcde/mcde_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5b5afc6aaf8e..0b2910e69b42 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -491,6 +491,9 @@ static int __init mcde_drm_register(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = platform_register_drivers(component_drivers,
 					ARRAY_SIZE(component_drivers));
 	if (ret)
-- 
2.33.1

