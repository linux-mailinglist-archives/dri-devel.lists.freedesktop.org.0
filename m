Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF919D818
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222CA6EB98;
	Fri,  3 Apr 2020 13:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BE06EB9A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j17so8570407wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4WyT1EFmhRKezLfNxlpR3d1W8vhgrbqDCPO+ZzyKww=;
 b=RYL4G1daPuQlkZ+2kFyTincViIbC5uiNRqyOT+ssr0W+MHjkUGKCO8bt63LQikzwc5
 9BgrzzOR8ZHbi3LxUvmD3V+KDWn+TLvvf4awVftQz1wPo6T8P//Syx0nmsIGcdEOKk2U
 q7Ih4xstkaCNfMsXWnNmWxRzYgJeYXoUi0MWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4WyT1EFmhRKezLfNxlpR3d1W8vhgrbqDCPO+ZzyKww=;
 b=HcYorCsLeYSofB5RBIWjQG9coSlmCQzriIutkSEs+mq+ht2j2muIB4gUqSaw4ANG2o
 VZf4aDZ5PrnhdoEKFMRSLp0/U+lfNNPTFBYDwPMCgl6n7ROQcNuGBRcE++ipc1E9sqvv
 wygoTTu789AmOXwPKgm9m21fUT0Bs6+GnHxx3FJSkS6GDT/YV2dI2YNr2QoN9LMWYuBa
 DGOZmeI5QfR0ujiSZogBFJvPjpW99gw3azmgon1WzfaaiacSRZcrHwAXPTx6uOveKO3r
 CYCYHwDzX1YZ6B3EmQTgHrH2EkJtR+zEXHnh4ZzHMXaSujgaPuGYVaIu3k9fWkL+yyQp
 ih5A==
X-Gm-Message-State: AGi0PuYLZ05mi4c2SD4tMw5sV05cE+nS7rkfU4J+JTTNP+ygN4/mVC3k
 ZbXGcvJDdLZvzkpsGVa1Zf4Cu/O98rPfkQ==
X-Google-Smtp-Source: APiQypIg0wasRpg8UJY2rhOiK4FjOyXN2/rR/FcetICn/SiZfcbpqHKJzT+NEva27Lq3C1umXUzr5w==
X-Received: by 2002:a05:6000:a:: with SMTP id
 h10mr9747138wrx.226.1585922316381; 
 Fri, 03 Apr 2020 06:58:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/44] drivers/base: Always release devres on device_del
Date: Fri,  3 Apr 2020 15:57:45 +0200
Message-Id: <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm we've added nice drm_device (the main gpu driver thing, which
also represents the userspace interfaces and has everything else
dangling off it) init functions using devres, devm_drm_dev_init and
soon devm_drm_dev_alloc (this patch series adds that).

A slight trouble is that drm_device itself holds a reference on the
struct device it's sitting on top (for sysfs links and dmesg debug and
lots of other things), so there's a reference loop. For real drivers
this is broken at remove/unplug time, where all devres resources are
released device_release_driver(), before the final device reference is
dropped. So far so good.

There's 2 exceptions:
- drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
  platform device to make them look more like normal devices to
  userspace. These aren't drivers in the driver model sense, we simple
  create a platform_device and register it.

- drm/i915/selftests, where we create minimal mock devices, and again
  the selftests aren't proper drivers in the driver model sense.

For these two cases the reference loop isn't broken, because devres is
only cleaned up when the last device reference is dropped. But that's
not happening, because the drm_device holds that last struct device
reference.

Thus far this wasn't a problem since the above cases simply
hand-rolled their cleanup code. But I want to convert all drivers over
to the devm_ versions, hence it would be really nice if these
virtual/fake/mock uses-cases could also be managed with devres
cleanup.

I see three possible approaches:

- Clean up devres from device_del (or platform_device_unregister) even
  when no driver is bound. This seems like the simplest solution, but
  also the one with the widest impact, and what this patch implements.
  We might want to include more of the cleanup than just
  devres_release_all, but this is all I need to get my use case going.

- Create a devres group and release that when we unbind. The code in
  virtual drivers gets a bit ugly, since every error case has a
  different cleanup code until we've chained everything
  (platform_device, devres group and then drm_device) together and a
  devres_release_group takes care of everything. Doable, but a bit
  confusing when I typed it out.

- Convert the virtual drivers to real (in the device model sense)
  drivers. Feels like too much boilerplate for not much gain. And
  especially with the mock objects minimal mocking is kinda the goal,
  to limit the amount of accidentally pulled in code into our unit
  tests as much as possible.

Either way I think time to discuss this a bit and figure out what's
the recommended approach here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 drivers/base/dd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index b25bcab2a26b..1bcfb0ff5f44 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1155,6 +1155,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 						     dev);
 
 		kobject_uevent(&dev->kobj, KOBJ_UNBIND);
+	} else {
+		devres_release_all(dev);
 	}
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
