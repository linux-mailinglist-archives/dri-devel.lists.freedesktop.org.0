Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB775373B6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 05:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390810EAFD;
	Mon, 30 May 2022 03:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (unknown [14.29.68.187])
 by gabe.freedesktop.org (Postfix) with ESMTP id 202D410EAFD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 03:35:00 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 May
 2022 11:10:51 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 May
 2022 11:10:47 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 "Lyude Paul" <lyude@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/therm: Fix pointer dereferenced before checking
Date: Mon, 30 May 2022 11:10:46 +0800
Message-ID: <1653880246-23670-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
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
Cc: nouveau@lists.freedesktop.org, Haowen Bai <baihaowen@meizu.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fan->base is dereferencing before null checking, so move
it after checking.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
index 340f37a299dc..b13ba9b2f6be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
@@ -98,10 +98,10 @@ nvkm_fanpwm_create(struct nvkm_therm *therm, struct dcb_gpio_func *func)
 		return -ENODEV;
 
 	fan = kzalloc(sizeof(*fan), GFP_KERNEL);
-	therm->fan = &fan->base;
 	if (!fan)
 		return -ENOMEM;
 
+	therm->fan = &fan->base;
 	fan->base.type = "PWM";
 	fan->base.get = nvkm_fanpwm_get;
 	fan->base.set = nvkm_fanpwm_set;
-- 
2.7.4

