Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC75BB8A4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152F810E3C7;
	Sat, 17 Sep 2022 14:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935610E39C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQ2b8FPNlwEbynCjr0nyirbvc/fOO7v7p2XCeafmNuI=;
 b=FNg9pXdlqugmDQx+3vVKgKhgpzfvCXGa4a1ZwwuIybNJu7TIL/bgwIxqEde0CpKgySrpE7
 cCf5S2zdVhjOUHa9iAUT7ve4fYDW3ryjupsR7ZMWcJlfoc82QQlGnWPy1mCN5dDA70hU6O
 ubsYf+iPsViO6CefB3kKSKltw/GoAbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-W0_HDPSDNWGrZUQCstWlfg-1; Sat, 17 Sep 2022 10:03:59 -0400
X-MC-Unique: W0_HDPSDNWGrZUQCstWlfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D90B85A583;
 Sat, 17 Sep 2022 14:03:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CCC40C6EC2;
 Sat, 17 Sep 2022 14:03:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 5/5] drm/gma500: Call acpi_video_register_backlight()
Date: Sat, 17 Sep 2022 16:03:52 +0200
Message-Id: <20220917140352.526507-6-hdegoede@redhat.com>
In-Reply-To: <20220917140352.526507-1-hdegoede@redhat.com>
References: <20220917140352.526507-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On machines without an Intel video opregion the acpi_video driver
immediately probes the ACPI video bus and used to also immediately
register acpi_video# backlight devices when supported.

Once the drm/kms driver then loaded later and possibly registered
a native backlight device then the drivers/acpi/video_detect.c code
unregistered the acpi_video0 device to avoid there being 2 backlight
devices (when acpi_video_get_backlight_type()==native).

This means that userspace used to briefly see 2 devices and the
disappearing of acpi_video0 after a brief time confuses the systemd
backlight level save/restore code, see e.g.:
https://bbs.archlinux.org/viewtopic.php?id=269920

To fix this the ACPI video code has been modified to make backlight class
device registration a separate step, relying on the drm/kms driver to
ask for the acpi_video backlight registration after it is done setting up
its native backlight device.

Add a call to the new acpi_video_register_backlight() function after
setting up the gma500's native backlight, so that the acpi_video backlight
device gets registered on systems where the gma500's native backlight
device is not registered.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index d3dc16193a29..cd9c73f5a64a 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -398,6 +398,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 		if (gma_encoder->type == INTEL_OUTPUT_LVDS ||
 		    gma_encoder->type == INTEL_OUTPUT_MIPI) {
 			ret = gma_backlight_init(dev);
+			if (ret == 0)
+				acpi_video_register_backlight();
 			break;
 		}
 	}
-- 
2.37.3

