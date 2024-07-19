Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA79377A7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 14:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AE210EBD9;
	Fri, 19 Jul 2024 12:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DJcYQBMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56610EBD9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721391660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wZGdjlBqIgSvR2eKWkeFk3m/cvKrn5tMiAiIWxhCfOo=;
 b=DJcYQBMGajOMu1bmsdEyUmtykPd29LF1aX52ALsDIbEGaBL+GfbGKRIvM2nUtPTl1v9gZU
 zP3zznY7/iYuj2fnvlj52l6E6C98MmuOBbnBzbXKVhrC0fI/TNsNhayKA8MDsHQghNwzB0
 rjE8QowOSFSE+Oyu5kxkb+aSVogM+/g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-CxBE6dxTOMyUpUYpgtsu1Q-1; Fri,
 19 Jul 2024 08:20:59 -0400
X-MC-Unique: CxBE6dxTOMyUpUYpgtsu1Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1115E1955D4B; Fri, 19 Jul 2024 12:20:58 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 11AB6195605A; Fri, 19 Jul 2024 12:20:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
Date: Fri, 19 Jul 2024 14:20:40 +0200
Message-ID: <20240719122051.1507927-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This breaks build if DRM_PANIC is not enabled.
Also add the missing include drm_crtc_internal.h in drm_panic.c

Fixes: 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 2 +-
 drivers/gpu/drm/drm_panic.c         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c10de39cbe83..bbac5350774e 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
 #ifdef CONFIG_DRM_PANIC
 bool drm_panic_is_enabled(struct drm_device *dev);
 #else
-bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
+static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
 #endif
 
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 9f1a3568e62d..072752b658f0 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -27,6 +27,8 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
+#include "drm_crtc_internal.h"
+
 MODULE_AUTHOR("Jocelyn Falempe");
 MODULE_DESCRIPTION("DRM panic handler");
 MODULE_LICENSE("GPL");
-- 
2.45.2

