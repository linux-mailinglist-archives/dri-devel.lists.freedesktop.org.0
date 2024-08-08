Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070794BCB9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8495A10E6EB;
	Thu,  8 Aug 2024 11:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="DjMy8tRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F028710E6EB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:58:47 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723118318; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mURPLIA4vd7lWdffQkpZXcs3WAN+g6N1oy/1Aw9AaQc3FkZSUGq4Azha/56zJ7gy3Be8SSeeKUMcBGXzQf4/H4Q7ObkO8JDaojKQkXyicJB/SzNX007HaxPR7BCXXURaez8KTQvCe2x++C/aYzTfrq/l2d8V+st2EKX/Bpdhlmc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723118318;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WMDBItI2xogayssnAPBndPmg8HyuNPCtZlERCJnLHAQ=; 
 b=kvbzknc31A9FHaiMDjqyPSVVgRxW5VLnQlX61scOWrw+TjhXJzyV6AgHI8dD79tFRCz64iM9F8C+Iwz8CnPNF9LjfVkh7ujzfdrxI3d+LsPWOljGt4lnRO/FV79QSP9Ej67V0Niuo9l3ZkuXEcweo5E12toCsrmFp2LZ+QnEyN8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723118318; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=WMDBItI2xogayssnAPBndPmg8HyuNPCtZlERCJnLHAQ=;
 b=DjMy8tRg+xKo2lpOY9ZK0xWCQP3Ov/9q4yCqsKDjyHTv/hhKT4nr7nusEHsAusaT
 D8iWzJXQT0IrKG6m1drCEnd+3qS2mAXW62JrgtIBvs1DzfJTnBaUiW9bYXWOYDtk5fh
 Im54m0QoMMf8H4ri3hxTXhV4yoh1CCivTfICcV4o=
Received: by mx.zohomail.com with SMTPS id 172311831804658.98418777154552;
 Thu, 8 Aug 2024 04:58:38 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 08 Aug 2024 14:58:02 +0300
Subject: [PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
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
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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
-- 
Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

