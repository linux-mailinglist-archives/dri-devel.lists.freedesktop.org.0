Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220785BB8A8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1BA10E3CB;
	Sat, 17 Sep 2022 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BFD10E3B7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dSBp+S+fhERIUuSXbVuDJQDte67101MKgi38mAbAwc=;
 b=aehaGYCNmeeSc78G0InNpAgZM+1Bdw5m2rEy2Cz4HbT2L4/YpqZLEIoiykUPcPoHvJ+VRR
 dY1kTwENN7hVx7WX7yANrddRpWSioHsAuyLe/4bMREjQZ+ddlgXHttUp0AS147ax51etdL
 MwRyrsfBA1RpLfIsB7zEDLpDl4WcZMw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-Qak9HAeGP2uaqC7DwDq9lQ-1; Sat, 17 Sep 2022 10:03:56 -0400
X-MC-Unique: Qak9HAeGP2uaqC7DwDq9lQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D2C338041DC;
 Sat, 17 Sep 2022 14:03:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB61D40C6EC2;
 Sat, 17 Sep 2022 14:03:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/5] drm/gma500: Change registered backlight device type to
 raw/native
Date: Sat, 17 Sep 2022 16:03:49 +0200
Message-Id: <20220917140352.526507-3-hdegoede@redhat.com>
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

Change the type for the registered backlight class device from platform
to raw/native.

The poulsbo/cedarview/oaktrail backlight support is using native GPU
backlight control and as such the type should be raw (aka native) as
is done by all the other native GPU backlight driver code.

Note this will not change much from userspace's point of view.
poulsbo/cedarview laptops typically offer both an ACPI-video
backlight interface as well as the native GPU backlight interface.

The /sys/class/backlight/acpi_video0 has a type of firmware and
userspace typically looks for firmware devices before looking
for platform devices. The typical standard lookup order is:
firmware -> platform -> raw

This means that both before and after this change typical userspace
backlight consumers (sich as e.g. GNOME) will prefer the firmware
acpi_video0 backlight device.

This has been tested on a Packard Bell Dot SC (Intel Atom N2600, cedarview)
and a Sony Vaio vpc-x11s1e (Intel N540, poulsbo) laptop.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 20c793de7775..d113c5810ca5 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -83,7 +83,7 @@ int gma_backlight_init(struct drm_device *dev)
 #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	props.brightness = dev_priv->backlight_level;
 	props.max_brightness = PSB_MAX_BRIGHTNESS;
-	props.type = BACKLIGHT_PLATFORM;
+	props.type = BACKLIGHT_RAW;
 
 	dev_priv->backlight_device =
 		backlight_device_register(dev_priv->ops->backlight_name,
-- 
2.37.3

