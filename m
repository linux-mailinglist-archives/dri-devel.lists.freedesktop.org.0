Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D55804EBB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BCF10E4C3;
	Tue,  5 Dec 2023 09:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921810E4B7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701769931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+Da2Qql1bsrEKKPfU2b2itmxztryxOX4KsKIrv3OP4=;
 b=ZEQsbJZgPR0Fa36IKntr+VaZFzEann/44mW8bxHwdqcRfm8APO9tkDkGbB3MKnSG6ofwJF
 6XHMfwypzLLKrlBHjrpygknQled4lHkTctBikNR2ZajXp7YATWH5zsigsQPM8xe81tglyG
 NlA6Gkp5BNEG0EhMAua/EGEqmfsxDQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-dz0InC4iOo-5f2Yr02nO4w-1; Tue, 05 Dec 2023 04:52:06 -0500
X-MC-Unique: dz0InC4iOo-5f2Yr02nO4w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AD7188232F;
 Tue,  5 Dec 2023 09:52:06 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD5AF492BC7;
 Tue,  5 Dec 2023 09:52:04 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v6 3/5] drm/simpledrm: Add drm_panic support
Date: Tue,  5 Dec 2023 10:48:25 +0100
Message-ID: <20231205095051.269841-4-jfalempe@redhat.com>
In-Reply-To: <20231205095051.269841-1-jfalempe@redhat.com>
References: <20231205095051.269841-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
index 34bbbd7b53dd..41eea078294b 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -986,6 +987,19 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
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
@@ -1001,6 +1015,7 @@ static struct drm_driver simpledrm_driver = {
 	.minor			= DRIVER_MINOR,
 	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
 	.fops			= &simpledrm_fops,
+	.get_scanout_buffer	= simpledrm_get_scanout_buffer,
 };
 
 /*
-- 
2.42.0

