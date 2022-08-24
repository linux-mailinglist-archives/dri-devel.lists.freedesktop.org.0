Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BBD59F94D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4841010EB3D;
	Wed, 24 Aug 2022 12:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC50310E938
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fez5JurfKkdDHmkN5O68TIQTTlcqRFGtraUyOgljYGY=;
 b=WTcLo3pVcIksLNpFQ43XMSt+NWmAjIvb0mK20fk0rEmFCLV0pci+Yoj7FXWzBim5C14p8B
 vjC+VnNskLWmxsdJ7FshMK67vncefLGa3wy7MrYr+awLzXo4C+kbmJqy8kdHHI627WzFTu
 GdF2eySJTGZLxcDWidbjMlS1+2gmcNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-cNAXySJINM6P_8HiGuvrAw-1; Wed, 24 Aug 2022 08:15:46 -0400
X-MC-Unique: cNAXySJINM6P_8HiGuvrAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7F40101AA47;
 Wed, 24 Aug 2022 12:15:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BC71C15BB3;
 Wed, 24 Aug 2022 12:15:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v4 02/31] drm/i915: Don't register backlight when another
 backlight should be used
Date: Wed, 24 Aug 2022 14:14:54 +0200
Message-Id: <20220824121523.1291269-3-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
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
 drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 681ebcda97ad..a4dd7924e0c1 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -8,6 +8,8 @@
 #include <linux/pwm.h>
 #include <linux/string_helpers.h>
 
+#include <acpi/video.h>
+
 #include "intel_backlight.h"
 #include "intel_backlight_regs.h"
 #include "intel_connector.h"
@@ -952,6 +954,11 @@ int intel_backlight_device_register(struct intel_connector *connector)
 
 	WARN_ON(panel->backlight.max == 0);
 
+	if (!acpi_video_backlight_use_native()) {
+		DRM_INFO("Skipping intel_backlight registration\n");
+		return 0;
+	}
+
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 
-- 
2.37.2

