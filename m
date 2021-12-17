Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E888478189
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1110E276;
	Fri, 17 Dec 2021 00:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A8310E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahyuAZOmdFY2VC9vEMo81WUIOHBO2hembXo6sdu/X5c=;
 b=B4GX4LikWbKFRCcQvJDRaGaK/RQf5haD8FdvtpW8U0Ty+Afm2Azxk69K9AQV5Z3fOzikeY
 tyVhcDC34I4IB9vbngKa09XtJpzByLxgtDmYBeuArZRX9tZb8cQvvwNwrWLzi6bSMqezID
 xPxP3WPxrOF2pYYCg3p6wLF/adp7L9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-Zse-pmmHOxKxaHmPHDoGwQ-1; Thu, 16 Dec 2021 19:38:20 -0500
X-MC-Unique: Zse-pmmHOxKxaHmPHDoGwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so2102525wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahyuAZOmdFY2VC9vEMo81WUIOHBO2hembXo6sdu/X5c=;
 b=W4L2dWt92jBAD5TVHTcFiw7RTgzhbW25ZTFOrI7aBDEu6nTTLR2qig4P8dckNVX8ov
 LMUz3c0SQe9pkn8A98LIKqE51gvYbhN1qK32ipmOh8n1EBeelSZz3Ek5g0RhyuDDbxJ3
 ODgGKbSAS0VzdYRzSWgwMk4OkI2V/toQnJ7W0cyoo0qt1PFbJp4tSFDYFmpTL4yE81+k
 mI+qVprl0spvbpbMmJx6PF3F1WpkJdP6l+54+c0RzMr3ZtK3nl6Kq3yWayxkxxEmSQ8D
 e9YSbic+pABQwkp7xQxwucepGeQgrY8Ly/wJbmj5RGVDrYoCzdBuL9N4JiYqCzNgd9O2
 TY6Q==
X-Gm-Message-State: AOAM530Ce8QiUPo0YKDa/lwIxmgm9FlRI1Dgo6xTGNBG1Vhje7FMYdof
 g3vMHzxidrvAGnRSIAs8kYMqiXSSywL2lWPfWllEFj9pkOKCJmqe6xP6qQ3+0x2osSmAXtSJHTJ
 wc5ubmamFUkTi/I8PKPgcIKml3iMt
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr359371wml.21.1639701499463;
 Thu, 16 Dec 2021 16:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTSRmEv5AHQGNtBrGU4dWrsLog9QRAEtcHtdNw5mn1tItTrVq0e8y+xK7lY+butph+c2lFnA==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr359361wml.21.1639701499217;
 Thu, 16 Dec 2021 16:38:19 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/37] drm/armada: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:36 +0100
Message-Id: <20211217003752.3946210-22-javierm@redhat.com>
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
 Russell King <linux@armlinux.org.uk>
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

 drivers/gpu/drm/armada/armada_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..4f9b0a9f13e3 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -273,6 +273,9 @@ static int __init armada_drm_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = platform_driver_register(&armada_lcd_platform_driver);
 	if (ret)
 		return ret;
-- 
2.33.1

