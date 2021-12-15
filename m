Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBF474FF0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BC310E1BD;
	Wed, 15 Dec 2021 01:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8169710E163
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01UyAOvBbQsdYZuo/97O6H7o+O610gyZBThBA0LMVHg=;
 b=V7KHfu6TB3m++N6DUcmOyeamATOUvqbNqUNxCBKPuB7UZcA/hqNtP2PEeN6frNMQziOVaq
 umev55M8gyFk/BYu4mFJdmpHvreJte2e6KguBnn9cx/K0O6plk9qPQhZb2YgfvmIT5kx1f
 wZfVM30oyas7RzTdW/O4O+MRn8gAWtQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-Y3NlsZwcOYyYIeVhMDLx8w-1; Tue, 14 Dec 2021 20:01:40 -0500
X-MC-Unique: Y3NlsZwcOYyYIeVhMDLx8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 x17-20020a5d6511000000b0019838caab88so5386662wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=01UyAOvBbQsdYZuo/97O6H7o+O610gyZBThBA0LMVHg=;
 b=Ab/v3czAQKXCqLDiq3o9N5rmvA5Gy74fYWUotwILE6DmOD7I9kFqXquw8AIhbbV7jN
 PjVK+B5ghGubjyYYFb6rTNXIBKaiG7vFsQXE/I8XVFCjSDSfYM3U6R+JOFMO61kNWRFT
 q1246Letl/SsWshMcnLiWSobtT3bkvUbO+ZGAklwaGQBfQlYdI1Rg6wNGLjLgFriGCcw
 7qbRVC5Voba05OR1hiZcpss1f19lMqIPJ2xT0RnDFnQyTP1PjvMahv4gjMJs6A1Ddmi6
 ZCrEHR7B/qa1jpw1a1HpHyTyzxUTe3IO6Y2h1Kwl3nTjDGelrjf59S0zOU83DvrFJ+cm
 9L4A==
X-Gm-Message-State: AOAM533OHF+yBpPDDo4EN3LE2w5mC6heRZfASaTaW/ZF53ofvqAKunyO
 I4KelEJU24QPznWA7vfgygnYrBqwqkdW2IURiC87GSpnDxTqQ9QZSn0H+GL1IHmz/7vnuFw7FjM
 tZ0zzTiu0Rj4biEDIIjJdm4Fe/6Hj
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr2393880wmc.58.1639530099241; 
 Tue, 14 Dec 2021 17:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqoSLRJJ02so1Qq0JhojYRNJZ9AVkb2q/OhzN866shbb5MPKeNaZ6+meUDDnZw5935EtqRvQ==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr2393869wmc.58.1639530099075; 
 Tue, 14 Dec 2021 17:01:39 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 57/60] drm/udl: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 02:00:05 +0100
Message-Id: <20211215010008.2545520-58-javierm@redhat.com>
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
Cc: Sean Paul <sean@poorly.run>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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

 drivers/gpu/drm/udl/udl_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 5703277c6f52..d5a0aa762ec8 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -91,6 +91,9 @@ static int udl_usb_probe(struct usb_interface *interface,
 	int r;
 	struct udl_device *udl;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	udl = udl_driver_create(interface);
 	if (IS_ERR(udl))
 		return PTR_ERR(udl);
-- 
2.33.1

