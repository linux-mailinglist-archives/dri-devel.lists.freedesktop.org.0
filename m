Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F25B7FAD9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF9510E839;
	Wed, 17 Sep 2025 14:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="aurBuFcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CCCC10E839
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:03:11 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 90A592018E7D;
 Wed, 17 Sep 2025 07:03:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 90A592018E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758117790;
 bh=R0iXWeZ0yvccNH0jWPajLtukW7dSkCEEiXwfJnLS9oY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aurBuFcBsGMr5E6fG2nGZOE2PDW0RcbGIO2P3NWxMpIt+zbX4eJjDYrS6KJTs/6+C
 7qQExQF2rRIHmUFAoNKdNrCeRefhkh/iKBs3NZ150UThI5IZMRtykly/cwYeNJMd+G
 8BDRNrU/sy85br8YEYArd+d+jglp8JB53iieG7IQ=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ssengar@linux.microsoft.com, mhklinux@outlook.com,
 ptsm@linux.microsoft.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com, arnd@arndb.de,
 tzimmermann@suse.de, decui@microsoft.com, wei.liu@kernel.org,
 deller@gmx.de, kys@microsoft.com, haiyangz@microsoft.com
Subject: [PATCH 1/2] fbdev/hyperv_fb: deprecate this in favor of Hyper-V DRM
 driver
Date: Wed, 17 Sep 2025 07:03:05 -0700
Message-Id: <1758117785-20653-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <E5C2A201B1BD>
References: <E5C2A201B1BD>
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
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

The Hyper-V DRM driver is available since kernel version 5.14 and it
provides full KMS support and fbdev emulation via the DRM fbdev helpers.
Deprecate this driver in favor of Hyper-V DRM driver.

Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/video/fbdev/Kconfig     | 5 ++++-
 drivers/video/fbdev/hyperv_fb.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c21484d15f0c..48c1c7417f6d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1773,13 +1773,16 @@ config FB_BROADSHEET
 	  a bridge adapter.
 
 config FB_HYPERV
-	tristate "Microsoft Hyper-V Synthetic Video support"
+	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
 	depends on FB && HYPERV
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
 	select FB_IOMEM_HELPERS_DEFERRED
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
+	  This driver is deprecated, please use the Hyper-V DRM driver at
+	  drivers/gpu/drm/hyperv (CONFIG_DRM_HYPERV) instead.
+
 config FB_SIMPLE
 	tristate "Simple framebuffer support"
 	depends on FB
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 75338ffc703f..c99e2ea4b3de 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1357,6 +1357,8 @@ static int __init hvfb_drv_init(void)
 {
 	int ret;
 
+	pr_warn("Deprecated: use Hyper-V DRM driver instead\n");
+
 	if (fb_modesetting_disabled("hyper_fb"))
 		return -ENODEV;
 
-- 
2.49.0

