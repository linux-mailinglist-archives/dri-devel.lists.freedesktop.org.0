Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5682235C8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB646ED3D;
	Fri, 17 Jul 2020 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C06EC54
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594904215; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=DUN8mRRTBoSNE5wMk07ynYLLgnvVyFadqpMluACqVzo=;
 b=A9llEpHYyVXFBQJ+53KuAtojE88Sbp0dYxrXJpLeyeCNQeGJnTPeIIXOvS6y6loRvjzqiK
 +8SmbAgNEi70JtQqVdOuetgZtYhNFinJb4fi8ekKE4UVXRw9getW4wk065sdZENPxrlNv1
 yKfwx/rcemLi0fqStgsCpo3Mf+SjekU=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/2] drm/panel-simple: Fix inverted V/H SYNC for Frida
 FRD350H54004 panel
Date: Thu, 16 Jul 2020 14:56:46 +0200
Message-Id: <20200716125647.10964-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FRD350H54004 panel was marked as having active-high VSYNC and HSYNC
signals, which sorts-of worked, but resulted in the picture fading out
under certain circumstances.

Fix this issue by marking VSYNC and HSYNC signals active-low.

v2: Rebase on drm-misc-next

Fixes: 7b6bd8433609 ("drm/panel: simple: Add support for the Frida FRD350H54004 panel")
Cc: stable@vger.kernel.org # v5.5
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f42249b72548..8b0bab9dd075 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1763,7 +1763,7 @@ static const struct drm_display_mode frida_frd350h54004_mode = {
 	.vsync_start = 240 + 2,
 	.vsync_end = 240 + 2 + 6,
 	.vtotal = 240 + 2 + 6 + 2,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
 static const struct panel_desc frida_frd350h54004 = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
