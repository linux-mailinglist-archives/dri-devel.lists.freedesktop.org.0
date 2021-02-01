Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4C30A8A0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2546E5A0;
	Mon,  1 Feb 2021 13:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6DC6E59D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:37 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t8so19516338ljk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkEGOvHYYd+Q9dKrVulbEdTb0n+csJWL3IspA9E7+ec=;
 b=M0zWPYD2ToqaUoifCDutFnNa9+191BbGTwShPaPHr4K5bmOw9Ii0+Y0c01nn4XjUtF
 a3WAwWDJQortDv7m+m93MIUew5aPMkE3py12EgceFa4ePXTqfClRRnQcBg2siGazpH5K
 ty9UoihTn32NGOM7txGwuyAaAMUl6Fh8Dhd0JRY2AiG9mcxHNk+cKjZurK40MKznVfYN
 bhHkoQb1UD1TdJzmawogwMY7FKg4DV8bolH1sXmrDObKnVbtoLigxKMHcBArpaUrT8So
 9Ndc1pSh1b4a+Myvtyib1g1wcZCpk7sEc7UujUTJBEF8WZOhiUYm9ygqajHFNRPyyoEL
 7GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkEGOvHYYd+Q9dKrVulbEdTb0n+csJWL3IspA9E7+ec=;
 b=oor4Crn7Ap+C5vrnVRExSdOarbrbhZylt1QHJ+49O3up9jH89moxnfNGwO7LquweFA
 g7CdvPyrPqkLmbyOslHhdbO02owe5xROgb0xODDON0rfeJRJCibtbhzJtTEi2IIyz34f
 Qt3N1xcNgQCHllkX0NmvftTHz+NP465oCGSOW12DSCOgpAKHhv/mArqw5CLlqp9AgPjY
 XugH74pKZkdgtzv91ZVv35uQKL/Kz2fL7PHOTRCbuhzattm3d8oPqTkAMnzfTquKYJ0Y
 rgh9VutwOV1GHX62TruTBuIMmBKrS7vlE9t+ONtilAyJ2/SW5TpdtAcRz27QV1nhrYLW
 uKrg==
X-Gm-Message-State: AOAM53303d0vyDiT4HfJ+aHMCL5Q5Z0oLwrPXf9jb93577RlIUxMs4Sx
 LewZfPHFO711CoeNVWAE9q/ob4picQw=
X-Google-Smtp-Source: ABdhPJySRYqQB4d9ecFluuPivLIJhVFyuDomg0ybnUUj1Qet64MStlsxsOO1re7C0JYOkiVnYpuVKg==
X-Received: by 2002:a2e:b0ee:: with SMTP id h14mr10605213ljl.31.1612185995613; 
 Mon, 01 Feb 2021 05:26:35 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:34 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/gma500: Unify crtc helpers
Date: Mon,  1 Feb 2021 14:26:15 +0100
Message-Id: <20210201132617.1233-4-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CDV crtc helpers are identical to other chips so use gma_ prefix for the
crtc helper struct and remove the CDV copy.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_device.c        |  2 +-
 drivers/gpu/drm/gma500/cdv_device.h        |  1 -
 drivers/gpu/drm/gma500/cdv_intel_display.c | 12 ------------
 drivers/gpu/drm/gma500/oaktrail_device.c   |  2 +-
 drivers/gpu/drm/gma500/psb_device.c        |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h           |  2 +-
 drivers/gpu/drm/gma500/psb_intel_display.c |  2 +-
 7 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 19e055dbd4c2..1342e7fb382f 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -603,7 +603,7 @@ const struct psb_ops cdv_chip_ops = {
 	.errata = cdv_errata,
 
 	.crtc_helper = &cdv_intel_helper_funcs,
-	.crtc_funcs = &cdv_intel_crtc_funcs,
+	.crtc_funcs = &gma_intel_crtc_funcs,
 	.clock_funcs = &cdv_clock_funcs,
 
 	.output_init = cdv_output_init,
diff --git a/drivers/gpu/drm/gma500/cdv_device.h b/drivers/gpu/drm/gma500/cdv_device.h
index 37e4bdc84c03..504d717385cd 100644
--- a/drivers/gpu/drm/gma500/cdv_device.h
+++ b/drivers/gpu/drm/gma500/cdv_device.h
@@ -8,7 +8,6 @@ struct drm_device;
 struct psb_intel_mode_device;
 
 extern const struct drm_crtc_helper_funcs cdv_intel_helper_funcs;
-extern const struct drm_crtc_funcs cdv_intel_crtc_funcs;
 extern const struct gma_clock_funcs cdv_clock_funcs;
 extern void cdv_intel_crt_init(struct drm_device *dev,
 			struct psb_intel_mode_device *mode_dev);
diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index aac776fab36d..c3a9f6b3c848 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -961,18 +961,6 @@ const struct drm_crtc_helper_funcs cdv_intel_helper_funcs = {
 	.disable = gma_crtc_disable,
 };
 
-const struct drm_crtc_funcs cdv_intel_crtc_funcs = {
-	.cursor_set = gma_crtc_cursor_set,
-	.cursor_move = gma_crtc_cursor_move,
-	.gamma_set = gma_crtc_gamma_set,
-	.set_config = gma_crtc_set_config,
-	.destroy = gma_crtc_destroy,
-	.page_flip = gma_crtc_page_flip,
-	.enable_vblank = psb_enable_vblank,
-	.disable_vblank = psb_disable_vblank,
-	.get_vblank_counter = psb_get_vblank_counter,
-};
-
 const struct gma_clock_funcs cdv_clock_funcs = {
 	.clock = cdv_intel_clock,
 	.limit = cdv_intel_limit,
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 08cd5f73c868..9650588c7223 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -548,7 +548,7 @@ const struct psb_ops oaktrail_chip_ops = {
 	.chip_setup = oaktrail_chip_setup,
 	.chip_teardown = oaktrail_teardown,
 	.crtc_helper = &oaktrail_helper_funcs,
-	.crtc_funcs = &psb_intel_crtc_funcs,
+	.crtc_funcs = &gma_intel_crtc_funcs,
 
 	.output_init = oaktrail_output_init,
 
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 2d21f8ec595f..951725a0f7a3 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -329,7 +329,7 @@ const struct psb_ops psb_chip_ops = {
 	.chip_teardown = psb_chip_teardown,
 
 	.crtc_helper = &psb_intel_helper_funcs,
-	.crtc_funcs = &psb_intel_crtc_funcs,
+	.crtc_funcs = &gma_intel_crtc_funcs,
 	.clock_funcs = &psb_clock_funcs,
 
 	.output_init = psb_output_init,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index d4f14a5d509b..697f64e0f2f4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -672,7 +672,7 @@ extern void oaktrail_lvds_init(struct drm_device *dev,
 
 /* psb_intel_display.c */
 extern const struct drm_crtc_helper_funcs psb_intel_helper_funcs;
-extern const struct drm_crtc_funcs psb_intel_crtc_funcs;
+extern const struct drm_crtc_funcs gma_intel_crtc_funcs;
 
 /* psb_intel_lvds.c */
 extern const struct drm_connector_helper_funcs
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 9c3cb1b80bbd..359606429316 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -426,7 +426,7 @@ const struct drm_crtc_helper_funcs psb_intel_helper_funcs = {
 	.disable = gma_crtc_disable,
 };
 
-const struct drm_crtc_funcs psb_intel_crtc_funcs = {
+const struct drm_crtc_funcs gma_intel_crtc_funcs = {
 	.cursor_set = gma_crtc_cursor_set,
 	.cursor_move = gma_crtc_cursor_move,
 	.gamma_set = gma_crtc_gamma_set,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
