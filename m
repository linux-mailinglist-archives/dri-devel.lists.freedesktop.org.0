Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB541BD4E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142AF6ECAB;
	Wed, 29 Apr 2020 06:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3EE6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:18:02 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 8F1184829C3;
 Tue, 28 Apr 2020 21:17:55 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: pm resume add return errno branch
Date: Tue, 28 Apr 2020 06:17:47 -0700
Message-Id: <20200428131747.2099-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVMSU5CQkJDSElKTkhISVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6Kio*DDgrLE4BVk83MQgt
 KzYwCzpVSlVKTkNDS0xCQ0xOQ0lOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSUpKSjcG
X-HM-Tid: 0a71c0efd6a593bakuws8f1184829c3
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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

pm_resump api did not handle drm_mode_config_helper_resume error.
This change add handle to return drm_mode_config_helper_resume`s
error number. This code logic is aligned with api pm_suspend.
After this change, the code maybe a bit readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..8c2e1b47e81a 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -412,9 +412,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->init(priv);
 
-	drm_mode_config_helper_resume(priv->drm);
-
-	return 0;
+	return drm_mode_config_helper_resume(priv->drm);
 }
 
 static int compare_of(struct device *dev, void *data)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
