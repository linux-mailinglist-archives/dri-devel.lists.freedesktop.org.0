Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846989BE030
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DC310E673;
	Wed,  6 Nov 2024 08:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1201 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2024 03:15:44 UTC
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EC610E037
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 03:15:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XjqXm0lcPz2Fbr5;
 Wed,  6 Nov 2024 10:54:00 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id B91CE1A0188;
 Wed,  6 Nov 2024 10:55:40 +0800 (CST)
Received: from huawei.com (10.67.175.69) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 6 Nov
 2024 10:55:40 +0800
From: Zhang Kunbo <zhangkunbo@huawei.com>
To: <neil.armstrong@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chris.zjh@huawei.com>, <liaochang1@huawei.com>
Subject: [PATCH] drm/meson: Avoid use-after-free issues with crtc
Date: Wed, 6 Nov 2024 02:45:48 +0000
Message-ID: <20241106024548.1915611-1-zhangkunbo@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.69]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

It's dangerous to call drm_crtc_init_with_planes() whose second
argument is allocated with devm_kzalloc() [1][2].

Use drmm_kzalloc instead to avoid UAF.

[1] https://lore.kernel.org/all/a830685d8b10a00cfe0a86db1ee9fb13@ispras.ru
[2] https://lore.kernel.org/all/2111196.TG1k3f53YQ@avalon

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Zhang Kunbo <zhangkunbo@huawei.com>
---
 drivers/gpu/drm/meson/meson_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2..603022554a48 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "meson_crtc.h"
 #include "meson_plane.h"
@@ -72,7 +73,6 @@ static void meson_crtc_disable_vblank(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs meson_crtc_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.destroy		= drm_crtc_cleanup,
 	.page_flip		= drm_atomic_helper_page_flip,
 	.reset			= drm_atomic_helper_crtc_reset,
 	.set_config             = drm_atomic_helper_set_config,
@@ -677,14 +677,14 @@ int meson_crtc_create(struct meson_drm *priv)
 	struct drm_crtc *crtc;
 	int ret;
 
-	meson_crtc = devm_kzalloc(priv->drm->dev, sizeof(*meson_crtc),
+	meson_crtc = drmm_kzalloc(priv->drm, sizeof(*meson_crtc),
 				  GFP_KERNEL);
 	if (!meson_crtc)
 		return -ENOMEM;
 
 	meson_crtc->priv = priv;
 	crtc = &meson_crtc->base;
-	ret = drm_crtc_init_with_planes(priv->drm, crtc,
+	ret = drmm_crtc_init_with_planes(priv->drm, crtc,
 					priv->primary_plane, NULL,
 					&meson_crtc_funcs, "meson_crtc");
 	if (ret) {
-- 
2.34.1

