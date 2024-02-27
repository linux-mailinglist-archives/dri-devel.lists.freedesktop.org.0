Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B9868CE7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E522D10EF1A;
	Tue, 27 Feb 2024 10:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PcK1hvRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251C10EF1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pt+3oezJlhj43rAd97hx30ieNFlZxgK2TVRbLGhOZJc=;
 b=PcK1hvRPvo6x/HJvP2s1nhc6nvLkJRHBpbRLTvMpnheyH1oo3jWSIlVxpwZlL2Frk0Zz8J
 lUmbU6UxM7TH6OcvS0nlb5SfKqI1GEhE8gPJLuzZ1gZMvw0SQsSL0SPqt95olYv2tHd7T7
 pKj8d9+HHRgNLZmtUo9RnWvm3Xqdy34=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-pyCTUgpcMIqIT1PDI8Os7g-1; Tue,
 27 Feb 2024 05:05:43 -0500
X-MC-Unique: pyCTUgpcMIqIT1PDI8Os7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B81D3811F21;
 Tue, 27 Feb 2024 10:05:42 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE71539CAD;
 Tue, 27 Feb 2024 10:05:39 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 7/8] drm/imx: Add drm_panic support
Date: Tue, 27 Feb 2024 11:04:18 +0100
Message-ID: <20240227100459.194478-8-jfalempe@redhat.com>
In-Reply-To: <20240227100459.194478-1-jfalempe@redhat.com>
References: <20240227100459.194478-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Add support for the drm_panic module, which displays a user-friendly
message to the screen when a kernel panic occurs.

v7:
 * use drm_panic_gem_get_scanout_buffer() helper

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dade8b59feae..e820858732ec 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 
 #include <video/imx-ipu-v3.h>
 
@@ -765,6 +766,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	ipu_cpmem_set_buffer(ipu_plane->ipu_ch, 1, eba);
 	ipu_idmac_lock_enable(ipu_plane->ipu_ch, num_bursts);
 	ipu_plane_enable(ipu_plane);
+
+	drm_panic_gem_set_scanout_buffer(plane, fb);
 }
 
 static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
@@ -942,6 +945,8 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 			  zpos ? "overlay" : "primary", &ret);
 		return ERR_PTR(ret);
 	}
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_panic_register(&ipu_plane->base);
 
 	return ipu_plane;
 }
-- 
2.43.0

