Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA19478191
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F510E281;
	Fri, 17 Dec 2021 00:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E5E10E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWIZ87MUo0cEUhCnqBRUdqKqzQv0kebYslmFPB1YJWY=;
 b=XjtG+EyJAvWcJ0QbBBprGFpkCrv3T4ZrshFk9A40Sezv2aEg8rmG5QIPLqyoRBp3GNbB1J
 UvEwGQU5Xw3lNwwlTtZhJEkZQKz67LYU+TAaLOQ4lMin581Skhaz4Xa2xGXrgpt1MvmV+j
 9vI3PyOCz3EKcUYc4nGW6ip+Dkfn32Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-OfyLLkqDOwSwJPcu-Y6sZg-1; Thu, 16 Dec 2021 19:38:22 -0500
X-MC-Unique: OfyLLkqDOwSwJPcu-Y6sZg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p13-20020a05600c1d8d00b0034565e7e5c6so380012wms.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWIZ87MUo0cEUhCnqBRUdqKqzQv0kebYslmFPB1YJWY=;
 b=PAzc/s3hvyvapdHHTA1cKONsl+7Bijn/iVhYpsuIVQVxFaELcuzS7zolMieYZ9mZu4
 DYW4XxVhBu6BfF6QhnVu3qSnUuAnJq4XLnxHMs7FXDP7ICbNJotYQvsDQ6ZVICrbMQzW
 PIP6Sy5OQlrdWVHMtxJLP+P/rYFI7h30RKgZVE/ZIlq3RxMOkRzjueJPaQjA35C714dZ
 Ijp+jioq8SFXXguGjlwdVhO4BeAm0PA/iIE9AWzKevSErq2ac25rVqJoETY6HdXfG5mQ
 /jOgKBZJ7ITtI/088lLcIyvYdwyh8jcyqk0ltv//WkYJIUp3qpJbt0nxEL/aWiRtaecE
 MJAQ==
X-Gm-Message-State: AOAM5305z/jm34KoszHgsNuL+ovgVKBzGielogdCxk9hiC5Gon/xCuJI
 ExKlY1QjUoF9HbojA6zihcPc/Gb+VrL0YvFW1ZQNrcVN8Ti7bkyQ3fXjkF9jvqUPRdEPErkcXiQ
 lZcOOcMrHScJIGIglY4T7HoKmEoGd
X-Received: by 2002:a5d:564f:: with SMTP id j15mr366091wrw.366.1639701501206; 
 Thu, 16 Dec 2021 16:38:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTFfvoBc9Gq2NFZc+CJBEfpNHVs8STFhbVw5McSXQJVdGwqdmltnAmye6C790hGSSWCdjm8A==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr366078wrw.366.1639701500951; 
 Thu, 16 Dec 2021 16:38:20 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 23/37] drm/gma500: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:38 +0100
Message-Id: <20211217003752.3946210-24-javierm@redhat.com>
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

 drivers/gpu/drm/gma500/psb_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 65cf1c79dd7c..eeb681be9c95 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -538,6 +538,9 @@ static struct pci_driver psb_pci_driver = {
 
 static int __init psb_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return pci_register_driver(&psb_pci_driver);
 }
 
-- 
2.33.1

