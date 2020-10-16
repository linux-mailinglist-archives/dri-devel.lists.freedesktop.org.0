Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2ED28FEF8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30D76EA7C;
	Fri, 16 Oct 2020 07:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9846E6EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 07:13:03 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l18so893697pgg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=cCtw9OFU3rtww1isHIEEcnmW7Zwg3NtpL46BN8HaGKc=;
 b=Adc8hCSgfLi+wo8dAry+ZnREP8hg6NKFlr+XNEwqPKajYvpxKQhVsOd5tP2kpfAQml
 +J3Bd806sQHX6JTcFRy9yLio7Ya6pAZbEmK6uKv/S4wc9uNDKs8eVJcVB5he/tTtraiQ
 rhsCxG0ulP5RpsrM+Cup+250sJp5/IokycFqtXeAkHsygkZKudrIIFDqyGL0tPE03ORJ
 lTNbIVo1kdnPVvdjlf27mwvet59zMLXO+yGsONs2kLFBak0rHRp7zDaTSJkwIKEbBWBa
 AXSrGEHT5lgODcGoDf4bherpayhmXVPlzT9wePWtPNx3QiYXJBRnMuyJfvaAnJ1kiIJv
 WdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cCtw9OFU3rtww1isHIEEcnmW7Zwg3NtpL46BN8HaGKc=;
 b=d1xEmuGQgqYNSRJhTORIm/1hFOoi4ZBiJUWuhpaEC4WRFYkLYVTt1TMw89xSLSbvGv
 WCDPByaZH1gdJ8BAkhA4Y3Ql6AD2+3M94oGr1s65uvdKcLKIQZQhLFeUL3HJTrzHpLF4
 tcoyBPXplyzbd6qziUuqTq1fmzLPakRMOf80w2GMOT2iiscqgCOyIZ+hjyYxpshMaSMn
 oQM38pKPk5KM8yfMwqC48mUYj4eXuFLFPS3Mbp0LjgJ7aFhpoPOaF8K0bFBYrc0ZHGNY
 YmZnDySwYkg80qb3IJVUWWkad3hG1Dqd93PORvyqdmV21sCCHa8OB+FCEKv6AyilBEH2
 Zn8g==
X-Gm-Message-State: AOAM533AEacSlRgz1GN7g9XFF3S6ZCFx1DIVx/BKeV7+Zkn2YZjePNBr
 IbMVGptzngsV3ozeG888IKackh4aQD39g1KP
X-Google-Smtp-Source: ABdhPJxapsdkf6Bqbk4m3qu2DLLW+LOHCSF3toDzudWRrZr9o+8tN8TAButTAjC9xkFWvDDdKMInzA==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr1972958pgg.102.1602832382907; 
 Fri, 16 Oct 2020 00:13:02 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id 14sm1479977pfy.192.2020.10.16.00.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 00:13:02 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined mode
 timing
Date: Fri, 16 Oct 2020 15:12:54 +0800
Message-Id: <20201016071254.2681-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
before a mode has been set on CRTC.  This happens sometimes during the
initial mode setting of a CRTC.  It also happens on Android running HWC2
backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
before the atomic mode setting on CRTC happens.

In this case, there is nothing really bad to happen as kernel function
returns as no-op.  So using WARN() version might be overkilled,
considering some user space crash reporting services may treat kernel
WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
to drm_warn_once() for warning undefined mode timing.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index b18e1efbbae1..5f7c4a923e8a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -717,9 +717,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	 * Happens during initial modesetting of a crtc.
 	 */
 	if (mode->crtc_clock == 0) {
-		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
-			     pipe);
-		drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
+		drm_warn_once(dev, "crtc %u: Noop due to uninitialized mode.\n",
+			      pipe);
+
 		return false;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
