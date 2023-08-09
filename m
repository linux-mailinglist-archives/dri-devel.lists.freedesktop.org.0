Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615A7768AF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 21:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3513810E0EC;
	Wed,  9 Aug 2023 19:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7F210E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691609145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrApbH3ZISZgcAP6fd6XAvkPWM5vg+C/x2NIkw+xvRk=;
 b=MBRJFkdzBVpNus8eLDBG7JjLMWrR2iCw7p+bWb6Uma+aEJmzv4AAa/T8eehUaHpvsSM/po
 EZhvh5Q99DkR2uKWhehD+OgOQus/cu9fXEuL4TgVM10W6dOf47Eh5+hqOkcubuJKenftmV
 vWQYMRR1ubGGNhjZwBOZQ/4ZcGtwDw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-T0VfiPQFPYS_nZCkRTplug-1; Wed, 09 Aug 2023 15:25:42 -0400
X-MC-Unique: T0VfiPQFPYS_nZCkRTplug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA1C6801FA0;
 Wed,  9 Aug 2023 19:25:41 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A15B4021C9;
 Wed,  9 Aug 2023 19:25:40 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH 2/2] drm/simpledrm: Add drm_panic support
Date: Wed,  9 Aug 2023 21:17:29 +0200
Message-ID: <20230809192514.158062-3-jfalempe@redhat.com>
In-Reply-To: <20230809192514.158062-1-jfalempe@redhat.com>
References: <20230809192514.158062-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 25e11ef11c4c..4e356fb5a062 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_panic.h>
 
 #define DRIVER_NAME	"simpledrm"
 #define DRIVER_DESC	"DRM driver for simple-framebuffer platform devices"
@@ -884,6 +885,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 		color_mode = sdev->format->depth; // can be 15 or 16
 
 	drm_fbdev_generic_setup(dev, color_mode);
+	drm_panic_init_client(dev);
 
 	return 0;
 }
-- 
2.41.0

