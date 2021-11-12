Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4B044E768
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982A488EF2;
	Fri, 12 Nov 2021 13:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16AD6E3D2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLaL9JZ/L/NQxIKHNVpbSM1dEcBi90FRvIYDc1fdXrY=;
 b=HJdXKNRr5Po2APyCkfj+TG9Qr2Fc2UzO+uDWr5DU2CooMHceg1MqoF69NZYYhis+4UgSIZ
 Ui29wdibioIi5AFHsPCf96kjpF1M7h1oNXfzghy58jg8fZau3D1D0mOe93DrK08+uEzBk+
 QsQVj3QySmMixE6DJhpy3HIMBsuE48U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-tT17PCDPOy-NEKloPm6n5w-1; Fri, 12 Nov 2021 08:32:49 -0500
X-MC-Unique: tT17PCDPOy-NEKloPm6n5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so6305245wmg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLaL9JZ/L/NQxIKHNVpbSM1dEcBi90FRvIYDc1fdXrY=;
 b=hI7ReFNNQxkgAep8zmqEnayTfTdiY/jkyl3hNE9bmTig+km8OVYo73uzyZcSgQRXQC
 7dkbA+8XRi3LiZQFmWV+XNTX+7gftEQGTgmKjBFJegkOcsQsESEsEPZ9tn0TSSkElMDM
 WR4KgPoECdorlyl30In3ZynG5vfPt6L1hVHeVFjDunYXklT0KnJEpuorj4BiDRL+VZzR
 IcPWbJwmuIvvUTYC6Sqz7fBUUgiwJ9NoPXkeFKUjLYKv9XSPiQXmwn7iHANPR2hMNrSM
 D1xEYqRDNs+hOJVu2zAi9+TXa/CW9rfvnK93HrXmncPZKL4LGIJB9GXB4uQYJgcv07cD
 em7Q==
X-Gm-Message-State: AOAM530kKqcSxPltykd2a6ao5uau+55SjbNw42jkkzR/6I8cDrhWYL/a
 umKXrTc+bgrpdKodbCorhPO9wFlvixl7TXE0tb1f3a2G9RRJMaPkWS38FUfDlXQ2uDZeFRKO3cx
 fCYLweQVCvhAjh7Cp7xGIYdH4aDGD
X-Received: by 2002:a5d:4989:: with SMTP id r9mr19032571wrq.14.1636723968589; 
 Fri, 12 Nov 2021 05:32:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf3Es8c/GzYUbtaVdHj/i+lj1ZAXpyeetue9BBTgBWOxPQKZ1EhV8CzIyD0A5jk57GUqcR0A==
X-Received: by 2002:a5d:4989:: with SMTP id r9mr19032550wrq.14.1636723968436; 
 Fri, 12 Nov 2021 05:32:48 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] drm: Don't print messages if drivers are disabled due
 nomodeset
Date: Fri, 12 Nov 2021 14:32:25 +0100
Message-Id: <20211112133230.1595307-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel parameter handler already prints a message that the
DRM drivers will be disabled, so there's no need for drivers to do that.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 +---
 drivers/gpu/drm/radeon/radeon_drv.c     | 8 ++------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c718fb5f3f8a..289d04999ced 100644
--- drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2514,10 +2514,8 @@ static int __init amdgpu_init(void)
 {
 	int r;
 
-	if (vgacon_text_force()) {
-		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
+	if (vgacon_text_force())
 		return -EINVAL;
-	}
 
 	r = amdgpu_sync_init();
 	if (r)
diff --git drivers/gpu/drm/radeon/radeon_drv.c drivers/gpu/drm/radeon/radeon_drv.c
index b74cebca1f89..380adc61e71c 100644
--- drivers/gpu/drm/radeon/radeon_drv.c
+++ drivers/gpu/drm/radeon/radeon_drv.c
@@ -637,15 +637,11 @@ static struct pci_driver radeon_kms_pci_driver = {
 
 static int __init radeon_module_init(void)
 {
-	if (vgacon_text_force() && radeon_modeset == -1) {
-		DRM_INFO("VGACON disable radeon kernel modesetting.\n");
+	if (vgacon_text_force() && radeon_modeset == -1)
 		radeon_modeset = 0;
-	}
 
-	if (radeon_modeset == 0) {
-		DRM_ERROR("No UMS support in radeon module!\n");
+	if (radeon_modeset == 0)
 		return -EINVAL;
-	}
 
 	DRM_INFO("radeon kernel modesetting enabled.\n");
 	radeon_register_atpx_handler();
-- 
2.33.1

