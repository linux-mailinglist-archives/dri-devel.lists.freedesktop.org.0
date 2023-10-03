Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619D7B6B67
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA1310E1DB;
	Tue,  3 Oct 2023 14:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058EA10E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696343131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8oMxpWU4YbTU2E5DbIhyBHpqHGV9WG8v7GffYLPWQg=;
 b=A4/w0NBIwzyALCu/eL741OggFQxq3ltqORxqbMsxWe513YghCOVCyoOZUr3dyi9yNwFkbX
 /PEMHg0h9OyNDi6t6ykh8ww+tyh6jVXc7x8/U7BMfCOq8To92FY7uSaKmGdXWMYKAtH25L
 NfZ7AsL8Ijfx8sESLcjVA2LPbk0j5n4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-sbJWEilaPDSukLMd1JJZ8g-1; Tue, 03 Oct 2023 10:25:27 -0400
X-MC-Unique: sbJWEilaPDSukLMd1JJZ8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85F5C88F4A1;
 Tue,  3 Oct 2023 14:25:26 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 071D92156701;
 Tue,  3 Oct 2023 14:25:24 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v4 3/4] drm/simpledrm: Add drm_panic support
Date: Tue,  3 Oct 2023 16:22:46 +0200
Message-ID: <20231003142508.190246-4-jfalempe@redhat.com>
In-Reply-To: <20231003142508.190246-1-jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
index 25e11ef11c4c..ee62303ef68a 100644
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

