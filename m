Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A77176713
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C0E6E894;
	Mon,  2 Mar 2020 22:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784806E884
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v2so1793723wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azWGJfq+4gUQku9CpJXjJjTVXvkNs3RIP5rZa0E3LE8=;
 b=ZEYxEpN3h2Ishc/kIsXvbdv27Zb6F760M+mGaS8VZkVrfGD9AkUVNaObmVXd54WolO
 leCH5BlaUAWlYcZVW7uQ26Vd9VQ8LaTJtjFxfAYS+8K2/+dOLu00iWmUp6q+0sh3Z2sj
 u+dqZGxH4bbDwoBFlqP8Fridw4wX8NgcCU5Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azWGJfq+4gUQku9CpJXjJjTVXvkNs3RIP5rZa0E3LE8=;
 b=DEqEuep64ULoHsR8c3G5hHjqf23hMQk6Y8l9g/IGL/SRiNMm7eNUuQ2NugoYmjAnOe
 kETEXyOJNBS1uqAGGU0NIVcEl0fi3XGqQ2pD12vdRnU6N8T0hMMUj30hJVu8V0GaAZXz
 2lLZPrllKH0FwVTmCUJXq2fI/G6Bg0XI+mfu6JyeWF4j8FfSBI65YdSbTELPUg94sjf/
 W3dL5G8/gmrhaxu4s7L2lLuVZzo5R1qXsS3RRnqUQQIiIkf5Ai9A6UvgSaGmfyWiOgsa
 uPX+DPfcze+oNnBVGGvd/b5ZaH88nTI/TYxWb0ZK9T6TGkQuFSLKT9cIdaBqc3FlmJHh
 sZ2Q==
X-Gm-Message-State: ANhLgQ0Ewv8h6DMZ8b9PyArneQcLWvxrmJoFm3wBjliVQjIhdNPcEh8D
 Oz5sjCc7XP8N7DpAfKocSvs9SCyMeq4=
X-Google-Smtp-Source: ADFU+vvFrjcgVZFeJYQyIv/sqOGvHdt85ub/0aBlvt6zONAoEL3Thfgft0N7iA3hCThdrPL01V0jeg==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr1553765wrv.318.1583188022907; 
 Mon, 02 Mar 2020 14:27:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:02 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/51] drm/gm12u320: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:57 +0100
Message-Id: <20200302222631.3861340-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With this we can drop the final kfree from the release function.

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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
