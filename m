Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B739AD55
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CADF6F510;
	Thu,  3 Jun 2021 21:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1586F512
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:58:22 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q15so6176435pgg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E33VpkCicrhCD0xawQsjRc1s2X6KLPP55EFBcN78Cmc=;
 b=nd4t1yTL9raf7I8N8sAjsgYkU70Ab2nau6dmvWEfLhnanrinOsInyFOhBhumFZlseO
 lyMIV/jfFI4ED1tOQb60ZpS+dJXppW/3nJIge3AwipnFz3YqMJ/bgNbNuT5vKBITn+eB
 w6kwf/KK5HHx1/q8pXLk50QeWTpNu3HloDAGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E33VpkCicrhCD0xawQsjRc1s2X6KLPP55EFBcN78Cmc=;
 b=pXAFGeN1D9lybSPCIYeG3tAJAwCzTlHB4XbsTozu6nXflnro0Qh3vWTFpX6jLd3dLx
 kTbOcreQazbHOOglh6N6a0pJ4ZRw/p3P6ieWzl9Q3IR+wr+hB4TvrmzSqEzj6if8gSDH
 b1hcVsSHjp2QLdKbM4P/hTFA5jtRB20L35nbqkAaF6PFRVeOIqp/M9jHWjEQMAd59AIA
 Tv/bGfTSfGKdIh6U2r5yE/M1N8nTe5A9QnwDMEmipe3F15fkkRRGqxCNI2ql7GUecMca
 804ZFxr3ofvfsCGpDGKi0Oob6zgRTH9QY8rkdCu1kdgXq1amM3nCunJVvd/6vZh9LxL5
 C9/Q==
X-Gm-Message-State: AOAM53283o+xG/6yuXVknJ8ztm9F94sEvuSVurvJkWglxfgTjI9icC8t
 j4amD398MSbiDsA/Q1W7ObpTTQ==
X-Google-Smtp-Source: ABdhPJygDyZYIs+VBgxVm5pLVAz896xD2LcmZZzYpzb/eyQ0hxw0nPGLcmTwWUQp9bMimcTR7TQQhw==
X-Received: by 2002:a65:584d:: with SMTP id s13mr1547265pgr.77.1622757502408; 
 Thu, 03 Jun 2021 14:58:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v9sm56165pfn.22.2021.06.03.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:58:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
Date: Thu,  3 Jun 2021 14:58:19 -0700
Message-Id: <20210603215819.3904733-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=6b805c2a72c424d5883995daad5dea751e3e4227;
 i=DwQ2M6JPPIp1aqGMVRBW/n1FD/gTXx2QUVMc6SXkj4M=;
 m=uJeVtt0ygoQEka7D4SNZAzuRePykX/n9wjq3wzQ7W9A=;
 p=h0Hb7farsgywRDtpFu8qUGXsdKoc6UYbZMLMBkRugeI=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC5UHoACgkQiXL039xtwCZOJw//S1J
 PbQg8xZKTtx+9Xkya3J7A1st3vMPy2XF9A56Uj3IXo7NSqHQJbBAJ1EbTuG4UbSOVCFOOuLqkVcmd
 YGgtoNZzhhy+YDuGuDZdlbuiP1f58Jea54BRb3IaN5v8LFRSNzN9wj5py1/YCqt9m0L+y+D6bzFjV
 LPvDImivp1i0z07MmRaCd1pHegHX0AhN9G1n5ApHyXROtb9yMVZA9bhTUUr0M2sRtihNblo5LkW7o
 5ydp50FvtWjGdljCc/jwvRmzucQuZycEGxfh9/PnKTmb2AOzcw9gL2fexCYD9wjBk1WhsBTxt2vfM
 ZtfaMcCr6VZZ+8p9TCYrxrBx6qC/d586r9L8fckkoOVmXtuJonJYSfo4enbqe6YTh/fNC6jg/0Eal
 SpE/WHIZ/MEjK2ORJG8C8mKfQkffLZOnhYEEiniul7fq9+cN51yof3G1Uh3OuvfO9SduU/pqLobGB
 o2ajlYLZ6C8Y10t7k1Rt9F8/g5asRfXa6SKVn43u5J2TzjcxNt2dhC0lODJBnXF+qAHM5Uz3UJiGO
 K3BNzgcy1Xj4N+58hnpMMOG+2sBS7OBcvAGm7LUkI6QKv7tHmml7BV1SM3TAfeAGOghlU0YTeGQb6
 d2CorJwF886Lf6m/fLNlvd85Xpg6pY7BHWKnXPkCfAA8a8vxIxIPth4jDZlweZpw=
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
pl111 is modular. Update the Kconfig to reflect the need.

Cc: Emma Anholt <emma@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/pl111/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index c5210a5bef1b..b84879ca430d 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -2,7 +2,8 @@
 config DRM_PL111
 	tristate "DRM Support for PL111 CLCD Controller"
 	depends on DRM
-	depends on VEXPRESS_CONFIG
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
2.25.1

