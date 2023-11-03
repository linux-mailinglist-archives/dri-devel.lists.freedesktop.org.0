Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FC7E050F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B955610EA09;
	Fri,  3 Nov 2023 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8010EA04
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699023353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHZPg3Ae3/vSii4YmeaUnopY4CM7CyvSoW6lvZvMs34=;
 b=PdXCiHdIK0KlOP3Mg8ZH9OSHp1Bb2OyML4k9MCoojqqX4WJlKg3BAIkSefr51PeWKI7dT1
 SDa7bweMTb3M5ZBG4wGIy9RdetmBT1T3cjOMTZSgMMckXit3jKw29bGS0zjnar9s8Y1lxe
 zFbn0dNI60+0gtYBmtIsCX3wdt5MNdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-zzCDQF3vPpG_YLI73zIkug-1; Fri, 03 Nov 2023 10:55:50 -0400
X-MC-Unique: zzCDQF3vPpG_YLI73zIkug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4BA68370E0;
 Fri,  3 Nov 2023 14:55:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC7F1C060BA;
 Fri,  3 Nov 2023 14:55:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v5 3/6] drm/simpledrm: Add drm_panic support
Date: Fri,  3 Nov 2023 15:53:27 +0100
Message-ID: <20231103145526.628138-4-jfalempe@redhat.com>
In-Reply-To: <20231103145526.628138-1-jfalempe@redhat.com>
References: <20231103145526.628138-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a user-friendly
message to the screen when a kernel panic occurs.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 8ea120eb8674..e5070b82703a 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -23,6 +23,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -842,6 +843,19 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	return sdev;
 }
 
+static int simpledrm_get_scanout_buffer(struct drm_device *dev,
+					struct drm_scanout_buffer *sb)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+
+	sb->width = sdev->mode.hdisplay;
+	sb->height = sdev->mode.vdisplay;
+	sb->pitch = sdev->pitch;
+	sb->format = sdev->format;
+	sb->map = sdev->screen_base;
+	return 0;
+}
+
 /*
  * DRM driver
  */
@@ -857,6 +871,7 @@ static struct drm_driver simpledrm_driver = {
 	.minor			= DRIVER_MINOR,
 	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops			= &simpledrm_fops,
+	.get_scanout_buffer	= simpledrm_get_scanout_buffer,
 };
 
 /*
-- 
2.41.0

