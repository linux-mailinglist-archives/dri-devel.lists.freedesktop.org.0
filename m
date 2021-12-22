Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAB47CE3E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9AE1126D4;
	Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FFE10F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EHgB4jt8VzQ3WZ6ERGEVuhUukhc+8h/a/zrx+jNmtA=;
 b=gGCOVWs8dt5KthfWtDNgssxxlDusz6AGdEoF58AOuTXU3U3qOelIGTRrJdhXBMGCzWYlIb
 T4w/GKpmR8EpYbqXMDGfmqRvYF7RvWJFWXkMBxQVX2JaXtWNeVLEKcM2D+645+svRdx9CY
 5e2bh7d3eSAEga5qxxVO28z733zbYk8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-DlXe_aNjPAi62h5bXPBOng-1; Wed, 22 Dec 2021 03:28:47 -0500
X-MC-Unique: DlXe_aNjPAi62h5bXPBOng-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so434538wmp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5EHgB4jt8VzQ3WZ6ERGEVuhUukhc+8h/a/zrx+jNmtA=;
 b=ZTFYi9bL5CA6n4Ea9InXQjGdcAH8wmHRwZOl5Zg4Of1uRjpfFjLLMCdR+2Kfnh0hFd
 9nwjI1nYgVkVg2+gZ0KVJjR+ma9cnkedv1Ru29WCdFsVkFtJAmxac5Qnzy4IDuu92itq
 lQ9o+xHGO3xV9jzSQD8HfZXeR1YadBXgA8yfC7O+60VkFsGqb246cdnG+X9AzOdLVPfF
 FYZpHtVuWA8e5Yx9Gf5/hQIwk4ag8UTAbJY90K0QUqpcVEigXJpe2CJJ/P4o3USoQsET
 q3nMRlATbaoxyP2PwPUPCIUA3yy2jW+hw12pDaRyIlO3nSlgNE665ddEdzfAhjoHUx9w
 oJCg==
X-Gm-Message-State: AOAM533sA22Plc36vGjhwbnnTF/w+QaRpYG7wXhnOvKSKkhSPbw8wPwp
 sNry/Qp6EGw+kmqTClNayuH2wB0PNFi/RXnRNie/06Jyj3ruJ48Z5KD0AdBRyptAoPyJ5gJB+q7
 itgo9QNbFdos/kh75Ye0ti1fhbbEj
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr104010wms.1.1640161726558; 
 Wed, 22 Dec 2021 00:28:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxao6fS2/g74UosGgsoqKJfq1VcVJQsZJi/iDWRRvOhWbuaBqYMNZKeV5b54IyJARY9L/JEgg==
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr104003wms.1.1640161726400; 
 Wed, 22 Dec 2021 00:28:46 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/10] drm/hisilicon/hibmc: Replace module initialization
 with DRM helpers
Date: Wed, 22 Dec 2021 09:28:26 +0100
Message-Id: <20211222082831.196562-6-javierm@redhat.com>
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
 Chen Feng <puck.chen@hisilicon.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Replace module_pci_driver() with drm_module_pci_driver(). The DRM macro
respects drm_firmware_drivers_only() and fails if the flag has been set.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 610fc8e135f9..fe4269c5aa0a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_module.h>
 #include <drm/drm_vblank.h>
 
 #include "hibmc_drm_drv.h"
@@ -379,7 +380,7 @@ static struct pci_driver hibmc_pci_driver = {
 	.driver.pm =    &hibmc_pm_ops,
 };
 
-module_pci_driver(hibmc_pci_driver);
+drm_module_pci_driver(hibmc_pci_driver);
 
 MODULE_DEVICE_TABLE(pci, hibmc_pci_table);
 MODULE_AUTHOR("RongrongZou <zourongrong@huawei.com>");
-- 
2.33.1

