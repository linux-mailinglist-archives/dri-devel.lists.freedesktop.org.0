Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9436C97E7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 22:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287E210E2F4;
	Sun, 26 Mar 2023 20:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376510E2F4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679864080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M7RQZdeZtOt4zLgpooTRzTRkfrdiOxa18wSZtB6xVY8=;
 b=CqLPyizOJfyag9Bvmt78OmSdjkJujkLcgp4wAfrFrg0nSbcF2rqQ8gUYPibud3z7S0JT9r
 Fihvw7xPBtdB6nXRqoDAjw5Nwa0Bo2gYsj8nptyCeQKhHDqGvTNR5Fc1CIWR4WEyzQBS6n
 0PvfIveQ1NIWm25oy+PIJlTVHbsKrmM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-VqxJWldQMJymyj7wDsC9OQ-1; Sun, 26 Mar 2023 16:54:35 -0400
X-MC-Unique: VqxJWldQMJymyj7wDsC9OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA93F185A78F;
 Sun, 26 Mar 2023 20:54:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6A3D140EBF4;
 Sun, 26 Mar 2023 20:54:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH 6.2 regression fix] drm/nouveau/kms: Fix backlight registration
Date: Sun, 26 Mar 2023 22:54:33 +0200
Message-Id: <20230326205433.36485-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Hans de Goede <hdegoede@redhat.com>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nouveau code used to call drm_fb_helper_initial_config() from
nouveau_fbcon_init() before calling drm_dev_register(). This would
probe all connectors so that drm_connector->status could be used during
backlight registration which runs from nouveau_connector_late_register().

After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
the fbdev emulation code, which now is a drm-client, can only run after
drm_dev_register(). So during backlight registration the connectors are
not probed yet and the drm_connector->status == connected check in
nv50_backlight_init() would now always fail.

Replace the drm_connector->status == connected check with
a drm_helper_probe_detect() == connected check to fix nv_backlight
no longer getting registered because of this.

Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 40409a29f5b6..91b5ecc57538 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -33,6 +33,7 @@
 #include <linux/apple-gmux.h>
 #include <linux/backlight.h>
 #include <linux/idr.h>
+#include <drm/drm_probe_helper.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_reg.h"
@@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nvif_object *device = &drm->client.device.object;
 
+	/*
+	 * Note when this runs the connectors have not been probed yet,
+	 * so nv_conn->base.status is not set yet.
+	 */
 	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
-	    nv_conn->base.status != connector_status_connected)
+	    drm_helper_probe_detect(&nv_conn->base, NULL, false) != connector_status_connected)
 		return -ENODEV;
 
 	if (nv_conn->type == DCB_CONNECTOR_eDP) {
-- 
2.39.1

