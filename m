Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D545844A551
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 04:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F084089DFC;
	Tue,  9 Nov 2021 03:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394DF89DFC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 03:23:54 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id u25so13368585qve.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 19:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2V3HogjR6tzeLasoYLzy6we6u4i3vWdwDzTcRieWiEM=;
 b=LKmalwKErazJJMZDAs8oZwXA/te5qGZYGXTxMEHcmVJf+XS9M8wT0fh3k0hmf/XDZ0
 yi6id+IP38VRYUwbGNeq4MlUgDwU6N9MtCw1q1yYh3c6N0FV1jJbo4WOxtjzaZtrryUS
 NFWk0a96iyu6mjMc260jlsndn+BUXvcJjLP5KXc1Nl0vksgTp8IIAEQ4GuzXrRJ8+Hi5
 SM021kwP48z1A77N3qqpuKy2P0XXTXHnFSTvBr8VmJ/Jt7CClHTX47WUh1yw15J51bu+
 9NHvn3fWf/R0o/blQpqIr2amky3axROrIpPPoeDiU+gOAQXGZhygjP9eTO9tFM20Lcjx
 ZPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2V3HogjR6tzeLasoYLzy6we6u4i3vWdwDzTcRieWiEM=;
 b=xKSIBQtZCxOc2i+WuVruW7QEmZg33XXgFslpLKBtNAF4q7MFXA4L13Rqovh1lujgRt
 yg29bB9PUDVMgD4pmRKq/QCZbyzRs7BkSW9IBRwyxUjGxh6x581KIV37RnTXLWlt+2x5
 pX2Z6/5aQ7J1IFjHgHWg0R5VdDwO3XZtHSqxdGlJ6X2NnaM+2v32USyn3FjIJOHScQWn
 bunqc2Maf9PyozU0so61d8NCzAocTvzfHV6EGDJ46XRj9HDxB/slg6gU2/W9ZEF3Y1/3
 kteT8E5nk17RyeKcbkhW4tBxFDvzRg4rrgR0QrkfZ5wuYRTjpss2DHtOoxhfkBJ8CoQY
 /DPg==
X-Gm-Message-State: AOAM533X7zNXSdvySI++ioWwJb0fiKFGWc2m/ZKAxwQ9axeDwFuwEBRS
 HBEkmELefijqLNRKciNhUhU=
X-Google-Smtp-Source: ABdhPJx/A45jDBxyjJp26aQ17KId/KksS/DEix+3w66MMwl/WrSdu8dJIgKKzsVCzb8Z0GoWSqPLkg==
X-Received: by 2002:a05:6214:411d:: with SMTP id
 kc29mr4253736qvb.22.1636428233263; 
 Mon, 08 Nov 2021 19:23:53 -0800 (PST)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id f7sm11032327qkp.107.2021.11.08.19.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 19:23:52 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, jernej.skrabec@gmail.com, wens@csie.org,
 mripard@kernel.org
Subject: [PATCH] [PATCH v2] drm/sun4i: fix unmet dependency on
 RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Mon,  8 Nov 2021 22:23:51 -0500
Message-Id: <20211109032351.43322-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, fazilyildiran@gmail.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
is not selected, Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
  Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=n]
  Selected by [y]:
  - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]

This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
without selecting or depending on RESET_CONTROLLER, despite
PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

v2:
Fixed indentation to match the rest of the file.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e77..8c796de53222 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -46,6 +46,7 @@ config DRM_SUN6I_DSI
 	default MACH_SUN8I
 	select CRC_CCITT
 	select DRM_MIPI_DSI
+	select RESET_CONTROLLER
 	select PHY_SUN6I_MIPI_DPHY
 	help
 	  Choose this option if you want have an Allwinner SoC with
-- 
2.30.2

