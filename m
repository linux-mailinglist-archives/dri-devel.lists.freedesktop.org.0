Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DA43F27B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 00:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6E26E0A6;
	Thu, 28 Oct 2021 22:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E826E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 22:13:30 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t40so7282290qtc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxQeetJwEcrw7mZizeh9N8oA8I68HO4YJPCT6BOjW/s=;
 b=YFX4KkFo8sn9wUT9exIjYE3zy3X6XhfFyUpqK4woD/WNaVGG3KGkVpVflHcB2Qt1lE
 Xkhb3v3R7klYbEuJFZfZjc88uoGQTQlz55LXKAO/HgzTV1v+Iw3nk3r4l8kDktOetHWv
 zE+bQ06pDHenulNUaR3PQwa1vJ0rOPI/VD52aaxeqduMEy75r78mNhqQ8H2h5bci8jtS
 XwmcTcwMGOBl99eASIyea5vPhEfkpKyomJtpy9kr23OXOIjmoOzm/7kz1r2I8u/mpEdv
 Pn4gxdZZ5msiceUFeN0yQ5DE4zcoTWmFwaQLZYGeLXelxIx+UNHtzObZMzsrRiU9cZv5
 pTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BxQeetJwEcrw7mZizeh9N8oA8I68HO4YJPCT6BOjW/s=;
 b=IuY3FR9cphSHx+1wjrOf29nw+7byEwLdbsMIP6bT/KdciVjgVJreFRr6K9WuXqANHm
 cuMvXgVSNDVqi+HZpl6XnSxYiYyspB06r03q6HCZqagCUM7ZR/83Y8TILx1qQ2n6qeub
 GH2UzO2EnOqqh7llgiLKm64gTD1RYAK+wi+4MpLL/DIKyLS5BMKiDKhZtKoN9nJL+Mmk
 Dzmwskco7IhPrUO4jrOryVRs9E49lg7ihZvKK97VzeOGhildlQ+4M0qGHNL6UrrBZFiF
 D+TmvI7Epgpen5rGYTE088SIOOCOcfqC45rxQxQD0vRHPvlSRWaefH2tjaDjbHrU3B+e
 Uxhw==
X-Gm-Message-State: AOAM530kCMda/9GUsPUFcf3zdmbsrXimzgx4k0jFX36CzmBrqt8HQAAc
 6tLxLP9aJG51Tpgr0rqflHE=
X-Google-Smtp-Source: ABdhPJw7Ip+mVVOhi3P5MeUydNnz0+e4/X81XifGWVT5beNjEjvIb8weALxoCTaaNT8lMLrlpNCpGQ==
X-Received: by 2002:ac8:5d8c:: with SMTP id d12mr7510623qtx.184.1635459209652; 
 Thu, 28 Oct 2021 15:13:29 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id h2sm2791097qkf.106.2021.10.28.15.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 15:13:29 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, jernej.skrabec@gmail.com, wens@csie.org,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 fazilyildiran@gmail.com
Subject: [PATCH] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for
 PHY_SUN6I_MIPI_DPHY
Date: Thu, 28 Oct 2021 18:13:27 -0400
Message-Id: <20211028221327.17984-1-julianbraha@gmail.com>
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

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e77..3f70a14a3c94 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -46,6 +46,7 @@ config DRM_SUN6I_DSI
 	default MACH_SUN8I
 	select CRC_CCITT
 	select DRM_MIPI_DSI
+  select RESET_CONTROLLER
 	select PHY_SUN6I_MIPI_DPHY
 	help
 	  Choose this option if you want have an Allwinner SoC with
-- 
2.30.2

