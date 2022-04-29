Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6B514481
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DC410F987;
	Fri, 29 Apr 2022 08:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E210FC61
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTpQrVgtEus10W4LvCQhMZMxqMItEWJawYg8qRPBPlQ=;
 b=Rg5gfs0MyoSZLr9EEcN9xuRRLqsy8n1lWBRp2NYN08Utl3xbHud9IlO+U4YLB6Wp7rsQxF
 uIM2kxyR9LqE9muxH7mGEcz5X6s7eXTHr064mcOIpMBPGZMSF+bzxCu0nwc/Nr6Ze857dC
 T2tQQ4W4X91OhVFVRJXrgjWgXDdVFM0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-LDK4-8GnNkCqYx4LoE-T6A-1; Fri, 29 Apr 2022 04:43:20 -0400
X-MC-Unique: LDK4-8GnNkCqYx4LoE-T6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso2813010wrg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTpQrVgtEus10W4LvCQhMZMxqMItEWJawYg8qRPBPlQ=;
 b=XvErfbv5ut/D9uPKsamSTj3KAuh3NCyO2DYTfN8y1Vcl2JQ007dG3MBgjg1+ljdRJE
 bL5Ewr66w78/quWy2bnwsoN8xKTSVLDCMBKbdjUqm8aeUeDDvewCdzeEdMq2dzRn7avd
 q/EIhG7SLk7n3hLd90dQUxKkDd2BVvjeNNBzNcNNi1ePbFPVULQTS7mt3EMfIrdyg7FO
 I9a1LcydYe1c32wvOy3w+AOgIKgh3bgIidoS+OTM60I8vHFjWmw+l/aorNB1x8VTNpLf
 JtheZKZiZXLfFguyxFeUFYGuaAxY7LVM7Tks7dtDCYRdu6HqNAegT6pCI5JAqsQkmxqR
 7w2Q==
X-Gm-Message-State: AOAM53292MAi2EPmBYMs1g3IT3jRIYVSSkE8gcG96Uv9lf4mo33XuZDr
 JGrz1znX/pBdZFgeOZvjpx9cwfGktiQa7Cn9hlFyL7FskuJt4XkdloBos7nJko6qsDQ6W2kreRj
 9EiLLGGZ9myx1p+DDzX0R9pvIPrlJ
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id
 h12-20020a056000000c00b0020adf2e2c38mr17608223wrx.481.1651221799511; 
 Fri, 29 Apr 2022 01:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWrC4ya/rMI6HLQk7JSawGUTh/QcZs606nyrC5F9U2cmzfWUxtJf62tVPglLeePqo2GOHhKw==
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id
 h12-20020a056000000c00b0020adf2e2c38mr17608204wrx.481.1651221799301; 
 Fri, 29 Apr 2022 01:43:19 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 09/11] drm: Fix race between sysfb and DRM devices
 registration
Date: Fri, 29 Apr 2022 10:42:51 +0200
Message-Id: <20220429084253.1085911-10-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices registered by sysfb match with firmware-based DRM or
fbdev drivers, that are used to have early graphics using a framebuffer
provided by the system firmware.

DRM or fbdev drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has a race, since the sysfb_init() function could
be called after a DRM driver is probed and requested to unregister devices
for drivers with conflicting framebuffes.

To prevent this, disable any future sysfb platform device registration by
calling sysfb_disable(), if either a framebuffer device or a DRM device is
registered. Since in that case a display will already be present.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v3)

Changes in v3:
- Call sysfb_disable() when a DRM device is registered rather than
  when conflicting framebuffers are removed (Thomas Zimmermann).

 drivers/gpu/drm/drm_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..e577c42861c6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
+#include <linux/sysfb.h>
 
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
@@ -913,6 +914,17 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 out_unlock:
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
+
+	/*
+	 * If a driver registers a DRM device, then it can be assumed that a
+	 * display will be present and there is no need for a generic driver
+	 * using the firmware setup system framebuffer.
+	 *
+	 * Disable sysfb and prevent registering simple framebuffer devices.
+	 */
+	if (!drm_core_check_feature(dev, DRIVER_FIRMWARE))
+		sysfb_disable();
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_dev_register);
-- 
2.35.1

