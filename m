Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB116888F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7C6F511;
	Fri, 21 Feb 2020 21:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2850E6F511
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u6so3559130wrt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=OUs744sfBj5Yz8FxWBbt8pW3CMj0kJQQuffQ6w3kONmB7i7nLUpEo6lRzYKC9JV7i8
 9TpKdlpvdxRAbYZqx3zz4rE0OH6c3o/y5Fpet2Z6OUurTg1yZRHHBiYlNaBdnqY/abnm
 Osr1M+2I5bcERAqC/o5bxjfmgVS5FgYaCozLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=RNy37fAEgvPqHszkycQVwhOnNOs/uwKN410O8hiwNutx2ipsTjgmCTXvhcdYEZWMMc
 CQKdSSr/yr9twjAW+NQourINF0fB82ut5+semuwReQkCDz5I58GAtQU45im97A1CjI9S
 IQO7ImduohOgL1EvJmoPWCVPpAWVONC6iVGIxggPhOiT9O0G9RfxygBWbrSZ1ZlokTw5
 gvLmhAMc4U7AR56yY0bnQPT0+7dHjA92qjb2FbLC3xMrNtOQzNrOfFUyeeOOntPjYa7A
 lQ5c5rPZSJt7AxdIz11ErNNgtznTQlFCEs0vuk9oe70L2haQf4n4gGH5BABWb/Ca7Fc7
 g6vw==
X-Gm-Message-State: APjAAAVf2e+X+CIyvtHeDMVZPII6xso3LXqJRmSj0PbTvpfyGnoyVt1i
 6jNl935jwRb2V36rSEKBMdX/c0ddgyw=
X-Google-Smtp-Source: APXvYqzmMEGPKaIKETbiA7OJ6Ovghfws0dfiq7Mol0uFNN7+X3yV0LhNGEsGp238gAJXe0N+E0ExQw==
X-Received: by 2002:a5d:5011:: with SMTP id e17mr47740612wrt.134.1582319017533; 
 Fri, 21 Feb 2020 13:03:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:36 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/51] drm/qxl: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:35 +0100
Message-Id: <20200221210319.2245170-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 --
 drivers/gpu/drm/qxl/qxl_kms.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 4fda3f9b29f4..09102e2efabc 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -144,8 +144,6 @@ static void qxl_drm_release(struct drm_device *dev)
 	 */
 	qxl_modeset_fini(qdev);
 	qxl_device_fini(qdev);
-	dev->dev_private = NULL;
-	kfree(qdev);
 }
 
 static void
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 70b20ee4741a..09d7b5f6d172 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -27,6 +27,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_drv.h"
@@ -121,6 +122,7 @@ int qxl_device_init(struct qxl_device *qdev,
 	qdev->ddev.pdev = pdev;
 	pci_set_drvdata(pdev, &qdev->ddev);
 	qdev->ddev.dev_private = qdev;
+	drmm_add_final_kfree(&qdev->ddev, qdev);
 
 	mutex_init(&qdev->gem.mutex);
 	mutex_init(&qdev->update_area_mutex);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
