Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724217A18F9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AA10E5CC;
	Fri, 15 Sep 2023 08:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1610E5CC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694766941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXbIVLwa/2TSsXtVZlcjZuTAoEj/aPgzjjwzUOVSS0M=;
 b=gRobihBhjWFVZPyS6uoZRJgZXg2tpgwAwyKJYNrl7fNRuNe/6QTMvVv7BcZ45CZ38cXu5v
 WrBqmjLCOqFD9j+L9lrfmg2hM6fDTT6Ft6vdrV/fQdHmHbE4hQdsJGUZYlTxrav7B8rboi
 XIe2n6upF95tSO5IPR6s+ZXqu+XqUmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-waxRs4pMOOqvhb5ffAHm4w-1; Fri, 15 Sep 2023 04:35:38 -0400
X-MC-Unique: waxRs4pMOOqvhb5ffAHm4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E510685A5BA;
 Fri, 15 Sep 2023 08:35:37 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83EDB40C2070;
 Fri, 15 Sep 2023 08:35:36 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v2 2/2] drm/simpledrm: Add drm_panic support
Date: Fri, 15 Sep 2023 10:28:22 +0200
Message-ID: <20230915083307.1185571-3-jfalempe@redhat.com>
In-Reply-To: <20230915083307.1185571-1-jfalempe@redhat.com>
References: <20230915083307.1185571-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a user-friendly
message to the screen when a kernel panic occurs.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 25e11ef11c4c..f0454b58ead3 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -23,6 +23,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -838,10 +839,24 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		return ERR_PTR(ret);
 
 	drm_mode_config_reset(dev);
+	drm_panic_register(dev);
 
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
@@ -857,6 +872,7 @@ static struct drm_driver simpledrm_driver = {
 	.minor			= DRIVER_MINOR,
 	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops			= &simpledrm_fops,
+	.get_scanout_buffer	= simpledrm_get_scanout_buffer,
 };
 
 /*
@@ -894,6 +910,7 @@ static int simpledrm_remove(struct platform_device *pdev)
 	struct drm_device *dev = &sdev->dev;
 
 	drm_dev_unplug(dev);
+	drm_panic_unregister(dev);
 
 	return 0;
 }
-- 
2.41.0

