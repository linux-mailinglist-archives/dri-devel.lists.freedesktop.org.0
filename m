Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A58AAF3A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 15:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F160F10F188;
	Fri, 19 Apr 2024 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RGXeBv0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55510E6EF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713532996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4w2okfnWt4A2mGL+WlGEy1UeRfHqnVgV2LwGrY3KH3E=;
 b=RGXeBv0a1MYFnTOkYPEN6BiyR2Y8iQp5ojeNdERj/PtOVViz4Tx04JuwJfx31yknHAHexM
 ciR4S3lnuwWu93ssn8INB0KMf6BQblpmzAIWGnT/84jt/QOQpnQG+eYy/A1npc6P6piGII
 Zb66h7ocjTHFAo7rr+6+j/fXYUkp4Lc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-7cupQ4r_OkOp8N44e634KQ-1; Fri, 19 Apr 2024 09:23:13 -0400
X-MC-Unique: 7cupQ4r_OkOp8N44e634KQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED68D810602;
 Fri, 19 Apr 2024 13:23:12 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEF4A400059;
 Fri, 19 Apr 2024 13:23:10 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: daniel@ffwll.ch, tzimmermann@suse.de, airlied@redhat.com, deller@gmx.de,
 geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] lib/fonts: Allow to select fonts for drm_panic
Date: Fri, 19 Apr 2024 15:20:19 +0200
Message-ID: <20240419132243.154466-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

drm_panic has been introduced recently, and uses the same fonts as
FRAMEBUFFER_CONSOLE.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 lib/fonts/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
index 7e945fdcbf11..befcb463f738 100644
--- a/lib/fonts/Kconfig
+++ b/lib/fonts/Kconfig
@@ -10,7 +10,7 @@ if FONT_SUPPORT
 
 config FONTS
 	bool "Select compiled-in fonts"
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
 	help
 	  Say Y here if you would like to use fonts other than the default
 	  your frame buffer console usually use.
@@ -23,7 +23,7 @@ config FONTS
 
 config FONT_8x8
 	bool "VGA 8x8 font" if FONTS
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
 	default y if !SPARC && !FONTS
 	help
 	  This is the "high resolution" font for the VGA frame buffer (the one
@@ -46,7 +46,7 @@ config FONT_8x16
 
 config FONT_6x11
 	bool "Mac console 6x11 font (not supported by all drivers)" if FONTS
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
 	default y if !SPARC && !FONTS && MAC
 	help
 	  Small console font with Macintosh-style high-half glyphs.  Some Mac
@@ -54,7 +54,7 @@ config FONT_6x11
 
 config FONT_7x14
 	bool "console 7x14 font (not supported by all drivers)" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
 	help
 	  Console font with characters just a bit smaller than the default.
 	  If the standard 8x16 font is a little too big for you, say Y.
@@ -62,7 +62,7 @@ config FONT_7x14
 
 config FONT_PEARL_8x8
 	bool "Pearl (old m68k) console 8x8 font" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
 	default y if !SPARC && !FONTS && AMIGA
 	help
 	  Small console font with PC-style control-character and high-half
@@ -70,7 +70,7 @@ config FONT_PEARL_8x8
 
 config FONT_ACORN_8x8
 	bool "Acorn console 8x8 font" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
 	default y if !SPARC && !FONTS && ARM && ARCH_ACORN
 	help
 	  Small console font with PC-style control characters and high-half
@@ -90,7 +90,7 @@ config FONT_6x10
 
 config FONT_10x18
 	bool "console 10x18 font (not supported by all drivers)" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
 	help
 	  This is a high resolution console font for machines with very
 	  big letters. It fits between the sun 12x22 and the normal 8x16 font.
@@ -105,7 +105,7 @@ config FONT_SUN8x16
 
 config FONT_SUN12x22
 	bool "Sparc console 12x22 font (not supported by all drivers)"
-	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
+	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
 	help
 	  This is the high resolution console font for Sun machines with very
 	  big letters (like the letters used in the SPARC PROM). If the
@@ -113,7 +113,7 @@ config FONT_SUN12x22
 
 config FONT_TER16x32
 	bool "Terminus 16x32 font (not supported by all drivers)"
-	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
+	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
 	help
 	  Terminus Font is a clean, fixed width bitmap font, designed
 	  for long (8 and more hours per day) work with computers.
@@ -122,7 +122,7 @@ config FONT_TER16x32
 
 config FONT_6x8
 	bool "OLED 6x8 font" if FONTS
-	depends on FRAMEBUFFER_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
 	help
 	  This font is useful for small displays (OLED).
 

base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
-- 
2.44.0

