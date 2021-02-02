Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699630D4EB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811686EA05;
	Wed,  3 Feb 2021 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17640.qiye.163.com (mail-m17640.qiye.163.com
 [59.111.176.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D740A6E105
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 12:10:50 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id B83F75402D9;
 Tue,  2 Feb 2021 20:10:45 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <john.stultz@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Bernard Zhao <bernard@vivo.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/hisilicon: remove redundant when devm_kzalloc failed
Date: Tue,  2 Feb 2021 04:10:37 -0800
Message-Id: <20210202121039.14945-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZS0wYGk9CTRpPSkxOVkpNSklJTUxDT01LQkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhQ6Sxw*TD8INTYsFD9KEQMp
 PklPCwxVSlVKTUpJSU1MQ09NT0xPVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSU5NTDcG
X-HM-Tid: 0a7762a6f996d995kuwsb83f75402d9
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Line 852 DRM_ERROR is redundant because memory alloc already
prints an error when failed.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 00e87c290796..8491d8267f07 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -852,10 +852,9 @@ static int dsi_probe(struct platform_device *pdev)
 	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		DRM_ERROR("failed to allocate dsi data.\n");
+	if (!data)
 		return -ENOMEM;
-	}
+
 	dsi = &data->dsi;
 	ctx = &data->ctx;
 	dsi->ctx = ctx;
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
