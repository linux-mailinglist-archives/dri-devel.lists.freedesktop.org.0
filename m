Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE35B48E4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 22:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0CE10E2C1;
	Sat, 10 Sep 2022 20:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EA110E2C1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662843068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXox2uAJLE09VSo4z2OzY+kKnaf5gaZrZLRMxFJt2Ao=;
 b=aaa0w/kzmIziYgoJsxLFTDpfH/V7e+MYcHnMcURuCH5WIZ55qYHor7kKTf0z8t1hXUwmkb
 hvyVeFXUfsn+kTrJfp2O4WnUKFvvhwzR9SYz0EgCmo5BbkSW9Ku8fMjiz2RtMMm+x0CLb5
 aKXrbPy6nBDyds4uhJjQvvWF6iIBMLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-btOv2T2NODKX3Yil5fKnpw-1; Sat, 10 Sep 2022 16:51:06 -0400
X-MC-Unique: btOv2T2NODKX3Yil5fKnpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B34D29AB3EF;
 Sat, 10 Sep 2022 20:51:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E8F3C15BC3;
 Sat, 10 Sep 2022 20:51:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 3/4] drm/gma500: Don't register backlight when another
 backlight should be used
Date: Sat, 10 Sep 2022 22:51:00 +0200
Message-Id: <20220910205101.1355950-4-hdegoede@redhat.com>
In-Reply-To: <20220910205101.1355950-1-hdegoede@redhat.com>
References: <20220910205101.1355950-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
index d113c5810ca5..7251f17fe108 100644
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
2.37.2

