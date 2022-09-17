Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B190B5BBA7E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 23:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB410E158;
	Sat, 17 Sep 2022 21:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EEF10E140
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663448369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiOjLnibW2f7+v0sqpogMrrQ0MRzAdY4zFs7k5CUbQE=;
 b=IFNS4lLllPnpehDaks5tE1VM/0rdnQCGeEfoXum3m/EozG9hfFNG6DIGWjov1oECLFHV1f
 rquczpGYWoR9UnFNDyq0+Oie11Mypa+MJol8uP3A8zCaMS8aqvS0P8maaCdz/rr0uJX4LV
 zhA3Ue303U7qaNE9bItvjtgONZQpwY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-yxbEY5IKPyqMN7h5ZesDdw-1; Sat, 17 Sep 2022 16:59:28 -0400
X-MC-Unique: yxbEY5IKPyqMN7h5ZesDdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C969185A59D;
 Sat, 17 Sep 2022 20:59:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69821121314;
 Sat, 17 Sep 2022 20:59:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 4/5] drm/gma500: Don't register backlight when another
 backlight should be used
Date: Sat, 17 Sep 2022 22:59:19 +0200
Message-Id: <20220917205920.647212-5-hdegoede@redhat.com>
In-Reply-To: <20220917205920.647212-1-hdegoede@redhat.com>
References: <20220917205920.647212-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Before this commit when we want userspace to use the acpi_video backlight
device we register both the GPU's native backlight device and acpi_video's
firmware acpi_video# backlight device. This relies on userspace preferring
firmware type backlight devices over native ones.

Registering 2 backlight devices for a single display really is
undesirable, don't register the GPU's native backlight device when
another backlight device should be used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/backlight.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index e85fd181f2f3..577a4987b193 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -7,6 +7,8 @@
  * Authors: Eric Knopp
  */
 
+#include <acpi/video.h>
+
 #include "psb_drv.h"
 #include "psb_intel_reg.h"
 #include "psb_intel_drv.h"
@@ -80,6 +82,12 @@ int gma_backlight_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
+	if (!acpi_video_backlight_use_native()) {
+		drm_info(dev, "Skipping %s backlight registration\n",
+			 dev_priv->ops->backlight_name);
+		return 0;
+	}
+
 #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	props.brightness = dev_priv->backlight_level;
 	props.max_brightness = PSB_MAX_BRIGHTNESS;
-- 
2.37.3

