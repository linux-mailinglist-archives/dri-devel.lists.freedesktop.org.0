Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0A859F9C3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290B0A4BC9;
	Wed, 24 Aug 2022 12:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB7111AA83
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5czve/fmNspAirsfJJfC4zXPA302CHlDbEsopfhHVNM=;
 b=EyphQ2yEDZJZj1gDRlNB6rQrUJAin15TZnnZ/NPLweAcJyemZaKeT7bOKmsizl+ZHO+i6g
 rMyf2NvvsezkctXhbfmQmmSCXGyPR/vyA5PJcJn0ut6PNDfH5cAKjFU11XnL6sJSrjNjCq
 OjTpapINMJ942CLFWq4oRIDA3vFlO2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-vEdLhMEvPIqSmaD6fN5tSw-1; Wed, 24 Aug 2022 08:15:58 -0400
X-MC-Unique: vEdLhMEvPIqSmaD6fN5tSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEC17101E989;
 Wed, 24 Aug 2022 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33805C15BB3;
 Wed, 24 Aug 2022 12:15:53 +0000 (UTC)
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
Subject: [PATCH v4 05/31] drm/nouveau: Don't register backlight when another
 backlight should be used (v2)
Date: Wed, 24 Aug 2022 14:14:57 +0200
Message-Id: <20220824121523.1291269-6-hdegoede@redhat.com>
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

Changes in v2:
- Add nouveau_acpi_video_backlight_use_native() wrapper to avoid unresolved
  symbol errors on non X86

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 5 +++++
 drivers/gpu/drm/nouveau/nouveau_acpi.h      | 2 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 6140db756d06..1592c9cd7750 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -386,3 +386,8 @@ nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 
 	return kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
 }
+
+bool nouveau_acpi_video_backlight_use_native(void)
+{
+	return acpi_video_backlight_use_native();
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index 330f9b837066..3c666c30dfca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -11,6 +11,7 @@ void nouveau_register_dsm_handler(void);
 void nouveau_unregister_dsm_handler(void);
 void nouveau_switcheroo_optimus_dsm(void);
 void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
+bool nouveau_acpi_video_backlight_use_native(void);
 #else
 static inline bool nouveau_is_optimus(void) { return false; };
 static inline bool nouveau_is_v1_dsm(void) { return false; };
@@ -18,6 +19,7 @@ static inline void nouveau_register_dsm_handler(void) {}
 static inline void nouveau_unregister_dsm_handler(void) {}
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
 static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
+static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index a2141d3d9b1d..d2b8f8c13db4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -38,6 +38,7 @@
 #include "nouveau_reg.h"
 #include "nouveau_encoder.h"
 #include "nouveau_connector.h"
+#include "nouveau_acpi.h"
 
 static struct ida bl_ida;
 #define BL_NAME_SIZE 15 // 12 for name + 2 for digits + 1 for '\0'
@@ -405,6 +406,11 @@ nouveau_backlight_init(struct drm_connector *connector)
 		goto fail_alloc;
 	}
 
+	if (!nouveau_acpi_video_backlight_use_native()) {
+		NV_INFO(drm, "Skipping nv_backlight registration\n");
+		goto fail_alloc;
+	}
+
 	if (!nouveau_get_backlight_name(backlight_name, bl)) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
 		goto fail_alloc;
-- 
2.37.2

