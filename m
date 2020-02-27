Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA9172667
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A326ECE8;
	Thu, 27 Feb 2020 18:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59DB6EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m16so4588766wrx.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=UGjp3j2m8tSpVtgqlVsaT55NLPaJ+bCVZNIyBF9xRUhtONMNz9C25aIe4AKs+mpAuI
 fPMK5fZkOxdJBP1TkttHVjsFqD+3P/nq/HjaSFpRwkSmPeNftrevjNHz9YaqdM+rUxyq
 EdjgWR4GUIZHrdJ5QqimuB/ajA7WfCZI5Ptjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGkQy6GARMrTdcko1Rer3WUnvLpzhV0C66wlxAxhWNE=;
 b=Tr1+NIURh9W4w4JXboXUjPzf2ZDHMjPKDNNxF/0kc38mtvrwXO3Imq5SXHlOj72UAx
 WVuNcmbuIHTGMQyaPRzWEoGiLisREj63UZloXF0l2YewK7dhX7EtrjBcQjFTGFuqQZki
 MZEkqj2fvXMsJPsiNnfcPbN1gvG6iAruyqbo7S2J7Jzm0Ckxch2uFauKLsuAo4/+M5HY
 LbcIv5oKvg1q4/0GKmPo3buzp9wBC/HtjVV7iCavOHzgnURxAvWLJ4N5jgYw42f992to
 mUrAMAfLAtjuJK9U6hIKviD/4ZAN86oT8UxzoysbvvKu7GdnB54IgcEwHBH5BDfnPtRq
 CfcQ==
X-Gm-Message-State: APjAAAVnHQPafHDTwHf7Eo2BinLr4+SN7LTzEYI0ARR3apeL3qtX4/nY
 gBrZ2ml2dPlUmq6/xUMqUu1HokQiSUA=
X-Google-Smtp-Source: APXvYqzi6pnLYSD8cXiyxKS8GvQP4s+u1dCT+w1GY+i7lVlNGRL1AhMKB3TARM9gKM0sDr2ZmPcmHQ==
X-Received: by 2002:adf:cc8b:: with SMTP id p11mr155186wrj.8.1582827338247;
 Thu, 27 Feb 2020 10:15:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:37 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/51] drm/qxl: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:38 +0100
Message-Id: <20200227181522.2711142-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
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
