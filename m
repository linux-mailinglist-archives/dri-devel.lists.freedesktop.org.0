Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB24480D8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85186E0CE;
	Mon,  8 Nov 2021 14:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE176E0AB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPjF0q/sVEPX9a+zAsNTT+5st42KW0ioDba0FRy7So0=;
 b=IGIlF0++ic0B473yd83NzgKoO1zX2FaY6bgLrxQTUiXeXWeju7EwnERpV1I4YfISbf5TzD
 DJrzQiyvve9VZW6w0sSPh3+We7r9IUM8lBvilI3vPWqke4evYfmmNR9AZaOZBYl1Aw87VH
 lY+MU2Vg0nMSF2gf9C4PpTl2U6i0+bA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-MhTBUxdHMoaZJ-yv_fJfIg-1; Mon, 08 Nov 2021 09:07:08 -0500
X-MC-Unique: MhTBUxdHMoaZJ-yv_fJfIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso4073237wrr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPjF0q/sVEPX9a+zAsNTT+5st42KW0ioDba0FRy7So0=;
 b=Rpn+wQLBvAcMZ3qJ6BwDg2mLDmqkpbg3PwgrWgnoBSQgXyUmtOi+wJ6swc4Mm6tyAy
 GtFRMgd/eINGPZwJPqBdh4nGezUo/4Oak5SXg1OlfYxLMTmhOp9baklZ8d9VBMsNwqmg
 iNpBIdxLS/oW/dFTu5/GaNf8jJP3D7RjC3gwynGxBnMlnN1yGZmru2gr5Z7UYeEZp9m8
 UsnUjiVIEm7+cUnnwhacd+RMvYniHqU/DaT8DRlJRKaFHqKlAm78XDpvbTyvQod5tjZ8
 Z91AgRGSEBxOf6gZWrK/eZE9AIsKa6VBQYvQ1NT73szN8nzrv10Gc+CxVkAub59Q7VI0
 wqjw==
X-Gm-Message-State: AOAM530WgFu4V9wH3Ik9B2ZdI/8coYPtNBmEZ7l2k2cXOFMx7GJnUgHm
 C4hG4IxEr0SzoFUO9dpGMPrb3fhZ3BgN7+C0nLTPJIU0gO5HG4x3CN8FRBwhQFsoLEgb8inNaep
 2XrQNfQ702EzGjs5n02FSPUqIf7qp
X-Received: by 2002:a5d:6481:: with SMTP id o1mr48028040wri.305.1636380427610; 
 Mon, 08 Nov 2021 06:07:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpZwgscwTuqbX3FM0P7plr2LbKZCfnFDWGyt9ZGyuhmO5dPrrJxu4VvdTcsUZXQXtqpR3eCw==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr48027995wri.305.1636380427367; 
 Mon, 08 Nov 2021 06:07:07 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
Date: Mon,  8 Nov 2021 15:06:46 +0100
Message-Id: <20211108140648.795268-5-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This relationship was only for historical reasons and the nomodeset option
should be available even on platforms that don't enable CONFIG_VGA_CONSOLE.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/Kconfig       | 6 ++++++
 drivers/gpu/drm/Makefile      | 2 +-
 include/drm/drm_mode_config.h | 4 ----
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git drivers/gpu/drm/Kconfig drivers/gpu/drm/Kconfig
index fb144617055b..483d534eb074 100644
--- drivers/gpu/drm/Kconfig
+++ drivers/gpu/drm/Kconfig
@@ -8,6 +8,7 @@
 menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
+	select DRM_NOMODESET
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select HDMI
 	select FB_CMDLINE
@@ -493,6 +494,11 @@ config DRM_EXPORT_FOR_TESTS
 config DRM_PANEL_ORIENTATION_QUIRKS
 	tristate
 
+# Separate option because nomodeset parameter is global and expected built-in
+config DRM_NOMODESET
+	bool
+	default n
+
 config DRM_LIB_RANDOM
 	bool
 	default n
diff --git drivers/gpu/drm/Makefile drivers/gpu/drm/Makefile
index c74810c285af..fa16d3e0bbdc 100644
--- drivers/gpu/drm/Makefile
+++ drivers/gpu/drm/Makefile
@@ -33,7 +33,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
-obj-$(CONFIG_VGA_CONSOLE) += drm_nomodeset.o
+obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
diff --git include/drm/drm_mode_config.h include/drm/drm_mode_config.h
index f4d407908348..4bb129040185 100644
--- include/drm/drm_mode_config.h
+++ include/drm/drm_mode_config.h
@@ -969,10 +969,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
-#ifdef CONFIG_VGA_CONSOLE
 extern bool drm_get_modeset(void);
-#else
-static inline bool drm_get_modeset(void) { return true; }
-#endif
 
 #endif
-- 
2.33.1

