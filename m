Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8B447F5B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58786E0D7;
	Mon,  8 Nov 2021 12:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF2B6E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvpqxJ0h/KARiUJklDyPTF0UTcSFrdOggpTVbohw2n0=;
 b=APE5ERfOw5Jp0H/3lFsWgfHa0JNwkuNTjU7XEmLykWY2Ya0l4hEhuF5UAEmKj9JmFv7HAz
 J7SRNRFy450WNKQWtcu6RNWrm5Be51IJvQgvB3sX0ECy47zBQ8wfIF3HGCaEtkLPNlZDNH
 CsgcDXVMQPSww2LE5UToSVPf+yxQyvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-pJIE1xZNPeq4PLkxNGYjbw-1; Mon, 08 Nov 2021 07:16:06 -0500
X-MC-Unique: pJIE1xZNPeq4PLkxNGYjbw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so5671010wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvpqxJ0h/KARiUJklDyPTF0UTcSFrdOggpTVbohw2n0=;
 b=mMeli7xXuuwls4pZ0HkHKmJavShgji3iavodwXu7Qa4lPMhE0xnSHzAAFlhGS3ETeu
 WcvdBwnYYARqBvUfAc/ySEvSdCoKMv8+Jx72W7GC9jumEVvcKJde5rjs2e6/Xny2gJRa
 DK5SxgnfsFHb6Bx70/XmUbMJxZxiAXcFeZG8rgM8/hpT8fFcuh+EECryhCG0rZcc7yEJ
 4kaiYdqLR/wrM1QlGbEsa7Qqy9oOpa2eqlps3RVYHKmzP1INKZKjVfjUuZpHa2poZbmQ
 lgyu5DQuz/YnMBvyVWgnQ1qIjx5hzhE8XBGYaRADh+hLjeD7N3tXtTF47uD5H5+Go+d9
 tr0Q==
X-Gm-Message-State: AOAM533n5uytO4BLaIcCa+rJWrcPJYSgq95hXEFm0mfejOJ91zUJkUrX
 zkbIZcGLGTSoDx5c0yiOjKYUvhe3qeJZ3hV3/9vlHHaHopKwqW1lKIU2Uj0YIq30p/o0jgSXFc/
 Qo30myn6l4Ay8KVdh2GP0ZwlfoyGU
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr53317275wmq.62.1636373763004; 
 Mon, 08 Nov 2021 04:16:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzlvEYbpw4g7ENtWhZB1VcX9c/BLzL1OXMXSYWBRM+1DfGtRdBeaMAQRctQX+FLnaEOlGCfg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr53317154wmq.62.1636373761895; 
 Mon, 08 Nov 2021 04:16:01 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] drm: Don't print messages if drivers are disabled due
 nomodeset
Date: Mon,  8 Nov 2021 13:15:39 +0100
Message-Id: <20211108121544.776590-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
References: <20211108121544.776590-1-javierm@redhat.com>
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

