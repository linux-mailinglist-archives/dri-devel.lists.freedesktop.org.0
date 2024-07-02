Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E6923D78
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBF810E199;
	Tue,  2 Jul 2024 12:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HOSD5cVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34D410E199
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719922681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V6GUg8qJdzfUKFkObYqAigKWCFdCLA/o1qUky7ru9B0=;
 b=HOSD5cVrSZLH7ofIFagI2mdS1TVEklyY7szMBEt9lwL2IUoGokofwLY93+RtcJbF59jd0q
 waJTMuhqnL+PXZ0jN1TH6wRCgoY8ouUe8J/Nb9J+fk4oWOUgTpYQP8hlqIY2ZqWdrozEWO
 4gCnBbYtMswDGt9p1A822LIlGD+5L+o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-lJRGdo3UPRecJTpGrx0DQg-1; Tue,
 02 Jul 2024 08:17:56 -0400
X-MC-Unique: lJRGdo3UPRecJTpGrx0DQg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B3B8C1979201; Tue,  2 Jul 2024 12:17:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C8C0C3000221; Tue,  2 Jul 2024 12:17:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] drm/fbdev-dma: Fix framebuffer mode for big endian devices
Date: Tue,  2 Jul 2024 14:17:37 +0200
Message-ID: <20240702121737.522878-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

The drm_mode_legacy_fb_format() function only generates formats suitable
for little endian devices. switch to drm_driver_legacy_fb_format() here
instead to take the device endianness into consideration, too.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: Patch has only been compile-tested since I lack an environment
       for testing it. But it's the same fix as I required for the
       drm_mode_legacy_fb_format() in drm_fbdev_generic.c / drm_fbdev_ttm.c
       so I think this should be fine.

 drivers/gpu/drm/drm_fbdev_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 97ef6300d47e..fdef4a2f883f 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -101,7 +101,8 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_width, sizes->surface_height,
 		    sizes->surface_bpp);
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
+					     sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
-- 
2.45.2

