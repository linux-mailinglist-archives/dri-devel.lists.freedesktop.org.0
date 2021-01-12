Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D482F296A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BA86E0CC;
	Tue, 12 Jan 2021 07:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8989DB4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 02:10:27 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DFDXv23fQzj4qK;
 Tue, 12 Jan 2021 10:09:35 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 12 Jan 2021 10:10:18 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <abrodkin@synopsys.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: arc: Use simple encoder
Date: Tue, 12 Jan 2021 10:10:11 +0800
Message-ID: <1610417411-29661-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The arc driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/arc/arcpgu_hdmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index 5283993..71ef75f 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -9,13 +9,10 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_device.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "arcpgu.h"
 
-static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 {
 	struct drm_encoder *encoder;
@@ -34,8 +31,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
-	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	if (ret)
 		return ret;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
