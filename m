Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E01474FE9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3780710E1B0;
	Wed, 15 Dec 2021 01:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9989E5B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXP/22XWDeSSfWdh8ZJFPAZdI4OlCsRGMDp7gB3zWDg=;
 b=gFRup0agj5qywSa3Z462fgstv3gn4LDtiROummfrZemIozOa5WZamxPrfe8oj7PO44IueD
 7e1vcqKVikv8YK7sr6LaQVYdri+Dcjeen3AqcxekpWte3K/hBLKT651wG3iPyHumaz5UXo
 DOOGQd5C+z3Gm9W2CS0VYkMo1jXQHIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-6LoWxOBmPauBaPzeMs7EzQ-1; Tue, 14 Dec 2021 20:01:39 -0500
X-MC-Unique: 6LoWxOBmPauBaPzeMs7EzQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso5391079wrx.15
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXP/22XWDeSSfWdh8ZJFPAZdI4OlCsRGMDp7gB3zWDg=;
 b=wovo1uKiFFc0zN5ujiu9RhCu+t3RtHD1VKjwYMGsNLGho0Aox9Es6X3a7WUeXc6X9G
 Ytu/cDSm2ZQXbyS91md8QsuvxcquQcxnfL+BjHxzl/SlrRTMZS4vliO1uOMZz2y2DtYO
 07LQBUK5i5sGSGIb0PFe+m1Jk6/tbxwWpvgL2+cKOgLB0OvGyzql7PjABrlkM4ZFft50
 Y95l6+MH7jCwTcMQq0pFu4KLK+JrD1ywFxiO3XHXMX8OAnn92d6p4iCFSAlWa4wyhxdr
 MAL0kwInr2hB/Xe3CMjiLo+4ITPd8jN9A3fQCQfmM/hryoW+BO6X+FT++ERSeF5wKpS7
 uK1g==
X-Gm-Message-State: AOAM532bvnKzocdW2O45fgGPZEZxEvGNxwZB/jfKDpv2Da9XFbXrMRIS
 BC7+2dyf2UNYjB2Lq+DRLQ6bYkCx6pLXVWTzOFLr4Qky5o4NRR+gv0RN3rTMEAj6EgR0xxvfy7l
 kXLn4Qea0Nh5F9mskPBHHiRKqxBAE
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr2219263wri.31.1639530096851; 
 Tue, 14 Dec 2021 17:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2Y3r7Wrxo2s6F9TQGT0dP872Q0+eYRFhRtYHasJ27MOIxQF8D02kzkkE7A14By/sQgvIN1w==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr2219252wri.31.1639530096667; 
 Tue, 14 Dec 2021 17:01:36 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 54/60] drm/st7586: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 02:00:02 +0100
Message-Id: <20211215010008.2545520-55-javierm@redhat.com>
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

 drivers/gpu/drm/tiny/st7586.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 51b9b9fb3ead..55bf695861c7 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -305,6 +305,9 @@ static int st7586_probe(struct spi_device *spi)
 	size_t bufsize;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &st7586_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

