Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7D5BB8A5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C107910E3A7;
	Sat, 17 Sep 2022 14:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DE710E3A7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pAQss5VCXg66jEKxKniS2Tm6UU562RPw+riy5cfbVY=;
 b=StkKpKaQRbBzvgu9MH71g1ESwbEvUrccqN0kY2CqWMiu4yhinpYsNt+d+AY4Ttu6mDMlMe
 CITAml+apaheussrMofPD8GOBnW9LE0Jy61ovs11+JpR1WKXsUuwBy4tdemqBbrC3aySsj
 RSmB7Og3vKmZK4Bo1W2hJoQtfimdTrs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-pT-dJ93EMOKlBmlI_fWZRw-1; Sat, 17 Sep 2022 10:03:58 -0400
X-MC-Unique: pT-dJ93EMOKlBmlI_fWZRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 338A43C025B3;
 Sat, 17 Sep 2022 14:03:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E5D240C6EC2;
 Sat, 17 Sep 2022 14:03:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 4/5] drm/gma500: Don't register backlight when another
 backlight should be used
Date: Sat, 17 Sep 2022 16:03:51 +0200
Message-Id: <20220917140352.526507-5-hdegoede@redhat.com>
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
index 9be28dc0bdd1..376c7d724af7 100644
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

