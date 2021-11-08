Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803D447F5E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0363F6E118;
	Mon,  8 Nov 2021 12:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84696E118
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihYsTjIGFFK0sCaC1QK64DApGBNHXW4kTZaSzkld3oE=;
 b=Rl1aGdmCQ3SnOhj7JU9uXZN1U2rudMybpFH95zJPK9eMdJdEfR7xqaRYB4jL1ZOPefDrky
 dkDp7V06NIp9QzlZ6nDuBfX2FFQcOgeMbjajgshZ7cXY773IhxA/EMPYD2chvHrQp/2nzU
 mE0243BLGNEK3fnJRetuVsPYQyput64=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-RGaVtoI5Px6m-qhd--rOTA-1; Mon, 08 Nov 2021 07:16:06 -0500
X-MC-Unique: RGaVtoI5Px6m-qhd--rOTA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so3975560wrd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ihYsTjIGFFK0sCaC1QK64DApGBNHXW4kTZaSzkld3oE=;
 b=CXiaFTDRC6sene9fmWIc54aMzefcXxlKQDKGgJP04MwlY7uXRdJX77i7USPPZo/qBo
 5bLPaVZoCPd5c5AmvH7fCCQr2UpXr54JrRKfGOPJdvM3MNbCWkGm+GhsQ9s08+q/MA4t
 V2FRCBUAaLV8OWeGmrMbFj0ER/Mwb1vKF5KVtlVMIubt+/eh2G9NkCUdc8QHGgN7jS74
 EQSwoAa6xWH1ObTlzxiO9lP9tlPxz6pOSNHRxLky/hCsT1UU0/5+e6AEcm2Oa2Ns5DCS
 f1lRTIvIobdvBRC1tZzjt2QAT4y0heutdPRQLmgaGMfGpTuTJVsVogT6heo4ntO00quC
 wjRg==
X-Gm-Message-State: AOAM532t+5TpOwQpq6xUrFFiHa4yTPvoFHNGNpsT+FJiwYuPUIPsuP+g
 18BRIlpkRFdiaheUY+SCHEngwSwSNuwA2yBWvobv6e7LP22aOqb2OHryS4erHk6cFeakeJcMJKi
 Y85zXWeEpUOyuluX/Ta/phqVGBrAd
X-Received: by 2002:adf:f44e:: with SMTP id f14mr98811489wrp.37.1636373765564; 
 Mon, 08 Nov 2021 04:16:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEWXnM8yAOkIKPIbowIGiFO8iG5XYKaUBbKw2J150lfwX5eydvUmPC9K12Ua7FhaCuHRqXeA==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr98811458wrp.37.1636373765322; 
 Mon, 08 Nov 2021 04:16:05 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
Date: Mon,  8 Nov 2021 13:15:42 +0100
Message-Id: <20211108121544.776590-5-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
References: <20211108121544.776590-1-javierm@redhat.com>
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

