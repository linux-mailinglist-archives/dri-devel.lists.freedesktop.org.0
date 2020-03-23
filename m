Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4C18F756
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC376E1B4;
	Mon, 23 Mar 2020 14:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F1F6E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m3so15132657wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXqRR0rGkpy8qrdQ866VDfCOHi+Vl+Vnh07hczoQ6o0=;
 b=jUra0S/zv3IxuxbaiN7QsXuOFPnQxaFuGmOApVf8JvhtW8S3DeELhzIZG8wm8pioJ8
 ul7GgNSK4HdtyO5L+7VDWjgaNBD/CCMY6IQDUCJXFqpTXKPLGg6zXfDnLJzg85tyPFfe
 X+lBfRwLj1b8CAl3pQRf0JTO9OxewKRj5Ma3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXqRR0rGkpy8qrdQ866VDfCOHi+Vl+Vnh07hczoQ6o0=;
 b=ZT5G874XuGQ1W2tG/CoVMTXKpDogXt4YVLYe+2QujFQQG3CuHXCmLPvwkkUQ+p4hfJ
 qPm/qqAKceDad6wDIA6xbg4dhhVCa6TKDJBdM0P1bTXYpMVcWzf+vxHzaDaDOW/O26mb
 Oslg8OaQ3RdZt1owV9CHQwYZGkoWCo8T6km8rPUnCLOO8x+t5gQyVIIzUlfDE2j+EW/8
 376Za3pYrZdl3a4r4eaVI2vOX1QtDFop9wR/8wM/rQnwud0GOg9s3lNdLlx5bzj7w16U
 xXD0X1OzI9kM5qm8RSdbPisDKBZeydjdIaPMizidt7QzBW9c0FWiXQGiFSn7CEfXnOP4
 OjhQ==
X-Gm-Message-State: ANhLgQ2nxIwR0Rk2XchOIg+Bj2If2KulYaNXz03AEwyx8Z9n+z+Afs8m
 h++LltRKe9OrT4yCoCRlrr/0BKc5iEuaww==
X-Google-Smtp-Source: ADFU+vuETD3HO60CC15DZuYT1AjvXhVaos+IwuMI8BoAoxSwb4xCoHw4S2vmGccf5q7xqmZr8CBFcw==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr18417358wme.47.1584975020246; 
 Mon, 23 Mar 2020 07:50:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/51] drm/gm12u320: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:16 +0100
Message-Id: <20200323144950.3018436-18-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index a48173441ae0..524ca0941cf9 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -19,6 +19,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -637,7 +638,6 @@ static void gm12u320_driver_release(struct drm_device *dev)
 	gm12u320_usb_free(gm12u320);
 	drm_mode_config_cleanup(dev);
 	drm_dev_fini(dev);
-	kfree(gm12u320);
 }
 
 DEFINE_DRM_GEM_FOPS(gm12u320_fops);
@@ -692,6 +692,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 		return ret;
 	}
 	dev->dev_private = gm12u320;
+	drmm_add_final_kfree(dev, gm12u320);
 
 	drm_mode_config_init(dev);
 	dev->mode_config.min_width = GM12U320_USER_WIDTH;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
