Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A462B6C5E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288889C99;
	Tue, 17 Nov 2020 17:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2921189C99
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:54:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h23so25269989ljg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYshMtSkbtkvYAVk3VOA8AMxSRgti+Fm93GTg0y55f8=;
 b=v4RgBe1veeJUySmh5ZybKOl11N3U6m7sRQIVjdRArBnhNFJlVMsgu1EJnQa8yKpVJg
 IcTg+ZZcapvyZmu9ij57AFExXebMSUSr5t7G/Ctq22oZMXElERJwnfKlmcACzXT+ygmp
 KlIT+zDKgq3ak2O5OCeBkmM0roZvF78dcO0UgCeyipnuWfodfYjQZx798wytdC8aWbHR
 15YXQWOVyhgmrpQX9zNGWDbgfkz45lZlyMUUemxFfDRNk49B8Z+Up9hvMOz3thu+DCXe
 ScQf43SpJ441ZKJ9S8i5431oLEqvvmGHe633dp6lYw0xOuQldQMLPMxzWTO8P1Ej9X8t
 LQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYshMtSkbtkvYAVk3VOA8AMxSRgti+Fm93GTg0y55f8=;
 b=VrHJ9Yxe/bioSxIpWmrQ1o5NQVlDWqJz6Kff3qshh1zyP3XizWOtSDAv3kVcEXoKdh
 ZVtVXEn+wYK4itmgt/YrVTD10l+NsUUzcnBqbkbW8B+UaScOD+8Bj0LvsbAp/0WMWcFu
 opsn3SEVNq7qslBbIYn7M8SeWl/OIXeXliAaUREfl37cf/ECC+ARMab/RVZZRu5JdCmU
 8XQg2kz3+9hGe4Fj8UwnvKRZdR1vH+lYiXLCPnmqSgiMKMlnmzzxK3VLxDofabk8KYql
 dUQ4skIetaJxpknk2I5U28qvSTLgxd0bfRuckBvdLsYkCwD8p1mzKkaEW5kPG41ls24N
 6kCQ==
X-Gm-Message-State: AOAM532FBCh4GybIWdCYvR2Swj3TycGQW5aIolEJMwr4P8CLkHqZxgEn
 g8Y60spbTs2E6bwJlHsHqH1q9Kb2hTN+xD/X
X-Google-Smtp-Source: ABdhPJwYCW4AJAthMTLUnKzYugRaJneBQliHIDA9MTR0dbeDC5p+ci1X6tIWhNL3odHgqrDg5BeDJg==
X-Received: by 2002:a2e:9b8b:: with SMTP id z11mr2254921lji.259.1605635659175; 
 Tue, 17 Nov 2020 09:54:19 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id c9sm3237808lfd.98.2020.11.17.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:54:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix RGB/BGR bug
Date: Tue, 17 Nov 2020 18:54:13 +0100
Message-Id: <20201117175413.869871-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: phone-devel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was confused when the graphics came out with blue
penguins on the DPI panel.

It turns out that the so-called "packed RGB666" mode
on the DSI formatter is incorrect: this mode is the
actual RGB888 mode, and the mode called RGB888 is
BGR888.

The claims that the MCDE had inverse RGB/BGR buffer
formats was wrong, so correct this and the buggy
register and everything is much more consistent, and
graphics look good on all targets, both DPI and
DSI.

Cc: phone-devel@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c      | 23 +++++++++++------------
 drivers/gpu/drm/mcde/mcde_display_regs.h |  4 ++--
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 14c76d3a8e5a..192e11c88d72 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -250,73 +250,70 @@ static int mcde_configure_extsrc(struct mcde *mcde, enum mcde_extsrc src,
 	val = 0 << MCDE_EXTSRCXCONF_BUF_ID_SHIFT;
 	val |= 1 << MCDE_EXTSRCXCONF_BUF_NB_SHIFT;
 	val |= 0 << MCDE_EXTSRCXCONF_PRI_OVLID_SHIFT;
-	/*
-	 * MCDE has inverse semantics from DRM on RBG/BGR which is why
-	 * all the modes are inversed here.
-	 */
+
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ABGR8888:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB8888:
 		val |= MCDE_EXTSRCXCONF_BPP_XRGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR8888:
 		val |= MCDE_EXTSRCXCONF_BPP_XRGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_RGB888:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_BGR888:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ARGB4444:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB4444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ABGR4444:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB4444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB4444:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR4444:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB1555:
 		val |= MCDE_EXTSRCXCONF_BPP_IRGB1555 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR1555:
 		val |= MCDE_EXTSRCXCONF_BPP_IRGB1555 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_RGB565:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB565 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_BGR565:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB565 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_YUV422:
 		val |= MCDE_EXTSRCXCONF_BPP_YCBCR422 <<
@@ -810,7 +807,9 @@ static void mcde_configure_dsi_formatter(struct mcde *mcde,
 			MCDE_DSICONF0_PACKING_SHIFT;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		val |= MCDE_DSICONF0_PACKING_RGB666_PACKED <<
+		dev_err(mcde->dev,
+			"we cannot handle the packed RGB666 format\n");
+		val |= MCDE_DSICONF0_PACKING_RGB666 <<
 			MCDE_DSICONF0_PACKING_SHIFT;
 		break;
 	case MIPI_DSI_FMT_RGB565:
diff --git a/drivers/gpu/drm/mcde/mcde_display_regs.h b/drivers/gpu/drm/mcde/mcde_display_regs.h
index ae76da8a2138..2ad78c59d627 100644
--- a/drivers/gpu/drm/mcde/mcde_display_regs.h
+++ b/drivers/gpu/drm/mcde/mcde_display_regs.h
@@ -552,8 +552,8 @@
 #define MCDE_DSICONF0_PACKING_MASK 0x00700000
 #define MCDE_DSICONF0_PACKING_RGB565 0
 #define MCDE_DSICONF0_PACKING_RGB666 1
-#define MCDE_DSICONF0_PACKING_RGB666_PACKED 2
-#define MCDE_DSICONF0_PACKING_RGB888 3
+#define MCDE_DSICONF0_PACKING_RGB888 2
+#define MCDE_DSICONF0_PACKING_BGR888 3
 #define MCDE_DSICONF0_PACKING_HDTV 4
 
 #define MCDE_DSIVID0FRAME 0x00000E04
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
