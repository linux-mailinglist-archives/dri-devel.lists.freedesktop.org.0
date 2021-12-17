Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0B47818B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E40810E26D;
	Fri, 17 Dec 2021 00:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6FA10E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAdAcCeoSy3NAZTLDXklszelhKuqQBcBNDx2eEIibYo=;
 b=CSkgqIRSfi9C2a2vBi1PtnPF1LS3easCBpNlqsMDT1ZKriBflBKLy/7I4q/9Q6/Rr+9uwP
 8K1fHvDrzdcOeZGoS640dmRn08Ejuv+75kWffE1h65pyNkOKjNC1alngUCfwV+zfnEGDkp
 mdvUvqaJ72VfuTqQGPKQukWewVZzsfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163--E6OVpV2PxeAzTVzChmk5A-1; Thu, 16 Dec 2021 19:38:13 -0500
X-MC-Unique: -E6OVpV2PxeAzTVzChmk5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso146338wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAdAcCeoSy3NAZTLDXklszelhKuqQBcBNDx2eEIibYo=;
 b=rdBpX6yTf784/4rxvVx20mE/StJqAkYfHVAGkeL1blLDNATmvd69m8BaUAC/YmQK+m
 JJRMyelee8tZk/NVkzptqY44Oh/OWBdQ05u3H0iD9NgDE7m9cKx2SlkXLguo+6aPC/pG
 VZFP9+MX0nBNMLtfNyK4xMPC+6v0WHNnSFS9jZzm3j3/VoNOwbdPCNJEf16B9dMHPcrU
 A7ywWdC6s4qTjrzC+gaMsQhA2K6ckYFayOJ2uohcxq+MIxhscEIccPWMnOoza7RR+Mx5
 aJsRAkzv1YVv+fLCD7lme7J581uINGQP8d7KenKhOnSgXhd7H+8UEBRTuKoCg/SsoLXr
 Frkg==
X-Gm-Message-State: AOAM5326XpMXh05uhlN5emeh3D+1JXuMnndJPoPwW4gBOL9FDGsf9bEK
 w4bH5qPzFHbbR8fI8UekWtokTIPcd7MjNHuSm+UjMaNvC1UuGRixCMO8e8+MGBm8+dELGdfrCet
 TAaqW+rU8d4qO0ddXpE+WmQ26I+zk
X-Received: by 2002:a05:6000:1568:: with SMTP id 8mr379311wrz.79.1639701492624; 
 Thu, 16 Dec 2021 16:38:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywLWSjt+RUifQYBu2U1bixIZxEL7Wi1XcY4KBKbw1G3UnPe6EtY442LWhvo4FfaT2BgUqDDQ==
X-Received: by 2002:a05:6000:1568:: with SMTP id 8mr379301wrz.79.1639701492412; 
 Thu, 16 Dec 2021 16:38:12 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/37] drm/shmobile: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:29 +0100
Message-Id: <20211217003752.3946210-15-javierm@redhat.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 80078a9fd7f6..c99adb8e74ce 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -295,7 +295,7 @@ static struct platform_driver shmob_drm_platform_driver = {
 	},
 };
 
-module_platform_driver(shmob_drm_platform_driver);
+drm_module_platform_driver(shmob_drm_platform_driver);
 
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_DESCRIPTION("Renesas SH Mobile DRM Driver");
-- 
2.33.1

