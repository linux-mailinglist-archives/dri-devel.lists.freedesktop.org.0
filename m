Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86215FA14
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 23:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273376FBC2;
	Fri, 14 Feb 2020 22:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CF76FBC2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581721163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EaF2muGJbXQ3bmagv3YuadFQzhctrcmvWvxkLuK4Sk=;
 b=Hy6B8O+n3cPcHKiffXTYyQQQNn28uo9w1CjylD2T8HJgMLBj6h0T0erOvjyxs8UTMwerb6
 vJ2XNEKGaE0ghXijO/Eo+XK/KcEVMfzUzs3Ffc3bZ9eJ6zT4IihYntMDYLKkriqu8e3NdR
 2CkSaI+ZbVk76sQT9FH0BWw4yEYVJzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-lCs922heNx-hMQR2Xsh6jg-1; Fri, 14 Feb 2020 17:59:21 -0500
X-MC-Unique: lCs922heNx-hMQR2Xsh6jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D230C800D4E;
 Fri, 14 Feb 2020 22:59:19 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B8FC89F10;
 Fri, 14 Feb 2020 22:59:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/nouveau/kms/nv50-: Initialize core channel in
 nouveau_display_create()
Date: Fri, 14 Feb 2020 17:58:52 -0500
Message-Id: <20200214225910.695210-2-lyude@redhat.com>
In-Reply-To: <20200214225910.695210-1-lyude@redhat.com>
References: <20200214225910.695210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need the core channel initialized and ready by the time that we
start creating modesetting objects, so that we can call the
NV507D_GET_CAPABILITIES method to make the hardware expose it's
modesetting capabilities for later probing.

So, when loading the driver prepare the core channel from within
nouveau_display_create(). Everywhere else, we initialize the core
channel during resume.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a3dc2ba19fb2..ba07b0154d2b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2394,7 +2394,8 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 	struct drm_encoder *encoder;
 	struct drm_plane *plane;
 
-	core->func->init(core);
+	if (resume || runtime)
+		core->func->init(core);
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
@@ -2481,6 +2482,8 @@ nv50_display_create(struct drm_device *dev)
 	if (ret)
 		goto out;
 
+	disp->core->func->init(disp->core);
+
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >= GV100_DISP)
 		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
