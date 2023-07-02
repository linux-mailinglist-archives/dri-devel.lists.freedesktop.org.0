Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF57745046
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 21:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B42410E07C;
	Sun,  2 Jul 2023 19:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4C10E048
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 19:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688325352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtebbbtsycpwEyNSye/8z5gGh26uqgxI4WhcsSrx/V0=;
 b=Fi/6/3SkBSBJkuTJ67jxVRigEW6AqKeSqSFF+jequoe1zoNq7ji2HZJr7e++de/kjAQyHN
 Ju/vW3dYlf1Y0BzEpndTQ8i+R65avSaiLBAvdVcU2WHt49WgiSe5WlnDPsehvy0w3a0eTr
 RIP41BiTVstHnpZCtY+IBxpRRiSVXa4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-ktuMvFuPNSm1j3ZRNkCrHw-1; Sun, 02 Jul 2023 15:15:50 -0400
X-MC-Unique: ktuMvFuPNSm1j3ZRNkCrHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31114af5e45so2116372f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 12:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688325349; x=1690917349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtebbbtsycpwEyNSye/8z5gGh26uqgxI4WhcsSrx/V0=;
 b=glbLBwLhahfnAB58Kkus72wTV9mAIsPUr3UxQCdEFH4u45MF4ek70BNeZAs0EOKAUl
 W37bwW7XHSgnIFwgahtQPRZyiMRb9gzL8S38IpPJWNf7Va+1OFmSnAG1s5XyxJ4TcIvz
 WGI10F5GTRwKm4ygwIqaM31On0goyron1fKWBntMk116YRrTkCtrLOwq8Xb3a77uj1Sw
 eYy5XzxRkd7fZ4WN7s7bHSmUyMSwrB/Wx3/2q0SwXnt9RCe7VAw0wZNiP8VkIB1NtuGL
 VVW8pkrVcoVf++lz0b8oqNOZpoEIaFTLxGHVk0gV7EhyPF9VeEdajppOqScDBqw9qrts
 naUQ==
X-Gm-Message-State: ABy/qLbizK034X82m94FvzpNl7DWyRFekLC0CnuweDATorIsylzKvc8P
 zb5geABvk89bO+ADBTFV0CZYYYlHn2LmNSjUwJQ4zakNbjVKdBKa+2m5yAVNFRES8XcUIH8gjpO
 l2tbQI/tn9+IAJmAbQ/C7H580YnDp
X-Received: by 2002:adf:df03:0:b0:314:f88:4fea with SMTP id
 y3-20020adfdf03000000b003140f884feamr7089528wrl.8.1688325348942; 
 Sun, 02 Jul 2023 12:15:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyklTA8x1D+VHvsQUZVf1gre+qa/Wgc/bQ4CPKiC6Ihq07p7WS1Q0iaaxUngWXac/drZSALQ==
X-Received: by 2002:adf:df03:0:b0:314:f88:4fea with SMTP id
 y3-20020adfdf03000000b003140f884feamr7089512wrl.8.1688325348614; 
 Sun, 02 Jul 2023 12:15:48 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a7bc4cb000000b003fbab76165asm14144231wmk.48.2023.07.02.12.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 12:15:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm: Make FB_CORE to be selected if DRM fbdev
 emulation is enabled
Date: Sun,  2 Jul 2023 21:15:20 +0200
Message-ID: <20230702191529.768248-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230702191529.768248-1-javierm@redhat.com>
References: <20230702191529.768248-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that fbdev core has been split in FB_CORE and FB, make the DRM symbol
to select the FB_CORE option if the DRM fbdev emulation layer is enabled.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable each of the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Make the DRM symbol to select FB_CORE if DRM_FBDEV_EMULATION is
  enabled (Arnd Bergmann).
- Also make DRM select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
- Make DRM_FBDEV_EMULATION to depend on DRM instead of DRM_KMS_HELPER.

Changes in v2:
- Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann).

 drivers/gpu/drm/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 373f85e174c2..07077708efd8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -10,6 +10,9 @@ menuconfig DRM
 	tristate "Direct Rendering Manager (DRM) and Kernel Mode Settings (KMS)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_PANEL_ORIENTATION_QUIRKS
+	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
+	select FB_CORE if DRM_FBDEV_EMULATION
+	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select HDMI
 	select I2C
 	select DMA_SHARED_BUFFER
@@ -99,7 +102,6 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
-	select FB_SYS_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
@@ -135,8 +137,7 @@ config DRM_DEBUG_MODESET_LOCK
 
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
-	depends on DRM_KMS_HELPER
-	depends on FB=y || FB=DRM_KMS_HELPER
+	depends on DRM
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
-- 
2.41.0

