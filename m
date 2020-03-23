Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460FB18F760
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633676E152;
	Mon, 23 Mar 2020 14:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475FA6E192
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so17456170wrm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUPCZlSdOG0wn26Uuj6Ehpa6AIixz4lNiLlezNelgyc=;
 b=jjYTA2YYC77yZCSP/eTiVKjsMGmt9odZA/p4dfpIiQmrDYdRFosrTekcCbRObetHsD
 wnDFzaSobPzvRfy2OSXssjI8/pzC3TXQM0wkNTXnROiA36Cp309L1A3h4plTvzxbwBEt
 Gcqw7e0Psb0gGoH+gxxR2p9RSzLRDy6n/Ar9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUPCZlSdOG0wn26Uuj6Ehpa6AIixz4lNiLlezNelgyc=;
 b=MlPwzMigZU5ZUQ94mM7aqHgj1UhuKV3vjGguWqu3bUndbfARPdjKCB84EzWkvqKIiv
 EGvRzyrdPXRl5TKeIQk4QlJPHwlJGi6WuqlX2OnTDlwXL9fVWLh/zZjZQ/MkGc+NP89c
 NEBbjkG96vQbhK/ksrxOOpgHJoEtmBMSNamLK7nov58OJsvuYlYYJ7tNL86wOuayaOH8
 GO/BB+j2BCMSLOiaPnb+mnHV87CjtVRqg4Nzjd0Ora/7CEv5bXf0P2YKJfR0/3t+IIm0
 Z5hxbsLVnxK14j+BSwUS+c7P7lnvBvz2mTwUJZ7BOu0SXiCtLjdGlBZUBA38hoUkf0XG
 5sMw==
X-Gm-Message-State: ANhLgQ1Q5RtnicYs8kIUHhzOfr52tCtngFDHBkqx7CoM7Qj7XwGpo1PZ
 3QNnnFjIycvVr/249Q5JnDhKHYaBxibGhg==
X-Google-Smtp-Source: ADFU+vtfYkWHaNQ5Kmf8knqpB3bBeXHP0C3/fY9BVDRlqk1XueUaqHwkLnT1wlLWniYpUHQc3Fa2Sw==
X-Received: by 2002:a5d:6187:: with SMTP id j7mr6557129wru.419.1584975022035; 
 Mon, 23 Mar 2020 07:50:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/51] drm/<drivers>: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:17 +0100
Message-Id: <20200323144950.3018436-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Hans de Goede <hdegoede@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are the leftover drivers that didn't have a ->release hook that
needed to be updated.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 ++
 drivers/gpu/drm/armada/armada_drv.c             | 2 ++
 drivers/gpu/drm/vboxvideo/vbox_drv.c            | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 442d4656150a..16dfd5cdb66c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -271,6 +272,7 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 	err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
 	if (err)
 		goto free_kms;
+	drmm_add_final_kfree(drm, kms);
 
 	drm->dev_private = mdev;
 
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 197dca3fc84c..dd9ed71ed942 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -103,6 +104,7 @@ static int armada_drm_bind(struct device *dev)
 		kfree(priv);
 		return ret;
 	}
+	drmm_add_final_kfree(&priv->drm, priv);
 
 	/* Remove early framebuffers */
 	ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 8512d970a09f..13eaae7921f5 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 
 #include "vbox_drv.h"
 
@@ -54,6 +55,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vbox->ddev.pdev = pdev;
 	vbox->ddev.dev_private = vbox;
 	pci_set_drvdata(pdev, vbox);
+	drmm_add_final_kfree(&vbox->ddev, vbox);
 	mutex_init(&vbox->hw_mutex);
 
 	ret = pci_enable_device(pdev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
