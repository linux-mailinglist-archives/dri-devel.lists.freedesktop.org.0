Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C478245B5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8CE10E4FC;
	Thu,  4 Jan 2024 16:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D31110E502
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtJmSEoDb7X3SZg/5Vr9t/X8U01jcunBW8k6+e9basM=;
 b=IRvTzB5mXM/8dldxZ2XN0HKBZu633tV2ZAPm0heqabY/26xhBFTHrIM/aqFXcEnw/fOe9H
 2Beo6Y1afDVOqu6JxvKTlAv+jkX+sv7ZQ5uwFEp7fX2nSDPhSJnQNeB/XA04Vdnui805Ie
 yV/75WmPoxCgxs8PciFnkrhY27aJwrA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-HUAFss60MlekBNwcS99q6g-1; Thu, 04 Jan 2024 11:04:13 -0500
X-MC-Unique: HUAFss60MlekBNwcS99q6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93B5D881F01;
 Thu,  4 Jan 2024 16:04:10 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2CC81C060AF;
 Thu,  4 Jan 2024 16:04:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Date: Thu,  4 Jan 2024 17:00:50 +0100
Message-ID: <20240104160301.185915-7-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-1-jfalempe@redhat.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
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
index 7ce1c4617675..6dd2afee84d4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #define DRIVER_NAME	"simpledrm"
@@ -985,6 +986,19 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
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
@@ -1000,6 +1014,7 @@ static struct drm_driver simpledrm_driver = {
 	.minor			= DRIVER_MINOR,
 	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops			= &simpledrm_fops,
+	.get_scanout_buffer	= simpledrm_get_scanout_buffer,
 };
 
 /*
-- 
2.43.0

