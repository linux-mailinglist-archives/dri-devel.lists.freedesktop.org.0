Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB9528568
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4EC1121DC;
	Mon, 16 May 2022 13:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75531121DC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652707871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w+eIR1jdJFJp4FEreIhpWwIkPEB98By7uRBAllkcS2c=;
 b=bn/7Or2/uqh6DZ3VeIK5aaDVRRUGIT2Y1sXPY+UPHMzAVFuiBL5XFYdHwwSrUPY5IM9wvJ
 RurMEMo8mXJUHHICP8DYamj38pCtnVgZti5ZglYWid1pLQyXOM4FW+hVkV/T2Z6qhbrukT
 tDJ9NSsQhSZYgeb85X8wNiLOV5dfY+Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-cp184M9RMTGQjVBcZOy-jQ-1; Mon, 16 May 2022 09:31:08 -0400
X-MC-Unique: cp184M9RMTGQjVBcZOy-jQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b14-20020a05640202ce00b0042aa312ff51so3262324edx.18
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w+eIR1jdJFJp4FEreIhpWwIkPEB98By7uRBAllkcS2c=;
 b=S8S9XnM3DsAL2IWuZ/WqlKi3ociCR9u6nX41le3wovJv89CEukozDI3JZiT7O4jQGI
 gr1vcDTvUBybvf74Z0NjMks4d0rg8wL8dH0VL6J9MWI3bHQH694gjqpIh/zgpxPryheL
 9Wz7MTTCR57T9g+k79wS1M1Hk/XpjZKwurmaoPCGimw8lCDOjO8FLCrCytRc1heKxLLQ
 kJWVL4PvvlEPQZNz52ubKqqwnP4l24JDYbmWrfadD3W3Zl0Q1xZ5JrGInrofwttJVOx3
 VsiU4wSi9xzDkS5oWg2SlyAO4+XDSiW+h+gE3nVIZ4ZIM+wYCJoLo4nDbizGgUHmPqP/
 4Fdg==
X-Gm-Message-State: AOAM533VYX/z095kBgg/vEdT60G00o8TweYb0GdXBm7VQh3xf23ypTbi
 ccwPmk+IjApLuzarZBHjKcfsyjWxcGSMAq9oQHm/zlGHf3poUIqL6rD0z98ZN3AZK8+9YJYxFSH
 IOUSUiFJdegxXufrGldjwc87xFdHt
X-Received: by 2002:a17:907:1687:b0:6f4:ebc2:da77 with SMTP id
 hc7-20020a170907168700b006f4ebc2da77mr14924491ejc.508.1652707867473; 
 Mon, 16 May 2022 06:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0fOyJSx7iSNVdMn7CYLSlWrFP1mGJaYESmuOYZfdVRlB9QZmxDbNE8F2fpbTaT5BDFciIPw==
X-Received: by 2002:a17:907:1687:b0:6f4:ebc2:da77 with SMTP id
 hc7-20020a170907168700b006f4ebc2da77mr14924475ejc.508.1652707867235; 
 Mon, 16 May 2022 06:31:07 -0700 (PDT)
Received: from fedora.. (78-80-114-84.customers.tmcz.cz. [78.80.114.84])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a50fa83000000b0042ab8c5e99fsm868438edr.14.2022.05.16.06.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:31:06 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/nouveau: reorder nouveau_drm_device_fini
Date: Mon, 16 May 2022 15:31:03 +0200
Message-Id: <20220516133103.324365-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Mark Menzynski <mmenzyns@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini()
and display_fini(), where if output poll happens, it crashes.

This makes output poll workers cleared right before fbcon resources are
destroyed.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4f9b3aa5deda..5226323e55d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -39,6 +39,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_atomic.h>
@@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
 	if (!drm->fbcon)
 		return;
 
+	drm_kms_helper_poll_fini(dev);
 	nouveau_fbcon_accel_fini(dev);
 	nouveau_fbcon_destroy(dev, drm->fbcon);
 	kfree(drm->fbcon);
-- 
2.32.0

