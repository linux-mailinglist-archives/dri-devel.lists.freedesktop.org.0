Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FA474FD1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0736510E164;
	Wed, 15 Dec 2021 01:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8EA10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pipp5Hk74a/1STom3UVKk7EFvp7D65TSNGTYUyjtDlk=;
 b=jGkHQv4tDyDtIzfhjaOYF05B95FmyTRtASD6SgKT5f9ABAtEK6Gq4clNfPSFKtkCfwnRAd
 78ogJPGnhzGXOmBajcW2/hYJQwp+Lzsk0nKU0C4Pj9WuhZI6XR2ws2k09SA5hyH3XU9YlR
 FrL0Oe3Gsbm5ztzkzVED+/KmTS1Ms5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-F8xbg_zlOLGgsAhvwi_b_w-1; Tue, 14 Dec 2021 20:00:59 -0500
X-MC-Unique: F8xbg_zlOLGgsAhvwi_b_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so8319933wmq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pipp5Hk74a/1STom3UVKk7EFvp7D65TSNGTYUyjtDlk=;
 b=sqVzZ4cR8D/vj05wHzaZ1WNZunDliNt0Rzyg3M2gNhd6GRXN1N+1kEh4P5/c2xfN79
 K1rKJZ959LytQ3osUDTvvC6VXK+s2IPOWYKUwlDq+h9Q/j2HUT+Q4aJcPilFxuWrvVVg
 aZGirgXRRjfXxHnxNs9Y3eSfWDAKOhwx7bUQdM7h7FzxY0kI1EyyIqJr0RwqhmmI1NqV
 X7iwO7eadGkd6ynfsGuebEjsWsE82MhAvCt3wEORw/H4zJJ4HpUNlxTx5CVTKsZWq8sJ
 LLQVZBav2/AsIMyy5XIR1APLqWNOyIKAV8oyvK4TVKIAFplrVFCTgjZFJnDzZ4m5YBTc
 nOtA==
X-Gm-Message-State: AOAM531OE6Zp0oQjWDHv5qC3pZB4r29K72jlpKJijHBcq5zoGlTzmIFm
 kOAeRoP/MPWb1ojgEi1iWcb9wGK91W7maPt+FofhZmxPN5rFlRox3t3fvsYhNj09dc0YaKfD9Zk
 Vvg9HLhdHzMosQnHuH32lrTvQ0whC
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr2040418wrg.571.1639530058320; 
 Tue, 14 Dec 2021 17:00:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc2FHtBXm7KY5VUL2eaL902we5JmBihfDLC7w8UAkYHKv6H+YkvJRKFmrkn5Za3LZ6R1tVlA==
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr2040409wrg.571.1639530058134; 
 Tue, 14 Dec 2021 17:00:58 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/60] drm/gma500: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:18 +0100
Message-Id: <20211215010008.2545520-11-javierm@redhat.com>
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

