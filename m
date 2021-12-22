Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83A47CE3A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DDD10F59A;
	Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7EF10F59A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/qoDXiIfAUFTnZkuc0zNNYRvTskgiRkFkbMNCnXmhY=;
 b=QnUy+fORaHQdW5DlletoywcRFR8m28FzB1Fwr7TERdbWppP+6EwT/lenfcLto06wlX2CFs
 D0KSXHnpDBInL2mOa2ThP4vII3EBOjvKXAYfDvLq3HDqFNM8zSOgg5PwF2yNGJLWFBXojt
 tL/ndIu9fDuvO7YB6VbZL4JvRtKaX6I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-mjIrwisAMSeeBcVP2YC9gQ-1; Wed, 22 Dec 2021 03:28:45 -0500
X-MC-Unique: mjIrwisAMSeeBcVP2YC9gQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so669614wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/qoDXiIfAUFTnZkuc0zNNYRvTskgiRkFkbMNCnXmhY=;
 b=TosRuZgb0/nlZQKuvmHhFFdNpT6gw2kKlxqofCwt4Crac1c9ybwLzgSFsLHUOEfUZu
 ksdcOTrq7AtCpcbNSqs4ObRhykf+zZ9GdDnbN5pCsOgKohY7menKqFQc5gO0ANU+AUhJ
 IzwC68wpWHN4SGHuUHVujlPFC21HE7Yn7YwXRq5321kkldQu283ovdZsBvMYY/VjvNet
 L/eMIEdySEWQZvZ+K+71fgt2RoDZBBsaIhlAs36TT7MLFv0a+XcgPXCPxSS4e6zjXsOS
 e5GZyiC8tYWjyQATU4P8TQw75UlIQ0YgGpEhBqelpyplg27x/4FJ2vpCwY7L9LIkmuZV
 AawA==
X-Gm-Message-State: AOAM530fVHtA9WYVbWCfaizJAxDyNaYknLVp5+UOjd2A3TkNgnn3cwWK
 10gl2b7YCgASaykH0W9hDkRSaGnp0GI2A1Nmvjxdhk/3M87j1Mpqjf5bp6op9dt1gbEn+YZDA7W
 s/McEQvDqO3sr6AsFXdG5Aky6mV9I
X-Received: by 2002:a05:600c:3507:: with SMTP id
 h7mr110713wmq.122.1640161724072; 
 Wed, 22 Dec 2021 00:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmVVLVe+6aOEoAfYzcCCJuT1IgGbQOeC1WEJhsigU/0tjFkWA+ef3XacqmOZoplM0rtMS/Fg==
X-Received: by 2002:a05:600c:3507:: with SMTP id
 h7mr110702wmq.122.1640161723929; 
 Wed, 22 Dec 2021 00:28:43 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/10] drm/bochs: Replace module-init boiler-plate code
 with DRM helpers
Date: Wed, 22 Dec 2021 09:28:24 +0100
Message-Id: <20211222082831.196562-4-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Remove custom bochs_init() and bochs_exit() functions and initialize
the module with DRM module helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tiny/bochs.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index fc26a1ce11ee..ed971c8bb446 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -716,24 +717,7 @@ static struct pci_driver bochs_pci_driver = {
 /* ---------------------------------------------------------------------- */
 /* module init/exit                                                       */
 
-static int __init bochs_init(void)
-{
-	if (drm_firmware_drivers_only() && bochs_modeset == -1)
-		return -EINVAL;
-
-	if (bochs_modeset == 0)
-		return -EINVAL;
-
-	return pci_register_driver(&bochs_pci_driver);
-}
-
-static void __exit bochs_exit(void)
-{
-	pci_unregister_driver(&bochs_pci_driver);
-}
-
-module_init(bochs_init);
-module_exit(bochs_exit);
+drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
 
 MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
-- 
2.33.1

