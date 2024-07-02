Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7591EC40
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 03:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2910E085;
	Tue,  2 Jul 2024 01:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y7balNkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D85110E085
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719882287;
 bh=5z7atQ1VjiYvr2o9gWZIqlkvHfprQlCHTqWMYytQ00Y=;
 h=From:Date:Subject:To:Cc:From;
 b=Y7balNkRr12dGs53p8cujgzf8a47EFsbUeTXjjdWPBY7trHiJ2tdYeKKS44bBXmNt
 CrEAd825ApjlVEufjeg8bJeTe5K9Ax8Zn4H8LAjPOPQbr3lXjZf4peHGJzdt/tIGPU
 uQqXNdB80pLMHFk7rCs67NVjm97/kYifhZYwfAShvguDiCZron2f88CCzapobKTT58
 ZRFj1s0POiyHvpUKGB9sxN62gUdUDHdrpmOHvovRuKqB2qFdwZcz9+HASuGSN37uAF
 XWgIS9AQ27aCbldlDNk7oWAzCKOZ34Wc1oiCbguVTGIqVJlVswFHauvHsYcEFqaJLD
 Xn3U1Y7AYGSVw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B399937820DE;
 Tue,  2 Jul 2024 01:04:46 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jul 2024 04:04:24 +0300
Subject: [PATCH] drm/rockchip: Unregister platform drivers in reverse order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-rk-drm-fix-unreg-v1-1-5bd325ed42b4@collabora.com>
X-B4-Tracking: v=1; b=H4sIABdSg2YC/x2MQQqAMAzAviI9W6hTlPkV8SCu0yJO6VAE2d8dH
 kNIXoiswhH64gXlW6IcIUNVFjCvU1gYxWUGQ6ahjgzqhk539PLgFZQXtL72xlrbTkSQs1M5y38
 5jCl9N7zm72IAAAA=
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sean Paul <seanpaul@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Yao <markyao0591@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
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

Move rockchip_drm_platform_driver unregistration after its sub-drivers,
which ensures all drivers are unregistered in the reverse order used
when they were registered.

Fixes: 8820b68bd378 ("drm/rockchip: Refactor the component match logic.")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 44d769d9234d..ca7b07503fbe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -528,10 +528,9 @@ static int __init rockchip_drm_init(void)
 
 static void __exit rockchip_drm_fini(void)
 {
-	platform_driver_unregister(&rockchip_drm_platform_driver);
-
 	platform_unregister_drivers(rockchip_sub_drivers,
 				    num_rockchip_sub_drivers);
+	platform_driver_unregister(&rockchip_drm_platform_driver);
 }
 
 module_init(rockchip_drm_init);

---
base-commit: 1eb586a9782cde8e5091b9de74603e0a8386b09e
change-id: 20240702-rk-drm-fix-unreg-9f3f29996a00

