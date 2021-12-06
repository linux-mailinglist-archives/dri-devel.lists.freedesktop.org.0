Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558B46A2D9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3450773AE5;
	Mon,  6 Dec 2021 17:26:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ABD73AA3
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:41 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 7AA6629F7CC;
 Mon,  6 Dec 2021 17:26:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811600; bh=ARlP5qu4PyRximlNoMBL44jRuSlLI/ZGMETNeobO3jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HlUFJ0vKRFWuEb4PbKXrkSX5o4HWn+ZfN7AFW7J7DYcB0HOL0ieCW/BrU+AC5kc5o
 +u8i0WxQ5rHINszyqoy8pnI0IsHuPIabyweRMMvGZkNmQ3/xOeqTOwXVtaPTMmyeNG
 bwh1eyRJy3r82UIHzsu6G07uY4iU09CcTpIyGjTBkkMrcYSqFwxSUGA1NtnHX6AEjQ
 lTfKBepA1uM3vw1Kl8F97k7ixCWuSkGnF+c9c5NFSwyN9Zh4nK0nZXmNBbOYpZXxbh
 8YCiKH9iHAKHH03OxQaUllqbQesU874lrbi9wmjb5NSA2eOKu1pLeGl/s4T/6H4K7I
 wrKkTpIKjouGw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 09/12] drm/vmwgfx: Allow checking for gl43 contexts
Date: Mon,  6 Dec 2021 12:26:17 -0500
Message-Id: <20211206172620.3139754-10-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, Charmaine Lee <charmainel@vmware.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

To make sure we're running on top of hardware that can support
GL4.3 we need to add a way of querying for those capabilities.
DRM_VMW_PARAM_GL43 allows userspace to check for presence of
GL4.3 capable contexts.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Charmaine Lee <charmainel@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 3 +++
 include/uapi/drm/vmwgfx_drm.h         | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 28af34ab6ed6..471da2b4c177 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -105,6 +105,9 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *data,
 	case DRM_VMW_PARAM_SM5:
 		param->value = has_sm5_context(dev_priv);
 		break;
+	case DRM_VMW_PARAM_GL43:
+		param->value = has_gl43_context(dev_priv);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 9078775feb51..8277644c1144 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -110,6 +110,7 @@ extern "C" {
 #define DRM_VMW_PARAM_HW_CAPS2         13
 #define DRM_VMW_PARAM_SM4_1            14
 #define DRM_VMW_PARAM_SM5              15
+#define DRM_VMW_PARAM_GL43             16
 
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
-- 
2.32.0

