Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37213172688
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B886ECF9;
	Thu, 27 Feb 2020 18:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C36ECE6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so2145660wrr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azWGJfq+4gUQku9CpJXjJjTVXvkNs3RIP5rZa0E3LE8=;
 b=aFyJRMibgLaagAJtMOu0q/Ok1A4H7/Z9WmZ+tZ6VTPyaiQIT5ZfO+OdmIIC2hUww59
 aW0lcnSo0H3Yb90nr9+4tUnOyJ03bgM8VvN/IXUwUSzkusjTTrr1Pqvpzh8JBgDEmn+C
 q4vXOmJ5JaKD/GLEjjzuc2mYhgA5rfEb3dUFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azWGJfq+4gUQku9CpJXjJjTVXvkNs3RIP5rZa0E3LE8=;
 b=mbSxd2gV0cgm0Yg9/3BzOLKnvbs7Xa89LLbfYqwfvF95o9xmWOSRnIvBz/PqLca04M
 z3OfOoFYdFPQZrsDyYg5MkO+rN3g2LWpvibVVYC+Ie56NX8zs2ioK7Kn2zaPxkfJO8l5
 +5/h0Hrmk2oConpyJhf4wCGdfO7Rc3n0jqxbuxpcXmXfvv/Ay7GjcW4eI/30XgTkrRqJ
 X/qLJnqdIML/Xe6qY1GbS9U3iUjneTLnL7qLhG9zBJHBA0xrQRmIuwQEvp5cFEm97eWh
 Hm/Mwq97QwHIXrS894D6/zIdMAyzUx012b58Fq4FJCA9v8TaXSsEKHrvqSsTXGva3IG9
 CiwA==
X-Gm-Message-State: APjAAAUwdjiiBfIofVG8tl6BdKkbITQ+V756ZTweqgfKY4Ry7uz5SCas
 6Fy2tuW5vsyF9OxT2JljNZKXTfaVzto=
X-Google-Smtp-Source: APXvYqyXTLtWwxs8KgRYuAUAu/Bdv/q5tbn67AHonBtvMlYN7465DT786gXFsbDr3e6pW0qjCgSGbg==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr116679wrr.83.1582827351195;
 Thu, 27 Feb 2020 10:15:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/51] drm/gm12u320: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:48 +0100
Message-Id: <20200227181522.2711142-18-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
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
