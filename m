Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EE381D56
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 09:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3214B6E492;
	Sun, 16 May 2021 07:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A436E492
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621151333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xMEHr3txinobPMiklkheMH3hCxm7Pua65lCR30BLejs=;
 b=En6c7A1SnXRy4qukNG9tR5LGlvI0AcOY90qJgWX2rkIpK5Ka32/Wdx15i5T+nq7fyPS4/I
 eea9urQrgWhYmuSL1n7VFLDu8DBhbox6ycNyw8WIunol0rYNMRwhdHEqDaEucn63dsA0/k
 o0mxdEgyNF6Plt0DwFvJ4C8vw6MbMh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-pXNkdPIgMFuqi8ul1ivl7g-1; Sun, 16 May 2021 03:48:50 -0400
X-MC-Unique: pXNkdPIgMFuqi8ul1ivl7g-1
Received: by mail-wm1-f69.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso2554849wmj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 00:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMEHr3txinobPMiklkheMH3hCxm7Pua65lCR30BLejs=;
 b=ci19CGF37ewfY6eO4kSLxA25wk3glvq6gvR5+oZ8qvyKvlbgL9AuK6wyKg4Zh9WHzT
 nqxpbkqWVn3kijRa137CE9oQkpukwseb1SC8FiAFNKvYUbLa24U9G6f1vBqXC5PvuwHp
 ylhvEWHKWQg82RYGkSBdeqp7N3h+/OfWucKpNUY2FbJeTDVTFDcOW0o3VPPVVde/6W+S
 G/UmJO8gvP6Gfq5k8QtcAx1fR+kpH9JZzMDFAQMHuzD7eAawEH8PmI4WfZdWGoQL12mF
 FJCULA1QKLZELaB9n8NWWTQ4nWouofCrGs3XOFriXNPl/x798RG+pbwyUDbrev6qjmel
 fzvg==
X-Gm-Message-State: AOAM532PitMpsyXlQaPV+uUavvvbKy0YHLuwQMv2oquKZ9j0qnNny4ai
 bacckPHhtJnWmNKWyzVsM6XA28rmRE44L9Bq0Ffx00QxVkVEXQOpzFtCsKUwZ6Sf+Iml3UOn/Sl
 +RmyZmXyf2sA+EM6q42pLnPGGKn9Q
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr57335893wmi.104.1621151328866; 
 Sun, 16 May 2021 00:48:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRkzwXMjfjJhlzuX9LLoPTb6ClHg5TLaCME19q70w8+F6ekQW/0awjb4A7BinEgHO2w+/92g==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr57335881wmi.104.1621151328701; 
 Sun, 16 May 2021 00:48:48 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o129sm16643610wmo.22.2021.05.16.00.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 00:48:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/rockchip: remove existing generic drivers to take over
 the device
Date: Sun, 16 May 2021 09:48:33 +0200
Message-Id: <20210516074833.451643-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are drivers that register framebuffer devices very early in the boot
process and make use of the existing framebuffer as setup by the firmware.

If one of those drivers has registered a fbdev, then the fallback fbdev of
the DRM driver won't be bound to the framebuffer console. To avoid that,
remove any existing generic driver and take over the graphics device.

By doing that, the fb mapped to the console is switched correctly from the
early fbdev to the one registered by the rockchip DRM driver:

    [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Move drm_aperture_remove_framebuffers() call to .bind callback (tzimmermann).
- Adapt subject line, commit message, etc accordingly.

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 212bd87c0c4..b730b8d5d94 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -16,6 +16,7 @@
 #include <linux/console.h>
 #include <linux/iommu.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -114,6 +115,15 @@ static int rockchip_drm_bind(struct device *dev)
 	struct rockchip_drm_private *private;
 	int ret;
 
+	/* Remove existing drivers that may own the framebuffer memory. */
+	ret = drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
+	if (ret) {
+		DRM_DEV_ERROR(dev,
+			      "Failed to remove existing framebuffers - %d.\n",
+			      ret);
+		return ret;
+	}
+
 	drm_dev = drm_dev_alloc(&rockchip_drm_driver, dev);
 	if (IS_ERR(drm_dev))
 		return PTR_ERR(drm_dev);
-- 
2.31.1

