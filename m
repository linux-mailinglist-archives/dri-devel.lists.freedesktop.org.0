Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6144E76E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 14:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC46E3D2;
	Fri, 12 Nov 2021 13:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA088FC8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636723974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1s41S2hPwpPT7g2xpXi235aPAB5NLJoO6nNF2Iym4o=;
 b=SisXvzMjn8lGtlg3U1OOotVcbGoEnHd4U7ppe/iOBG++D4msueb5TqNSjJRBZMDAjzEKXx
 9A4UUjXnotMw5naWuf+/mK9TlvlGxFcdo7UFXiWZdynJXzpVxa6AkI0FH8Ho+gDpW8SBxR
 +GPdgvco5phI9U3bXtP1Jxm7MxIiAfk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-nv0COL2sOQCr3Vk2A412Dw-1; Fri, 12 Nov 2021 08:32:53 -0500
X-MC-Unique: nv0COL2sOQCr3Vk2A412Dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso2231702wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1s41S2hPwpPT7g2xpXi235aPAB5NLJoO6nNF2Iym4o=;
 b=wYG0tRoJreoa6uSvNJTka9RFRxNt+UHaR3X2kYElB7872jNQLdXabUj8cDgF4DLW2v
 TlTKngoKNQd0peTg3NoWXgVpyX9xBstyZ/nV4OTYJ3urwktyOOEk7qzrVptQBMa4RYZT
 QAbp9DAuD9JLIel6XYNsrsoklaxRdTSO+U+bfRlr5i4w5cwMI5BODXqylAJfuHcWJiFz
 4RNTDUSUQwe9RRRDFFGruluCajsm+cj4KWTmdTtBR63IGTMcmb1VTRJHaJz5760rU+o9
 V7VWNcUfb36PXDqCA2pc5inMJBEYPC98d9X7xf3cDeM+lySjmCCYVSSF5apaIhtvTiJ+
 JJyw==
X-Gm-Message-State: AOAM533j6y01V5XEhHJRyVVoGNN4tawwZjk8TS23oW9TkdnQKsyVc4KF
 QyhuT4gsbp0BCFDenNfNDGPCZjRZ6TH7dBHBFnixBVPK04AK0+nFJ62564DuJVRCgOAUlRs/RPm
 ZSckuT/Dq2nIfpXto3e5tCyFvARzV
X-Received: by 2002:a7b:cf0f:: with SMTP id l15mr17452502wmg.92.1636723972337; 
 Fri, 12 Nov 2021 05:32:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0Xujucpr+TCy5KQx1Uvs84Rns+3FCYJpzpxCgAXAGddQEWARAJGBX35Wrmx2RbfGOXF7SbQ==
X-Received: by 2002:a7b:cf0f:: with SMTP id l15mr17452471wmg.92.1636723972162; 
 Fri, 12 Nov 2021 05:32:52 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z12sm5733470wrv.78.2021.11.12.05.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:32:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
Date: Fri, 12 Nov 2021 14:32:28 +0100
Message-Id: <20211112133230.1595307-5-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/Kconfig  | 6 ++++++
 drivers/gpu/drm/Makefile | 2 +-
 include/drm/drm_drv.h    | 4 ----
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
diff --git include/drm/drm_drv.h include/drm/drm_drv.h
index 89e26a732175..da0c836fe8e1 100644
--- include/drm/drm_drv.h
+++ include/drm/drm_drv.h
@@ -601,10 +601,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 
 int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
-#ifdef CONFIG_VGA_CONSOLE
 extern bool drm_firmware_drivers_only(void);
-#else
-static inline bool drm_firmware_drivers_only(void) { return false; }
-#endif
 
 #endif
-- 
2.33.1

