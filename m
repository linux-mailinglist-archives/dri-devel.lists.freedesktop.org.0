Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A90381B62
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 00:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7189F03;
	Sat, 15 May 2021 22:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882589F03
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621116907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uj0FnsDmx2/pl2qaIJyZPTU7rem4vQ2vcjf8oF9Zpos=;
 b=bOV5sYGBbrWV6FPbZEHnivfPNO3plxxRBJxPimgY+4ZdPARNyFH2q0ffGocoN2cNvVrj42
 X5s5w1rBzC2wZ8bB5k7JfG3gAuCSwbhKl8bi8eZfKqELGC9noFlnQ5H/TJCDmagua+dpZe
 +zN0pXAj2Wl+se8HrgGO5VgX2HKhXOo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-VqLTjtGPMEyWXq5cGuhH4w-1; Sat, 15 May 2021 18:15:03 -0400
X-MC-Unique: VqLTjtGPMEyWXq5cGuhH4w-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so1514160wrb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uj0FnsDmx2/pl2qaIJyZPTU7rem4vQ2vcjf8oF9Zpos=;
 b=sXdbjcdxQExZx6z4dCpD8ePmMUGmVLaMpLOySjeFEcofPRqtrkTPcwJT1zxmnHjRaE
 1zmQDpqrFpjdA1F6DzMmbfUWQsH3dmAT+HYLtAmLSE55JDfLEoGht8AzRvrN8ECf6Ato
 Mek0HPOKoGxJAdAJXi0eI7n6HC3j73827Kw7HHGuSPM57RhKamqN1ByQwnfUOejg6X6Q
 RMxN//o/bSzhFt95ogaz+cQO44Sx01CuPUhnEoAReIbJ+ztYZBX6oJVSyPUD7zyQXpQb
 /OP3LnXxkqOiZle7EKhlU+LyLl2Vbm/Zu1u1JEXFRGhge5/rTtGJUs1Cd+I14DfXUIW6
 zeMg==
X-Gm-Message-State: AOAM531nnesolv4Sx5y484/TNc6/dLAuCjkaTSQ+O0AFkyVcllsHZEzm
 6q3CudLMHmBJI9/Q/yJMkvpXMdpAZwLpbaP7j9v3XSmV0TmWTJ0ah8GR8Z43tBMfxa/CzDPE7nz
 +ZcwDM344uPojDfIQ8kRO7H9XERgb
X-Received: by 2002:a1c:9a4a:: with SMTP id c71mr14231676wme.136.1621116902165; 
 Sat, 15 May 2021 15:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3DRAaEOsMocZIjWgXpJWHgD+0UBOgPkcyX7580Aop0DadT4fIcQ2zAgGZMo+oom1e3PWTXA==
X-Received: by 2002:a1c:9a4a:: with SMTP id c71mr14231663wme.136.1621116902006; 
 Sat, 15 May 2021 15:15:02 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id b15sm10632945wru.64.2021.05.15.15.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:15:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: remove early framebuffers before registering
 the fbdev
Date: Sun, 16 May 2021 00:14:47 +0200
Message-Id: <20210515221447.429779-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-rockchip@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are drivers that register framebuffer devices very early in the boot
process and make use of the existing framebuffer as setup by the firmware.

If one of those drivers has registered a fbdev, then the fbdev registered
by a DRM driver won't be bound to the framebuffer console. To avoid that,
remove any early framebuffer before registering a DRM framebuffer device.

By doing that, the fb mapped to the console is switched correctly from the
early fbdev to the one registered by the rockchip DRM driver:

    [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
index 2fdc455c4ad..e3e5b63fdcc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
@@ -4,6 +4,7 @@
  * Author:Mark Yao <mark.yao@rock-chips.com>
  */
 
+#include <drm/drm_aperture.h>
 #include <drm/drm.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -124,6 +125,15 @@ int rockchip_drm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, &rockchip_drm_fb_helper_funcs);
 
+	/* Remove early framebuffers (e.g: simplefb or efifb) */
+	ret = drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
+	if (ret) {
+		DRM_DEV_ERROR(dev->dev,
+			      "Failed to remove early framebuffers - %d.\n",
+			      ret);
+		return ret;
+	}
+
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
-- 
2.31.1

