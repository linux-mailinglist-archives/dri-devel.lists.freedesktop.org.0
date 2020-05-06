Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D041C8326
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74E86E943;
	Thu,  7 May 2020 07:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0A46E879
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 12:49:40 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 6E7471A31C1;
 Wed,  6 May 2020 20:49:03 +0800 (CST)
Message-ID: <AMkACAAICCLCcgaekrYcyKoA.1.1588769343436.Hmail.bernard@vivo.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vZXh5bm9zOiByZW1vdmUgbm8gbmVlZCBkZXZtX2tmcmVlIGluIHByb2JlIFtyZS1zZW5kLCB3ZWxjb21lIGFueSBjb21tZW50c10=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Wed, 6 May 2020 20:49:03 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Wed, 6 May 2020 20:49:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VPQ0NCQkJDT0hOQkxPSllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo2EDo4OjoyODg3OBgcGh4QCSIY
 AjAUOlVKVUpOQ0NMTUJIT0hOSkpVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpOTFVL
 VUhKVUpJSVlXWQgBWUFITUlDNwY+
X-HM-Tid: 0a71ea0847e793b4kuws6e7471a31c1
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove no need devm_kfree in probe.
The change is to make the code a bit more readable

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 43fa0f26c052..e06f7d7a6695 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -181,10 +181,8 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 			return -ENOMEM;
 
 		ret = of_get_videomode(dn, vm, 0);
-		if (ret < 0) {
-			devm_kfree(dev, vm);
+		if (ret < 0)
 			return ret;
-		}
 
 		ctx->vm = vm;
 
@@ -233,10 +231,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 	ctx->dev = dev;
 
 	ret = exynos_dpi_parse_dt(ctx);
-	if (ret < 0) {
-		devm_kfree(dev, ctx);
-		return NULL;
-	}
+	if (ret < 0)
+		return ERR_PTR(ret);
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
-- 
2.26.2


[re-send, welcome any comments]
Regards,
Bernard




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
